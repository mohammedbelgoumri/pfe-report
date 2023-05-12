import lightning.pytorch as pl
import torch
from torch import Tensor, nn
from torch.nn import functional as F
from torchmetrics.functional import accuracy, bleu_score
from tqdm import tqdm

super = nn.Module
self = nn.Module()


def __init__(
    self,
    d_model: int,
    nhead: int,
    source_vocab_size: int,
    target_vocab_size: int,
    source_pad_idx: int,
    num_encoder_layers: int,
    num_decoder_layers: int,
    max_len: int,
    dim_feedforward: int,
    dropout: float,
    lr: float,
):
    super().__init__()

    self.input_embedding = nn.Embedding(source_vocab_size, d_model)
    self.input_position_embedding = nn.Embedding(max_len, d_model)

    self.output_embedding = nn.Embedding(target_vocab_size, d_model)
    self.output_position_embedding = nn.Embedding(max_len, d_model)

    self.transformer = nn.Transformer(
        d_model,
        nhead,
        num_encoder_layers,
        num_decoder_layers,
        dim_feedforward,
        dropout,
    )

    self.linear = nn.Linear(d_model, target_vocab_size)
    self.dropout = nn.Dropout(dropout)
    self.source_pad_idx = source_pad_idx

    self.lr = lr
