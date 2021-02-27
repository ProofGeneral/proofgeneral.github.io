---
layout: page
title: Download
subtitle:
---

# Proof General

Proof General is distributed under the terms of the [GNU General Public
License, Version 2](https://github.com/ProofGeneral/PG/blob/master/COPYING).
See [below](#prereq) for software pre-requisites for running
Proof General.

{% comment %} TODO: migrate this page as well? {% endcomment %}
Join the Proof General [mailing list](http://proofgeneral.inf.ed.ac.uk/mailinglist)
for announcements of new versions.

## Quick installation instructions

The `master` version of Proof General is available on
[MELPA](https://melpa.org/), a repository of Emacs packages.
Skip this step if you already use MELPA. Otherwise, add the following
to your `.emacs` and restart Emacs:

```elisp
(require 'package)
;; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3") ; see remark below
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
```

> **Remark:** If you have Emacs 26.1 (which is precisely
> [the packaged version in Debian 10](https://packages.debian.org/emacs)),
> you may get the error message `Failed to download 'melpa' archive`
> during the package refresh step. This is a know bug
> ([debbug #34341](https://debbugs.gnu.org/cgi/bugreport.cgi?bug=34341))
> which has been fixed in Emacs 26.3 and 27.1, while a simple workaround
> consists in uncommenting the line
> `(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")` above in your
> `.emacs`.

> **Note:** If you switch to MELPA from a previously manually-installed
> Proof General, make sure you removed the old versions of Proof General
> from your Emacs context (by removing from your `.emacs` the line
> loading `PG/generic/proof-site`, or by uninstalling the proofgeneral
> package provided by your OS package manager).

Then, run `M-x package-refresh-contents RET` followed by
`M-x package-install RET proof-general RET` to install and
byte-compile `proof-general`.

You can now open a Coq file (`.v`), an EasyCrypt file (`.ec`), or a
PhoX file (`.phx`) to automatically load the corresponding major mode.

### <a name="prereq"></a>What you need to run Proof General

You need:

- A proof assistant, e.g.:
  [Coq](https://coq.inria.fr/),
  [EasyCrypt](http://www.easycrypt.info/),
  [PhoX](http://www.lama.univ-savoie.fr/pagesmembres/raffalli/phox.html)
  (see links for versions).
- Version 24.5 or later of [GNU Emacs](http://www.gnu.org/software/emacs/).

Emacs is available for a huge variety of platforms, including Unix,
Windows, and macOS. See the [Emacs Wiki](http://www.emacswiki.org)
for advice.

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


## Keeping Proof General up-to-date

As explained in the [MELPA documentation](https://melpa.org/#/getting-started), updating all MELPA packages in one go is as easy as typing
`M-x package-list-packages RET` then `r` (**r**efresh the package list), `U`(mark **U**pgradable packages), and `x` (e**x**ecute the installs and deletions).

For more information, see the
[README](https://github.com/ProofGeneral/PG#readme) file on the GitHub
repo.

{% comment %} TODO: remove
### Other versions

If you have an old version of a proof assistant and/or an old Emacs
version, you may need a previous release of Proof General:

- <http://proofgeneral.inf.ed.ac.uk/oldrel.php> (up to Proof General 4.0)

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
{% endcomment %}
