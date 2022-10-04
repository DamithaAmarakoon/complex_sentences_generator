# Complex English Sentences Generator for Singlish Text

A Singlish to English translator using JFlex and Python

## Run the following commands to compile the code

_create /data that contains the input file (input.txt)_
_You need to end the sentence with a punctuation mark (.?!)_

_**--num_aug** - number of sentences generated_
_**--input** - input text file (input.txt)_
_**--output** - output text file (out.txt)_

**Install dependencies**

- `pip install -r ./requirements.txt`

**Singlish to Sinhala**
converts singlish sentence to sinhala.

- `cd singlish-sinhala; jflex Translator.flex; javac -encoding UTF-8 Translator.java; java Translator '../data/input.txt'; cd ..`

**Sinhala to English**
converts sinhala sentence to multiple english sentences with the same meaning.

- `python 'augment/augment.py' --input 'data/intermediate_out.txt' --output 'data/out.txt' --num_aug 3`

## Test an input

- change the data/input.txt file
- run
  - `cd singlish-sinhala; java Translator '../data/input.txt'; cd ..`
  - `python 'augment/augment.py' --input 'data/intermediate_out.txt' --output 'data/out.txt' --num_aug 3`
- results are written to data/out.txt
