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
from random import uniform
from math import sin, cos, pi, sqrt

import sys
sys.path.insert(0, sys.argv[-1])
import sprites
from tasprite_factory import SVG, svg_from_file, svg_str_to_pixbuf
import taturtle
import tawindow



def main():

    #initialize drawing area, sprites list, and system argument variables
    drawing = Gtk.DrawingArea()
    surface = cairo.SVGSurface("test.svg", 200,200)
    window = tawindow.TurtleArtWindow(drawing, "/", "/", turtle_canvas=surface, activity=None, running_sugar=False, running_turtleart=False)
    

    
    test_sprites_list = sprites.Sprites(drawing)
    test_turtles_list = taturtle.Turtles(window)
    good_turtle = sprites.Sprite(test_sprites_list, 100,100,svg_str_to_pixbuf(SVG().basic_block()))
    num_loops = int(sys.argv[1])
    good_turtle = int(sys.argv[2])
    good_turtle_index = good_turtle//2
    for i in range(num_loops):
        if i == good_turtle_index and good_turtle:
             test_turtle = taturtle.Turtle(test_turtles_list, "good turtle", "green")
             test_turtle.spr = good_turtle
        else:
             test_turtle = taturtle.Turtle(test_turtles_list, "bad turtle" + str(i) , "red")
             test_turtle.spr = None


    output = test_turtles_list.spr_to_turtle(good_turtle)
    
    if output is None:
        print "\"None\""
    else:
        print output._name

main()
