import torch
import os

def update_dropout(m, args):
    classname = m.__class__.__name__
    if classname.find('Dropout') != -1:
        if hasattr(m, 'p'):
            m.p = args.dropout

def update_dropatt(m, args):
    if hasattr(m, 'dropatt'):
        m.dropatt.p = args.dropatt

def load_model(args):
    with open(os.path.join(args.restart_dir, 'model.pt'), 'rb') as f:
        model = torch.load(f)
    return model

def update_model_by_args(model, args):
    if not args.fp16:
        model = model.float()
    model.apply(update_dropout, args)
    model.apply(update_dropatt, args)
    return model

if __name__ == "__main__":
    from collections import namedtuple
    # P = namedtuple('A', 'dropout restart_dir dropatt fp16',defaults=[0.1, None, None, False])
    P = namedtuple('A', 'restart_dir')
    args = P(restart_dir="saved_results/cp_50/")
    model = load_model(args)
    print(model)
    