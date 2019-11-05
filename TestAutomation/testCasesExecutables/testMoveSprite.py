import cairo
import gi
import os
gi.require_version("Gtk", "3.0")
from gi.repository import Gtk
from gi.repository import Gdk
from gi.repository import GdkPixbuf
from gi.repository import Pango
gi.require_version("PangoCairo", "1.0")
from gi.repository import PangoCairo
from gi.repository import GdkPixbuf
import sys
sys.path.insert(0, sys.argv[-1])
import sprites
from tasprite_factory import SVG, svg_from_file, svg_str_to_pixbuf


# [15,115, "yellow", 1,1]
def main(): 
    #initialize drawing area, sprites list, and assing system argument variables
    drawing = Gtk.DrawingArea()
    test_sprites_list = sprites.Sprites(drawing)
    x = int(sys.argv[1])
    y = int(sys.argv[2])
    move_x = int(sys.argv[3])
    move_y = int(sys.argv[4])
    test_sprite_one = sprites.Sprite(test_sprites_list, x, y, svg_str_to_pixbuf(SVG().basic_block()))
    test_sprite_one.move_relative([move_x, move_y])
    print ("\"" + str(test_sprite_one.get_xy()) + "\"")
    
    #self.rect.x this is how the the sprite moves things
main()
