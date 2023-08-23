; Listing generated by Microsoft (R) Optimizing Compiler Version 19.36.32537.0 

	TITLE	C:\Users\chris\Documents\GitHub\FastCopy-M\external\zlib\contrib\vstudio\vc12\x86\TestZlibDebug\Tmp\inffast.obj
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB MSVCRTD
INCLUDELIB OLDNAMES

PUBLIC	_inflate_fast
_DATA	SEGMENT
$SG44261 DB	'invalid distance too far back', 00H
	ORG $+2
$SG44276 DB	'invalid distance code', 00H
	ORG $+2
$SG44281 DB	'invalid literal/length code', 00H
_DATA	ENDS
; Function compile flags: /Odtp
; File C:\Users\chris\Documents\GitHub\FastCopy-M\external\zlib\inffast.c
_TEXT	SEGMENT
_whave$ = -92						; size = 4
_beg$ = -88						; size = 4
_dmask$ = -84						; size = 4
_lmask$ = -80						; size = 4
tv333 = -76						; size = 4
tv326 = -72						; size = 4
_lcode$ = -68						; size = 4
_dcode$ = -64						; size = 4
_window$ = -60						; size = 4
_wsize$ = -56						; size = 4
_end$ = -52						; size = 4
_last$ = -48						; size = 4
_wnext$ = -44						; size = 4
_dist$ = -40						; size = 4
_here$ = -36						; size = 4
_state$ = -32						; size = 4
_len$ = -28						; size = 4
_in$ = -24						; size = 4
_hold$ = -20						; size = 4
_bits$ = -16						; size = 4
_from$ = -12						; size = 4
_out$ = -8						; size = 4
_op$ = -4						; size = 4
_strm$ = 8						; size = 4
_start$ = 12						; size = 4
_inflate_fast PROC

; 50   : void ZLIB_INTERNAL inflate_fast(z_streamp strm, unsigned start) {

	push	ebp
	mov	ebp, esp
	sub	esp, 92					; 0000005cH

; 51   :     struct inflate_state FAR *state;
; 52   :     z_const unsigned char FAR *in;      /* local strm->next_in */
; 53   :     z_const unsigned char FAR *last;    /* have enough input while in < last */
; 54   :     unsigned char FAR *out;     /* local strm->next_out */
; 55   :     unsigned char FAR *beg;     /* inflate()'s initial strm->next_out */
; 56   :     unsigned char FAR *end;     /* while out < end, enough space available */
; 57   : #ifdef INFLATE_STRICT
; 58   :     unsigned dmax;              /* maximum distance from zlib header */
; 59   : #endif
; 60   :     unsigned wsize;             /* window size or zero if not using window */
; 61   :     unsigned whave;             /* valid bytes in the window */
; 62   :     unsigned wnext;             /* window write index */
; 63   :     unsigned char FAR *window;  /* allocated sliding window, if wsize != 0 */
; 64   :     unsigned long hold;         /* local strm->hold */
; 65   :     unsigned bits;              /* local strm->bits */
; 66   :     code const FAR *lcode;      /* local strm->lencode */
; 67   :     code const FAR *dcode;      /* local strm->distcode */
; 68   :     unsigned lmask;             /* mask for first level of length codes */
; 69   :     unsigned dmask;             /* mask for first level of distance codes */
; 70   :     code const *here;           /* retrieved table entry */
; 71   :     unsigned op;                /* code bits, operation, extra bits, or */
; 72   :                                 /*  window position, window bytes to copy */
; 73   :     unsigned len;               /* match length, unused bytes */
; 74   :     unsigned dist;              /* match distance */
; 75   :     unsigned char FAR *from;    /* where to copy match from */
; 76   : 
; 77   :     /* copy state to local variables */
; 78   :     state = (struct inflate_state FAR *)strm->state;

	mov	eax, DWORD PTR _strm$[ebp]
	mov	ecx, DWORD PTR [eax+28]
	mov	DWORD PTR _state$[ebp], ecx

; 79   :     in = strm->next_in;

	mov	edx, DWORD PTR _strm$[ebp]
	mov	eax, DWORD PTR [edx]
	mov	DWORD PTR _in$[ebp], eax

; 80   :     last = in + (strm->avail_in - 5);

	mov	ecx, DWORD PTR _strm$[ebp]
	mov	edx, DWORD PTR [ecx+4]
	mov	eax, DWORD PTR _in$[ebp]
	lea	ecx, DWORD PTR [eax+edx-5]
	mov	DWORD PTR _last$[ebp], ecx

; 81   :     out = strm->next_out;

	mov	edx, DWORD PTR _strm$[ebp]
	mov	eax, DWORD PTR [edx+12]
	mov	DWORD PTR _out$[ebp], eax

; 82   :     beg = out - (start - strm->avail_out);

	mov	ecx, DWORD PTR _strm$[ebp]
	mov	edx, DWORD PTR _start$[ebp]
	sub	edx, DWORD PTR [ecx+16]
	mov	eax, DWORD PTR _out$[ebp]
	sub	eax, edx
	mov	DWORD PTR _beg$[ebp], eax

; 83   :     end = out + (strm->avail_out - 257);

	mov	ecx, DWORD PTR _strm$[ebp]
	mov	edx, DWORD PTR [ecx+16]
	mov	eax, DWORD PTR _out$[ebp]
	lea	ecx, DWORD PTR [eax+edx-257]
	mov	DWORD PTR _end$[ebp], ecx

; 84   : #ifdef INFLATE_STRICT
; 85   :     dmax = state->dmax;
; 86   : #endif
; 87   :     wsize = state->wsize;

	mov	edx, DWORD PTR _state$[ebp]
	mov	eax, DWORD PTR [edx+44]
	mov	DWORD PTR _wsize$[ebp], eax

; 88   :     whave = state->whave;

	mov	ecx, DWORD PTR _state$[ebp]
	mov	edx, DWORD PTR [ecx+48]
	mov	DWORD PTR _whave$[ebp], edx

; 89   :     wnext = state->wnext;

	mov	eax, DWORD PTR _state$[ebp]
	mov	ecx, DWORD PTR [eax+52]
	mov	DWORD PTR _wnext$[ebp], ecx

; 90   :     window = state->window;

	mov	edx, DWORD PTR _state$[ebp]
	mov	eax, DWORD PTR [edx+56]
	mov	DWORD PTR _window$[ebp], eax

; 91   :     hold = state->hold;

	mov	ecx, DWORD PTR _state$[ebp]
	mov	edx, DWORD PTR [ecx+60]
	mov	DWORD PTR _hold$[ebp], edx

; 92   :     bits = state->bits;

	mov	eax, DWORD PTR _state$[ebp]
	mov	ecx, DWORD PTR [eax+64]
	mov	DWORD PTR _bits$[ebp], ecx

; 93   :     lcode = state->lencode;

	mov	edx, DWORD PTR _state$[ebp]
	mov	eax, DWORD PTR [edx+80]
	mov	DWORD PTR _lcode$[ebp], eax

; 94   :     dcode = state->distcode;

	mov	ecx, DWORD PTR _state$[ebp]
	mov	edx, DWORD PTR [ecx+84]
	mov	DWORD PTR _dcode$[ebp], edx

; 95   :     lmask = (1U << state->lenbits) - 1;

	mov	eax, DWORD PTR _state$[ebp]
	mov	edx, 1
	mov	ecx, DWORD PTR [eax+88]
	shl	edx, cl
	sub	edx, 1
	mov	DWORD PTR _lmask$[ebp], edx

; 96   :     dmask = (1U << state->distbits) - 1;

	mov	eax, DWORD PTR _state$[ebp]
	mov	edx, 1
	mov	ecx, DWORD PTR [eax+92]
	shl	edx, cl
	sub	edx, 1
	mov	DWORD PTR _dmask$[ebp], edx
$LN4@inflate_fa:

; 97   : 
; 98   :     /* decode literals and length/distances until end-of-block or not enough
; 99   :        input data or output space */
; 100  :     do {
; 101  :         if (bits < 15) {

	cmp	DWORD PTR _bits$[ebp], 15		; 0000000fH
	jae	SHORT $LN22@inflate_fa

; 102  :             hold += (unsigned long)(*in++) << bits;

	mov	eax, DWORD PTR _in$[ebp]
	movzx	edx, BYTE PTR [eax]
	mov	ecx, DWORD PTR _bits$[ebp]
	shl	edx, cl
	add	edx, DWORD PTR _hold$[ebp]
	mov	DWORD PTR _hold$[ebp], edx
	mov	eax, DWORD PTR _in$[ebp]
	add	eax, 1
	mov	DWORD PTR _in$[ebp], eax

; 103  :             bits += 8;

	mov	ecx, DWORD PTR _bits$[ebp]
	add	ecx, 8
	mov	DWORD PTR _bits$[ebp], ecx

; 104  :             hold += (unsigned long)(*in++) << bits;

	mov	edx, DWORD PTR _in$[ebp]
	movzx	eax, BYTE PTR [edx]
	mov	ecx, DWORD PTR _bits$[ebp]
	shl	eax, cl
	add	eax, DWORD PTR _hold$[ebp]
	mov	DWORD PTR _hold$[ebp], eax
	mov	ecx, DWORD PTR _in$[ebp]
	add	ecx, 1
	mov	DWORD PTR _in$[ebp], ecx

; 105  :             bits += 8;

	mov	edx, DWORD PTR _bits$[ebp]
	add	edx, 8
	mov	DWORD PTR _bits$[ebp], edx
$LN22@inflate_fa:

; 106  :         }
; 107  :         here = lcode + (hold & lmask);

	mov	eax, DWORD PTR _hold$[ebp]
	and	eax, DWORD PTR _lmask$[ebp]
	mov	ecx, DWORD PTR _lcode$[ebp]
	lea	edx, DWORD PTR [ecx+eax*4]
	mov	DWORD PTR _here$[ebp], edx
$dolen$62:

; 108  :       dolen:
; 109  :         op = (unsigned)(here->bits);

	mov	eax, DWORD PTR _here$[ebp]
	movzx	ecx, BYTE PTR [eax+1]
	mov	DWORD PTR _op$[ebp], ecx

; 110  :         hold >>= op;

	mov	edx, DWORD PTR _hold$[ebp]
	mov	ecx, DWORD PTR _op$[ebp]
	shr	edx, cl
	mov	DWORD PTR _hold$[ebp], edx

; 111  :         bits -= op;

	mov	eax, DWORD PTR _bits$[ebp]
	sub	eax, DWORD PTR _op$[ebp]
	mov	DWORD PTR _bits$[ebp], eax

; 112  :         op = (unsigned)(here->op);

	mov	ecx, DWORD PTR _here$[ebp]
	movzx	edx, BYTE PTR [ecx]
	mov	DWORD PTR _op$[ebp], edx

; 113  :         if (op == 0) {                          /* literal */

	cmp	DWORD PTR _op$[ebp], 0
	jne	SHORT $LN23@inflate_fa

; 114  :             Tracevv((stderr, here->val >= 0x20 && here->val < 0x7f ?
; 115  :                     "inflate:         literal '%c'\n" :
; 116  :                     "inflate:         literal 0x%02x\n", here->val));
; 117  :             *out++ = (unsigned char)(here->val);

	mov	eax, DWORD PTR _out$[ebp]
	mov	ecx, DWORD PTR _here$[ebp]
	mov	dl, BYTE PTR [ecx+2]
	mov	BYTE PTR [eax], dl
	mov	eax, DWORD PTR _out$[ebp]
	add	eax, 1
	mov	DWORD PTR _out$[ebp], eax

; 118  :         }

	jmp	$LN2@inflate_fa
$LN23@inflate_fa:

; 119  :         else if (op & 16) {                     /* length base */

	mov	ecx, DWORD PTR _op$[ebp]
	and	ecx, 16					; 00000010H
	je	$LN25@inflate_fa

; 120  :             len = (unsigned)(here->val);

	mov	edx, DWORD PTR _here$[ebp]
	movzx	eax, WORD PTR [edx+2]
	mov	DWORD PTR _len$[ebp], eax

; 121  :             op &= 15;                           /* number of extra bits */

	mov	ecx, DWORD PTR _op$[ebp]
	and	ecx, 15					; 0000000fH
	mov	DWORD PTR _op$[ebp], ecx

; 122  :             if (op) {

	je	SHORT $LN27@inflate_fa

; 123  :                 if (bits < op) {

	mov	edx, DWORD PTR _bits$[ebp]
	cmp	edx, DWORD PTR _op$[ebp]
	jae	SHORT $LN28@inflate_fa

; 124  :                     hold += (unsigned long)(*in++) << bits;

	mov	eax, DWORD PTR _in$[ebp]
	movzx	edx, BYTE PTR [eax]
	mov	ecx, DWORD PTR _bits$[ebp]
	shl	edx, cl
	add	edx, DWORD PTR _hold$[ebp]
	mov	DWORD PTR _hold$[ebp], edx
	mov	eax, DWORD PTR _in$[ebp]
	add	eax, 1
	mov	DWORD PTR _in$[ebp], eax

; 125  :                     bits += 8;

	mov	ecx, DWORD PTR _bits$[ebp]
	add	ecx, 8
	mov	DWORD PTR _bits$[ebp], ecx
$LN28@inflate_fa:

; 126  :                 }
; 127  :                 len += (unsigned)hold & ((1U << op) - 1);

	mov	edx, 1
	mov	ecx, DWORD PTR _op$[ebp]
	shl	edx, cl
	sub	edx, 1
	and	edx, DWORD PTR _hold$[ebp]
	add	edx, DWORD PTR _len$[ebp]
	mov	DWORD PTR _len$[ebp], edx

; 128  :                 hold >>= op;

	mov	eax, DWORD PTR _hold$[ebp]
	mov	ecx, DWORD PTR _op$[ebp]
	shr	eax, cl
	mov	DWORD PTR _hold$[ebp], eax

; 129  :                 bits -= op;

	mov	ecx, DWORD PTR _bits$[ebp]
	sub	ecx, DWORD PTR _op$[ebp]
	mov	DWORD PTR _bits$[ebp], ecx
$LN27@inflate_fa:

; 130  :             }
; 131  :             Tracevv((stderr, "inflate:         length %u\n", len));
; 132  :             if (bits < 15) {

	cmp	DWORD PTR _bits$[ebp], 15		; 0000000fH
	jae	SHORT $LN29@inflate_fa

; 133  :                 hold += (unsigned long)(*in++) << bits;

	mov	edx, DWORD PTR _in$[ebp]
	movzx	eax, BYTE PTR [edx]
	mov	ecx, DWORD PTR _bits$[ebp]
	shl	eax, cl
	add	eax, DWORD PTR _hold$[ebp]
	mov	DWORD PTR _hold$[ebp], eax
	mov	ecx, DWORD PTR _in$[ebp]
	add	ecx, 1
	mov	DWORD PTR _in$[ebp], ecx

; 134  :                 bits += 8;

	mov	edx, DWORD PTR _bits$[ebp]
	add	edx, 8
	mov	DWORD PTR _bits$[ebp], edx

; 135  :                 hold += (unsigned long)(*in++) << bits;

	mov	eax, DWORD PTR _in$[ebp]
	movzx	edx, BYTE PTR [eax]
	mov	ecx, DWORD PTR _bits$[ebp]
	shl	edx, cl
	add	edx, DWORD PTR _hold$[ebp]
	mov	DWORD PTR _hold$[ebp], edx
	mov	eax, DWORD PTR _in$[ebp]
	add	eax, 1
	mov	DWORD PTR _in$[ebp], eax

; 136  :                 bits += 8;

	mov	ecx, DWORD PTR _bits$[ebp]
	add	ecx, 8
	mov	DWORD PTR _bits$[ebp], ecx
$LN29@inflate_fa:

; 137  :             }
; 138  :             here = dcode + (hold & dmask);

	mov	edx, DWORD PTR _hold$[ebp]
	and	edx, DWORD PTR _dmask$[ebp]
	mov	eax, DWORD PTR _dcode$[ebp]
	lea	ecx, DWORD PTR [eax+edx*4]
	mov	DWORD PTR _here$[ebp], ecx
$dodist$63:

; 139  :           dodist:
; 140  :             op = (unsigned)(here->bits);

	mov	edx, DWORD PTR _here$[ebp]
	movzx	eax, BYTE PTR [edx+1]
	mov	DWORD PTR _op$[ebp], eax

; 141  :             hold >>= op;

	mov	edx, DWORD PTR _hold$[ebp]
	mov	ecx, DWORD PTR _op$[ebp]
	shr	edx, cl
	mov	DWORD PTR _hold$[ebp], edx

; 142  :             bits -= op;

	mov	eax, DWORD PTR _bits$[ebp]
	sub	eax, DWORD PTR _op$[ebp]
	mov	DWORD PTR _bits$[ebp], eax

; 143  :             op = (unsigned)(here->op);

	mov	ecx, DWORD PTR _here$[ebp]
	movzx	edx, BYTE PTR [ecx]
	mov	DWORD PTR _op$[ebp], edx

; 144  :             if (op & 16) {                      /* distance base */

	mov	eax, DWORD PTR _op$[ebp]
	and	eax, 16					; 00000010H
	je	$LN30@inflate_fa

; 145  :                 dist = (unsigned)(here->val);

	mov	ecx, DWORD PTR _here$[ebp]
	movzx	edx, WORD PTR [ecx+2]
	mov	DWORD PTR _dist$[ebp], edx

; 146  :                 op &= 15;                       /* number of extra bits */

	mov	eax, DWORD PTR _op$[ebp]
	and	eax, 15					; 0000000fH
	mov	DWORD PTR _op$[ebp], eax

; 147  :                 if (bits < op) {

	mov	ecx, DWORD PTR _bits$[ebp]
	cmp	ecx, DWORD PTR _op$[ebp]
	jae	SHORT $LN32@inflate_fa

; 148  :                     hold += (unsigned long)(*in++) << bits;

	mov	edx, DWORD PTR _in$[ebp]
	movzx	eax, BYTE PTR [edx]
	mov	ecx, DWORD PTR _bits$[ebp]
	shl	eax, cl
	add	eax, DWORD PTR _hold$[ebp]
	mov	DWORD PTR _hold$[ebp], eax
	mov	ecx, DWORD PTR _in$[ebp]
	add	ecx, 1
	mov	DWORD PTR _in$[ebp], ecx

; 149  :                     bits += 8;

	mov	edx, DWORD PTR _bits$[ebp]
	add	edx, 8
	mov	DWORD PTR _bits$[ebp], edx

; 150  :                     if (bits < op) {

	mov	eax, DWORD PTR _bits$[ebp]
	cmp	eax, DWORD PTR _op$[ebp]
	jae	SHORT $LN32@inflate_fa

; 151  :                         hold += (unsigned long)(*in++) << bits;

	mov	ecx, DWORD PTR _in$[ebp]
	movzx	edx, BYTE PTR [ecx]
	mov	ecx, DWORD PTR _bits$[ebp]
	shl	edx, cl
	add	edx, DWORD PTR _hold$[ebp]
	mov	DWORD PTR _hold$[ebp], edx
	mov	eax, DWORD PTR _in$[ebp]
	add	eax, 1
	mov	DWORD PTR _in$[ebp], eax

; 152  :                         bits += 8;

	mov	ecx, DWORD PTR _bits$[ebp]
	add	ecx, 8
	mov	DWORD PTR _bits$[ebp], ecx
$LN32@inflate_fa:

; 153  :                     }
; 154  :                 }
; 155  :                 dist += (unsigned)hold & ((1U << op) - 1);

	mov	edx, 1
	mov	ecx, DWORD PTR _op$[ebp]
	shl	edx, cl
	sub	edx, 1
	and	edx, DWORD PTR _hold$[ebp]
	add	edx, DWORD PTR _dist$[ebp]
	mov	DWORD PTR _dist$[ebp], edx

; 156  : #ifdef INFLATE_STRICT
; 157  :                 if (dist > dmax) {
; 158  :                     strm->msg = (char *)"invalid distance too far back";
; 159  :                     state->mode = BAD;
; 160  :                     break;
; 161  :                 }
; 162  : #endif
; 163  :                 hold >>= op;

	mov	eax, DWORD PTR _hold$[ebp]
	mov	ecx, DWORD PTR _op$[ebp]
	shr	eax, cl
	mov	DWORD PTR _hold$[ebp], eax

; 164  :                 bits -= op;

	mov	ecx, DWORD PTR _bits$[ebp]
	sub	ecx, DWORD PTR _op$[ebp]
	mov	DWORD PTR _bits$[ebp], ecx

; 165  :                 Tracevv((stderr, "inflate:         distance %u\n", dist));
; 166  :                 op = (unsigned)(out - beg);     /* max distance in output */

	mov	edx, DWORD PTR _out$[ebp]
	sub	edx, DWORD PTR _beg$[ebp]
	mov	DWORD PTR _op$[ebp], edx

; 167  :                 if (dist > op) {                /* see if copy from window */

	mov	eax, DWORD PTR _dist$[ebp]
	cmp	eax, DWORD PTR _op$[ebp]
	jbe	$LN34@inflate_fa

; 168  :                     op = dist - op;             /* distance back in window */

	mov	ecx, DWORD PTR _dist$[ebp]
	sub	ecx, DWORD PTR _op$[ebp]
	mov	DWORD PTR _op$[ebp], ecx

; 169  :                     if (op > whave) {

	mov	edx, DWORD PTR _op$[ebp]
	cmp	edx, DWORD PTR _whave$[ebp]
	jbe	SHORT $LN36@inflate_fa

; 170  :                         if (state->sane) {

	mov	eax, DWORD PTR _state$[ebp]
	cmp	DWORD PTR [eax+7108], 0
	je	SHORT $LN36@inflate_fa

; 171  :                             strm->msg =

	mov	ecx, DWORD PTR _strm$[ebp]
	mov	DWORD PTR [ecx+24], OFFSET $SG44261

; 172  :                                 (char *)"invalid distance too far back";
; 173  :                             state->mode = BAD;

	mov	edx, DWORD PTR _state$[ebp]
	mov	DWORD PTR [edx+4], 16209		; 00003f51H

; 174  :                             break;

	jmp	$LN3@inflate_fa
$LN36@inflate_fa:

; 175  :                         }
; 176  : #ifdef INFLATE_ALLOW_INVALID_DISTANCE_TOOFAR_ARRR
; 177  :                         if (len <= op - whave) {
; 178  :                             do {
; 179  :                                 *out++ = 0;
; 180  :                             } while (--len);
; 181  :                             continue;
; 182  :                         }
; 183  :                         len -= op - whave;
; 184  :                         do {
; 185  :                             *out++ = 0;
; 186  :                         } while (--op > whave);
; 187  :                         if (op == 0) {
; 188  :                             from = out - dist;
; 189  :                             do {
; 190  :                                 *out++ = *from++;
; 191  :                             } while (--len);
; 192  :                             continue;
; 193  :                         }
; 194  : #endif
; 195  :                     }
; 196  :                     from = window;

	mov	eax, DWORD PTR _window$[ebp]
	mov	DWORD PTR _from$[ebp], eax

; 197  :                     if (wnext == 0) {           /* very common case */

	cmp	DWORD PTR _wnext$[ebp], 0
	jne	SHORT $LN38@inflate_fa

; 198  :                         from += wsize - op;

	mov	ecx, DWORD PTR _wsize$[ebp]
	sub	ecx, DWORD PTR _op$[ebp]
	add	ecx, DWORD PTR _from$[ebp]
	mov	DWORD PTR _from$[ebp], ecx

; 199  :                         if (op < len) {         /* some from window */

	mov	edx, DWORD PTR _op$[ebp]
	cmp	edx, DWORD PTR _len$[ebp]
	jae	SHORT $LN40@inflate_fa

; 200  :                             len -= op;

	mov	eax, DWORD PTR _len$[ebp]
	sub	eax, DWORD PTR _op$[ebp]
	mov	DWORD PTR _len$[ebp], eax
$LN7@inflate_fa:

; 201  :                             do {
; 202  :                                 *out++ = *from++;

	mov	ecx, DWORD PTR _out$[ebp]
	mov	edx, DWORD PTR _from$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx], al
	mov	ecx, DWORD PTR _out$[ebp]
	add	ecx, 1
	mov	DWORD PTR _out$[ebp], ecx
	mov	edx, DWORD PTR _from$[ebp]
	add	edx, 1
	mov	DWORD PTR _from$[ebp], edx

; 203  :                             } while (--op);

	mov	eax, DWORD PTR _op$[ebp]
	sub	eax, 1
	mov	DWORD PTR _op$[ebp], eax
	jne	SHORT $LN7@inflate_fa

; 204  :                             from = out - dist;  /* rest from output */

	mov	ecx, DWORD PTR _out$[ebp]
	sub	ecx, DWORD PTR _dist$[ebp]
	mov	DWORD PTR _from$[ebp], ecx
$LN40@inflate_fa:

; 205  :                         }
; 206  :                     }

	jmp	$LN17@inflate_fa
$LN38@inflate_fa:

; 207  :                     else if (wnext < op) {      /* wrap around window */

	mov	edx, DWORD PTR _wnext$[ebp]
	cmp	edx, DWORD PTR _op$[ebp]
	jae	$LN41@inflate_fa

; 208  :                         from += wsize + wnext - op;

	mov	eax, DWORD PTR _wsize$[ebp]
	add	eax, DWORD PTR _wnext$[ebp]
	sub	eax, DWORD PTR _op$[ebp]
	add	eax, DWORD PTR _from$[ebp]
	mov	DWORD PTR _from$[ebp], eax

; 209  :                         op -= wnext;

	mov	ecx, DWORD PTR _op$[ebp]
	sub	ecx, DWORD PTR _wnext$[ebp]
	mov	DWORD PTR _op$[ebp], ecx

; 210  :                         if (op < len) {         /* some from end of window */

	mov	edx, DWORD PTR _op$[ebp]
	cmp	edx, DWORD PTR _len$[ebp]
	jae	SHORT $LN43@inflate_fa

; 211  :                             len -= op;

	mov	eax, DWORD PTR _len$[ebp]
	sub	eax, DWORD PTR _op$[ebp]
	mov	DWORD PTR _len$[ebp], eax
$LN10@inflate_fa:

; 212  :                             do {
; 213  :                                 *out++ = *from++;

	mov	ecx, DWORD PTR _out$[ebp]
	mov	edx, DWORD PTR _from$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx], al
	mov	ecx, DWORD PTR _out$[ebp]
	add	ecx, 1
	mov	DWORD PTR _out$[ebp], ecx
	mov	edx, DWORD PTR _from$[ebp]
	add	edx, 1
	mov	DWORD PTR _from$[ebp], edx

; 214  :                             } while (--op);

	mov	eax, DWORD PTR _op$[ebp]
	sub	eax, 1
	mov	DWORD PTR _op$[ebp], eax
	jne	SHORT $LN10@inflate_fa

; 215  :                             from = window;

	mov	ecx, DWORD PTR _window$[ebp]
	mov	DWORD PTR _from$[ebp], ecx

; 216  :                             if (wnext < len) {  /* some from start of window */

	mov	edx, DWORD PTR _wnext$[ebp]
	cmp	edx, DWORD PTR _len$[ebp]
	jae	SHORT $LN43@inflate_fa

; 217  :                                 op = wnext;

	mov	eax, DWORD PTR _wnext$[ebp]
	mov	DWORD PTR _op$[ebp], eax

; 218  :                                 len -= op;

	mov	ecx, DWORD PTR _len$[ebp]
	sub	ecx, DWORD PTR _op$[ebp]
	mov	DWORD PTR _len$[ebp], ecx
$LN13@inflate_fa:

; 219  :                                 do {
; 220  :                                     *out++ = *from++;

	mov	edx, DWORD PTR _out$[ebp]
	mov	eax, DWORD PTR _from$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx], cl
	mov	edx, DWORD PTR _out$[ebp]
	add	edx, 1
	mov	DWORD PTR _out$[ebp], edx
	mov	eax, DWORD PTR _from$[ebp]
	add	eax, 1
	mov	DWORD PTR _from$[ebp], eax

; 221  :                                 } while (--op);

	mov	ecx, DWORD PTR _op$[ebp]
	sub	ecx, 1
	mov	DWORD PTR _op$[ebp], ecx
	jne	SHORT $LN13@inflate_fa

; 222  :                                 from = out - dist;      /* rest from output */

	mov	edx, DWORD PTR _out$[ebp]
	sub	edx, DWORD PTR _dist$[ebp]
	mov	DWORD PTR _from$[ebp], edx
$LN43@inflate_fa:

; 223  :                             }
; 224  :                         }
; 225  :                     }

	jmp	SHORT $LN17@inflate_fa
$LN41@inflate_fa:

; 226  :                     else {                      /* contiguous in window */
; 227  :                         from += wnext - op;

	mov	eax, DWORD PTR _wnext$[ebp]
	sub	eax, DWORD PTR _op$[ebp]
	add	eax, DWORD PTR _from$[ebp]
	mov	DWORD PTR _from$[ebp], eax

; 228  :                         if (op < len) {         /* some from window */

	mov	ecx, DWORD PTR _op$[ebp]
	cmp	ecx, DWORD PTR _len$[ebp]
	jae	SHORT $LN17@inflate_fa

; 229  :                             len -= op;

	mov	edx, DWORD PTR _len$[ebp]
	sub	edx, DWORD PTR _op$[ebp]
	mov	DWORD PTR _len$[ebp], edx
$LN16@inflate_fa:

; 230  :                             do {
; 231  :                                 *out++ = *from++;

	mov	eax, DWORD PTR _out$[ebp]
	mov	ecx, DWORD PTR _from$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax], dl
	mov	eax, DWORD PTR _out$[ebp]
	add	eax, 1
	mov	DWORD PTR _out$[ebp], eax
	mov	ecx, DWORD PTR _from$[ebp]
	add	ecx, 1
	mov	DWORD PTR _from$[ebp], ecx

; 232  :                             } while (--op);

	mov	edx, DWORD PTR _op$[ebp]
	sub	edx, 1
	mov	DWORD PTR _op$[ebp], edx
	jne	SHORT $LN16@inflate_fa

; 233  :                             from = out - dist;  /* rest from output */

	mov	eax, DWORD PTR _out$[ebp]
	sub	eax, DWORD PTR _dist$[ebp]
	mov	DWORD PTR _from$[ebp], eax
$LN17@inflate_fa:

; 234  :                         }
; 235  :                     }
; 236  :                     while (len > 2) {

	cmp	DWORD PTR _len$[ebp], 2
	jbe	SHORT $LN18@inflate_fa

; 237  :                         *out++ = *from++;

	mov	ecx, DWORD PTR _out$[ebp]
	mov	edx, DWORD PTR _from$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx], al
	mov	ecx, DWORD PTR _out$[ebp]
	add	ecx, 1
	mov	DWORD PTR _out$[ebp], ecx
	mov	edx, DWORD PTR _from$[ebp]
	add	edx, 1
	mov	DWORD PTR _from$[ebp], edx

; 238  :                         *out++ = *from++;

	mov	eax, DWORD PTR _out$[ebp]
	mov	ecx, DWORD PTR _from$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax], dl
	mov	eax, DWORD PTR _out$[ebp]
	add	eax, 1
	mov	DWORD PTR _out$[ebp], eax
	mov	ecx, DWORD PTR _from$[ebp]
	add	ecx, 1
	mov	DWORD PTR _from$[ebp], ecx

; 239  :                         *out++ = *from++;

	mov	edx, DWORD PTR _out$[ebp]
	mov	eax, DWORD PTR _from$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx], cl
	mov	edx, DWORD PTR _out$[ebp]
	add	edx, 1
	mov	DWORD PTR _out$[ebp], edx
	mov	eax, DWORD PTR _from$[ebp]
	add	eax, 1
	mov	DWORD PTR _from$[ebp], eax

; 240  :                         len -= 3;

	mov	ecx, DWORD PTR _len$[ebp]
	sub	ecx, 3
	mov	DWORD PTR _len$[ebp], ecx

; 241  :                     }

	jmp	SHORT $LN17@inflate_fa
$LN18@inflate_fa:

; 242  :                     if (len) {

	cmp	DWORD PTR _len$[ebp], 0
	je	SHORT $LN46@inflate_fa

; 243  :                         *out++ = *from++;

	mov	edx, DWORD PTR _out$[ebp]
	mov	eax, DWORD PTR _from$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx], cl
	mov	edx, DWORD PTR _out$[ebp]
	add	edx, 1
	mov	DWORD PTR _out$[ebp], edx
	mov	eax, DWORD PTR _from$[ebp]
	add	eax, 1
	mov	DWORD PTR _from$[ebp], eax

; 244  :                         if (len > 1)

	cmp	DWORD PTR _len$[ebp], 1
	jbe	SHORT $LN46@inflate_fa

; 245  :                             *out++ = *from++;

	mov	ecx, DWORD PTR _out$[ebp]
	mov	edx, DWORD PTR _from$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx], al
	mov	ecx, DWORD PTR _out$[ebp]
	add	ecx, 1
	mov	DWORD PTR _out$[ebp], ecx
	mov	edx, DWORD PTR _from$[ebp]
	add	edx, 1
	mov	DWORD PTR _from$[ebp], edx
$LN46@inflate_fa:

; 246  :                     }
; 247  :                 }

	jmp	$LN35@inflate_fa
$LN34@inflate_fa:

; 248  :                 else {
; 249  :                     from = out - dist;          /* copy direct from output */

	mov	eax, DWORD PTR _out$[ebp]
	sub	eax, DWORD PTR _dist$[ebp]
	mov	DWORD PTR _from$[ebp], eax
$LN21@inflate_fa:

; 250  :                     do {                        /* minimum length is three */
; 251  :                         *out++ = *from++;

	mov	ecx, DWORD PTR _out$[ebp]
	mov	edx, DWORD PTR _from$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx], al
	mov	ecx, DWORD PTR _out$[ebp]
	add	ecx, 1
	mov	DWORD PTR _out$[ebp], ecx
	mov	edx, DWORD PTR _from$[ebp]
	add	edx, 1
	mov	DWORD PTR _from$[ebp], edx

; 252  :                         *out++ = *from++;

	mov	eax, DWORD PTR _out$[ebp]
	mov	ecx, DWORD PTR _from$[ebp]
	mov	dl, BYTE PTR [ecx]
	mov	BYTE PTR [eax], dl
	mov	eax, DWORD PTR _out$[ebp]
	add	eax, 1
	mov	DWORD PTR _out$[ebp], eax
	mov	ecx, DWORD PTR _from$[ebp]
	add	ecx, 1
	mov	DWORD PTR _from$[ebp], ecx

; 253  :                         *out++ = *from++;

	mov	edx, DWORD PTR _out$[ebp]
	mov	eax, DWORD PTR _from$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx], cl
	mov	edx, DWORD PTR _out$[ebp]
	add	edx, 1
	mov	DWORD PTR _out$[ebp], edx
	mov	eax, DWORD PTR _from$[ebp]
	add	eax, 1
	mov	DWORD PTR _from$[ebp], eax

; 254  :                         len -= 3;

	mov	ecx, DWORD PTR _len$[ebp]
	sub	ecx, 3
	mov	DWORD PTR _len$[ebp], ecx

; 255  :                     } while (len > 2);

	cmp	DWORD PTR _len$[ebp], 2
	ja	SHORT $LN21@inflate_fa

; 256  :                     if (len) {

	cmp	DWORD PTR _len$[ebp], 0
	je	SHORT $LN35@inflate_fa

; 257  :                         *out++ = *from++;

	mov	edx, DWORD PTR _out$[ebp]
	mov	eax, DWORD PTR _from$[ebp]
	mov	cl, BYTE PTR [eax]
	mov	BYTE PTR [edx], cl
	mov	edx, DWORD PTR _out$[ebp]
	add	edx, 1
	mov	DWORD PTR _out$[ebp], edx
	mov	eax, DWORD PTR _from$[ebp]
	add	eax, 1
	mov	DWORD PTR _from$[ebp], eax

; 258  :                         if (len > 1)

	cmp	DWORD PTR _len$[ebp], 1
	jbe	SHORT $LN35@inflate_fa

; 259  :                             *out++ = *from++;

	mov	ecx, DWORD PTR _out$[ebp]
	mov	edx, DWORD PTR _from$[ebp]
	mov	al, BYTE PTR [edx]
	mov	BYTE PTR [ecx], al
	mov	ecx, DWORD PTR _out$[ebp]
	add	ecx, 1
	mov	DWORD PTR _out$[ebp], ecx
	mov	edx, DWORD PTR _from$[ebp]
	add	edx, 1
	mov	DWORD PTR _from$[ebp], edx
$LN35@inflate_fa:

; 260  :                     }
; 261  :                 }
; 262  :             }

	jmp	SHORT $LN31@inflate_fa
$LN30@inflate_fa:

; 263  :             else if ((op & 64) == 0) {          /* 2nd level distance code */

	mov	eax, DWORD PTR _op$[ebp]
	and	eax, 64					; 00000040H
	jne	SHORT $LN50@inflate_fa

; 264  :                 here = dcode + here->val + (hold & ((1U << op) - 1));

	mov	ecx, DWORD PTR _here$[ebp]
	movzx	edx, WORD PTR [ecx+2]
	mov	eax, DWORD PTR _dcode$[ebp]
	lea	edx, DWORD PTR [eax+edx*4]
	mov	eax, 1
	mov	ecx, DWORD PTR _op$[ebp]
	shl	eax, cl
	sub	eax, 1
	and	eax, DWORD PTR _hold$[ebp]
	lea	ecx, DWORD PTR [edx+eax*4]
	mov	DWORD PTR _here$[ebp], ecx

; 265  :                 goto dodist;

	jmp	$dodist$63

; 266  :             }

	jmp	SHORT $LN31@inflate_fa
$LN50@inflate_fa:

; 267  :             else {
; 268  :                 strm->msg = (char *)"invalid distance code";

	mov	edx, DWORD PTR _strm$[ebp]
	mov	DWORD PTR [edx+24], OFFSET $SG44276

; 269  :                 state->mode = BAD;

	mov	eax, DWORD PTR _state$[ebp]
	mov	DWORD PTR [eax+4], 16209		; 00003f51H

; 270  :                 break;

	jmp	SHORT $LN3@inflate_fa
$LN31@inflate_fa:

; 271  :             }
; 272  :         }

	jmp	SHORT $LN2@inflate_fa
$LN25@inflate_fa:

; 273  :         else if ((op & 64) == 0) {              /* 2nd level length code */

	mov	ecx, DWORD PTR _op$[ebp]
	and	ecx, 64					; 00000040H
	jne	SHORT $LN52@inflate_fa

; 274  :             here = lcode + here->val + (hold & ((1U << op) - 1));

	mov	edx, DWORD PTR _here$[ebp]
	movzx	eax, WORD PTR [edx+2]
	mov	ecx, DWORD PTR _lcode$[ebp]
	lea	edx, DWORD PTR [ecx+eax*4]
	mov	eax, 1
	mov	ecx, DWORD PTR _op$[ebp]
	shl	eax, cl
	sub	eax, 1
	and	eax, DWORD PTR _hold$[ebp]
	lea	ecx, DWORD PTR [edx+eax*4]
	mov	DWORD PTR _here$[ebp], ecx

; 275  :             goto dolen;

	jmp	$dolen$62

; 276  :         }

	jmp	SHORT $LN2@inflate_fa
$LN52@inflate_fa:

; 277  :         else if (op & 32) {                     /* end-of-block */

	mov	edx, DWORD PTR _op$[ebp]
	and	edx, 32					; 00000020H
	je	SHORT $LN54@inflate_fa

; 278  :             Tracevv((stderr, "inflate:         end of block\n"));
; 279  :             state->mode = TYPE;

	mov	eax, DWORD PTR _state$[ebp]
	mov	DWORD PTR [eax+4], 16191		; 00003f3fH

; 280  :             break;

	jmp	SHORT $LN3@inflate_fa

; 281  :         }

	jmp	SHORT $LN2@inflate_fa
$LN54@inflate_fa:

; 282  :         else {
; 283  :             strm->msg = (char *)"invalid literal/length code";

	mov	ecx, DWORD PTR _strm$[ebp]
	mov	DWORD PTR [ecx+24], OFFSET $SG44281

; 284  :             state->mode = BAD;

	mov	edx, DWORD PTR _state$[ebp]
	mov	DWORD PTR [edx+4], 16209		; 00003f51H

; 285  :             break;

	jmp	SHORT $LN3@inflate_fa
$LN2@inflate_fa:

; 286  :         }
; 287  :     } while (in < last && out < end);

	mov	eax, DWORD PTR _in$[ebp]
	cmp	eax, DWORD PTR _last$[ebp]
	jae	SHORT $LN3@inflate_fa
	mov	ecx, DWORD PTR _out$[ebp]
	cmp	ecx, DWORD PTR _end$[ebp]
	jb	$LN4@inflate_fa
$LN3@inflate_fa:

; 288  : 
; 289  :     /* return unused bytes (on entry, bits < 8, so in won't go too far back) */
; 290  :     len = bits >> 3;

	mov	edx, DWORD PTR _bits$[ebp]
	shr	edx, 3
	mov	DWORD PTR _len$[ebp], edx

; 291  :     in -= len;

	mov	eax, DWORD PTR _in$[ebp]
	sub	eax, DWORD PTR _len$[ebp]
	mov	DWORD PTR _in$[ebp], eax

; 292  :     bits -= len << 3;

	mov	ecx, DWORD PTR _len$[ebp]
	shl	ecx, 3
	mov	edx, DWORD PTR _bits$[ebp]
	sub	edx, ecx
	mov	DWORD PTR _bits$[ebp], edx

; 293  :     hold &= (1U << bits) - 1;

	mov	eax, 1
	mov	ecx, DWORD PTR _bits$[ebp]
	shl	eax, cl
	sub	eax, 1
	and	eax, DWORD PTR _hold$[ebp]
	mov	DWORD PTR _hold$[ebp], eax

; 294  : 
; 295  :     /* update state and return */
; 296  :     strm->next_in = in;

	mov	ecx, DWORD PTR _strm$[ebp]
	mov	edx, DWORD PTR _in$[ebp]
	mov	DWORD PTR [ecx], edx

; 297  :     strm->next_out = out;

	mov	eax, DWORD PTR _strm$[ebp]
	mov	ecx, DWORD PTR _out$[ebp]
	mov	DWORD PTR [eax+12], ecx

; 298  :     strm->avail_in = (unsigned)(in < last ? 5 + (last - in) : 5 - (in - last));

	mov	edx, DWORD PTR _in$[ebp]
	cmp	edx, DWORD PTR _last$[ebp]
	jae	SHORT $LN58@inflate_fa
	mov	eax, DWORD PTR _last$[ebp]
	sub	eax, DWORD PTR _in$[ebp]
	add	eax, 5
	mov	DWORD PTR tv326[ebp], eax
	jmp	SHORT $LN59@inflate_fa
$LN58@inflate_fa:
	mov	ecx, DWORD PTR _in$[ebp]
	sub	ecx, DWORD PTR _last$[ebp]
	mov	edx, 5
	sub	edx, ecx
	mov	DWORD PTR tv326[ebp], edx
$LN59@inflate_fa:
	mov	eax, DWORD PTR _strm$[ebp]
	mov	ecx, DWORD PTR tv326[ebp]
	mov	DWORD PTR [eax+4], ecx

; 299  :     strm->avail_out = (unsigned)(out < end ?

	mov	edx, DWORD PTR _out$[ebp]
	cmp	edx, DWORD PTR _end$[ebp]
	jae	SHORT $LN60@inflate_fa
	mov	eax, DWORD PTR _end$[ebp]
	sub	eax, DWORD PTR _out$[ebp]
	add	eax, 257				; 00000101H
	mov	DWORD PTR tv333[ebp], eax
	jmp	SHORT $LN61@inflate_fa
$LN60@inflate_fa:
	mov	ecx, DWORD PTR _out$[ebp]
	sub	ecx, DWORD PTR _end$[ebp]
	mov	edx, 257				; 00000101H
	sub	edx, ecx
	mov	DWORD PTR tv333[ebp], edx
$LN61@inflate_fa:
	mov	eax, DWORD PTR _strm$[ebp]
	mov	ecx, DWORD PTR tv333[ebp]
	mov	DWORD PTR [eax+16], ecx

; 300  :                                  257 + (end - out) : 257 - (out - end));
; 301  :     state->hold = hold;

	mov	edx, DWORD PTR _state$[ebp]
	mov	eax, DWORD PTR _hold$[ebp]
	mov	DWORD PTR [edx+60], eax

; 302  :     state->bits = bits;

	mov	ecx, DWORD PTR _state$[ebp]
	mov	edx, DWORD PTR _bits$[ebp]
	mov	DWORD PTR [ecx+64], edx

; 303  :     return;
; 304  : }

	mov	esp, ebp
	pop	ebp
	ret	0
_inflate_fast ENDP
_TEXT	ENDS
END
