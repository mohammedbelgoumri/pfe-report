def beam_search_decode(model, b):
    # Initialize the beam with a single blank sequence
    beam = [(tuple(), 0)]

    # Start exploring branches
    while True:
        # Generate all possible successors for each sequence in the beam
        successors = []
        for seq, score in beam:
            successors.extend(
                (seq + (next_word,), score + next_word.prob) for next_word in model(seq)
            )
        # Keep only the top b sequences
        beam = sorted(successors, key=lambda x: x[1], reverse=True)[:b]

        # If all sequences in the beam end in <eos>, return the best one
        if all(seq[-1] == "<eos>" for seq, score in beam):
            return beam[0][0]
