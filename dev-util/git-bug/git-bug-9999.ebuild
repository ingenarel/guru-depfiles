# Copyright 2020-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="distributed, offline-first bug tracker"
HOMEPAGE="https://github.com/git-bug/git-bug"

inherit git-r3
EGIT_REPO_URI="https://github.com/git-bug/${PN}"

LICENSE="GPL-3"
SLOT="0"

src_unpack() {
	default
	git-r3_src_unpack
	go-module_live_vendor
}

src_compile() {
	ego generate
	ego build \
		-ldflags "-s -w -X github.com/git-bug/git-bug/commands.GitLastTag=${PV} -X github.com/git-bug/git-bug/commands.GitExactTag=${PV}" \
		-o ${PN}
}

src_install() {
	dobin ${PN}
}

src_test() {
	CI=true ego test
}
