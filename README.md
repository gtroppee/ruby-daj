# daj

Are you terminally annoyed by the number of unaesthetic lines you have to write when the only thing you need is just reading and parsing some fracking data?

Well if this is the case, **daj** is made for you!

**daj**'s philosophy is to enable you to read and write popular data formats in one simplistic line:

```ruby
require 'ruby-daj'

data = daj < 'path/to/your-fracking-data.json'
```

**daj** is your quick & dirty scripting companion. No more annoying boilerplate code: you start coding things that matter right now!

## Installation

```ruby
gem 'ruby-daj'
```
or 

```ruby
gem install ruby-daj
```

To install the latest dev version

```ruby
gem 'ruby-daj', git: "git://github.com/gtroppee/ruby-daj.git"
```

## Formats supported

* plain text
* json
* yaml
* csv
* tsv

## Reading
Note that if you do not provide a method to **daj**, this one will try to guess your format by analyzing the file's extension.

So if you have a twisted mind and like to name csv files `table.json`, well first of all you are a sneaky bastard, second, just use the proper **daj** method.

```ruby
# Guessing the format
data = daj < 'file.json'

# Will also work with raw text
data = daj < 'file.txt'

# Using daj methods
data = daj.json < 'file.json'
data = daj.yml < 'file.yml'
data = daj.csv < 'file.csv'
data = daj.tsv < 'file.tsv'

# Needing headers for your neat CSV files?
data = daj.csvh < 'file.csv'
data = daj.tsvh < 'file.tsv'
```

## Writing
As for reading, **daj** will try to guess the correct format for your data based on the extension of the file.

```ruby
# Writing some data
daj(data) > 'file.json'

# Will also work with raw text
daj(data) > 'file.txt'

# Using daj methods
daj.json(data) > 'file.json'
daj.yml(data) > 'file.yml'

# For csv, you can give an array of arrays or an array of objects
# If an array of objects is given, daj will output a csv with headers.
daj.csv(data) > 'file.csv'
daj.tsv(data) > 'file.tsv'
```

## Disclaimers
**daj** is clearly orientated toward quick & dirty data processing. This is probably a bad idea to use it in a production context and I would not vouch for that.

**ruby-daj** is directly inspired by [python-daj](https://github.com/Yomguithereal/python-daj)

## Contribution
Contribution are more than welcome, be sure to add relevant unit tests and pass them all before subitting any code.
