defmodule Cards do

  @moduledoc """
    Provides methods for creating and handling of cards
  """


  @doc """
    Returns a list of strings representing a deck of cards
  """
  #basic method declaration
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    #list comprehension
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  #method arguments
  def shuffle(deck) do
    # shuffle doesn't change the original list being passed 
    Enum.shuffle(deck)
  end

  #searching a list
  def contains?(deck, card) do 
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how many cards should
    be in the hand. 

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]
  """

  #indexes & tuples 
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end
  
  #Pattern Matching, saving to file & ERLANG relationship
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
      #error catching
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "Sorry doesn't exist"
    end
  end

  # pipe operator
  def create_hand(hand_size) do
    Cards.create_deck 
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

end
