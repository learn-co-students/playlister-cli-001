# Playlister CLI

## Objectives

1. Build classes that are associated to one another via has many, belongs to and through associations. 
2. Build a class that parses file names and uses that data to instantiate instances of classes. 
3. Interact with and get comfortable with a command line interface that was built for you. 

## Overview

In previous labs, you've built a Playlister domain model that creates artist, song and genre classes that are associated to each other via has many, belongs to and through associations. In another lab, you built an object oriented command line jukebox. This exercise will bring together some of those concepts. You'll be building out the Playlister domain model again. Then, we'll write a `LibraryParser` class that takes a list of music file names, grabs the artist, song name and genre out of each file name and uses that data to build song, artist and genre instances and associate them to one another. 

### Using External Data to Create Class Instances

We already know that our job as programmers is to deliver data. That will be the core concept behind many of the apps you build, especially apps for the web. So, where will that data come from? In some cases, it will come from users interacting with our app. The number of instances of the `User` class, for example, might grow every time someone signs up for our app. 

Let's say, though, that we are building an app that connects users to food pantries in their area. Where do we get the data on the food pantry locations from? There are dozens of food pantries in New York City. If you expand the geographic area, dozens would turn into hundreds of locations. We're lazy (remember, that's a virtue in a programmer!) and we certainly don't want to sit at our computer and instantiate hundreds of `FoodPantry` objects by hand. We would want a way to do that *programmatically*. We would want to write a class or a method that can iterate over a list of food pantries and their associated data (location, name, etc) and turn that data into instances of a `FoodPantry` class. 

Let's take a look at another example. Let's say we have an app that allows users to browse lists of recipes, saving recipes to their favorites and inviting their friends to collaborate on meals. Where do we get the recipes from? Once again, would we sit at our computers and manually instantiate hundres or even thousans of instances of a `Recipe` class? We are way too lazy for that. We would instead write a program that extracted recipes from an external source, such as an API, and used that data to instantiate our own `Recipe` instances. 

This kind of data retrieval and instantiation is what we've been practicing in many of the labs we've completed so far. Here, we'll be using a list of mp3 files in a `db` ("database") directory to instantiate `Song`, `Artist` and `Genre` instances in our Playlister domain model. 

## Instructions

This lab is partly test-driven. You're expected to get the `Song`, `Arist` and `Genre` classes set up using the tests to guide you. The `LibraryParser` class we'll set up together. Read through the guidelines below before proceeding with this lab.

### Project Set Up

The folder structure for this project is similar to the set up that we've been learning about and using up until now. It looks something like this:

```
├── README.md
├── app
│   ├── concerns
│   │   └── findable.rb
│   └── models
│       ├── artist.rb
│       ├── genre.rb
│       ├── library_parser.rb
│       └── song.rb
├── bin
│   └── cli
├── config
│   └── environment.rb
├── db
│   └── data
│       ├── ASAP Rocky - Peso [dance].mp3
│       ├── Action Bronson - Larry Csonka - indie.mp3
│       └── etc.
└── spec
    ├── artist_spec.rb
    ├── genre_spec.rb
    ├── library_parser_spec.rb
    ├── song_spec.rb
    └── spec_helper.rb
```

#### `bin`

The `bin` directory contains your executables. Within this directory there is a file, `cli`, that will work as our runner, or the part of a program that kicks off the rest of the process. This file will do the following things:

1. The first line in the `cli`, that starts with a `#!` is a line that tells BASH what interpreter to run this script through. We send it to: `#!/usr/bin/env ruby`, our ruby interpreter. This lets us write a shell script that can be executed outside of the ruby command (`./bin/cli vs ruby ./bin/cli.rb`).
2. It requires our environment, see below.
3. We're going to keep this file super simple, it's only job is to create an instance of our PlaylisterCLI interface and then trigger it via the `call` method. We purposely keep this file super simple so that all of our knowledge about the Playlister CLI interface gets encapsulated within our PlaylisterCLI class, defined in `app/models/playlister_cli.rb`.

#### `db/data`

This directory contains 99 fake MP3s from which you will build your music library using a LibraryParser class.

#### `app/models`

Our models live in here; we'll be defining an `Artist`, `Song`, `Genre`, and `LibraryParser`.

#### `spec`

Our tests.

### Domain Model

You should build out the domain model in the following order:

#### `Song`, `Artist`, `Genre`

These classes have to be built in unison as they collaborate so heavily. Begin with the `Song` class according to spec as it is the central character, and add `Artist` and `Genre` behavior as they are required. They are very similar to the classes defined in the `playlister-rb` project.

Some new additions of functionality are class methods `find_by_name`, `create_by_name`, and `reset_all`. The `create_by_name` method is a shortcut to instantiation with a name. We do this because we want to extend the functionality of creating an instance, instead of changing the behavior of initialize. By building a class method `create_by_name` that explicitly accepts a name argument and handles initialization, the `initialize` method does not need to be responsible for attribute assignment. `find_by_name` should be able to pluck the correct object out of the collections within the class method `all`. Additionally, a `reset_all` method should be able to clear our data, i.e. our collection of all of the instances of a class. 

**Advanced:** Note the `app/concerns` directory. For an extra challenge, refactor your `Song`, `Artist` and `Genre` class by removing all of the common methods described above and building them into either a `Findable` module, `Creatable` module or `Destroyable` module. You should create `findable.rb`, `creatable.rb` and `destroyable.rb` files and place them in `app/concerns`.

### `LibraryParser`

The `LibraryParser` should be responible for finding the MP3 files, parsing their titles, and building Song, Artist, and Genre objects from that data. 

The `library_parser_spec` defines a pretty specific vision for the library parser. It breaks it down to some small methods.

#### `.files`

This method has been built for you. It sets a `@files` variables equal to the list of files contained in the `db/data` directory. Via the following line: 

```ruby
@files = Dir['db/data/*']
```
The [`Dir` class](http://ruby-doc.org/core-2.2.0/Dir.html) is a Ruby class that provides a variety of ways to list directories and their contents. This method returns an array of file names. 

`require 'pry` at the top of the `LibraryParser` file and place a `binding.pry` into the `.files` method. Take a look at the `@files` variable to become familiar with the array you'll be operating on. 

#### `.parse_filename`

This method is also given to you. However, it's implementation is important to understand, so please read the explanation below. 

This method operates on *a single file name*. It takes that file name in as an argument  extracts from that file name the author, song and genre. Then, it returns an array that looks like this: 

```ruby
[artist_name, song_name, genre_name]
```

Inside this method we are operating on an individual file name, which looks something like this: 

```ruby
"db/data/Action Bronson - Larry Csonka - indie.mp3"
```

We need to extract just the artist name, song name and genre name. So, we need to get rid of the `"db/data"` and `.mp3` bits that start and end the string. Let's chop off the first part using the `.slice` method:

```ruby
filename.slice!(0..7)
```

Great. Now our file name looks something like this:

```ruby
"Action Bronson - Larry Csonka - indie.mp3"
```

Let's get rid of the file extension now:

```
filename.slice!(-4..-1)
```

Now, if we split the string on the `' - '`, we'll get the array we want:

```ruby
filename.split(" - ")
```
The return value of the above line of code would look this this:

```ruby
["Action Bronson", "Larry Csonka", "indie"]
```
We are therefore successfully returning the array of artist, song, genre

#### `build_song`

The `build_song` method will call on the `parse_filename` method. It should take in an argument of an individual file name and pass that file name to `parse_filename`. The array that `parse_filename` returns will be used here to instantiate  instances of `Song`, `Artist` and `Genre`. Use the `.create_by_name` method to instantiate the artist, song and genre. Associate them to one another use the `.add_song(song)` method on the artist instance and the `.genre=` method on the `song` instance. 

Make sure this method returns the `Song` instance that you create. 

#### `.call`

This method is responsible for executing the `LibraryParser` code. The `.call` method should iterate over the array of file names stored in the `.files` method. For each file name, call the `build_song` method. 

#### `PlaylisterCLI`

This class is the primary interface for the command line application. Upon initialization, we parse the main data in `data/db` (with the help of your `LibraryParser` class). It allows the user to browse the music and play music. We already have a basic version coded. Take the time to look through the code in this class until you feel you understand it. 

#### Bonus

Add features to the `PlaylisterCLI` class! Have fun with this, add functionality to perhaps browse by Genre or Artist.

