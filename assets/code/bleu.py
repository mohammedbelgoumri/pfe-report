from numpy import log, exp


def ngrams(sequence, n):
    output = []
    for i in range(len(sequence) - n + 1):
        output.append(sequence[i:i + n])
    return output


def modified_precision(candidate, truth, n):
    candidate_ngrams = ngrams(candidate, n)
    truth_ngrams = ngrams(truth, n)
    count = 0
    for ngram in candidate_ngrams:
        if ngram in truth_ngrams:
            count += 1
            truth_ngrams.remove(ngram)
    return count / len(candidate_ngrams)


def bleu(candidate, truth):
    pns = []
    for n in range(len(candidate)):
        pns.append(modified_precision(candidate, truth, n + 1))
    log_pns = [log(p_n) for p_n in pns]
    brevity_penalty = 1
    if len(candidate) > len(truth):
        brevity_penalty = exp(1 - len(candidate) / len(truth))
    return brevity_penalty * exp(sum(log_pns) / len(candidate))
