import sys

import tensorflow_datasets as tfds


def load(name=sys.argv[1], data_dir='/opt/tfds'):
    tfds.load(name=name, data_dir=data_dir)


if __name__ == '__main__'
    load()


