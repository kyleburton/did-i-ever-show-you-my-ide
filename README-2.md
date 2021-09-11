# Overview

The Machine of Lum the Mad
  aka Did I Ever Show You My IDE?

What this is not: this is not an advocacy piece for any of: Clojure, Bash, Unix, Emacs, Vim or any other specific program or technology that I use to demonstrate the ideas or concepts I'm trying to get across.  If your team is not currently using one of these (espeically something like Clojure) it's probably entirely inappropraite for this to be taken as advocacy.

So if that is one of the (many) things that this is not, then what is this?

# The Machine of Lum the Mad

. https://twitter.com/Jetpack_7/status/943525060492582912/photo/1

I like the description from the [forgotten realms](https://forgottenrealms.fandom.com/wiki/Machine_of_Lum_the_Mad) wiki:

```
  The Machine of Lum the Mad was an ancient artifact that had several dials and
  levers. Combinations entered by the users had either very beneficial or
  absolutely disastrous effects on them.
```

That definitly captures some of the mystery, awe, and whimsy that's often associated the unix environment.

To me, its philosophical underpinnings are about composition, about discovering the new primitives and recomposing quickly.  Building up from the primitives towards the semantics of your problem space.

I suffer? from an uncontrollable urge to fit everything I see and touch into a unified model or framework.  So I'm going to be spinning lots of philosophy and models, it's what I do, my hope is that they are also valuable for you.

# I've Got 99^99 Problems ...

I see a few divisions?, phases? parts in the way we approach developing our systems:

* problem domain
* soltuion domain
* implementation domain
* execution domain

## Problem Domain

Do we know what the problem is we're solving?  Usually we don't, we think we do but as we try to solve it we understand it better.  Can we define it?  If we can't define it we can't solve it, we won't know if a feature or a change to the system will address our problem.  Ideally we understand this clearly, we know that what is part of the problem and that which is not.  Typically we don't hit this ideal and we need to act in the other domains - which crucially teach us more about the problem being solved.  The best and worst part of that is that what we learn changes the first principles or primitives we've used to define the problem and the other domains.  As best as possible we want to tighten this loop and be able to integrate those changes throughout our systems.

## Solution Domain

Solutions are how we approach solving the problem that we think we have, as best as we understand it.  What data do we need to persist?  What's its life cycle?  Where do we need to protect against concurrency?  Where can we benefit from concurrency?

Our systems benefit when we can, as best as possible, conceptually separate our solution from implementation details.  The more the solution can be seen and understood by those looking at the system, separated from the constraints and limitations of the implementation, the better we'll be able to understand the system and maintain it.

## Implementation Domain

Here we encounter constraints that interfere with both the problem and the solution.  We must chose types, we must consider storage space, memory capacity, bandwidth.  Monetary costs.  This is where we compromise, where we limit, we constrain.  Must we have performance gaurantees that question the fitness of GC?  Can we tolerate runtime type conversion errors?  Must we support unknown data schemas?

## Execution Domain

I see this as a different set of concerns than the implementation domain, here are the live systems.  We benefit from being visibility into their behavior, being able to see traffic patterns, avaialble capacity.

# BREAK / MENTAL PIVOT

Why this framing?  Because I'm setting some context for how I want to think about your development environment.  The kinds of things you want to do and how you want that environment supporting and influencing you.  I want to seemlessly move back and forth between these domains as I learn more about the problem, I want to propagate those valuable learnings across the other domains.  I don't want to be constrained.

I want my tools to foster and encourage the explroation of each of these domains.

... so, lets talk about what an IDE is and if you and I have the understanding of what one is ... :)

# IDE - Integrated Development Environment

## Integrated:

  - formed or united into a whole
  - resembling a living organism in organization or development
  - Having different groups treated together as equals in one group
  - To form into one whole; to make entire; to complete; to renew; to restore; to perfect

I really like that last one, it implies change, iteration and improvement, it's almost verb like.  To me, this speaks to composition, and abstraction.  Who doesn't like unity and equality?

## Development:

  - The act of developing or disclosing that which is unknown; a gradual unfolding process by which anything is developed, ...; gradual advancement or growth through a series of progressive changes; also, the result of developing, or a developed state
  - a process in which something passes by degrees to a different stage (especially a more advanced or mature stage)

I love that "disclosing that which is unknown" - some good themes there: disclosing, progressing, advancement


## Environment:

  - the totality of surrounding conditions
  - That which environs or surrounds; surrounding conditions, influences, or forces, by which living forms are influenced and modified in their growth and development

Surrounding conditions, influences, that which modifies growth and development.  The key part that relates to this talk / discussion is where this ends, what's its extent?  Do we have the same boundaries?

So, this could be seen as a bit of hubris or conceit.  A primary thing I'd like us to take away is to unbound this part of how we think about the different parts of our development environment.

## Unbounded:

  - Having no bound or limit; as, unbounded space; an, unbounded ambition
  - seemingly boundless in amount, number, degree, or especially extent

Where does your IDE begin and end?  Who's the IDE for?  For Java?  For the programming language? the compiler?  NO: it's for you, for the person, for your _systems_.

Is mysql-workbench an IDE?  Yes of sorts, but why is it separate (not integrated) with IntelliJ?  Wouldn't we want to be able to access the data store through the same libraries and apis that our services are using?  That helps create consistency and repeatabiltiy.  It encourages us to build up from our primitves, it's a virtuous cycle.


# BREAK / MENTAL PIVOT

Ok, so lots of weird philosophical mumbo jumbo.  How do I think about my tools and my environment?


# The Unix Philosohpy

Or at least how I think about the Unix Philosohpy ... composition of smaller bits into larger bits, where you're pulling up the primitives to meet the sematics of your problem space.

VIM is an unbounded tool for manipulating text.  It provides primitives (motions and actions) that you compose to achieve your goals.  They typicall able to be composed in ways that scale.

Emacs is an unbounded tool to be extended and assimilate tools for exploring your problem, solution and implementation domians.  "You don't _use_ Emacs, you _extend_ it."  Emacs has deep roots in the Lisp community, the Lisp community values interactive development (but what they mean by interactive development isn't what I think most of us think it means).  [talk about how the CLHS has no 'exit']

The shell is an unbounded tool for interacting with your system - constrainted entirely within the semantics of repeatability and automatability.

IntelliJ and Eclipse are amazing tools for writing and debugging code.  IMO they integrate a (too) finite set of aspects: manipulating code (they do this amazingly well); compilation (primarily focused on the language tooling); and debugging (mostly focused on artificial execution domains).



# Demonstrations


