TBLM

---

This is a revision of The Bombay Literary Magazine as a static site.

# Goal

Create a web magazine solution that respects the word, the writer, the publisher,
and everybody's pocket. Writers aren't exactly rolling in it, you know.

# Architecture Guidelines

*Intelligent aesthetic.*

Render each piece of text the way the author intended it.

Yet, strive for an architecture that is web-first; amenable to creative expression
with typographically sound, browser-respecting fluid grid-based design techniques.

More in the section on Typography.

*Full content control and ownership.*

Build upon plain text formats that:
- are easy to learn and author content in,
- that allow authors to precisely specify and preview how the text should flow
  (easy access live-rendering plaintext->html text editors like https://dillinger.io
  along with layout cheat sheets),
- ensure unfettered access to the text (not buried inside databases),
- have excellent cross-platform support for rendering as HTML and PDF.

Markdown is a good enough default format. We may also support ASCIItext, LaTex,
and perhaps even org-mode, if the more hard-core typesetters insist on it :)

*Speed.*

Fast to render. Choose a site build tool that can render incrementally with live
reloading, in addition to being fast at rebuilding the whole site from scratch.

Fast to serve. Eschew heavy-duty frontend frameworks, and design as minimally as
possible. Channel your inner Dieter Rams. Render everything server-side. Follow
standard hygiene of gzipping and minifying all the things. Take advantage of CDNs.

*Simplicity.*

The technical solution should be as simple and dependency-free as possible.

- Clear directory layout and organisation.
- All configuration in plaintext.
- Distributed as a single completely self-contained zip file.
- Fully rebuild-able from source with a single command, without having to pull
  in external dependencies (except for any secrets, of course).
- Runnable under any operating system, any web server, on any web host.

# Typographic Guidelines

We wish to be particular with Typefaces, but we don't feel compelled to lock
ourselves into any particular choice of Typefaces.

We wish to be particular about the following things.

*The Text Comes First.*

Render prose and poetry with finely controlled typesetting, *but* without allowing
the typeface itself to colour the meaning or form of the subject matter. Faces
should be pleasant and flow, but the words must speak for themselves. Hold this
inviolable.

*Web-first Rendering.*

The Magazine is digital-first, so we strongly prefer typefaces optimized for
modern mobile and PC digital displays. Compatibility with ancient browsers is
secondary. Print-friendliness is tertiary.

*Strongly prefer Open Font Licenses.*

All typefaces that we host ourselves will be OFL-licensed as far as possible, or
donated to us, because a tiny literary magazine simply cannot afford server
licenses, much less commercial print ones.

*Magazine Brand Typeface.*

Magazine brand type will be distinctive. It may be of any kind *as long as*
it is our aesthetic, *and* pairs well with the body, *and* does not under any
circumstance distract the reader away from the actual material.

Prefer to evoke a *feel* of some part of Bombay. Maybe Art Deco. Maybe Gothic.
Maybe modernist. Maybe post-modern. Bombay is all the things all the time.
Plus ça change, plus c'est la même chose.

Prefer a distinctive sans-serif with a long design heritage.

Default choice: "Oswald" (OFL-licensed), owned by Google.
Ref: https://fonts.google.com/specimen/Oswald#license

*Body text Typeface.*

Body text will always be Serif. Choose body faces that provide complete character
sets for the scripts we need to support. Prefer one Serif typeface per script.
Ensure all body faces compose well together.

Default choice: "Gentium *Plus*" (OFL-licensed), owned by SIL International.
Ref: https://software.sil.org/gentium/

# Design Guidelines

*Layout.*

Do not try to dictate terms to The Browser. That story always ends in tragedy,
or worse, abandonment. The Every Layout system is an excellent idea. Let's keep
it simple, let's keep it algorithmic, let's help the Browser help us!
https://every-layout.dev.

*Colours.*

Avoid needless hex codes. Dual tone is perfectly fine. Elevate the words.

*Images.*

Avoid gratuitous imagery. Any graphic must always belong to the writing, and never
the other way around. Let poems be poems, fiction be fiction, comics be comics.

*Icons.*

Avoid needless pixels. Play with Type!
