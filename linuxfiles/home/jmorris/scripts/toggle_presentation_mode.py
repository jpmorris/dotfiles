#!/usr/bin/python

import i3ipc
import os
import json

i3 = i3ipc.Connection()

state_windows_file = '/tmp/state_windows.json'
# if window state file exists then restore windows and delete state file


def restore_windows(workspace, container):
    cmd_move_back = "i3-msg '[con_id={}] move --no-auto-back-and-forth workspace {}'".format(container['id'], workspace['name'])
    os.system(cmd_move_back)
    cmd_disable_float= "i3-msg '[con_id={}] floating disable'".format(container['id'], workspace['name'])
    os.system(cmd_disable_float)


def hide_windows(workspace, container):
    if workspace['name'] != '1':
        cmd_move_scratchpad = "i3-msg '[con_id={}] move --no-auto-back-and-forth scratchpad'".format(container['id'], workspace['name'])
        os.system(cmd_move_scratchpad)


def descend_tree(root, restore_windows):
    for output in root:
        # print('output: ' + output['type'] + ' ' + output['name'])
        for areas in output['nodes']:
            if areas['type'] == 'con':
                # print('\tareas: ' + areas['type'] + ' ' + areas['type'])
                for workspace in areas['nodes']:
                    # print('\t\tworkspace: ' + workspace['type'] + ' ' + workspace['name'])
                    for container in workspace['nodes']:
                        get_nested_windows(workspace, container, restore_windows)

def get_nested_windows(workspace, container, run_command):
    if len(container['nodes']) > 0:
        for node in container['nodes']:
            get_nested_windows(workspace, node, run_command)
    else:
        run_command(workspace, container)

if __name__ == '__main__':
    # RESTORE WINDOWS
    if os.path.exists(state_windows_file):
        # open state file
        with open(state_windows_file) as json_file:
            state_windows = json.load(json_file)
        # restore windows
        descend_tree(state_windows['nodes'], restore_windows)
        # disable notifications
        os.system('notify-send "DUNST_COMMAND_RESUME"')
        # remove state file
        os.remove(state_windows_file)
    # HIDE WINDOWS
    else:
        # save window state file
        os.system('i3-msg -t get_tree > {}'.format(state_windows_file))
        with open(state_windows_file, 'r') as json_file:
            state_windows = json.load(json_file)
        # move every window to scratchpad EXCEPT for any window reserved in workspace 1
        descend_tree(state_windows['nodes'], hide_windows)
        # resume notifications
        os.system('notify-send "DUNST_COMMAND_PAUSE"')




