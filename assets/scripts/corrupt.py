from itertools import product


def get_corrupted_sentences(corpus, errors):
    result = {}
    for sentence in corpus:
        variants = []
        corruptable_words = [word for word in errors if word in sentence.split(" ")]
        corruptions = list(
            product(
                *[
                    [(word, word)] + [(word, error) for error in errors[word]]
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
