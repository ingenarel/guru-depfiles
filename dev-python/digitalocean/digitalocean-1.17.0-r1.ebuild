# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..12} )
inherit distutils-r1

DESCRIPTION="Digitalocean API access library"
HOMEPAGE="https://github.com/koalalorenzo/python-digitalocean"
SRC_URI="https://github.com/koalalorenzo/python-${PN}/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/python-${P}"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/jsonpickle[${PYTHON_USEDEP}]
"
BDEPEND="test? ( dev-python/responses[${PYTHON_USEDEP}] )"

distutils_enable_sphinx docs dev-python/alabaster

EPYTEST_DESELECT=(
	# Needs net
	digitalocean/tests/test_firewall.py
)

distutils_enable_tests pytest
