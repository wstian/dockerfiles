import sys

import tensorflow_datasets as tfds


def load(name, data_dir):
    tfds.load(name=name, data_dir=data_dir)


if __name__ == '__main__':
    load(sys.argv[1], sys.argv[2])


