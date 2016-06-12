---
layout: page
title: Features
subtitle:
---

## Features of Proof General

It doesn't matter if you're an Emacs militant or a pacifist!

The aim of Proof General is to provide powerful and configurable
interfaces which help user-interaction with proof assistants. Proof
General targets power users rather than novices, but is designed to be
useful to both. Proof General leads to an environment for serious *proof
engineering* of interactively-constructed proofs.

Proof General is used by many people for organizing large proof
developments, and also for teaching interactive proof. They enjoy the
following features:

### Script management

A *proof script* is a sequence of commands sent to a proof assistant to
construct a proof, usually stored in a file. *Script management*
connects the editing of a proof script directly to an interactive proof
process, maintaining consistency between the edit buffer and the state
of the proof assistant.

Proof General colours a proof script to show the state in the proof
assistant. Parts of a proof script that have been processed are
displayed in blue and are "locked" -- they cannot be edited. Parts of
the script currently being processed by the proof assistant are shown in
red. Bodies of completed proofs in the locked region can be hidden from
view to help browsing. Proof General has commands for processing new
parts of the buffer, or undoing already processed parts.

Take a look at these [screenshots](/screenshots) of Proof General to see
script management in action.

### Simplified interaction model

Proof General is designed for proof assistants which have a command-line
(shell) interpreter. When using Proof General, the proof assistant's
shell is hidden from the user. Communication takes place via three
buffers (Emacs text widgets). The *script buffer* holds input, the
commands to construct a proof. The *goals buffer* displays the current
list of subgoals to be solved. The *response buffer* displays other
output from the proof assistant. By default, only two of these three
buffers are displayed at once. This means that the user only sees the
output from the most recent interaction, rather than a screen full of
output from the proof assistant.

Despite this more friendly communication model, Proof General does not
commandeer the proof assistant shell: the user still has complete access
to it if necessary.

### Multiple files

Script management in Proof General can work across many script files,
integrating with the file handling of the proof assistant. When a script
is visited in the editor, it is locked (coloured) to reflect whether the
proof assistant has loaded it in this session. When a file is unlocked,
all of the files which depend on it are automatically unlocked too.

Dependencies between script files are either communicated from the proof
assistant to Proof General, or maintained automatically by Proof General
(based on the order in which files were processed).

### Subterm highlighting and proof by pointing

Using hidden markup in the concrete syntax, Proof General allows the
user to explore the structure of complex terms output by the prover.
This provides nifty features for cutting-and-pasting subterms, querying
the type of a subterm, looking up the definition of an identifier, and
so on.

*Proof by pointing* uses this markup to allow the prover to suggest
steps in a proof, guided by the user's gestures in displayed goals. For
example, clicking on a hypothesis inserts a proof step into the script
to solve a goal using that hypothesis, and executes it.

*\[Subterm markup is only fully supported by LEGO at the moment, with an
experimental implementation of proof by pointing. Isabelle highlights
only variables. If you would like to see these features better supported
in your favourite proof assistant, please canvas the implementor to add
subterm-markup support.\]*

### Toolbar and menus

Proof General has a toolbar with buttons for examining the proof state,
starting a proof, manoeuvring in the proof script, restarting the
prover, saving a proof, searching for a theorem, issuing a command,
interrupting the assistant, and getting help.

Using the toolbar, you can replay proofs without knowing any low-level
commands of the proof assistant or any Emacs hot-keys!

Additionally, the toolbar commands and many more besides are available
on menus; you don't need to know magical key presses for any features.

### Syntax highlighting

Syntax highlighting is an editing feature which decorates a file with
different colours or fonts according to the syntax of some language
(usually a programming language).

Proof General decorates proof scripts: proof commands are highlighted
and different fonts may be used for definitions and assumptions, for
example.

### Real symbols

Proof General allows you to easily use real mathematical symbols in your
proof scripts. First, if your proof assistant supports it, you can use a
rich font and the ample [Emacs Unicode
support](http://www.emacswiki.org/emacs/UnicodeEncoding) mechanisms.

Alternatively or additionally, you can use [Proof General's own Unicode
Tokens mode](/components#unicodetokens) which provides a *presentation
view* on the source text by rendering sequences of characters using
symbols, fonts and positioning information (see the
[screenshots](/screenshots) for examples.)

### Proof-script editing facilities

Many facilities are provided for editing proof scripts. The *completion*
mechanism of Emacs can be used to help type keywords and identifier
names. The *outline* mode of Emacs allows hiding of parts of proof
scripts; a further special *proof hiding* facility is provided to hide
the body of completed proofs. *Navigation* in the script is supported by
a pull-down menu which gives easy access to the theorems, definitions,
and declarations in the current buffer.

### Remote proof assistant

Sometimes you may want to run a proof assistant on a powerful remote
machine. Proof General can communicate with a proof assistant running
remotely, while your files and editor reside on your local machine.

### Tags

Tags are an editing feature which allow you to quickly locate the
definition or declaration of a particular identifier. Proof General is
supplied with utilities to make tag indexes for Emacs. This makes it
easy to quickly access definitions from a standard library, for example,
and in large proof developments split across multiple files.

### Adaptability

Proof General is designed to be adaptable. Many aspects of its behaviour
can be easily customized (using dialogue boxes and buttons, no text file
editing!).

Most importantly, Proof General is generic, so you can adapt it to a new
proof assistant with surprisingly little effort.

Adapting for a new proof assistant is mainly a matter of setting some
variables with regular expressions to help parse output from the prover,
and setting other variables with commands to send to the prover. See
this basic [example
instance](http://proofgeneral.inf.ed.ac.uk/fileshow.php?file=releases%2FProofGeneral%2Fdemoisa%2Fdemoisa-easy.el).
To get the most from Proof General (proof by pointing, for example), it
may be necessary to put some hooks in the output routines of the proof
assistant.

Please feel free to download Proof General to customize it for a new
system, and [tell us](/feedback) how you get on.

For (even) more details of Proof General's features, see the manuals and
papers on the [documentation page](/doc).
