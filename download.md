---
layout: page
title: Download
subtitle:
---

## Proof General Version 4.2, 19th October 2012.

Proof General is distributed under the terms of the [GNU General Public
License, Version 2](https://github.com/ProofGeneral/PG/blob/master/COPYING).
See [below](/download#prereq) for software pre-requisites for running
Proof General.

### Download Proof General (for GNU Emacs 23.3 and later)

-   [ProofGeneral-4.2.tgz](http://proofgeneral.inf.ed.ac.uk/releases/ProofGeneral-4.2.tgz) (1575k)
-   [browse individual files](http://proofgeneral.inf.ed.ac.uk/releases/ProofGeneral-4.2/)

{% comment %} TODO: migrate this page as well? {% endcomment %}
Join the Proof General [mailing list](http://proofgeneral.inf.ed.ac.uk/mailinglist)
for announcements of new versions.

### Install Proof General

- Download and unpack the file:

  `tar xpzf ProofGeneral-4.2.tar.gz`

- Add this one line to your `.emacs` file, or inside its own file
  inside `.emacs.d`:

  `(load-file "dir/generic/proof-site.el")`

  Where dir is where you unpacked the sources. This makes Proof
  General available whenever you launch Emacs.

The `Makefile` helps with further installation. Read
[INSTALL](https://github.com/ProofGeneral/PG/blob/master/INSTALL)
for details.

**Important note:** The tar file contains compiled files for GNU Emacs
23.2. To be sure of compatibility with a different version of Emacs you
may need to recompile. To delete and recompile, use the provided
Makefile being sure to set EMACS to point to your Emacs executable,
e.g.:

`make clean`  
`make compile EMACS=/Applications/Emacs.app/Contents/MacOS/Emacs`

Proof General will also run using the interpreted code, at some speed
penalty.

### What you need to run Proof General

You need:

-   A proof assistant, for example:
    [Coq](https://github.com/ProofGeneral/PG/blob/master/coq/README);
    [Isabelle/Isar](https://github.com/ProofGeneral/PG/blob/master/isar/README);
    [LEGO](https://github.com/ProofGeneral/PG/blob/master/lego/README);
    [PhoX](https://github.com/ProofGeneral/PG/blob/master/phox/README)
    (see links for versions).
-   Version 23.2 or later of [GNU Emacs](http://www.gnu.org/software/emacs/)  
    Emacs is available for a huge variety of platforms, including Unix,
    Windows, and Mac OS. See the [Emacs Wiki](http://www.emacswiki.org)
    for advice
	{% comment %} TODO: setup a wiki on GitHub?
	and [Proof General wiki](https://github.com/ProofGeneral/PG/wiki)
	for compatibility notes
    (please help extend them).
	{% endcomment %}

Compatibility across the multitude of platforms, provers and Emacs
versions is very troublesome as invariably things break with Emacs or
prover API changes and new bugs. You may have luck with older versions
but there are no guarantees!

Please [report problems](https://github.com/ProofGeneral/PG/issues)
and [send fixes](https://github.com/ProofGeneral/PG/pulls) so we can maintain
support for latest versions.

### Other versions

-   Developers and early-adopters: check the interim [development
    release](/devel). This version may also have compatibility fixes for
    new Emacs or prover versions.
-   If you have an old version of a proof assistant and/or an old Emacs
    version, you may need a [previous release](http://proofgeneral.inf.ed.ac.uk/oldrel.php).
