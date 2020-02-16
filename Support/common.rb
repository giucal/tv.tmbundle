# Needed by individual commands.
require "#{ENV['TM_SUPPORT_PATH']}/lib/exit_codes"

# Transforms an entry.
def on_entry_line
  entry = Entry.parse(STDIN.read) or TextMate::exit_discard
  yield entry
  print entry
end

# An entry as found in a "TV" file.
#
# An entry represents the state of a TV programme, described by the
# following attributes.
#
#   - Title.   The name of the programme.
#   - Season.  The season being currently in the watching.
#   - Episode. The last watched episode of the season.
#   - Comment. An addendum.
#
# An entry is expected to comply with the format
#
#   <season> "x" <episode> " "* "|" " "* <title> [" "* "--" <comment>]
#
class Entry < Struct.new(:title, :season, :episode, :comment)
  # Entry format.
  RE = /^(\d+)x(\d+)[ \t]*\|[ \t]*\b(.+)\b([ \t]*(?:--.*)?)$/

  # Comment comprehensive of leading space and "--" mark.
  # Useful to maintain the alignment of comments.
  attr_reader :trailing

  private
  def initialize(title, season, episode, trailing)
    @trailing = trailing
    super(title, season, episode, trailing.strip)
  end

  # Parses an entry.
  #
  # Returns nil if the line is not a valid entry.
  def self.parse(line)
    return nil unless line =~ RE
    entry = Entry.new(
      title = $3,
      season = $1.to_i,
      episode = $2.to_i,
      trailing = $4
    )
  end

  def to_s
    s = format "%02dx%02d | %s", season, episode, title
    s += trailing unless trailing.nil?
  end
end
