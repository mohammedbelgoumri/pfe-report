def beam_search_decoder(data, k):
    sequences = [[[], 0.0]]
    for row in data:
        all_candidates = []
        for i in range(len(sequences)):
            seq, score = sequences[i]
            for j in range(len(row)):
                candidate = [seq + [j], score - log(row[j])]
                all_candidates.append(candidate)
        ordered = sorted(all_candidates, key=lambda tup: tup[1])
        sequences = ordered[:k]
    return sequences
