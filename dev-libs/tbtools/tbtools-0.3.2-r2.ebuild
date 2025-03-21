# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.4-r1

EAPI=8

CRATES="
	ahash@0.8.11
	aho-corasick@1.1.3
	ansi_term@0.12.1
	anstream@0.6.13
	anstyle-parse@0.2.3
	anstyle-query@1.0.2
	anstyle-wincon@3.0.2
	anstyle@1.0.6
	autocfg@1.2.0
	bitflags@1.3.2
	bitflags@2.5.0
	cfg-if@1.0.0
	clap@4.5.4
	clap_builder@4.5.2
	clap_derive@4.5.4
	clap_lex@0.7.0
	colorchoice@1.0.0
	crossbeam-channel@0.5.12
	crossbeam-utils@0.8.19
	crossterm@0.27.0
	crossterm_winapi@0.9.1
	darling@0.20.8
	darling_core@0.20.8
	darling_macro@0.20.8
	deranged@0.3.11
	enum-map-derive@0.17.0
	enum-map@2.7.3
	enumset@1.1.3
	enumset_derive@0.8.1
	equivalent@1.0.1
	fnv@1.0.7
	getrandom@0.2.14
	hashbrown@0.14.3
	heck@0.5.0
	ident_case@1.0.1
	indexmap@2.2.6
	itoa@1.0.11
	lazy_static@1.4.0
	libc@0.2.153
	libudev-sys@0.1.4
	lock_api@0.4.11
	log@0.4.21
	memchr@2.7.2
	memoffset@0.7.1
	mio@0.8.11
	nix@0.26.4
	num-complex@0.4.5
	num-conv@0.1.0
	num-integer@0.1.46
	num-iter@0.1.44
	num-rational@0.4.1
	num-traits@0.2.18
	num@0.4.1
	num_threads@0.1.7
	once_cell@1.19.0
	parking_lot@0.12.1
	parking_lot_core@0.9.9
	pin-utils@0.1.0
	pkg-config@0.3.30
	powerfmt@0.2.0
	ppv-lite86@0.2.17
	proc-macro2@1.0.79
	quote@1.0.35
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	redox_syscall@0.4.1
	regex-automata@0.4.6
	regex-syntax@0.8.3
	regex@1.10.4
	ryu@1.0.17
	scopeguard@1.2.0
	serde@1.0.197
	serde_derive@1.0.197
	serde_json@1.0.115
	serde_yaml@0.9.34+deprecated
	signal-hook-mio@0.2.3
	signal-hook-registry@1.4.1
	signal-hook@0.3.17
	smallvec@1.13.2
	strsim@0.11.1
	syn@2.0.58
	time-core@0.1.2
	time-macros@0.2.17
	time@0.3.34
	udev@0.7.0
	unicode-ident@1.0.12
	unicode-segmentation@1.11.0
	unicode-width@0.1.11
	unsafe-libyaml@0.2.11
	utf8parse@0.2.1
	uuid@1.8.0
	version_check@0.9.4
	wasi@0.11.0+wasi-snapshot-preview1
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.48.5
	windows-targets@0.52.4
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.4
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.4
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.4
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.4
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.4
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.4
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.4
	xi-unicode@0.3.0
	zerocopy-derive@0.7.32
	zerocopy@0.7.32
"

declare -A GIT_CRATES=(
	[cursive-macros]='https://github.com/gyscos/cursive;0a95c82c88c8a791d7fd983e7fb9f568b77551a8;cursive-%commit%/cursive-macros'
	[cursive]='https://github.com/gyscos/cursive;0a95c82c88c8a791d7fd983e7fb9f568b77551a8;cursive-%commit%/cursive'
	[cursive_core]='https://github.com/gyscos/cursive;0a95c82c88c8a791d7fd983e7fb9f568b77551a8;cursive-%commit%/cursive-core'
)

# <time@0.3.35
# https://github.com/time-rs/time/issues/693
RUST_MAX_VER="1.79.0"
RUST_MIN_VER="1.74.0"

inherit cargo

DESCRIPTION="Thunderbolt/USB4 debugging tools"
HOMEPAGE="https://github.com/intel/tbtools"
SRC_URI="
	https://github.com/intel/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+=" Apache-2.0 Unicode-DFS-2016"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="virtual/libudev"
DEPEND="${RDEPEND}"
BDEPEND="
	virtual/pkgconfig
"

QA_FLAGS_IGNORED="usr/bin/.*"
