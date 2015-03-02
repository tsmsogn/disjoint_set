# DisjointSet

[![Build Status](https://travis-ci.org/tsmsogn/disjoint_set.svg?branch=master)](https://travis-ci.org/tsmsogn/disjoint_set)

Disjoint-set data structure library.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'disjoint_set'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install disjoint_set

## Usage

initialize:

	d = DisjointSet::DisjointSet.new [1, 2, 3, 4]

[![Graph](https://chart.googleapis.com/chart?chl=digraph+g%7B%0D%0A++1%0D%0A++2%0D%0A++3%0D%0A++4%0D%0A%7D%0D%0A&cht=gv)](https://chart.googleapis.com/chart?chl=digraph+g%7B%0D%0A++1%0D%0A++2%0D%0A++3%0D%0A++4%0D%0A%7D%0D%0A&cht=gv)

make_set:

	d.make_set 5

[![Graph](https://chart.googleapis.com/chart?chl=digraph+g%7B%0D%0A++1%0D%0A++2%0D%0A++3%0D%0A++4%0D%0A++5%0D%0A%7D%0D%0A&cht=gv)](https://chart.googleapis.com/chart?chl=digraph+g%7B%0D%0A++1%0D%0A++2%0D%0A++3%0D%0A++4%0D%0A++5%0D%0A%7D%0D%0A&cht=gv)

union:

	d.union 1, 2

[![Graph](https://chart.googleapis.com/chart?chl=digraph+g%7B%0D%0A++2+-%3E+1%0D%0A++3%0D%0A++4%0D%0A++5%0D%0A%7D%0D%0A&cht=gv)](https://chart.googleapis.com/chart?chl=digraph+g%7B%0D%0A++2+-%3E+1%0D%0A++3%0D%0A++4%0D%0A++5%0D%0A%7D%0D%0A&cht=gv)

	d.union 3, 4
	d.union 1, 3

[![Graph](https://chart.googleapis.com/chart?chl=digraph+g%7B%0D%0A++2+-%3E+1%0D%0A++4+-%3E+3+-%3E+1%0D%0A++5%0D%0A%7D%0D%0A&cht=gv)](https://chart.googleapis.com/chart?chl=digraph+g%7B%0D%0A++2+-%3E+1%0D%0A++4+-%3E+3+-%3E+1%0D%0A++5%0D%0A%7D%0D%0A&cht=gv)

find:

	d.find 1
	=> 1
	d.find 2
	=> 1
	d.find 4
	=> 1

[![Graph](https://chart.googleapis.com/chart?chl=digraph+g%7B%0D%0A++2+-%3E+1%0D%0A++3+-%3E+1%0D%0A++4+-%3E+1%0D%0A++5%0D%0A%7D%0D%0A&cht=gv)](https://chart.googleapis.com/chart?chl=digraph+g%7B%0D%0A++2+-%3E+1%0D%0A++3+-%3E+1%0D%0A++4+-%3E+1%0D%0A++5%0D%0A%7D%0D%0A&cht=gv)

same?:

	d.same? 1, 2
	=> true
	d.same? 1, 5
	=> false

## Contributing

1. Fork it ( https://github.com/[my-github-username]/disjoint_set/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
