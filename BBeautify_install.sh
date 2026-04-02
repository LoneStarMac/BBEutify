# Install js-beautify
pip3 install jsbeautifier --break-system-packages 2>/dev/null || pip3 install jsbeautifier

SANDBOXED="$HOME/Library/Containers/com.barebones.bbedit/Data/Library/Application Support/BBEdit/Text Filters"
STANDARD="$HOME/Library/Application Support/BBEdit/Text Filters"

INSTALLED=0

for DIR in "$SANDBOXED" "$STANDARD"; do
    if [ -d "$DIR" ]; then
        cp BBeautify.py "$DIR/BBeautify.py"
        chmod +x "$DIR/BBeautify.py"
        echo "Installed BBeautify.py to $DIR"
        INSTALLED=1
    fi
done

if [ "$INSTALLED" -eq 0 ]; then
    echo "No BBEdit Text Filters directory found. Creating standard location..."
    mkdir -p "$STANDARD"
    cp BBeautify.py "$STANDARD/BBeautify.py"
    chmod +x "$STANDARD/BBeautify.py"
    echo "Installed BBeautify.py to  $STANDARD"
fi
