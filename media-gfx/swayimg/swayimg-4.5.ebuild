# Copyright 2023-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson xdg

DESCRIPTION="Lightweight image viewer for Wayland display servers"
HOMEPAGE="https://github.com/artemsen/swayimg"
SRC_URI="https://github.com/artemsen/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="avif bash-completion drm exif exr gif heif jpeg jpegxl png raw sixel svg test tiff +wayland webp X"
REQUIRED_USE="|| ( drm wayland )"
RESTRICT="!test? ( test )"

RDEPEND="
	media-libs/fontconfig
	media-libs/freetype
	x11-libs/libxkbcommon
	avif? ( media-libs/libavif:= )
	bash-completion? ( app-shells/bash-completion )
	drm? ( x11-libs/libdrm )
	exif? ( media-libs/libexif )
	exr? ( media-libs/openexr:= )
	gif? ( media-libs/giflib:= )
	heif? ( media-libs/libheif:= )
	jpeg? ( media-libs/libjpeg-turbo:= )
	jpegxl? ( media-libs/libjxl:= )
	png? ( media-libs/libpng:= )
	raw? ( media-libs/libraw:= )
	sixel? ( media-libs/libsixel )
	svg? (
		dev-libs/glib:2
		gnome-base/librsvg:2
		x11-libs/cairo[X=]
	)
	tiff? ( media-libs/tiff:= )
	wayland? (
		dev-libs/json-c:=
		dev-libs/wayland
	)
	webp? ( media-libs/libwebp:= )
"
DEPEND="${RDEPEND}
	svg? ( X? ( x11-base/xorg-proto ) )
	wayland? ( dev-libs/wayland-protocols )
"
BDEPEND="
	test? ( dev-cpp/gtest )
	wayland? ( dev-util/wayland-scanner )
"

src_configure() {
	local emesonargs=(
		$(meson_feature avif)
		$(meson_feature drm)
		$(meson_feature exif)
		$(meson_feature exr)
		$(meson_feature gif)
		$(meson_feature heif)
		$(meson_feature jpeg)
		$(meson_feature jpegxl jxl)
		$(meson_feature png)
		$(meson_feature raw)
		$(meson_feature sixel)
		$(meson_feature svg)
		$(meson_feature test tests)
		$(meson_feature tiff)
		$(meson_feature wayland)
		$(meson_feature wayland compositor)
		$(meson_feature webp)
		$(meson_feature bash-completion bash)
		-Dversion=${PV}
		-Ddesktop=true
		# avoid automagic building with scdoc
		-Dman=false
		-Dzsh=enabled
	)
	meson_src_configure
}

src_install() {
	meson_src_install

	doman extra/*.{1,5}
}
