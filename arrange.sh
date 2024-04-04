#!/bin/bash

# 원래 파일이 위치한 폴더
source_folder="files"

# 대상 알파벳
alphabet="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

# 대상 폴더로 파일을 이동하는 함수
move_files() {
    local letter=$1
    local destination_folder="$letter"

    # 알파벳으로 시작하는 파일들을 찾음
    files=$(find "$source_folder" -maxdepth 1 -type f -iname "${letter}*")

    # 파일 이동
    if [ -n "$files" ]; then
        mkdir -p "$destination_folder"  # 대상 폴더 생성
        mv $files "$destination_folder/" # 파일 이동
        echo "Moved files starting with '$letter' to '$destination_folder/'"
    fi
}

# 각 알파벳에 대해 파일 이동 함수 호출
for letter in $(echo $alphabet | fold -w1); do
    move_files $letter
done
