class Unit
  def initialize(name, stats)
    @name = name
    @stats = stats
  end

  def get_name
    return @name
  end
  def get_stats
    outstats = []
    for stat in @stats
      outstats.push [stat[0]+" = "+stat[1].to_s]
    end
    return outstats.join("\n")
  end
  def get_stat(stat_name)
    if @stats[stat_name].is_a?(Integer) #If the stat exists
      return (stat_name+" = "+@stats[stat_name].to_s)
    else #If stat_name was spelled wrong, or the unit doesn't have that stat
      return (@name+" doesn't have stat "+stat_name)
    end
  end
end
