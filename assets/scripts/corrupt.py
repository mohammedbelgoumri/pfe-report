from itertools import product


def get_corrupted_sentences(corpus, errors):
    result = {}
    for sentence in corpus:
        variants = []
        corruptable_words = [
            word
            for word in errors  # The keys of the errors dictionary
            if word in sentence.split(" ")  # Only those in the sentence
        ]
        corruptions = list(
            product(  # Cartesian product of all possible corruptions
                *[
                    [(word, word)]  # Identity corruption
                    + [
                        (word, error) for error in errors[word]
                    ]  # Modification corruptions
                    for word in corruptable_words
                ]
            )
        )
        for corruption in corruptions:
            splt = sentence.split(" ")
            for word, error in corruption:
                splt[splt.index(word)] = error
            if splt != sentence.split():
                variants.append(" ".join(splt))
        result[sentence] = set(variants)
    return result
