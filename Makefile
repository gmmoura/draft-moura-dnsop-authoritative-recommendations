default:all

all: draft-moura-dnsop-authoritative-recommendations.txt

%.xml: %.mkd
	kramdown-rfc2629  $< > $@

%.txt: %.xml
	xml2rfc $< -o $@ --text

%.html: %.xml
	xml2rfc $< -o $@ --html

%.pdf: %.txt
	enscript --margins 76::76: -B -q -p - $^ | ps2pdf - $@
