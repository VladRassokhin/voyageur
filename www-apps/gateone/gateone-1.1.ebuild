# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{5,6,7} )
inherit distutils-r1

DESCRIPTION="an HTML5-powered terminal emulator and SSH client"
HOMEPAGE="https://github.com/liftoff/GateOne"
SRC_URI="mirror://github/liftoff/GateOne/${P}.tar.gz"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="dtach kerberos pam"

DEPEND=">=www-servers/tornado-2.2"
RDEPEND="${DEPEND}
	dev-python/pillow[${PYTHON_USEDEP}]
	dtach? ( app-misc/dtach )
	kerberos? ( dev-python/pykerberos )
	pam? ( dev-python/python-pam )"

S="${WORKDIR}/GateOne"
