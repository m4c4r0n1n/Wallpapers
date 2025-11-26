#!/bin/bash
# Copy all wallpapers organized by theme
for theme_dir in ~/.config/hyde/themes/*/wallpapers; do
    theme_name=$(basename "$(dirname "$theme_dir")")
    mkdir -p "$theme_name"
    
    # Copy all image files
    find "$theme_dir" -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" -o -name "*.gif" -o -name "*.webp" \) -exec cp {} "$theme_name/" \; 2>/dev/null
    
    count=$(ls "$theme_name" 2>/dev/null | wc -l)
    if [ "$count" -gt 0 ]; then
        echo "Copied $count wallpapers from $theme_name"
    else
        rmdir "$theme_name" 2>/dev/null
    fi
done
