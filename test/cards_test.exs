defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck" do
    deck = Cards.create_deck
    assert deck == ["Ace Diamonds", "Two Diamonds", "Three Diamonds", "Four Diamonds", "Five Diamonds", "Six Diamonds", "Seven Diamonds", "Eight Diamonds", "Nine Diamonds", "Ten Diamonds", "Jack Diamonds", "Queen Diamonds", "King Diamonds", "Ace Hearts", "Two Hearts", "Three Hearts", "Four Hearts", "Five Hearts", "Six Hearts", "Seven Hearts", "Eight Hearts", "Nine Hearts", "Ten Hearts", "Jack Hearts", "Queen Hearts", "King Hearts", "Ace Spades", "Two Spades", "Three Spades", "Four Spades", "Five Spades", "Six Spades", "Seven Spades", "Eight Spades", "Nine Spades", "Ten Spades", "Jack Spades", "Queen Spades", "King Spades", "Ace Clubs", "Two Clubs", "Three Clubs", "Four Clubs", "Five Clubs", "Six Clubs", "Seven Clubs", "Eight Clubs", "Nine Clubs", "Ten Clubs", "Jack Clubs", "Queen Clubs", "King Clubs"]

  end

  test "create_deck makes 52 cards" do
    deck_length = length( Cards.create_deck )
    assert deck_length == 52
  end

  test "shuffle should randomize the entire deck" do
    deck = Cards.create_deck
    assert deck != Cards.shuffle(deck)
    refute deck == Cards.shuffle(deck)
  end

  test "deal should split a deck into the hand size" do
    deck = Cards.create_deck
    {hand, deck} = Cards.deal(deck, 1)
    assert length(hand) == 1
    assert length(deck) == 51
  end

  test "create_hand deal a hand" do
    {hand, deck} = Cards.create_hand(1)
    assert length(hand) == 1
    assert length(deck) == 51
  end
end
