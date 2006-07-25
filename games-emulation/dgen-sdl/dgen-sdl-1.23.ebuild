# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/games-emulation/dgen-sdl/dgen-sdl-1.23.ebuild,v 1.8 2005/01/09 10:50:14 swegener Exp $

inherit games gnuconfig

DESCRIPTION="A Linux/SDL-Port of the famous DGen MegaDrive/Genesis-Emulator"
HOMEPAGE="http://www.pknet.com/~joe/dgen-sdl.html"
SRC_URI="http://www.pknet.com/~joe/${P}.tar.gz"

LICENSE="dgen-sdl"
KEYWORDS="~amd64 x86"
SLOT="0"
IUSE="X mmx opengl"

RDEPEND="media-libs/libsdl
	X? ( virtual/x11 )
	opengl? ( virtual/opengl )"
DEPEND="${DEPEND}
	dev-lang/nasm"

src_compile() {
	gnuconfig_update

	egamesconf \
		$(use_with opengl) \
		$(use_with X x) \
		$(use_with mmx) || die
	emake || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" install || die "make install failed"
	dodoc AUTHORS ChangeLog README sample.dgenrc
	prepgamesdirs
}