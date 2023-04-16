#!/bin/sh

HOW_MANY_CMDs=10
cat $HOME/.bash_history | tail -n $HOW_MANY_CMDs > my_hist_file
