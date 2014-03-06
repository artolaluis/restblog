#!/usr/bin/env python
# Copyright 2013. Milestones Software, LLC. All rights reserved.

import os

from setuptools import find_packages
from setuptools import setup

VERSION = '1.2.2'
DESCRIPTION = 'Blog using reStructuredText from the command-line.'

REQUIREMENTS = '''
pygments
docutils
sphinx
'''.strip().split()

setup(
    name='restblog',
    version=VERSION,
    description=DESCRIPTION,
    long_description=DESCRIPTION,
    author='Luis Artola',
    url='https://github.com/artolaluis/restblog',
    package_dir={
        '': 'src',
    },
    packages=find_packages('src'),
    entry_points=dict(
        console_scripts=[
            'restblog = restblog.commandline:main',
        ],
    ),
    install_requires=REQUIREMENTS,
    zip_safe=False,
    classifiers=[
        "Development Status :: 4 - Beta",
        "Programming Language :: Python",
        "Operating System :: OS Independent",
    ],
)

