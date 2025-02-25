# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3
inherit meson

EGIT_REPO_URI="https://github.com/dgouders/lsp.git"
EGIT_BRANCH="next"

DESCRIPTION="The least significant pager"
HOMEPAGE="https://github.com/dgouders/lsp"
LICENSE="GPL-2"
SLOT="0"

RDEPEND="
	>=sys-apps/man-db-2.12.0
	>=sys-libs/ncurses-6.4_p20230401
"
DEPEND="${RDEPEND}"

pkg_postinst() {
	elog "lsp(1) is still considered experimental."
	elog "Testers and feedback are very welcome!"
	elog ""
	elog "One known problem are files with long lines."
	elog "Movement within those files isn't accurate but"
	elog "this will get fixed in the near future."
	elog ""
	elog "To enable lsp(1) to be automatically selected"
	elog "as a pager, set either MANPAGER, GIT_PAGER and/or PAGER."
}
