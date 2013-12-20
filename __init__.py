# -*- coding: utf-8 -*-
"""
/***************************************************************************
 openLand
                                 A QGIS plugin
                             -------------------
        begin                : 2012-10-08
        copyright            : (C) 2012 by Dmitriy Biryuchkov
        email                : biryuchkov@gmail.com
 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/
 This script initializes the plugin, making it known to QGIS.
"""
def name():
    return "openLand"
def description():
    return "Module for the cadastral engineer work"
def category():
    return "Plugins"
def version():
    return "Version 0.2.8"
def icon():
    return "settings/main.png"
def qgisMinimumVersion():
    return "2.0"
def qgisMaximumVersion():
    return "2.99"
def authorName():
    return "Dmitriy Biryuchkov"
def classFactory(iface):
    from openland import openLand
    return openLand(iface)
