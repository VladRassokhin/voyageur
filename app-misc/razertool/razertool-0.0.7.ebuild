# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="Unofficial tool for controlling the Razer Copperhead mouse"
HOMEPAGE="http://razertool.sourceforge.net/"
SRC_URI="mirror://sourceforge/${PN}/${PN}_${PV}.orig.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gtk hal"

# libusb-0.1.10a does not provide /usr/lib/pkgconfig/libusb.pc
# hal creates the plugdev group
DEPEND=">=dev-libs/libusb-0.1.12
	hal? ( >=sys-apps/hal-0.5.7 )
	gtk? (
		>=gnome-base/librsvg-2.0
		>=x11-libs/cairo-1.0.0
		>=x11-libs/gtk+-2.8.0 )"

src_unpack() {
	unpack ${A}
	cd "${S}"

	sed -i razertool.rules.example \
		-e 's:ACTION=="add", ::' \
		|| die "sed razertool.rules.example action failed"

	if ! use hal ; then
		# plugdev group might not exist
		sed -i razertool.rules.example \
			-e 's:plugdev:root:' \
			|| die "sed razertool.rules.example plugdev failed"
	fi
}

src_compile() {
	econf $(use_enable gtk) || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	insinto /etc/udev/rules.d
	newins razertool.rules.example 90-razertool.rules \
		|| die "newins failed"

	dodoc AUTHORS ChangeLog NEWS README
}

pkg_postinst() {
	if use hal ; then
		elog "To run as non-root, add yourself to the plugdev group:"
		elog "   gpasswd -a <user> plugdev"
		elog "Then unplug and plug in the mouse."
		echo
	fi
}
