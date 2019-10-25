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


def main():

    #initialize drawing area, sprites list, and assing system argument variables
    drawing = Gtk.DrawingArea()
    test_sprites_list = sprites.Sprites(drawing)
    zero_sprites = len(sys.argv) == 4
    one_sprite = len(sys.argv) ==7
    two_sprites  = len(sys.argv) == 10

    click_x = int(sys.argv[1])
    click_y = int(sys.argv[2])
    
    if one_sprite:
        sprite_one_label = sys.argv[3]
        sprite_one_x = int(sys.argv[4])
        sprite_one_y = int(sys.argv[5])
        #create the first necessary sprite
        test_sprite_one = sprites.Sprite(test_sprites_list, sprite_one_x, sprite_one_y, svg_str_to_pixbuf(SVG().basic_block()))
        #label the sprite with its label 
        test_sprite_one.labels.append(sprite_one_label)

    if two_sprites:
        sprite_two_x = int(sys.argv[6])
        sprite_two_y = int(sys.argv[7])
        sprite_two_label = sys.argv[8]
        test_sprite_two = sprites.Sprite(test_sprites_list, sprite_two_x, sprite_two_y, svg_str_to_pixbuf(SVG().basic_block()))
        test_sprite_two.labels.append(sprite_two_label)
        
    #OUTPUT THE SPRITE LABEL THAT'S AT THE CLICK INPUT TO THE SCRIPT
    output = test_sprites_list.find_sprite((click_x, click_y))
    if output == None:
        output = "\"None\"" 
        print output
    else:
        label = output.labels[0]
        print output.labels[0]
if __name__ == "__main__":
    main()
