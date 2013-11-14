# -*- coding: utf-8 -*-
__name__ = 'composerChanger'
__version__ = '0.1'
__author__ = 'Filippov Vladislav'
from PyQt4.QtCore import *
from PyQt4.QtGui import *
from qgis.core import *
from qgis.gui import *

#import sys, os


def run_script(iface):
    insertedValues = {
        u'Проект межевания территории в границах: ': u'Проект межевания территории в границах: Партизанская',
        u'Заказчик: Иванов И.И.': u'Заказчик: Филиппов В.Г.'
    }

    composerlist = iface.activeComposers()
    if len(composerlist) < 1:
        return
    for item in composerlist:
        parseComposition(item, insertedValues)  # composerView = composerList[0]


def parseComposition(composerView, insertedValues):
    composition = composerView.composition()
    if composition is None:
        return
    else:
        changeLabels(composition, insertedValues)  # Текст регистрозависим!


def changeLabels(composition, insertedValues):
    try:
        for search, insert in insertedValues.items():
            for item in composition.items():
                if type(item).__name__ == 'QgsComposerLabel' and item.displayText() == search:
                    print('find it!')
                    item.setText(insert)
    except():
        print 'exeption in changeLabels'


def qwe():
    if 1 == 1:
        print('')