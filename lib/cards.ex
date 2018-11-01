defmodule Cards do
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
