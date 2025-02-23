; Listing generated by Microsoft (R) Optimizing Compiler Version 15.00.21022.08 

	TITLE	y:\asl\software\video_compressor\vid_reader\zlib\zlib-1.2.3\inftrees.c
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB LIBCMTD
INCLUDELIB OLDNAMES

PUBLIC	_inflate_copyright
CONST	SEGMENT
_inflate_copyright DB ' inflate 1.2.3 Copyright 1995-2005 Mark Adler ', 00H
	ORG $+1
?lbase@?1??inflate_table@@9@9 DW 03H			; `inflate_table'::`2'::lbase
	DW	04H
	DW	05H
	DW	06H
	DW	07H
	DW	08H
	DW	09H
	DW	0aH
	DW	0bH
	DW	0dH
	DW	0fH
	DW	011H
	DW	013H
	DW	017H
	DW	01bH
	DW	01fH
	DW	023H
	DW	02bH
	DW	033H
	DW	03bH
	DW	043H
	DW	053H
	DW	063H
	DW	073H
	DW	083H
	DW	0a3H
	DW	0c3H
	DW	0e3H
	DW	0102H
	DW	00H
	DW	00H
	ORG $+2
?lext@?1??inflate_table@@9@9 DW 010H			; `inflate_table'::`2'::lext
	DW	010H
	DW	010H
	DW	010H
	DW	010H
	DW	010H
	DW	010H
	DW	010H
	DW	011H
	DW	011H
	DW	011H
	DW	011H
	DW	012H
	DW	012H
	DW	012H
	DW	012H
	DW	013H
	DW	013H
	DW	013H
	DW	013H
	DW	014H
	DW	014H
	DW	014H
	DW	014H
	DW	015H
	DW	015H
	DW	015H
	DW	015H
	DW	010H
	DW	0c9H
	DW	0c4H
	ORG $+2
?dbase@?1??inflate_table@@9@9 DW 01H			; `inflate_table'::`2'::dbase
	DW	02H
	DW	03H
	DW	04H
	DW	05H
	DW	07H
	DW	09H
	DW	0dH
	DW	011H
	DW	019H
	DW	021H
	DW	031H
	DW	041H
	DW	061H
	DW	081H
	DW	0c1H
	DW	0101H
	DW	0181H
	DW	0201H
	DW	0301H
	DW	0401H
	DW	0601H
	DW	0801H
	DW	0c01H
	DW	01001H
	DW	01801H
	DW	02001H
	DW	03001H
	DW	04001H
	DW	06001H
	DW	00H
	DW	00H
?dext@?1??inflate_table@@9@9 DW 010H			; `inflate_table'::`2'::dext
	DW	010H
	DW	010H
	DW	010H
	DW	011H
	DW	011H
	DW	012H
	DW	012H
	DW	013H
	DW	013H
	DW	014H
	DW	014H
	DW	015H
	DW	015H
	DW	016H
	DW	016H
	DW	017H
	DW	017H
	DW	018H
	DW	018H
	DW	019H
	DW	019H
	DW	01aH
	DW	01aH
	DW	01bH
	DW	01bH
	DW	01cH
	DW	01cH
	DW	01dH
	DW	01dH
	DW	040H
	DW	040H
CONST	ENDS
PUBLIC	_inflate_table
; Function compile flags: /Odtp /ZI
; File y:\asl\software\video_compressor\vid_reader\zlib\zlib-1.2.3\inftrees.c
;	COMDAT _inflate_table
_TEXT	SEGMENT
tv187 = -208						; size = 4
_offs$ = -140						; size = 32
_count$ = -108						; size = 32
_end$ = -76						; size = 4
_extra$ = -72						; size = 4
_base$ = -68						; size = 4
_next$ = -64						; size = 4
_this$ = -60						; size = 4
_mask$ = -56						; size = 4
_low$ = -52						; size = 4
_fill$ = -48						; size = 4
_incr$ = -44						; size = 4
_huff$ = -40						; size = 4
_used$ = -36						; size = 4
_left$ = -32						; size = 4
_drop$ = -28						; size = 4
_curr$ = -24						; size = 4
_root$ = -20						; size = 4
_max$ = -16						; size = 4
_min$ = -12						; size = 4
_sym$ = -8						; size = 4
_len$ = -4						; size = 4
_type$ = 8						; size = 4
_lens$ = 12						; size = 4
_codes$ = 16						; size = 4
_table$ = 20						; size = 4
_bits$ = 24						; size = 4
_work$ = 28						; size = 4
_inflate_table PROC					; COMDAT

; 39   : {

	push	ebp
	mov	ebp, esp
	sub	esp, 208				; 000000d0H
	push	ebx
	push	esi
	push	edi

; 40   :     unsigned len;               /* a code's length in bits */
; 41   :     unsigned sym;               /* index of code symbols */
; 42   :     unsigned min, max;          /* minimum and maximum code lengths */
; 43   :     unsigned root;              /* number of index bits for root table */
; 44   :     unsigned curr;              /* number of index bits for current table */
; 45   :     unsigned drop;              /* code bits to drop for sub-table */
; 46   :     int left;                   /* number of prefix codes available */
; 47   :     unsigned used;              /* code entries in table used */
; 48   :     unsigned huff;              /* Huffman code */
; 49   :     unsigned incr;              /* for incrementing code, index */
; 50   :     unsigned fill;              /* index for replicating entries */
; 51   :     unsigned low;               /* low bits for current root entry */
; 52   :     unsigned mask;              /* mask for low root bits */
; 53   :     code this;                  /* table entry for duplication */
; 54   :     code FAR *next;             /* next available space in table */
; 55   :     const unsigned short FAR *base;     /* base value table to use */
; 56   :     const unsigned short FAR *extra;    /* extra bits table to use */
; 57   :     int end;                    /* use base and extra for symbol > end */
; 58   :     unsigned short count[MAXBITS+1];    /* number of codes of each length */
; 59   :     unsigned short offs[MAXBITS+1];     /* offsets in table for each length */
; 60   :     static const unsigned short lbase[31] = { /* Length codes 257..285 base */
; 61   :         3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 15, 17, 19, 23, 27, 31,
; 62   :         35, 43, 51, 59, 67, 83, 99, 115, 131, 163, 195, 227, 258, 0, 0};
; 63   :     static const unsigned short lext[31] = { /* Length codes 257..285 extra */
; 64   :         16, 16, 16, 16, 16, 16, 16, 16, 17, 17, 17, 17, 18, 18, 18, 18,
; 65   :         19, 19, 19, 19, 20, 20, 20, 20, 21, 21, 21, 21, 16, 201, 196};
; 66   :     static const unsigned short dbase[32] = { /* Distance codes 0..29 base */
; 67   :         1, 2, 3, 4, 5, 7, 9, 13, 17, 25, 33, 49, 65, 97, 129, 193,
; 68   :         257, 385, 513, 769, 1025, 1537, 2049, 3073, 4097, 6145,
; 69   :         8193, 12289, 16385, 24577, 0, 0};
; 70   :     static const unsigned short dext[32] = { /* Distance codes 0..29 extra */
; 71   :         16, 16, 16, 16, 17, 17, 18, 18, 19, 19, 20, 20, 21, 21, 22, 22,
; 72   :         23, 23, 24, 24, 25, 25, 26, 26, 27, 27,
; 73   :         28, 28, 29, 29, 64, 64};
; 74   : 
; 75   :     /*
; 76   :        Process a set of code lengths to create a canonical Huffman code.  The
; 77   :        code lengths are lens[0..codes-1].  Each length corresponds to the
; 78   :        symbols 0..codes-1.  The Huffman code is generated by first sorting the
; 79   :        symbols by length from short to long, and retaining the symbol order
; 80   :        for codes with equal lengths.  Then the code starts with all zero bits
; 81   :        for the first code of the shortest length, and the codes are integer
; 82   :        increments for the same length, and zeros are appended as the length
; 83   :        increases.  For the deflate format, these bits are stored backwards
; 84   :        from their more natural integer increment ordering, and so when the
; 85   :        decoding tables are built in the large loop below, the integer codes
; 86   :        are incremented backwards.
; 87   : 
; 88   :        This routine assumes, but does not check, that all of the entries in
; 89   :        lens[] are in the range 0..MAXBITS.  The caller must assure this.
; 90   :        1..MAXBITS is interpreted as that code length.  zero means that that
; 91   :        symbol does not occur in this code.
; 92   : 
; 93   :        The codes are sorted by computing a count of codes for each length,
; 94   :        creating from that a table of starting indices for each length in the
; 95   :        sorted table, and then entering the symbols in order in the sorted
; 96   :        table.  The sorted table is work[], with that space being provided by
; 97   :        the caller.
; 98   : 
; 99   :        The length counts are used for other purposes as well, i.e. finding
; 100  :        the minimum and maximum length codes, determining if there are any
; 101  :        codes at all, checking for a valid set of lengths, and looking ahead
; 102  :        at length counts to determine sub-table sizes when building the
; 103  :        decoding tables.
; 104  :      */
; 105  : 
; 106  :     /* accumulate lengths for codes (assumes lens[] all in 0..MAXBITS) */
; 107  :     for (len = 0; len <= MAXBITS; len++)

	mov	DWORD PTR _len$[ebp], 0
	jmp	SHORT $LN64@inflate_ta
$LN63@inflate_ta:
	mov	eax, DWORD PTR _len$[ebp]
	add	eax, 1
	mov	DWORD PTR _len$[ebp], eax
$LN64@inflate_ta:
	cmp	DWORD PTR _len$[ebp], 15		; 0000000fH
	ja	SHORT $LN62@inflate_ta

; 108  :         count[len] = 0;

	xor	eax, eax
	mov	ecx, DWORD PTR _len$[ebp]
	mov	WORD PTR _count$[ebp+ecx*2], ax
	jmp	SHORT $LN63@inflate_ta
$LN62@inflate_ta:

; 109  :     for (sym = 0; sym < codes; sym++)

	mov	DWORD PTR _sym$[ebp], 0
	jmp	SHORT $LN61@inflate_ta
$LN60@inflate_ta:
	mov	eax, DWORD PTR _sym$[ebp]
	add	eax, 1
	mov	DWORD PTR _sym$[ebp], eax
$LN61@inflate_ta:
	mov	eax, DWORD PTR _sym$[ebp]
	cmp	eax, DWORD PTR _codes$[ebp]
	jae	SHORT $LN59@inflate_ta

; 110  :         count[lens[sym]]++;

	mov	eax, DWORD PTR _sym$[ebp]
	mov	ecx, DWORD PTR _lens$[ebp]
	movzx	edx, WORD PTR [ecx+eax*2]
	mov	ax, WORD PTR _count$[ebp+edx*2]
	add	ax, 1
	mov	ecx, DWORD PTR _sym$[ebp]
	mov	edx, DWORD PTR _lens$[ebp]
	movzx	ecx, WORD PTR [edx+ecx*2]
	mov	WORD PTR _count$[ebp+ecx*2], ax
	jmp	SHORT $LN60@inflate_ta
$LN59@inflate_ta:

; 111  : 
; 112  :     /* bound code lengths, force root to be within code lengths */
; 113  :     root = *bits;

	mov	eax, DWORD PTR _bits$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _root$[ebp], ecx

; 114  :     for (max = MAXBITS; max >= 1; max--)

	mov	DWORD PTR _max$[ebp], 15		; 0000000fH
	jmp	SHORT $LN58@inflate_ta
$LN57@inflate_ta:
	mov	eax, DWORD PTR _max$[ebp]
	sub	eax, 1
	mov	DWORD PTR _max$[ebp], eax
$LN58@inflate_ta:
	cmp	DWORD PTR _max$[ebp], 1
	jb	SHORT $LN56@inflate_ta

; 115  :         if (count[max] != 0) break;

	mov	eax, DWORD PTR _max$[ebp]
	movzx	ecx, WORD PTR _count$[ebp+eax*2]
	test	ecx, ecx
	je	SHORT $LN55@inflate_ta
	jmp	SHORT $LN56@inflate_ta
$LN55@inflate_ta:

; 116  :     if (root > max) root = max;

	jmp	SHORT $LN57@inflate_ta
$LN56@inflate_ta:
	mov	eax, DWORD PTR _root$[ebp]
	cmp	eax, DWORD PTR _max$[ebp]
	jbe	SHORT $LN54@inflate_ta
	mov	eax, DWORD PTR _max$[ebp]
	mov	DWORD PTR _root$[ebp], eax
$LN54@inflate_ta:

; 117  :     if (max == 0) {                     /* no symbols to code at all */

	cmp	DWORD PTR _max$[ebp], 0
	jne	SHORT $LN53@inflate_ta

; 118  :         this.op = (unsigned char)64;    /* invalid code marker */

	mov	BYTE PTR _this$[ebp], 64		; 00000040H

; 119  :         this.bits = (unsigned char)1;

	mov	BYTE PTR _this$[ebp+1], 1

; 120  :         this.val = (unsigned short)0;

	xor	eax, eax
	mov	WORD PTR _this$[ebp+2], ax

; 121  :         *(*table)++ = this;             /* make a table to force an error */

	mov	eax, DWORD PTR _table$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx], edx
	mov	eax, DWORD PTR _table$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, 4
	mov	edx, DWORD PTR _table$[ebp]
	mov	DWORD PTR [edx], ecx

; 122  :         *(*table)++ = this;

	mov	eax, DWORD PTR _table$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx], edx
	mov	eax, DWORD PTR _table$[ebp]
	mov	ecx, DWORD PTR [eax]
	add	ecx, 4
	mov	edx, DWORD PTR _table$[ebp]
	mov	DWORD PTR [edx], ecx

; 123  :         *bits = 1;

	mov	eax, DWORD PTR _bits$[ebp]
	mov	DWORD PTR [eax], 1

; 124  :         return 0;     /* no symbols, but wait for decoding to report error */

	xor	eax, eax
	jmp	$LN65@inflate_ta
$LN53@inflate_ta:

; 125  :     }
; 126  :     for (min = 1; min <= MAXBITS; min++)

	mov	DWORD PTR _min$[ebp], 1
	jmp	SHORT $LN52@inflate_ta
$LN51@inflate_ta:
	mov	eax, DWORD PTR _min$[ebp]
	add	eax, 1
	mov	DWORD PTR _min$[ebp], eax
$LN52@inflate_ta:
	cmp	DWORD PTR _min$[ebp], 15		; 0000000fH
	ja	SHORT $LN50@inflate_ta

; 127  :         if (count[min] != 0) break;

	mov	eax, DWORD PTR _min$[ebp]
	movzx	ecx, WORD PTR _count$[ebp+eax*2]
	test	ecx, ecx
	je	SHORT $LN49@inflate_ta
	jmp	SHORT $LN50@inflate_ta
$LN49@inflate_ta:

; 128  :     if (root < min) root = min;

	jmp	SHORT $LN51@inflate_ta
$LN50@inflate_ta:
	mov	eax, DWORD PTR _root$[ebp]
	cmp	eax, DWORD PTR _min$[ebp]
	jae	SHORT $LN48@inflate_ta
	mov	eax, DWORD PTR _min$[ebp]
	mov	DWORD PTR _root$[ebp], eax
$LN48@inflate_ta:

; 129  : 
; 130  :     /* check for an over-subscribed or incomplete set of lengths */
; 131  :     left = 1;

	mov	DWORD PTR _left$[ebp], 1

; 132  :     for (len = 1; len <= MAXBITS; len++) {

	mov	DWORD PTR _len$[ebp], 1
	jmp	SHORT $LN47@inflate_ta
$LN46@inflate_ta:
	mov	eax, DWORD PTR _len$[ebp]
	add	eax, 1
	mov	DWORD PTR _len$[ebp], eax
$LN47@inflate_ta:
	cmp	DWORD PTR _len$[ebp], 15		; 0000000fH
	ja	SHORT $LN45@inflate_ta

; 133  :         left <<= 1;

	mov	eax, DWORD PTR _left$[ebp]
	shl	eax, 1
	mov	DWORD PTR _left$[ebp], eax

; 134  :         left -= count[len];

	mov	eax, DWORD PTR _len$[ebp]
	movzx	ecx, WORD PTR _count$[ebp+eax*2]
	mov	edx, DWORD PTR _left$[ebp]
	sub	edx, ecx
	mov	DWORD PTR _left$[ebp], edx

; 135  :         if (left < 0) return -1;        /* over-subscribed */

	jns	SHORT $LN44@inflate_ta
	or	eax, -1
	jmp	$LN65@inflate_ta
$LN44@inflate_ta:

; 136  :     }

	jmp	SHORT $LN46@inflate_ta
$LN45@inflate_ta:

; 137  :     if (left > 0 && (type == CODES || max != 1))

	cmp	DWORD PTR _left$[ebp], 0
	jle	SHORT $LN43@inflate_ta
	cmp	DWORD PTR _type$[ebp], 0
	je	SHORT $LN42@inflate_ta
	cmp	DWORD PTR _max$[ebp], 1
	je	SHORT $LN43@inflate_ta
$LN42@inflate_ta:

; 138  :         return -1;                      /* incomplete set */

	or	eax, -1
	jmp	$LN65@inflate_ta
$LN43@inflate_ta:

; 139  : 
; 140  :     /* generate offsets into symbol table for each length for sorting */
; 141  :     offs[1] = 0;

	xor	eax, eax
	mov	WORD PTR _offs$[ebp+2], ax

; 142  :     for (len = 1; len < MAXBITS; len++)

	mov	DWORD PTR _len$[ebp], 1
	jmp	SHORT $LN41@inflate_ta
$LN40@inflate_ta:
	mov	eax, DWORD PTR _len$[ebp]
	add	eax, 1
	mov	DWORD PTR _len$[ebp], eax
$LN41@inflate_ta:
	cmp	DWORD PTR _len$[ebp], 15		; 0000000fH
	jae	SHORT $LN39@inflate_ta

; 143  :         offs[len + 1] = offs[len] + count[len];

	mov	eax, DWORD PTR _len$[ebp]
	movzx	ecx, WORD PTR _offs$[ebp+eax*2]
	mov	edx, DWORD PTR _len$[ebp]
	movzx	eax, WORD PTR _count$[ebp+edx*2]
	add	ecx, eax
	mov	edx, DWORD PTR _len$[ebp]
	mov	WORD PTR _offs$[ebp+edx*2+2], cx
	jmp	SHORT $LN40@inflate_ta
$LN39@inflate_ta:

; 144  : 
; 145  :     /* sort symbols by length, by symbol order within each length */
; 146  :     for (sym = 0; sym < codes; sym++)

	mov	DWORD PTR _sym$[ebp], 0
	jmp	SHORT $LN38@inflate_ta
$LN37@inflate_ta:
	mov	eax, DWORD PTR _sym$[ebp]
	add	eax, 1
	mov	DWORD PTR _sym$[ebp], eax
$LN38@inflate_ta:
	mov	eax, DWORD PTR _sym$[ebp]
	cmp	eax, DWORD PTR _codes$[ebp]
	jae	SHORT $LN36@inflate_ta

; 147  :         if (lens[sym] != 0) work[offs[lens[sym]]++] = (unsigned short)sym;

	mov	eax, DWORD PTR _sym$[ebp]
	mov	ecx, DWORD PTR _lens$[ebp]
	movzx	edx, WORD PTR [ecx+eax*2]
	test	edx, edx
	je	SHORT $LN35@inflate_ta
	mov	eax, DWORD PTR _sym$[ebp]
	mov	ecx, DWORD PTR _lens$[ebp]
	movzx	edx, WORD PTR [ecx+eax*2]
	movzx	eax, WORD PTR _offs$[ebp+edx*2]
	mov	ecx, DWORD PTR _work$[ebp]
	mov	dx, WORD PTR _sym$[ebp]
	mov	WORD PTR [ecx+eax*2], dx
	mov	eax, DWORD PTR _sym$[ebp]
	mov	ecx, DWORD PTR _lens$[ebp]
	movzx	edx, WORD PTR [ecx+eax*2]
	mov	ax, WORD PTR _offs$[ebp+edx*2]
	add	ax, 1
	mov	ecx, DWORD PTR _sym$[ebp]
	mov	edx, DWORD PTR _lens$[ebp]
	movzx	ecx, WORD PTR [edx+ecx*2]
	mov	WORD PTR _offs$[ebp+ecx*2], ax
$LN35@inflate_ta:

; 148  : 
; 149  :     /*
; 150  :        Create and fill in decoding tables.  In this loop, the table being
; 151  :        filled is at next and has curr index bits.  The code being used is huff
; 152  :        with length len.  That code is converted to an index by dropping drop
; 153  :        bits off of the bottom.  For codes where len is less than drop + curr,
; 154  :        those top drop + curr - len bits are incremented through all values to
; 155  :        fill the table with replicated entries.
; 156  : 
; 157  :        root is the number of index bits for the root table.  When len exceeds
; 158  :        root, sub-tables are created pointed to by the root entry with an index
; 159  :        of the low root bits of huff.  This is saved in low to check for when a
; 160  :        new sub-table should be started.  drop is zero when the root table is
; 161  :        being filled, and drop is root when sub-tables are being filled.
; 162  : 
; 163  :        When a new sub-table is needed, it is necessary to look ahead in the
; 164  :        code lengths to determine what size sub-table is needed.  The length
; 165  :        counts are used for this, and so count[] is decremented as codes are
; 166  :        entered in the tables.
; 167  : 
; 168  :        used keeps track of how many table entries have been allocated from the
; 169  :        provided *table space.  It is checked when a LENS table is being made
; 170  :        against the space in *table, ENOUGH, minus the maximum space needed by
; 171  :        the worst case distance code, MAXD.  This should never happen, but the
; 172  :        sufficiency of ENOUGH has not been proven exhaustively, hence the check.
; 173  :        This assumes that when type == LENS, bits == 9.
; 174  : 
; 175  :        sym increments through all symbols, and the loop terminates when
; 176  :        all codes of length max, i.e. all codes, have been processed.  This
; 177  :        routine permits incomplete codes, so another loop after this one fills
; 178  :        in the rest of the decoding tables with invalid code markers.
; 179  :      */
; 180  : 
; 181  :     /* set up for code type */
; 182  :     switch (type) {

	jmp	SHORT $LN37@inflate_ta
$LN36@inflate_ta:
	mov	eax, DWORD PTR _type$[ebp]
	mov	DWORD PTR tv187[ebp], eax
	cmp	DWORD PTR tv187[ebp], 0
	je	SHORT $LN32@inflate_ta
	cmp	DWORD PTR tv187[ebp], 1
	je	SHORT $LN31@inflate_ta
	jmp	SHORT $LN30@inflate_ta
$LN32@inflate_ta:

; 183  :     case CODES:
; 184  :         base = extra = work;    /* dummy value--not used */

	mov	eax, DWORD PTR _work$[ebp]
	mov	DWORD PTR _extra$[ebp], eax
	mov	ecx, DWORD PTR _extra$[ebp]
	mov	DWORD PTR _base$[ebp], ecx

; 185  :         end = 19;

	mov	DWORD PTR _end$[ebp], 19		; 00000013H

; 186  :         break;

	jmp	SHORT $LN33@inflate_ta
$LN31@inflate_ta:

; 187  :     case LENS:
; 188  :         base = lbase;

	mov	DWORD PTR _base$[ebp], OFFSET ?lbase@?1??inflate_table@@9@9

; 189  :         base -= 257;

	mov	eax, DWORD PTR _base$[ebp]
	sub	eax, 514				; 00000202H
	mov	DWORD PTR _base$[ebp], eax

; 190  :         extra = lext;

	mov	DWORD PTR _extra$[ebp], OFFSET ?lext@?1??inflate_table@@9@9

; 191  :         extra -= 257;

	mov	eax, DWORD PTR _extra$[ebp]
	sub	eax, 514				; 00000202H
	mov	DWORD PTR _extra$[ebp], eax

; 192  :         end = 256;

	mov	DWORD PTR _end$[ebp], 256		; 00000100H

; 193  :         break;

	jmp	SHORT $LN33@inflate_ta
$LN30@inflate_ta:

; 194  :     default:            /* DISTS */
; 195  :         base = dbase;

	mov	DWORD PTR _base$[ebp], OFFSET ?dbase@?1??inflate_table@@9@9

; 196  :         extra = dext;

	mov	DWORD PTR _extra$[ebp], OFFSET ?dext@?1??inflate_table@@9@9

; 197  :         end = -1;

	mov	DWORD PTR _end$[ebp], -1
$LN33@inflate_ta:

; 198  :     }
; 199  : 
; 200  :     /* initialize state for loop */
; 201  :     huff = 0;                   /* starting code */

	mov	DWORD PTR _huff$[ebp], 0

; 202  :     sym = 0;                    /* starting code symbol */

	mov	DWORD PTR _sym$[ebp], 0

; 203  :     len = min;                  /* starting code length */

	mov	eax, DWORD PTR _min$[ebp]
	mov	DWORD PTR _len$[ebp], eax

; 204  :     next = *table;              /* current table to fill in */

	mov	eax, DWORD PTR _table$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _next$[ebp], ecx

; 205  :     curr = root;                /* current table index bits */

	mov	eax, DWORD PTR _root$[ebp]
	mov	DWORD PTR _curr$[ebp], eax

; 206  :     drop = 0;                   /* current bits to drop from code for index */

	mov	DWORD PTR _drop$[ebp], 0

; 207  :     low = (unsigned)(-1);       /* trigger new sub-table when len > root */

	mov	DWORD PTR _low$[ebp], -1

; 208  :     used = 1U << root;          /* use root table entries */

	mov	eax, 1
	mov	ecx, DWORD PTR _root$[ebp]
	shl	eax, cl
	mov	DWORD PTR _used$[ebp], eax

; 209  :     mask = used - 1;            /* mask for comparing low */

	mov	eax, DWORD PTR _used$[ebp]
	sub	eax, 1
	mov	DWORD PTR _mask$[ebp], eax

; 210  : 
; 211  :     /* check available table space */
; 212  :     if (type == LENS && used >= ENOUGH - MAXD)

	cmp	DWORD PTR _type$[ebp], 1
	jne	SHORT $LN28@inflate_ta
	cmp	DWORD PTR _used$[ebp], 1456		; 000005b0H
	jb	SHORT $LN28@inflate_ta

; 213  :         return 1;

	mov	eax, 1
	jmp	$LN65@inflate_ta
$LN28@inflate_ta:

; 214  : 
; 215  :     /* process all codes and make table entries */
; 216  :     for (;;) {
; 217  :         /* create table entry */
; 218  :         this.bits = (unsigned char)(len - drop);

	mov	eax, DWORD PTR _len$[ebp]
	sub	eax, DWORD PTR _drop$[ebp]
	mov	BYTE PTR _this$[ebp+1], al

; 219  :         if ((int)(work[sym]) < end) {

	mov	eax, DWORD PTR _sym$[ebp]
	mov	ecx, DWORD PTR _work$[ebp]
	movzx	edx, WORD PTR [ecx+eax*2]
	cmp	edx, DWORD PTR _end$[ebp]
	jge	SHORT $LN26@inflate_ta

; 220  :             this.op = (unsigned char)0;

	mov	BYTE PTR _this$[ebp], 0

; 221  :             this.val = work[sym];

	mov	eax, DWORD PTR _sym$[ebp]
	mov	ecx, DWORD PTR _work$[ebp]
	mov	dx, WORD PTR [ecx+eax*2]
	mov	WORD PTR _this$[ebp+2], dx
	jmp	SHORT $LN25@inflate_ta
$LN26@inflate_ta:

; 222  :         }
; 223  :         else if ((int)(work[sym]) > end) {

	mov	eax, DWORD PTR _sym$[ebp]
	mov	ecx, DWORD PTR _work$[ebp]
	movzx	edx, WORD PTR [ecx+eax*2]
	cmp	edx, DWORD PTR _end$[ebp]
	jle	SHORT $LN24@inflate_ta

; 224  :             this.op = (unsigned char)(extra[work[sym]]);

	mov	eax, DWORD PTR _sym$[ebp]
	mov	ecx, DWORD PTR _work$[ebp]
	movzx	edx, WORD PTR [ecx+eax*2]
	mov	eax, DWORD PTR _extra$[ebp]
	mov	cl, BYTE PTR [eax+edx*2]
	mov	BYTE PTR _this$[ebp], cl

; 225  :             this.val = base[work[sym]];

	mov	eax, DWORD PTR _sym$[ebp]
	mov	ecx, DWORD PTR _work$[ebp]
	movzx	edx, WORD PTR [ecx+eax*2]
	mov	eax, DWORD PTR _base$[ebp]
	mov	cx, WORD PTR [eax+edx*2]
	mov	WORD PTR _this$[ebp+2], cx

; 226  :         }
; 227  :         else {

	jmp	SHORT $LN25@inflate_ta
$LN24@inflate_ta:

; 228  :             this.op = (unsigned char)(32 + 64);         /* end of block */

	mov	BYTE PTR _this$[ebp], 96		; 00000060H

; 229  :             this.val = 0;

	xor	eax, eax
	mov	WORD PTR _this$[ebp+2], ax
$LN25@inflate_ta:

; 230  :         }
; 231  : 
; 232  :         /* replicate for those indices with low len bits equal to huff */
; 233  :         incr = 1U << (len - drop);

	mov	ecx, DWORD PTR _len$[ebp]
	sub	ecx, DWORD PTR _drop$[ebp]
	mov	eax, 1
	shl	eax, cl
	mov	DWORD PTR _incr$[ebp], eax

; 234  :         fill = 1U << curr;

	mov	eax, 1
	mov	ecx, DWORD PTR _curr$[ebp]
	shl	eax, cl
	mov	DWORD PTR _fill$[ebp], eax

; 235  :         min = fill;                 /* save offset to next table */

	mov	eax, DWORD PTR _fill$[ebp]
	mov	DWORD PTR _min$[ebp], eax
$LN22@inflate_ta:

; 236  :         do {
; 237  :             fill -= incr;

	mov	eax, DWORD PTR _fill$[ebp]
	sub	eax, DWORD PTR _incr$[ebp]
	mov	DWORD PTR _fill$[ebp], eax

; 238  :             next[(huff >> drop) + fill] = this;

	mov	eax, DWORD PTR _huff$[ebp]
	mov	ecx, DWORD PTR _drop$[ebp]
	shr	eax, cl
	add	eax, DWORD PTR _fill$[ebp]
	mov	ecx, DWORD PTR _next$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+eax*4], edx

; 239  :         } while (fill != 0);

	cmp	DWORD PTR _fill$[ebp], 0
	jne	SHORT $LN22@inflate_ta

; 240  : 
; 241  :         /* backwards increment the len-bit code huff */
; 242  :         incr = 1U << (len - 1);

	mov	ecx, DWORD PTR _len$[ebp]
	sub	ecx, 1
	mov	eax, 1
	shl	eax, cl
	mov	DWORD PTR _incr$[ebp], eax
$LN19@inflate_ta:

; 243  :         while (huff & incr)

	mov	eax, DWORD PTR _huff$[ebp]
	and	eax, DWORD PTR _incr$[ebp]
	je	SHORT $LN18@inflate_ta

; 244  :             incr >>= 1;

	mov	eax, DWORD PTR _incr$[ebp]
	shr	eax, 1
	mov	DWORD PTR _incr$[ebp], eax
	jmp	SHORT $LN19@inflate_ta
$LN18@inflate_ta:

; 245  :         if (incr != 0) {

	cmp	DWORD PTR _incr$[ebp], 0
	je	SHORT $LN17@inflate_ta

; 246  :             huff &= incr - 1;

	mov	eax, DWORD PTR _incr$[ebp]
	sub	eax, 1
	and	eax, DWORD PTR _huff$[ebp]
	mov	DWORD PTR _huff$[ebp], eax

; 247  :             huff += incr;

	mov	eax, DWORD PTR _huff$[ebp]
	add	eax, DWORD PTR _incr$[ebp]
	mov	DWORD PTR _huff$[ebp], eax

; 248  :         }
; 249  :         else

	jmp	SHORT $LN16@inflate_ta
$LN17@inflate_ta:

; 250  :             huff = 0;

	mov	DWORD PTR _huff$[ebp], 0
$LN16@inflate_ta:

; 251  : 
; 252  :         /* go to next symbol, update count, len */
; 253  :         sym++;

	mov	eax, DWORD PTR _sym$[ebp]
	add	eax, 1
	mov	DWORD PTR _sym$[ebp], eax

; 254  :         if (--(count[len]) == 0) {

	mov	eax, DWORD PTR _len$[ebp]
	mov	cx, WORD PTR _count$[ebp+eax*2]
	sub	cx, 1
	mov	edx, DWORD PTR _len$[ebp]
	mov	WORD PTR _count$[ebp+edx*2], cx
	mov	eax, DWORD PTR _len$[ebp]
	movzx	ecx, WORD PTR _count$[ebp+eax*2]
	test	ecx, ecx
	jne	SHORT $LN15@inflate_ta

; 255  :             if (len == max) break;

	mov	eax, DWORD PTR _len$[ebp]
	cmp	eax, DWORD PTR _max$[ebp]
	jne	SHORT $LN14@inflate_ta
	jmp	$LN27@inflate_ta
$LN14@inflate_ta:

; 256  :             len = lens[work[sym]];

	mov	eax, DWORD PTR _sym$[ebp]
	mov	ecx, DWORD PTR _work$[ebp]
	movzx	edx, WORD PTR [ecx+eax*2]
	mov	eax, DWORD PTR _lens$[ebp]
	movzx	ecx, WORD PTR [eax+edx*2]
	mov	DWORD PTR _len$[ebp], ecx
$LN15@inflate_ta:

; 257  :         }
; 258  : 
; 259  :         /* create new sub-table if needed */
; 260  :         if (len > root && (huff & mask) != low) {

	mov	eax, DWORD PTR _len$[ebp]
	cmp	eax, DWORD PTR _root$[ebp]
	jbe	$LN13@inflate_ta
	mov	eax, DWORD PTR _huff$[ebp]
	and	eax, DWORD PTR _mask$[ebp]
	cmp	eax, DWORD PTR _low$[ebp]
	je	$LN13@inflate_ta

; 261  :             /* if first time, transition to sub-tables */
; 262  :             if (drop == 0)

	cmp	DWORD PTR _drop$[ebp], 0
	jne	SHORT $LN12@inflate_ta

; 263  :                 drop = root;

	mov	eax, DWORD PTR _root$[ebp]
	mov	DWORD PTR _drop$[ebp], eax
$LN12@inflate_ta:

; 264  : 
; 265  :             /* increment past last table */
; 266  :             next += min;            /* here min is 1 << curr */

	mov	eax, DWORD PTR _min$[ebp]
	mov	ecx, DWORD PTR _next$[ebp]
	lea	edx, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _next$[ebp], edx

; 267  : 
; 268  :             /* determine length of next table */
; 269  :             curr = len - drop;

	mov	eax, DWORD PTR _len$[ebp]
	sub	eax, DWORD PTR _drop$[ebp]
	mov	DWORD PTR _curr$[ebp], eax

; 270  :             left = (int)(1 << curr);

	mov	eax, 1
	mov	ecx, DWORD PTR _curr$[ebp]
	shl	eax, cl
	mov	DWORD PTR _left$[ebp], eax
$LN11@inflate_ta:

; 271  :             while (curr + drop < max) {

	mov	eax, DWORD PTR _curr$[ebp]
	add	eax, DWORD PTR _drop$[ebp]
	cmp	eax, DWORD PTR _max$[ebp]
	jae	SHORT $LN10@inflate_ta

; 272  :                 left -= count[curr + drop];

	mov	eax, DWORD PTR _curr$[ebp]
	add	eax, DWORD PTR _drop$[ebp]
	movzx	ecx, WORD PTR _count$[ebp+eax*2]
	mov	edx, DWORD PTR _left$[ebp]
	sub	edx, ecx
	mov	DWORD PTR _left$[ebp], edx

; 273  :                 if (left <= 0) break;

	cmp	DWORD PTR _left$[ebp], 0
	jg	SHORT $LN9@inflate_ta
	jmp	SHORT $LN10@inflate_ta
$LN9@inflate_ta:

; 274  :                 curr++;

	mov	eax, DWORD PTR _curr$[ebp]
	add	eax, 1
	mov	DWORD PTR _curr$[ebp], eax

; 275  :                 left <<= 1;

	mov	eax, DWORD PTR _left$[ebp]
	shl	eax, 1
	mov	DWORD PTR _left$[ebp], eax

; 276  :             }

	jmp	SHORT $LN11@inflate_ta
$LN10@inflate_ta:

; 277  : 
; 278  :             /* check for enough space */
; 279  :             used += 1U << curr;

	mov	eax, 1
	mov	ecx, DWORD PTR _curr$[ebp]
	shl	eax, cl
	add	eax, DWORD PTR _used$[ebp]
	mov	DWORD PTR _used$[ebp], eax

; 280  :             if (type == LENS && used >= ENOUGH - MAXD)

	cmp	DWORD PTR _type$[ebp], 1
	jne	SHORT $LN8@inflate_ta
	cmp	DWORD PTR _used$[ebp], 1456		; 000005b0H
	jb	SHORT $LN8@inflate_ta

; 281  :                 return 1;

	mov	eax, 1
	jmp	$LN65@inflate_ta
$LN8@inflate_ta:

; 282  : 
; 283  :             /* point entry in root table to sub-table */
; 284  :             low = huff & mask;

	mov	eax, DWORD PTR _huff$[ebp]
	and	eax, DWORD PTR _mask$[ebp]
	mov	DWORD PTR _low$[ebp], eax

; 285  :             (*table)[low].op = (unsigned char)curr;

	mov	eax, DWORD PTR _table$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _low$[ebp]
	mov	al, BYTE PTR _curr$[ebp]
	mov	BYTE PTR [ecx+edx*4], al

; 286  :             (*table)[low].bits = (unsigned char)root;

	mov	eax, DWORD PTR _table$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _low$[ebp]
	mov	al, BYTE PTR _root$[ebp]
	mov	BYTE PTR [ecx+edx*4+1], al

; 287  :             (*table)[low].val = (unsigned short)(next - *table);

	mov	eax, DWORD PTR _table$[ebp]
	mov	ecx, DWORD PTR _next$[ebp]
	sub	ecx, DWORD PTR [eax]
	sar	ecx, 2
	mov	edx, DWORD PTR _table$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	edx, DWORD PTR _low$[ebp]
	mov	WORD PTR [eax+edx*4+2], cx
$LN13@inflate_ta:

; 288  :         }
; 289  :     }

	jmp	$LN28@inflate_ta
$LN27@inflate_ta:

; 290  : 
; 291  :     /*
; 292  :        Fill in rest of table for incomplete codes.  This loop is similar to the
; 293  :        loop above in incrementing huff for table indices.  It is assumed that
; 294  :        len is equal to curr + drop, so there is no loop needed to increment
; 295  :        through high index bits.  When the current sub-table is filled, the loop
; 296  :        drops back to the root table to fill in any remaining entries there.
; 297  :      */
; 298  :     this.op = (unsigned char)64;                /* invalid code marker */

	mov	BYTE PTR _this$[ebp], 64		; 00000040H

; 299  :     this.bits = (unsigned char)(len - drop);

	mov	eax, DWORD PTR _len$[ebp]
	sub	eax, DWORD PTR _drop$[ebp]
	mov	BYTE PTR _this$[ebp+1], al

; 300  :     this.val = (unsigned short)0;

	xor	eax, eax
	mov	WORD PTR _this$[ebp+2], ax
$LN7@inflate_ta:

; 301  :     while (huff != 0) {

	cmp	DWORD PTR _huff$[ebp], 0
	je	$LN6@inflate_ta

; 302  :         /* when done with sub-table, drop back to root table */
; 303  :         if (drop != 0 && (huff & mask) != low) {

	cmp	DWORD PTR _drop$[ebp], 0
	je	SHORT $LN5@inflate_ta
	mov	eax, DWORD PTR _huff$[ebp]
	and	eax, DWORD PTR _mask$[ebp]
	cmp	eax, DWORD PTR _low$[ebp]
	je	SHORT $LN5@inflate_ta

; 304  :             drop = 0;

	mov	DWORD PTR _drop$[ebp], 0

; 305  :             len = root;

	mov	eax, DWORD PTR _root$[ebp]
	mov	DWORD PTR _len$[ebp], eax

; 306  :             next = *table;

	mov	eax, DWORD PTR _table$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _next$[ebp], ecx

; 307  :             this.bits = (unsigned char)len;

	mov	al, BYTE PTR _len$[ebp]
	mov	BYTE PTR _this$[ebp+1], al
$LN5@inflate_ta:

; 308  :         }
; 309  : 
; 310  :         /* put invalid code marker in table */
; 311  :         next[huff >> drop] = this;

	mov	eax, DWORD PTR _huff$[ebp]
	mov	ecx, DWORD PTR _drop$[ebp]
	shr	eax, cl
	mov	ecx, DWORD PTR _next$[ebp]
	mov	edx, DWORD PTR _this$[ebp]
	mov	DWORD PTR [ecx+eax*4], edx

; 312  : 
; 313  :         /* backwards increment the len-bit code huff */
; 314  :         incr = 1U << (len - 1);

	mov	ecx, DWORD PTR _len$[ebp]
	sub	ecx, 1
	mov	eax, 1
	shl	eax, cl
	mov	DWORD PTR _incr$[ebp], eax
$LN4@inflate_ta:

; 315  :         while (huff & incr)

	mov	eax, DWORD PTR _huff$[ebp]
	and	eax, DWORD PTR _incr$[ebp]
	je	SHORT $LN3@inflate_ta

; 316  :             incr >>= 1;

	mov	eax, DWORD PTR _incr$[ebp]
	shr	eax, 1
	mov	DWORD PTR _incr$[ebp], eax
	jmp	SHORT $LN4@inflate_ta
$LN3@inflate_ta:

; 317  :         if (incr != 0) {

	cmp	DWORD PTR _incr$[ebp], 0
	je	SHORT $LN2@inflate_ta

; 318  :             huff &= incr - 1;

	mov	eax, DWORD PTR _incr$[ebp]
	sub	eax, 1
	and	eax, DWORD PTR _huff$[ebp]
	mov	DWORD PTR _huff$[ebp], eax

; 319  :             huff += incr;

	mov	eax, DWORD PTR _huff$[ebp]
	add	eax, DWORD PTR _incr$[ebp]
	mov	DWORD PTR _huff$[ebp], eax

; 320  :         }
; 321  :         else

	jmp	SHORT $LN1@inflate_ta
$LN2@inflate_ta:

; 322  :             huff = 0;

	mov	DWORD PTR _huff$[ebp], 0
$LN1@inflate_ta:

; 323  :     }

	jmp	$LN7@inflate_ta
$LN6@inflate_ta:

; 324  : 
; 325  :     /* set return parameters */
; 326  :     *table += used;

	mov	eax, DWORD PTR _table$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	edx, DWORD PTR _used$[ebp]
	lea	eax, DWORD PTR [ecx+edx*4]
	mov	ecx, DWORD PTR _table$[ebp]
	mov	DWORD PTR [ecx], eax

; 327  :     *bits = root;

	mov	eax, DWORD PTR _bits$[ebp]
	mov	ecx, DWORD PTR _root$[ebp]
	mov	DWORD PTR [eax], ecx

; 328  :     return 0;

	xor	eax, eax
$LN65@inflate_ta:

; 329  : }

	pop	edi
	pop	esi
	pop	ebx
	mov	esp, ebp
	pop	ebp
	ret	0
_inflate_table ENDP
_TEXT	ENDS
END
