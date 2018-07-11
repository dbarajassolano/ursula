OUTPUT  = example
SRCS	= $(wildcard *.md)
META    = $(wildcard *.yaml)
WC      = $(shell pandoc --lua-filter ../wordcount.lua $(SRCS))

$(OUTPUT).pdf:	$(SRCS) $(META)
		pandoc -o $@ --lua-filter ../scene-separator.lua --template ../ursula --pdf-engine=lualatex $(SRCS) $(META) --metadata wordcount=$(WC)

.PHONY: clean count

clean:
		${RM} $(OUTPUT).pdf

count:
		echo "about" $(WC) "words"
