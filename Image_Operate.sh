#!/bin/bash

# Help
function Help_Document {
	echo "How to use:	bash Image_Operate.sh [options]"
	echo "options:"
	echo "-d	input the directory of pictures"
	echo "-j	Input the compression rate"
	echo "-c	Input the rate"
	echo "-e	Input the watermark"
	echo "-p	Input the prefix"
	echo "-s	Input the suffix"
	echo "-v	Convertto jpeg image"
	echo "-h	Get help"
}

# JPEG_Compress
function JPEG_Compress {                                                                                                                 
	mkdir J_output
    	for p in "$1"*.jpg; 
	do
	        fullname=$(basename "$p")
        	filename=$(echo "$fullname" | cut -d . -f1)
        	convert "$p" -quality "$2"% ./J_output/"$filename"."jpg"
	done

}

# Compress_Rate
function Compress_Rate {
	mkdir C_output
	for p in $(find "$1" -regex  '.*\.jpg\|.*\.svg\|.*\.png'); 
	do
		fullname=$(basename "$p")
	    filename=$(echo "$fullname" | cut -d . -f1)
		extension=$(echo "$fullname" | cut -d . -f2)
		convert "$p" -resize "$2" ./C_output/"$filename"."$extension"
	done
}

# Watermark
function Watermark {
	mkdir W_output
	for p in $(find "$1" -regex  '.*\.jpg\|.*\.svg\|.*\.png'); 
	do
		fullname=$(basename "$p")
        filename=$(echo "$fullname" | cut -d . -f1)
		extension=$(echo "$fullname" | cut -d . -f2)
		width=$(identify -format %w "$p")
		convert -background '#2F4F4F' -fill blue -gravity center \
		-size "${width}"x30 caption:"$2" "$p" +swap -gravity south \
		-composite ./W_output/"$filename"."$extension"
	done
}

# Rename
function Rename_Prefix {
	mkdir RP_output;
	for p in "$1"*.*; do
		fullname=$(basename "$p")
        filename=$(echo "$fullname" | cut -d . -f1)
		extension=$(echo "$fullname" | cut -d . -f2)
		cp "$p" ./RP_output/"$2""$filename"."$extension"
	done
}
function Rename_Suffix {
	mkdir RS_output;
	for p in "$1"*.*; 
	do
		fullname=$(basename "$p")
	    filename=$(echo "$fullname" | cut -d . -f1)
		extension=$(echo "$fullname" | cut -d . -f2)
		cp "$p" ./RS_output/"$filename""$2"."$extension"
	done
}

# Convert_JPEG
function Convert_JPEG {
	mkdir CJ_output
	for p in $(find "$1" -regex '.*\.svg\|.*\.png');
	do	
		fullname=$(basename "$p")
        filename=$(echo "$fullname" | cut -d . -f1)
		extension=$(echo "$fullname" | cut -d . -f2)
		convert "$p" ./CJ_output/"$filename"".jpg"
	done
}

# main

dir=""

if [[ "$#" -lt 1 ]]; then
	echo "Error!"
else 
	while [[ "$#" -ne 0 ]]; do
		case "$1" in
			"-d")
				dir="$2"
				shift 2
				;;
				
			"-j")
				if [[ "$2" != '' ]]; then 
					JPEG_Compress "$dir" "$2"
					shift 2
				else 
					echo "Please input a intact parameter"
				fi
				;;
				
			"-c")
				if [[ "$2" != '' ]]; then 
					Compress_Rate "$dir" "$2"
					shift 2
				else 
					echo "Please input rate"
				fi
				;;
				
			"-w")
				if [[ "$2" != '' ]]; then 
					Watermark "$dir" "$2"
					shift 2
				else 
					echo "Please enter the watermark"
				fi
				;;
				
			"-p")
				if [[ "$2" != '' ]]; then 
					Rename_Prefix "$dir" "$2"
					shift 2
				else 
					echo "Please input the prefix"
				fi
				;;
				
			"-s")
				if [[ "$2" != '' ]]; then 
					Rename_Suffix "$dir" "$2"
					shift 2
				else 
					echo "Please input the suffix"
				fi
				;;
			
			"-v")
				Convert_JPEG "$dir"
				shift
				;;
				
			"-h")
				Help_Document
				shift
				;;
		esac
	done
fi
