; Listing generated by Microsoft (R) Optimizing Compiler Version 19.34.31937.0 

	TITLE	C:\Users\chris\Documents\GitHub\zlib\contrib\vstudio\vc14\x86\TestZlibDebug\Tmp\uncompr.obj
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB MSVCRTD
INCLUDELIB OLDNAMES

PUBLIC	_uncompress@16
PUBLIC	_uncompress2@16
EXTRN	_inflate@8:PROC
EXTRN	_inflateEnd@4:PROC
EXTRN	_inflateInit_@12:PROC
_DATA	SEGMENT
$SG41846 DB	'1.2.13.1-motley', 00H
_DATA	ENDS
; Function compile flags: /Odtp
; File C:\Users\chris\Documents\GitHub\zlib\uncompr.c
_TEXT	SEGMENT
_stream$ = -96						; size = 56
tv95 = -40						; size = 4
tv94 = -36						; size = 4
tv93 = -32						; size = 4
tv76 = -28						; size = 4
tv72 = -24						; size = 4
_max$ = -20						; size = 4
_len$ = -16						; size = 4
_left$ = -12						; size = 4
_err$ = -8						; size = 4
_buf$ = -1						; size = 1
_dest$ = 8						; size = 4
_destLen$ = 12						; size = 4
_source$ = 16						; size = 4
_sourceLen$ = 20					; size = 4
_uncompress2@16 PROC

; 32   : {

	push	ebp
	mov	ebp, esp
	sub	esp, 96					; 00000060H

; 33   :     z_stream stream;
; 34   :     int err;
; 35   :     const uInt max = (uInt)-1;

	mov	DWORD PTR _max$[ebp], -1

; 36   :     uLong len, left;
; 37   :     Byte buf[1];    /* for detection of incomplete stream when *destLen == 0 */
; 38   : 
; 39   :     len = *sourceLen;

	mov	eax, DWORD PTR _sourceLen$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _len$[ebp], ecx

; 40   :     if (*destLen) {

	mov	edx, DWORD PTR _destLen$[ebp]
	cmp	DWORD PTR [edx], 0
	je	SHORT $LN5@uncompress

; 41   :         left = *destLen;

	mov	eax, DWORD PTR _destLen$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _left$[ebp], ecx

; 42   :         *destLen = 0;

	mov	edx, DWORD PTR _destLen$[ebp]
	mov	DWORD PTR [edx], 0

; 43   :     }

	jmp	SHORT $LN6@uncompress
$LN5@uncompress:

; 44   :     else {
; 45   :         left = 1;

	mov	DWORD PTR _left$[ebp], 1

; 46   :         dest = buf;

	lea	eax, DWORD PTR _buf$[ebp]
	mov	DWORD PTR _dest$[ebp], eax
$LN6@uncompress:

; 47   :     }
; 48   : 
; 49   :     stream.next_in = (z_const Bytef *)source;

	mov	ecx, DWORD PTR _source$[ebp]
	mov	DWORD PTR _stream$[ebp], ecx

; 50   :     stream.avail_in = 0;

	mov	DWORD PTR _stream$[ebp+4], 0

; 51   :     stream.zalloc = (alloc_func)0;

	mov	DWORD PTR _stream$[ebp+32], 0

; 52   :     stream.zfree = (free_func)0;

	mov	DWORD PTR _stream$[ebp+36], 0

; 53   :     stream.opaque = (voidpf)0;

	mov	DWORD PTR _stream$[ebp+40], 0

; 54   : 
; 55   :     err = inflateInit(&stream);

	push	56					; 00000038H
	push	OFFSET $SG41846
	lea	edx, DWORD PTR _stream$[ebp]
	push	edx
	call	_inflateInit_@12
	mov	DWORD PTR _err$[ebp], eax

; 56   :     if (err != Z_OK) return err;

	cmp	DWORD PTR _err$[ebp], 0
	je	SHORT $LN7@uncompress
	mov	eax, DWORD PTR _err$[ebp]
	jmp	$LN1@uncompress
$LN7@uncompress:

; 57   : 
; 58   :     stream.next_out = dest;

	mov	eax, DWORD PTR _dest$[ebp]
	mov	DWORD PTR _stream$[ebp+12], eax

; 59   :     stream.avail_out = 0;

	mov	DWORD PTR _stream$[ebp+16], 0
$LN4@uncompress:

; 60   : 
; 61   :     do {
; 62   :         if (stream.avail_out == 0) {

	cmp	DWORD PTR _stream$[ebp+16], 0
	jne	SHORT $LN8@uncompress

; 63   :             stream.avail_out = left > (uLong)max ? max : (uInt)left;

	mov	ecx, DWORD PTR _left$[ebp]
	cmp	ecx, DWORD PTR _max$[ebp]
	jbe	SHORT $LN14@uncompress
	mov	edx, DWORD PTR _max$[ebp]
	mov	DWORD PTR tv72[ebp], edx
	jmp	SHORT $LN15@uncompress
$LN14@uncompress:
	mov	eax, DWORD PTR _left$[ebp]
	mov	DWORD PTR tv72[ebp], eax
$LN15@uncompress:
	mov	ecx, DWORD PTR tv72[ebp]
	mov	DWORD PTR _stream$[ebp+16], ecx

; 64   :             left -= stream.avail_out;

	mov	edx, DWORD PTR _left$[ebp]
	sub	edx, DWORD PTR _stream$[ebp+16]
	mov	DWORD PTR _left$[ebp], edx
$LN8@uncompress:

; 65   :         }
; 66   :         if (stream.avail_in == 0) {

	cmp	DWORD PTR _stream$[ebp+4], 0
	jne	SHORT $LN9@uncompress

; 67   :             stream.avail_in = len > (uLong)max ? max : (uInt)len;

	mov	eax, DWORD PTR _len$[ebp]
	cmp	eax, DWORD PTR _max$[ebp]
	jbe	SHORT $LN16@uncompress
	mov	ecx, DWORD PTR _max$[ebp]
	mov	DWORD PTR tv76[ebp], ecx
	jmp	SHORT $LN17@uncompress
$LN16@uncompress:
	mov	edx, DWORD PTR _len$[ebp]
	mov	DWORD PTR tv76[ebp], edx
$LN17@uncompress:
	mov	eax, DWORD PTR tv76[ebp]
	mov	DWORD PTR _stream$[ebp+4], eax

; 68   :             len -= stream.avail_in;

	mov	ecx, DWORD PTR _len$[ebp]
	sub	ecx, DWORD PTR _stream$[ebp+4]
	mov	DWORD PTR _len$[ebp], ecx
$LN9@uncompress:

; 69   :         }
; 70   :         err = inflate(&stream, Z_NO_FLUSH);

	push	0
	lea	edx, DWORD PTR _stream$[ebp]
	push	edx
	call	_inflate@8
	mov	DWORD PTR _err$[ebp], eax

; 71   :     } while (err == Z_OK);

	cmp	DWORD PTR _err$[ebp], 0
	je	SHORT $LN4@uncompress

; 72   : 
; 73   :     *sourceLen -= len + stream.avail_in;

	mov	eax, DWORD PTR _len$[ebp]
	add	eax, DWORD PTR _stream$[ebp+4]
	mov	ecx, DWORD PTR _sourceLen$[ebp]
	mov	edx, DWORD PTR [ecx]
	sub	edx, eax
	mov	eax, DWORD PTR _sourceLen$[ebp]
	mov	DWORD PTR [eax], edx

; 74   :     if (dest != buf)

	lea	ecx, DWORD PTR _buf$[ebp]
	cmp	DWORD PTR _dest$[ebp], ecx
	je	SHORT $LN10@uncompress

; 75   :         *destLen = stream.total_out;

	mov	edx, DWORD PTR _destLen$[ebp]
	mov	eax, DWORD PTR _stream$[ebp+20]
	mov	DWORD PTR [edx], eax
	jmp	SHORT $LN11@uncompress
$LN10@uncompress:

; 76   :     else if (stream.total_out && err == Z_BUF_ERROR)

	cmp	DWORD PTR _stream$[ebp+20], 0
	je	SHORT $LN11@uncompress
	cmp	DWORD PTR _err$[ebp], -5		; fffffffbH
	jne	SHORT $LN11@uncompress

; 77   :         left = 1;

	mov	DWORD PTR _left$[ebp], 1
$LN11@uncompress:

; 78   : 
; 79   :     inflateEnd(&stream);

	lea	ecx, DWORD PTR _stream$[ebp]
	push	ecx
	call	_inflateEnd@4

; 80   :     return err == Z_STREAM_END ? Z_OK :

	cmp	DWORD PTR _err$[ebp], 1
	jne	SHORT $LN22@uncompress
	mov	DWORD PTR tv95[ebp], 0
	jmp	SHORT $LN23@uncompress
$LN22@uncompress:
	cmp	DWORD PTR _err$[ebp], 2
	jne	SHORT $LN20@uncompress
	mov	DWORD PTR tv94[ebp], -3			; fffffffdH
	jmp	SHORT $LN21@uncompress
$LN20@uncompress:
	cmp	DWORD PTR _err$[ebp], -5		; fffffffbH
	jne	SHORT $LN18@uncompress
	mov	edx, DWORD PTR _left$[ebp]
	add	edx, DWORD PTR _stream$[ebp+16]
	je	SHORT $LN18@uncompress
	mov	DWORD PTR tv93[ebp], -3			; fffffffdH
	jmp	SHORT $LN19@uncompress
$LN18@uncompress:
	mov	eax, DWORD PTR _err$[ebp]
	mov	DWORD PTR tv93[ebp], eax
$LN19@uncompress:
	mov	ecx, DWORD PTR tv93[ebp]
	mov	DWORD PTR tv94[ebp], ecx
$LN21@uncompress:
	mov	edx, DWORD PTR tv94[ebp]
	mov	DWORD PTR tv95[ebp], edx
$LN23@uncompress:
	mov	eax, DWORD PTR tv95[ebp]
$LN1@uncompress:

; 81   :            err == Z_NEED_DICT ? Z_DATA_ERROR  :
; 82   :            err == Z_BUF_ERROR && left + stream.avail_out ? Z_DATA_ERROR :
; 83   :            err;
; 84   : }

	mov	esp, ebp
	pop	ebp
	ret	16					; 00000010H
_uncompress2@16 ENDP
_TEXT	ENDS
; Function compile flags: /Odtp
; File C:\Users\chris\Documents\GitHub\zlib\uncompr.c
_TEXT	SEGMENT
_dest$ = 8						; size = 4
_destLen$ = 12						; size = 4
_source$ = 16						; size = 4
_sourceLen$ = 20					; size = 4
_uncompress@16 PROC

; 91   : {

	push	ebp
	mov	ebp, esp

; 92   :     return uncompress2(dest, destLen, source, &sourceLen);

	lea	eax, DWORD PTR _sourceLen$[ebp]
	push	eax
	mov	ecx, DWORD PTR _source$[ebp]
	push	ecx
	mov	edx, DWORD PTR _destLen$[ebp]
	push	edx
	mov	eax, DWORD PTR _dest$[ebp]
	push	eax
	call	_uncompress2@16

; 93   : }

	pop	ebp
	ret	16					; 00000010H
_uncompress@16 ENDP
_TEXT	ENDS
END
