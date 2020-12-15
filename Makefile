WRKSRC= src

OPENSCAD_BIN?=   openscad
# XXX not used yet
OPENSCADPATH=   lib

TARGETS=	sanding_block.stl sanding_block.png

all:	${TARGETS}

${TARGETS}: ${WRKSRC}/sanding_block.scad
	env OPENSCADPATH=${OPENSCADPATH} ${OPENSCAD_BIN} --render ${SANDING_BLOCK_FLAGS} -o ${.TARGET} ${WRKSRC}/sanding_block.scad

clean:
	rm -f ${TARGETS}

# vim: noexpandtab
