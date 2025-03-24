#!/bin/bash


get_clipboard_content() {
    xclip -selection clipboard -o
}


translate_text() {
    local text="$1"
    trans en:ru -brief -no-browser <<< "$text"
}


show_text_on_screen() {
    local text="$1"
   
    local wrapped_text=$(echo "$text" | fold -s -w 80)

    echo "$wrapped_text" | osd_cat --pos=top --align=right --delay=5 --font="-*-fixed-*-*-*-*-30-*-*-*-*-*-*-*" --color=green --outline=2 --shadow=5 --shadowcolour=pink --offset=100 --indent=100
}


main() {
    current_content=$(get_clipboard_content)
    
    translated_text=$(translate_text "$current_content")
   
    show_text_on_screen "$translated_text"
}

main
