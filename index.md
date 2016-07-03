---
layout: page
title: Proof General
subtitle: A generic Emacs interface for proof assistants.
---

## What is Proof General?

**Proof General** is a generic front-end for *proof assistants* (also
known as *interactive theorem provers*), based on the customizable text
editor [Emacs](http://www.emacswiki.org). Proof General has been
developed at the [LFCS](http://wcms.inf.ed.ac.uk/lfcs/) in the
[University of Edinburgh](http://www.ed.ac.uk/) with contributions from
other sites. It is distributed under the conditions of the [GNU General
Public License](http://www.gnu.org/licenses/gpl-2.0.html). The manager
and main developer is [David
Aspinall](http://homepages.inf.ed.ac.uk/da). Other contributors are
listed below and in the [AUTHORS](/AUTHORS) file.

Proof General offers a full support for latest versions of the Coq proof assistant:

- [![Coq logo](img/coq.png)](https://coq.inria.fr/)
  **Coq Proof General**,
  for [Coq](https://coq.inria.fr/)  
  by Healfdene Goguen, Patrick Loiseleur, David Aspinall, and [Pierre Courtieu](http://cedric.cnam.fr/~courtiep/).

Proof General also supports previous versions of the following other proof assistants:

- [![Isabelle logo](img/isabelle.png)](http://www.cl.cam.ac.uk/research/hvg/Isabelle/)
  **Isabelle Proof General**,
  for [Isabelle](http://www.cl.cam.ac.uk/research/hvg/Isabelle/) (up to Isabelle2014)  
  by [David Aspinall](http://homepages.inf.ed.ac.uk/da) and [Makarius](http://sketis.net/).
- [![PhoX logo](img/phox.png)](http://www.lama.univ-savoie.fr/~RAFFALLI/phox.html)
  **PhoX Proof General**,
  for [PhoX](http://www.lama.univ-savoie.fr/~RAFFALLI/phox.html)  
  by [Christophe Raffalli](http://www.lama.univ-savoie.fr/~RAFFALLI), Paul Roziere and Jean-Roch Sotty.
- **LEGO Proof General**,
  for [LEGO](http://www.dcs.ed.ac.uk/home/lego)
- **HOL Proof General**,
  for [HOL98/HOL4](https://hol-theorem-prover.org/)
- **ACL2 Proof General**,
  for [ACL2](http://www.cs.utexas.edu/users/moore/acl2)

These instances may be incomplete or not work with the latest theorem
prover versions.

Proof General is ready to be customized to new proof assistants. It can
be [very easy](https://github.com/ProofGeneral/PG/blob/master/obsolete/demoisa/demoisa-easy.el)
to get basic support working. Full [documentation on
configuration](http://proofgeneral.inf.ed.ac.uk/releases/ProofGeneral/doc/PG-adapting.pdf)
is provided. We welcome offers to support, extend and improve Proof
General instances. Please get in touch if you plan major work.

If you are considering supporting (or implementing) a new prover, please
read about the [Proof General Kit](http://proofgeneral.inf.ed.ac.uk/kit) architecture.
The idea is that proof assistants should support PGIP, a uniform protocol for
interaction, rather than use system-specific customization inside
interfaces. The main research prototype using PGIP is an experimental
[Eclipse](http://www.eclipse.org) plugin, although Emacs Proof General
supports some PGIP configuration.

## Quick installation instructions

Remove old versions of Proof General, then download and install the new release from GitHub:

```sh
git clone https://github.com/ProofGeneral/PG ~/.emacs.d/lisp/PG
cd ~/.emacs.d/lisp/PG
make
```

Then add the following to your `.emacs`:

```elisp
;; Open .v files with Proof General's Coq mode
(load "~/.emacs.d/lisp/PG/generic/proof-site")
```

If Proof General complains about a version mismatch, make sure that the shell's `emacs` is indeed your usual Emacs. If not, run the Makefile again with an explicit path to Emacs. On Mac in particular you'll probably need something like

```sh
make clean; make EMACS=/Applications/Emacs.app/Contents/MacOS/Emacs
```
For more information, see the [README](https://github.com/ProofGeneral/PG#more-info)
and [INSTALL](https://github.com/ProofGeneral/PG/blob/master/INSTALL) files
on the GitHub repo.
