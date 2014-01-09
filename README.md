electoral-map
=============

This is a bunch of software to produce an interactive poll-level
electoral map of Canada. It's currently located
[here](http://hdevalence.ca/etc/electoralmap), but this might change in
the future.

FAQ
===

*   How do I view the data for a particular riding?

    Enter the name of the riding in the search box and select from the
    suggestion menu. Note that there's currently a bug about the dashes
    in riding names, so if you type "Frontenac", it won't suggest
    something like "Lanark–Frontenac–Lennox and Addington". Sorry :(

*   Why do some ridings have more than 100% turnout?

    This is a pretty bad bug, caused by some flawed assumptions in the
    handling of advance polls. Currently, in order to prevent ignoring
    votes, the votes from an advance poll are redistributed amongst all
    the polls that make up the advance poll. The votes are apportioned
    in proportion to the share of electors of each component poll, i.e.,
    we assume that the event of a voter going to an advance poll is 
    independent of their actual poll. This assumption does not hold.

    I'd like to fix the problem, but I need to spend a bit more time
    thinking about the best way to show advance polls.

*   Where are the single-building polls?

    The data is all there, processed and ready, they're just not
    rendered on the map, since it's still a work in progress.

TODO
====

*   Clean code
*   Automate data processing
*   Add single-building polls
*   Fix advance poll handling
*   Fix height of map div: can't be 100% or it overflows because 
    of the header. JS resizing is probably the best bet. CSS height is icky.

