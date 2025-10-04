#!/usr/bin/env bash
set -euo pipefail

VERSION="${SASS_EMBEDDED_VERSION:-1.62.1}"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BIN_DIR="${ROOT_DIR}/node_modules/.bin"

case "$(uname -s)" in
  Linux) platform="linux" ;;
  Darwin) platform="macos" ;;
  MINGW*|MSYS*|CYGWIN*|Windows_NT) platform="windows" ;;
  *) echo "[dart-sass-embedded] Unsupported OS: $(uname -s)" >&2; exit 0 ;;
esac

case "$(uname -m)" in
  x86_64|amd64) arch="x64" ;;
  arm64|aarch64) arch="arm64" ;;
  armv7l|armv6l) arch="arm" ;;
  i386|i686) arch="ia32" ;;
  *) echo "[dart-sass-embedded] Unsupported architecture: $(uname -m)" >&2; exit 0 ;;
esac

if [[ "${platform}" == "macos" ]]; then
  target="macos-${arch}"
  archive_type="tar.gz"
elif [[ "${platform}" == "windows" ]]; then
  target="windows-${arch}"
  archive_type="zip"
else
  target="${platform}-${arch}"
  archive_type="tar.gz"
fi

url="https://github.com/sass/dart-sass-embedded/releases/download/${VERSION}/sass_embedded-${VERSION}-${target}.${archive_type}"

tmpdir="$(mktemp -d)"
trap 'rm -rf "${tmpdir}"' EXIT

echo "[dart-sass-embedded] Downloading ${url}" >&2
if [[ "${archive_type}" == "zip" ]]; then
  if ! curl -fL "${url}" -o "${tmpdir}/archive.zip"; then
    echo "[dart-sass-embedded] Failed to download dart-sass-embedded ${VERSION} for ${target}" >&2
    exit 1
  fi
  if ! unzip -q "${tmpdir}/archive.zip" -d "${tmpdir}"; then
    echo "[dart-sass-embedded] Failed to extract dart-sass-embedded ${VERSION} for ${target}" >&2
    exit 1
  fi
else
  if ! curl -fL "${url}" | tar -xz -C "${tmpdir}"; then
    echo "[dart-sass-embedded] Failed to download dart-sass-embedded ${VERSION} for ${target}" >&2
    exit 1
  fi
fi

content_dir="${tmpdir}/sass_embedded"
binary_path="${content_dir}/dart-sass-embedded"
if [[ ! -f "${binary_path}" ]]; then
  echo "[dart-sass-embedded] Unexpected archive contents for ${target}" >&2
  exit 1
fi

install_root="${ROOT_DIR}/node_modules/.dart-sass-embedded"
rm -rf "${install_root}"
mkdir -p "${install_root%/*}"
mv "${content_dir}" "${install_root}"

mkdir -p "${BIN_DIR}"
wrapper="${BIN_DIR}/dart-sass-embedded"
cat > "${wrapper}" <<'WRAPPER'
#!/usr/bin/env bash
set -euo pipefail
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
EXEC="${BASE_DIR}/.dart-sass-embedded/dart-sass-embedded"
exec "${EXEC}" "$@"
WRAPPER
chmod +x "${wrapper}"

echo "[dart-sass-embedded] Installed to ${install_root}" >&2
