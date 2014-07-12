class Map
  def initialize(height, width)
    @height = height #NOTE: height & width in rooms, not tiles!
    @width = width
    @map = generate_map
    @visual = generate_tiles
  end
  def generate_map
    rooms = []
    @height.times do
      rooms.push []
      @width.times do
        rooms[-1].push [rand(4)+5,rand(4)+5]
        #rooms[-1].push [9,9] #Test case 1
        #rooms[-1].push [6,6] #Test case 2
      end
    end
    return rooms
  end
  def generate_tiles
    #TODO: Allow for bigger rooms: 9x9 (7x7 walkable) is pretty small
    #TODO: Put in corridors between rooms
    tile_height = @height*12 - 3 #The map's height in tiles (ASCII characters)
    tile_width = @width*12 - 3 #The map's width in tiles
    tiles = [] #The visual map

    tile_height.times do
      tiles.push([" "]*tile_width)
    end

    @map.each_with_index do |row,i|
      row.each_with_index do |room,j|
        center_row = i*12 + 4
        center_col = j*12 + 4
        tiles[center_row - room[0]/2][(center_col - room[1]/2)..(center_col + (room[1]/2.0).ceil-1)] = ["-"]*room[1]
        tiles[center_row + (room[0]/2.0).ceil-1][(center_col - room[1]/2)..(center_col + (room[1]/2.0).ceil-1)] = ["-"]*room[1]
        (room[0]-2).times do |count|
          tiles[center_row - room[0]/2 + 1 + count][(center_col - room[1]/2)] = "|"
          tiles[center_row - room[0]/2 + 1 + count][(center_col + (room[1]/2.0).ceil-1)] = "|"
          tiles[center_row - room[0]/2 + 1 + count][(center_col - room[1]/2 + 1)..(center_col + (room[1]/2.0).ceil-1 - 1)] = ["."]*(room[1]-2)
        end
      end
    end

    return tiles
  end

  def get_height
    return @height
  end
  def get_width
    return @width
  end
  def get_map
    return @map
  end
  def get_visual
    return @visual
  end
end
