TV.tmbundle
===========

A TextMate bundle to keep track of last watched episodes of your TV
programmes.

How to use
----------

Keep your programmes in a file called `something.tv[.txt]`. Entries have
the form

    {season}x{episode} | {title}  -- comment

Put the cursor on an entry to transform it with one of the following commands:

  * Next episode: <kbd>opt</kbd><kbd>&rarr;</kbd>.
    Increment the episode count.
  * Previous episode: <kbd>opt</kbd><kbd>&larr;</kbd>.
    Decrement the episode count.
  * Next season: <kbd>opt</kbd><kbd>&uarr;</kbd>.
    Increment the season count and set the episode count to 1.
  * Previous season: <kbd>opt</kbd><kbd>&darr;</kbd>.
    Decrement the season count but keep the episode count.

TextMate already provides other shortcuts that could be useful, like
<kbd>ctrl</kbd><kbd>cmd</kbd><kbd>&uarr;</kbd> and
<kbd>ctrl</kbd><kbd>cmd</kbd><kbd>&darr;</kbd> to move lines up and down.

Example
-------

    My series

    Watching now
    01x05 | Fargo
    03x07 | The Americans
    01x03 | Halt and Catch Fire

    Waiting for the next season
    04x10 | Better Call Saul        -- 23th February 2020

    Yet to begin
    * Westworld
