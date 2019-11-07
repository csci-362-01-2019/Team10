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
from gi.repository import GObject
import sys
sys.path.insert(0, sys.argv[-1])
import sprites
from random import uniform
from math import sin, cos, pi, sqrt
from taconstants import (TURTLE_LAYER, DEFAULT_TURTLE_COLORS,DEFAULT_TURTLE,CONSTANTS, Color, ColorObj)
from tacanvas import wrap100, COLOR_TABLE
from sprites import Sprite
from tautils
from tasprite_factory import SVG, svg_from_file, svg_str_to_pixbuf
from TurtleArt.talogo import logoerror


def main():

    #initialize drawing area, sprites list, and system argument variables
    drawing = Gtk.DrawingArea()
    
    test_sprites_list = sprites.Sprites(drawing)
    test_turtles_list = taturtles.Turtles(drawing)
    test_sprite = sprites.Sprite(test_sprites_list, 0,0,svg_str_to_pixbuf(SVG().basic_block()))
    turtle_name = argv[1]
    turtle_color = argv[2]
    test_turtle = taturtle.Turtle(test_turtles_list,turtle_name, turtle_color)

    
	

