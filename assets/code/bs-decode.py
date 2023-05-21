EOS = 0
BOS = 1


def beam_search_decode(model, beam_width):
    # Initialize the beam with a single blank sequence
    beam = [((BOS,), 0)]

    # Start exploring branches
    while True:
        # Generate all possible successors
        successors = []
        # for each sequence in the beam
        for seq, score in beam:
            successors.extend(
                (seq + (next_word,), score + next_word.score)
                for next_word in model(seq)
            )
        # Keep only the top b sequences
        beam = sorted(successors, key=lambda x: x[1], reverse=True)
        beam = beam[:beam_width]

        # If all sequences in the beam end in <eos>, return the best one
        if all(seq[-1] == EOS for seq, score in beam):
            return beam[0][0]
