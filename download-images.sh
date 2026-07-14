#!/bin/bash
# Download product images from HellermannTyton official website
# This script downloads the 10 main product images for the 3D showcase

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
IMG_DIR="${SCRIPT_DIR}/assets/images"
mkdir -p "${IMG_DIR}"

echo "=== Downloading HellermannTyton Product Images ==="
echo "Target directory: ${IMG_DIR}"
echo ""

# Product image URLs from HellermannTyton official website
declare -A images=(
    ["tie1_T30R_main.jpg"]="https://www.hellermanntyton.com/shared/images600/57723.jpg"
    ["tie2_PT2A_main.jpg"]="https://www.hellermanntyton.com/shared/images600/30168.jpg"
    ["tie3_MBT8S_main.jpg"]="https://www.hellermanntyton.com/shared/images600/1147917.jpg"
    ["tie4_TEXTIE_main.jpg"]="https://www.hellermanntyton.com/shared/images600/95585.jpg"
    ["tie5_SVCOC_main.jpg"]="https://www.hellermanntyton.com/shared/images600/1142402.jpg"
    ["tie6_KR8_main.jpg"]="https://www.hellermanntyton.com/shared/images600/25411016.jpg"
    ["tie7_T18R_main.jpg"]="https://www.hellermanntyton.com/shared/images600/1000648.jpg"
    ["tie8_RFT5_main.jpg"]="https://www.hellermanntyton.com/shared/images600/1792268.jpg"
    ["tie9_KR8S1_main.jpg"]="https://www.hellermanntyton.com/shared/images600/95520.jpg"
    ["tie10_SR255S_main.jpg"]="https://www.hellermanntyton.com/shared/images600/12743320.jpg"
)

success=0
failed=0

for filename in "${!images[@]}"; do
    url="${images[$filename]}"
    filepath="${IMG_DIR}/${filename}"
    
    if [ -f "${filepath}" ]; then
        echo "[SKIP] ${filename} already exists"
        ((success++))
        continue
    fi
    
    if curl -sL -o "${filepath}" "${url}"; then
        size=$(du -h "${filepath}" | cut -f1)
        echo "[OK] ${filename} (${size})"
        ((success++))
    else
        echo "[FAIL] ${filename}"
        ((failed++))
    fi
done

echo ""
echo "=== Download Complete ==="
echo "Success: ${success}, Failed: ${failed}"
echo ""
echo "Next steps:"
echo "  1. Build Docker image: docker-compose build"
echo "  2. Run container: docker-compose up -d"
echo "  3. Open browser: http://localhost:8080"
