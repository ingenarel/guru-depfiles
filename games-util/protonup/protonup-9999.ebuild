# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

EPYTHON=python3

inherit git-r3 distutils-r1
EGIT_REPO_URI="https://github.com/AUNaseef/protonup.git"
DESCRIPTION="Install and Update Proton-GE"
HOMEPAGE="https://github.com/AUNaseef/protonup"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]"

src_compile() {
	distutils-r1_src_compile
}

src_install() {
	distutils-r1_src_install
}
