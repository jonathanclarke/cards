defmodule Cards do
  @moduledoc """
  Provides methods for creating and handling a deck of cards
  """

  @doc """
  Creates a full card deck and returns a list of cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Diamonds", "Hearts", "Spades", "Clubs"]

    for suit <- suits, value <- values do
      "#{ value } #{ suit }"
    end    
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end


  @doc """
  Checks if the deck contains a specific card
  ## Examples
  
      iex> deck = Cards.create_deck
      iex> result = Cards.contains?(deck, "Ace Diamonds")
      iex> result
      true
      iex> result = Cards.contains?(deck, "Pity the fool")
      iex> result
      false
      
  """  
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end


  @doc """
  Divides a deck into a hand and the remainder of the deck.
  The `hand_size` argument indicates how many cards should
  be in the hand
  ## Examples
  
      iex> deck = Cards.create_deck
      iex> {hand, _deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace Diamonds"]
      
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  #Using a built in erlang method to save to a filesystem
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  #Using a built in erlang method to load from a filesystem
  # Error handling condensed
  # We pattern match the result of File.read(filename)
  # if :ok then we read from that file
  # if :error then return an error message
  def load(filename) do
    case File.read(filename) do
      { :ok, binary } -> :erlang.binary_to_term(binary)
      { :error, _reason } -> "That file does not exist"
    end

  end

  def create_hand(size_of_deck) do
    #Pipe operator; it passes the returned value and
    #injects as the first value of the subsequent method
    Cards.create_deck |> Cards.shuffle |> Cards.deal(size_of_deck)    
  end
end
