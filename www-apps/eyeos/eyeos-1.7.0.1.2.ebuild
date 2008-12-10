# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit depend.php versionator webapp eutils

DESCRIPTION="AJAX web-based desktop environment"
HOMEPAGE="http://wwwwww.eyeos.org"
SRC_URI="mirror://sourceforge/eyeos/eyeOS_$(get_version_component_range 1-4)-$(get_version_component_range 5).tar.gz"

LICENSE="GPL-3"
KEYWORDS="~amd64 ~x86"
IUSE=""

need_httpd_cgi
need_php_httpd

S=${WORKDIR}/eyeOS

src_install () {
	webapp_src_preinst

	dodoc README.txt
	rm -f README.txt


	insinto "${MY_HTDOCSDIR}"
	doins -r .

	#TODO: needs "." too
	for file in index.html package.eyepackage installer installer/index.php installer/files/index.txt installer/files/settings.txt; do
			webapp_serverowned "${MY_HTDOCSDIR}/${file}"
	done


	webapp_src_install
}