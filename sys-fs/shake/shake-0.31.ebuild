# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit cmake-utils

DESCRIPTION="defragmenter that runs in userspace"
HOMEPAGE="http://vleu.net/shake/"
SRC_URI="http://download.savannah.nongnu.org/releases/${PN}/${P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE=""

DEPEND="sys-apps/attr"
RDEPEND="${DEPEND}"

