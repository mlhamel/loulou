# README

Louis a ses chansons préférées: certaines le font rire, d'autre chanter.

Ce projet les rassemblent toutes et les fait vivre dans un livre.

## D'où viennent les chansons?

De L'Internet en général mais aussi des cahiers de la bonne chanson (http://bilan.usherbrooke.ca/bilan/pages/evenements/576.html)

## Installation

1. En utilisant "dev":

```
$ git clone git@github.com:mlhamel/loulou.git
$ cd loulou
$ dev up
```

2. Pour les autres:

```
$ git clone git@github.com:mlhamel/loulou.git
$ cd loulou
$ bundle install
```

## Ensuite

Pour construire le livr

```
$ cd loulou
$ bundle exec rake loulou:book:print
```

