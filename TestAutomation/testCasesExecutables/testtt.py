import sprites
import cairo
import gi
gi.require_version("Gtk", "3.0")
from gi.repository import Gtk
from gi.repository import Gdk
from gi.repository import GdkPixbuf
from gi.repository import Pango
from gi.repository import PangoCairo
from gi.repository import GdkPixbuf
from tasprite_factory import SVG, svg_from_file, svg_str_to_pixbuf
import sys


def main():
    #CREATE THE DRAWING AREA AND INITIALIZE SPRITE ARRAY
    drawing = Gtk.DrawingArea()
    test_sprites_list = sprites.Sprites(drawing)
    #CREATE A SPRITE THAT STARTS AT THE INPUTS AND MAKES A 19 X 27 RECTANGLE FROM THAT POINT
    test_sprite_one = sprites.Sprite(test_sprites_list, int(sys.argv[1]), int(sys.argv[2]), svg_str_to_pixbuf(SVG().basic_block()))
    #LABEL WITH INPUT LABEL
    test_sprite_one.labels.append(sys.argv[3])
    #OUTPUT THE SPRITE LABEL THAT'S AT THE CLICK INPUT TO THE SCRIPT
    print(test_sprites_list.find_sprite((int(sys.argv[4]), int(sys.argv[5]))).labels[0])
if __name__ == "__main__":
    main()
