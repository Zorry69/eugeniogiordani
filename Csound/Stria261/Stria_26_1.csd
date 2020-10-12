<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsLicense>
======== STRIA Rel. 2.61  Written by Eugenio Giordani 11/02/2014 ====================
List of changes 
>Range for Freq. Spread: 0.001  to 100
>Range for Im1/2 : 4
>Added 3 control flag for secure start (giGEOMETRIC, giHARMONIC, giFIBO)
>Added metronome control on Sequencer
>Add meter linear for morph and percent output
>!!!! Revised by Michael Gogins !!!!!
>Added random parameters extractor with exclusion/inclusion check boxes
>Bug fixing of Sequencer
>Bug fixing Sequencer/ Put element
>Added a progress bar during Timeline 


</CsLicense>
<CsInstruments>
prints "Finished parsing and compiling, now running."
sr = 44100;48000
ksmps = 1024;1000
nchnls = 2

#define		EPSILON #int(sr/ksmps)#
#define		MAXFSPREAD #100#				; the same maxvalue of widget "band"
#define		MAXIMOD #4#					; the same maxvalue of widget "indx1"

massign 0,0									; Disable MIDI instr. triggering
gifreq				init 1
gipitchspace		init 2048	;frequency lookup table (pitchspace)
gispace				init 64
gind 				init 0		;table index (pitchspace)
girecompile_G  	init 0
giSEQ 				init 0
giPrn 				init 1
giTtran				init 0
giMode				init 0
gimaxindex         init 0 
gitot_TIME         init 0


giDEBUG_01         init 0.001
giDEBUG_02         init 0.002

gksw1 			init 0
gksw2			init 0
gksw3			init 0
gksw4			init 0
gksw5 			init 0
gksw6			init 0
gksw7			init 0
gksw8			init 0

gkfauto1		init 0
gkfauto2		init 0
gkfauto3		init 0
gkfauto4		init 0


gaFFT 			init 0
gaMETER_L 		init 0
gaMETER_R 		init 0
gaREVL			init 0
gaREVR			init 0
gkATK1 			init 1
gkREL1 			init 1
gkenvp     		init 0
gaWRITE_L		init 0
gaWRITE_R		init 0


gaREVREC_L		init 0
gaREVREC_R		init 0
gaCONV_L		init 0
gaCONV_R		init 0


gkval_1_old 	init 0
gkval_2_old 	init 0
gkval_3_old 	init 0
gkval_4_old 	init 0
gkval_5_old 	init 0
gkval_6_old 	init 0
gkval_7_old 	init 0
gkval_8_old 	init 0


gkval_11_old 	init 0
gkval_12_old 	init 0
gkval_13_old 	init 0
gkval_14_old 	init 0

gkMIDIVAR_1 	init 0
gkMIDIVAR_2 	init 0
gkMIDIVAR_3 	init 0
gkMIDIVAR_4 	init 0
gkMIDIVAR_5 	init 0
gkMIDIVAR_6 	init 0
gkMIDIVAR_7 	init 0
gkMIDIVAR_8		init 0

gkinv_1		init 0
gkinv_2		init 0
gkinv_3		init 0
gkinv_4		init 0
gkinv_5		init 0
gkinv_6		init 0
gkinv_7		init 0
gkinv_8		init 0

gkcc1_lev	init 1
gkcc2_lev	init 1
gkcc3_lev	init 1
gkcc4_lev	init 1
gkcc5_lev	init 1
gkcc6_lev	init 1
gkcc7_lev	init 1
gkcc8_lev	init 1


giGEOMETRIC		init 0
giHARMONIC		init 0
giFIBO			init 0

gkstop 			init 0


giONOFF			init 0

#define DEFAULT # 0 #
#define SCALEFACTOR1 # 5000 #
#define SCALEFACTOR2 # 2000 #

; 48 tables allocation containing 48 snapshots
gisna0 	ftgen 200, 0, gispace, -2, $DEFAULT		;1st table containing snapshot parameters (Snap01 ->   Get = 0 )
gisna1 	ftgen 201, 0, gispace, -2, $DEFAULT		;2nd  "
gisna2 	ftgen 202, 0, gispace, -2, $DEFAULT		; etc...
gisna3 	ftgen 203, 0, gispace, -2, $DEFAULT
gisna4 	ftgen 204, 0, gispace, -2, $DEFAULT
gisna5 	ftgen 205, 0, gispace, -2, $DEFAULT
gisna6 	ftgen 206, 0, gispace, -2, $DEFAULT
gisna7 	ftgen 207, 0, gispace, -2, $DEFAULT
gisna8 	ftgen 208, 0, gispace, -2, $DEFAULT
gisna9 	ftgen 209, 0, gispace, -2, $DEFAULT
gisna10 	ftgen 210, 0, gispace, -2, $DEFAULT
gisna11 	ftgen 211, 0, gispace, -2, $DEFAULT
gisna12 	ftgen 212, 0, gispace, -2, $DEFAULT
gisna13 	ftgen 213, 0, gispace, -2, $DEFAULT
gisna14 	ftgen 214, 0, gispace, -2, $DEFAULT
gisna15 	ftgen 215, 0, gispace, -2, $DEFAULT
gisna16 	ftgen 216, 0, gispace, -2, $DEFAULT
gisna17 	ftgen 217, 0, gispace, -2, $DEFAULT
gisna18 	ftgen 218, 0, gispace, -2, $DEFAULT
gisna19 	ftgen 219, 0, gispace, -2, $DEFAULT
gisna20 	ftgen 220, 0, gispace, -2, $DEFAULT
gisna21 	ftgen 221, 0, gispace, -2, $DEFAULT
gisna22 	ftgen 222, 0, gispace, -2, $DEFAULT
gisna23 	ftgen 223, 0, gispace, -2, $DEFAULT
gisna24 	ftgen 224, 0, gispace, -2, $DEFAULT
gisna25 	ftgen 225, 0, gispace, -2, $DEFAULT
gisna26 	ftgen 226, 0, gispace, -2, $DEFAULT
gisna27 	ftgen 227, 0, gispace, -2, $DEFAULT
gisna28 	ftgen 228, 0, gispace, -2, $DEFAULT
gisna29 	ftgen 229, 0, gispace, -2, $DEFAULT
gisna30 	ftgen 230, 0, gispace, -2, $DEFAULT
gisna31 	ftgen 231, 0, gispace, -2, $DEFAULT
gisna32 	ftgen 232, 0, gispace, -2, $DEFAULT
gisna33 	ftgen 233, 0, gispace, -2, $DEFAULT
gisna34 	ftgen 234, 0, gispace, -2, $DEFAULT
gisna35 	ftgen 235, 0, gispace, -2, $DEFAULT
gisna36 	ftgen 236, 0, gispace, -2, $DEFAULT
gisna37 	ftgen 237, 0, gispace, -2, $DEFAULT
gisna38 	ftgen 238, 0, gispace, -2, $DEFAULT
gisna39 	ftgen 239, 0, gispace, -2, $DEFAULT
gisna40 	ftgen 240, 0, gispace, -2, $DEFAULT
gisna41 	ftgen 241, 0, gispace, -2, $DEFAULT
gisna42 	ftgen 242, 0, gispace, -2, $DEFAULT
gisna43 	ftgen 243, 0, gispace, -2, $DEFAULT
gisna44 	ftgen 244, 0, gispace, -2, $DEFAULT
gisna45 	ftgen 245, 0, gispace, -2, $DEFAULT
gisna46 	ftgen 246, 0, gispace, -2, $DEFAULT
gisna47 	ftgen 247, 0, gispace, -2, $DEFAULT


;AMPLITUDE RAMP SHAPER FUNCTION
gifn20		ftgen   20, 0 , 8192, 20 , 2,  1


;BASIC AUDIO WAVEFORMS

gifn8	ftgen	8,0,16384,10,1,0,0,0.125,0.25, 0.7, 1, 0.7, 0.25,  0, 0, 0, 0, 0.2, 0.5, 0.7, 0.5, 0.1
gifn7	ftgen	7,0,16384,10,1,0,0,0,0,0,0,0,0.1,0.2,0,0,0,0,1,1,0,0,0,0,0.1,0,0.05
gifn6	ftgen	6,0,16384,10,1,0,0.1,0,0,0,0,0,0,0,1,0,0,0,0.1,0,0,0,0,0,0.1
gifn5	ftgen	5,0,16384,10,1,0,0,0.125,0.25, 0.7, 1, 0.7, 0.25,  0, 0, 0, 0, 0.2, 0.5, 0.7, 0.5, 0.1
gifn4	ftgen	4,0,16384,10,1,0,0,0,0,0,0,0,0.1,0.2,0,0,0,0,0.3,0.31,0,0,0,0,0.1,0,0.05
gifn3	ftgen	3,0,16384,10,1,0,0.1,0,0,0,0,0,0,0,0,0,0,0,0.1,0,0,0,0,0,0.1
gifn2	ftgen	2,0,16384,10,1,0,0,0.01,0,0.03,0.02,0,0,0,0,0,0,0,0.01
gifn1	ftgen	1,0,16384,10,1,0

;SPECTRAL SHAPE TABLES

gifn501 ftgen	501,0,8,16, 1,   8,  0, 1    			; flat equiamp spectrum
gifn502 ftgen	502,0,8,16, 1,   8,  0, 0.1  			; linear ramp (1 - 0.1)
gifn503 ftgen	503,0,8,16, 0.1, 8,  0, 1    			; linear ramp (0.1 - 1)
gifn504 ftgen	504,0,8,16, 1,   8,  2, 0.1  			; log up (1 - 0.1)
gifn505 ftgen	505,0,8,16, 0.1, 8, -2, 1    			; log dwn (0.1 - 1)
gifn506 ftgen	506,0,8,16, 1,   8, -2, 0.1  			; exp up (1 - 0.1)
gifn507 ftgen	507,0,8,16, 0.1, 8,  2, 1    			; exp dwn (0.1 - 1)
gifn508 ftgen	508,0,8,16, 1,   4,  0, 0.1, 4, 0, 1  ; V-shaped ramp (1 - 0.1 - 1)
gifn509 ftgen	509,0,8,16, 0.1, 4,  0, 1, 4, 0, 0.1  ; TRI-shaped ramp (1 - 0.1 - 1)


giLiveBuf	ftgen		0, 0, 16384, 2, 0	; buffer for writing and reading live input (future expansion)


;====================== INPUT VIRTUAL SURFACE CONTROL PARAMETERS ==========
instr 1 ;------> INPUT WIDGETS


ktrig	metro	8	; widgets scan timing (10 scans/seconds)

	if ktrig == 1 then
		gkxfade_0		invalue "XFADE"
		gkxfade 		port gkxfade_0, 0.05

outvalue "disp_G1LEV", 1 - gkxfade
outvalue "disp_G2LEV", gkxfade

gk_outf 		invalue "outf"
gk_ratio 		invalue "ratio"
gk_num			invalue "num"
gk_den			invalue "den"
gkmode_in		invalue "mode_in"

gk_G_fund		invalue "G_fund"
gk_G_oct		invalue "G_oct"
gk_G_key		invalue "G_key"

gk_H_fund		invalue "H_fund"
gk_H_oct		invalue "H_oct"
gk_H_key		invalue "H_key"

gk_ffund		invalue "ffund"
gk_exp			invalue "exp"
gk_maxharm		invalue "maxharm"
	
gkFIB_Start		invalue "FIB_Start"
gkFIB_Fund		invalue "FIB_Fund"


gkover_0		invalue "over"

gk_CAR_min		invalue "CAR_min"
gk_CAR_max		invalue "CAR_max"
gk_MOD_min		invalue "MOD_min"
gk_MOD_max		invalue "MOD_max"
gk_cm			invalue "cm"
gk_ADSYN		invalue "ADSYN"

gkpad_Y1		invalue "pad_Y1"
gkpad_X1		invalue "pad_X1"
gkran1_amp		invalue "ran1amp"
gkran1_vel		invalue "ran1vel"
gkfun1			invalue "Fun_1"
gkATK1			invalue "AT1"
gkREL1			invalue "RE1"
gkREVSEND1		invalue "REVSEND1"

gkstep			invalue "knob154"
gklev_1			invalue "Lev_1"
gkindx1			invalue "indx1"
gkSHAPE_0		invalue "SHAPE"
gkvoi			invalue "vox"

gkpad_Y2		invalue "pad_Y2"
gkpad_X2		invalue "pad_X2"
gkran2_amp		invalue "ran2amp"
gkran2_vel		invalue "ran2vel"
gkfun2			invalue "Fun_2"
gkATK2			invalue "AT2"
gkREL2			invalue "RE2"
gkREVSEND2		invalue "REVSEND2"
gklev_2			invalue "Lev_2"
gkindx2			invalue "indx2"

gkband			invalue "band"
gkdur			invalue "dur"
gkrate			invalue "rate"

gkREVLEV		invalue "REVLEV"
gkROOM			invalue "ROOM"
gkHF			invalue "HF"

gkmute1			invalue "MUTE1"
gkmute2			invalue "MUTE2"

gkran1_mute		invalue "RAN1MUTE"
gkran2_mute		invalue "RAN2MUTE"


gknum_fib		invalue "NUMFIB"

gkGet			invalue "Get"

gkTYPE			invalue "TYPE"
gkTrans			invalue "read_snap"
gkTIME			invalue "TIME"

gkBYSTTIME		invalue "BYSTTIME"

gkgrid_morph 	invalue "grid_morph"

gkkeyb_SW		invalue "keyb_SW"


gkrectime		invalue "rectime"


gkin_index		invalue "in_index"
gkin_readend	invalue "in_readend"
gkin_readton	invalue "in_readton"
gkin_readsnap	invalue "in_readsnap"
gkin_readtran	invalue "in_readtran"
gkin_readtype	invalue "in_readtype"

gkmetronome		invalue "metronome"

endif


gkpad_Y1L 	limit gkpad_Y1, 0,1
gkpad_X1L 	limit gkpad_X1, 0.0,1.0		;gkpad_X1L 	limit gkpad_X1, 0.001,1

gkover 		port gkover_0, 1
gkvoi_i  = 	int(gkvoi)
gkpad_Y2L 	limit gkpad_Y2, 0,1
gkpad_X2L 	limit gkpad_X2, 0,1
gkSHAPE    =  gkSHAPE_0 + 1

gknum_den = gk_num/gk_den

outvalue "disp_numdem", gknum_den
outvalue "disppad_Y1", gkpad_Y1L
outvalue "disppad_X1", gkpad_X1L
outvalue "metervoi", gkvoi_i/8

outvalue "led_ADSYN", gk_ADSYN
outvalue "led_FM", 1 - gk_ADSYN

outvalue "led_INT", 1 - gk_cm
outvalue "led_FLOAT", gk_cm



;SHOW ACTIVE INSTR
kactive active 151					;shows active intr
outvalue "active", kactive


ktrig2 metro 0.2
if ktrig2 == 1 then
outvalue "ABOUT", 0
endif

endin



;=============   BUTTONS STATE MANAGER   ===============

instr 2;----> Main Buttons State Manager (Old but stable)
;print giGEOMETRIC, giHARMONIC,  giFIBO

if p4 == 1 then	; test on p4  (button On/Off 1)

  if giGEOMETRIC != 0 || giHARMONIC !=0 || giFIBO !=0 then
	gksw1 = 1 - gksw1

	schedule 101,0,36000	; if == 1 call scheduler 1 (instr 101)
	else
	turnoff
	endif


elseif p4 == 2 then 		; test on p4 button On/Off 2


	gksw2 = 1 - gksw2

	schedule 102,0,36000	; if == 1 call  scheduler 2 (instr 102)


elseif p4 == 3 then		; test on p4 button Random 1
	gksw3 = 1 - gksw3
	schedule 21,0,36000		; if == 1 switch on random gen. 1 (instr 21)

elseif p4 == 4 then		; test on p4 button Random 2
	gksw4 = 1 - gksw4
	schedule 22,0,36000		; if == 1 switch on generator random 2 (instr 22)

elseif p4 == 5 then		; test on p4  button Timer
	gksw5 = 1 - gksw5
	schedule 950,0,36000		; if == 1 switch on Timer (instr 950)


endif
turnoff

endin

;=======================================
instr 3  ;----> Random Shot

;Random parameter extraction (only 7 for now as an exmple)
;In progress.....

ktrig	metro	8	; widgets scan timing (10 scans/seconds)

	if ktrig == 1 then
kf1_sw 	   	invalue "F1_SW"
kf2_sw     invalue "F2_SW"
klev1_sw	invalue "LEV1_SW"
klev2_sw	invalue "LEV2_SW"
kim1_sw	   	invalue "IM1_SW"
kim2_sw    	invalue "IM2_SW"

kx1_sw		invalue "X1_SW"
kx2_sw		invalue "X2_SW"
kvoi_sw  	invalue "VOI_SW"
kstep_sw	invalue "STEP_SW"
kshape_sw	invalue "SHAPE_SW"
krate_sw	invalue "RATE_SW"
kdur_sw	   	invalue "DUR_SW"
kband_sw	invalue "BAND_SW"

kat1_sw	   	invalue "AT1_SW"
kat2_sw	   	invalue "AT2_SW"
krel1_sw	invalue "REL1_SW"
krel2_sw	invalue "REL2_SW"
krev1_sw	invalue "REV1_SW"
krev2_sw	invalue "REV2_SW"

kcarmin_sw  invalue "CARMIN_SW"
kcarmax_sw  invalue "CARMAX_SW"
kmodmin_sw  invalue "MODMIN_SW"
kmodmax_sw  invalue "MODMAX_SW"

kfade_sw	invalue "FADE_SW"

endif


if1_sw		= i(kf1_sw)
if2_sw		= i(kf2_sw)
ilev1_sw	= i(klev1_sw)
ilev2_sw	= i(klev2_sw)
iim1_sw	   	= i(kim1_sw)
iim2_sw	   	= i(kim2_sw)
ix1_sw		= i(kx1_sw)
ix2_sw		= i(kx2_sw)
ivoi_sw   	= i(kvoi_sw)
istep_sw	= i(kstep_sw)
ishape_sw	= i(kshape_sw)
irate_sw	= i(krate_sw)
idur_sw	   	= i(kdur_sw)
iband_sw	= i(kband_sw)

iat1_sw    	= i(kat1_sw)
iat2_sw	   	= i(kat2_sw)
irel1_sw	= i(krel1_sw)
irel2_sw	= i(krel2_sw)
irev1_sw	= i(krev1_sw)
irev2_sw	= i(krev2_sw)


icarmin_sw = i(kcarmin_sw)
icarmax_sw = i(kcarmax_sw)
imodmin_sw = i(kmodmin_sw)
imodmax_sw = i(kmodmax_sw)

ifade_sw = i(kfade_sw)









if (iband_sw == 0) then
	ival1 gauss $MAXFSPREAD              ;100
   	outvalue "band", abs(ival1)
endif  
   
if (ix1_sw == 0) then 
	ival2 random 0,1
	outvalue "pad_X1",ival2
endif 
	
if (if1_sw == 0) then 		
	ival3 random 1,8
	outvalue "Fun_1", ival3
endif

	
if (istep_sw == 0) then	
	ival4 random 1,9
	outvalue "knob154", abs(ival4)
endif

if (ix2_sw == 0) then
	ival5 random 0,1
	outvalue "pad_X2", abs(ival5)
endif
if (ivoi_sw == 0) then
	ival6 random 1,8
	outvalue "vox", ival6
endif

if (ishape_sw == 0) then
	ival7 random 0,8
	outvalue "SHAPE", ival7
endif

if (irate_sw == 0) then
	ival8 random 0.172,0.5
	outvalue "rate", ival8
endif

if (iim1_sw == 0) then
	ival9 random 0, 4
	outvalue "indx1", ival9
endif

if (idur_sw == 0) then
	ival10 random 0.2, 3
	outvalue "dur", ival10
endif

if (ilev1_sw == 0) then
	ival11 random 0, 1
	outvalue "Lev_1", ival11
endif


if (iat1_sw == 0) then
	ival12 random 0.05, 0.9
	outvalue "AT1", ival12
endif

if (iat2_sw == 0) then
	ival13 random 0.05, 0.9
	outvalue "AT2", ival13
endif

if (irel1_sw == 0) then
	ival14 random 0.05, 0.9
	outvalue "RE1", ival14
endif

if (irel2_sw == 0) then
	ival15 random 0.05, 0.9
	outvalue "RE2", ival15
endif

if (irev1_sw == 0) then
	ival16 random 0, 1
	outvalue "REVSEND1", ival16
endif

if (irev2_sw == 0) then
	ival17 random 0, 1
	outvalue "REVSEND2", ival17
endif

if (if2_sw == 0) then 		
	ival18 random 1,8
	outvalue "Fun_2", ival18
endif


if (ilev2_sw == 0) then
	ival19 random 0, 1
	outvalue "Lev_2", ival19
endif

if (iim2_sw == 0) then
	ival20 random 0, 4
	outvalue "indx2", ival20
endif


if (icarmin_sw == 0 ) then
	ival21 random  0, 14
	outvalue "CAR_min", ival21
endif

if (icarmax_sw == 0 ) then
	ival22 random  0, 14
	outvalue "CAR_max", ival22
endif

if (imodmin_sw == 0 ) then
	ival23 random  0, 13
	outvalue "MOD_min", ival23
endif

if (icarmin_sw == 0 ) then
	ival24 random  0, 14
	outvalue "MOD_max", ival24
endif

if (ifade_sw == 0 ) then
	ival25 random  0, 1
	outvalue "FADE_SW", ival25
endif

turnoff

endin

;==========================================

instr 5;----> Clear MIDI Association
outvalue "MIDIVAR_1", 0
outvalue "MIDIVAR_2", 0
outvalue "MIDIVAR_3", 0
outvalue "MIDIVAR_4", 0
outvalue "MIDIVAR_5", 0
outvalue "MIDIVAR_6", 0
outvalue "MIDIVAR_7", 0
outvalue "MIDIVAR_8", 0
turnoff
endin


;==================== MIDI PATCHER ================


instr 4;---> MIDI PATCHER

ktrig	metro	8	; widgets scanning at 10 per sec

	if ktrig == 1 then

gkcc1			invalue "cc1"
gkcc2			invalue "cc2"
gkcc3			invalue "cc3"
gkcc4			invalue "cc4"
gkcc5			invalue "cc5"
gkcc6			invalue "cc6"
gkcc7			invalue "cc7"
gkcc8			invalue "cc8"



gkMIDIVAR_1		invalue "MIDIVAR_1"
gkMIDIVAR_2		invalue "MIDIVAR_2"
gkMIDIVAR_3		invalue "MIDIVAR_3"
gkMIDIVAR_4		invalue "MIDIVAR_4"
gkMIDIVAR_5		invalue "MIDIVAR_5"
gkMIDIVAR_6		invalue "MIDIVAR_6"
gkMIDIVAR_7		invalue "MIDIVAR_7"
gkMIDIVAR_8		invalue "MIDIVAR_8"


gkcc1_lev		invalue "cc1_lev"
gkcc2_lev		invalue "cc2_lev"
gkcc3_lev		invalue "cc3_lev"
gkcc4_lev		invalue "cc4_lev"
gkcc5_lev		invalue "cc5_lev"
gkcc6_lev		invalue "cc6_lev"
gkcc7_lev		invalue "cc7_lev"
gkcc8_lev		invalue "cc8_lev"

gkinv_1		invalue "inv1"
gkinv_2		invalue "inv2"
gkinv_3		invalue "inv3"
gkinv_4		invalue "inv4"
gkinv_5		invalue "inv5"
gkinv_6		invalue "inv6"
gkinv_7		invalue "inv7"
gkinv_8		invalue "inv8"

endif


gkMIDIsave	invalue "MIDIsave"

gkstatus, gkchan, gkdata1, gkdata2 midiin  ; read MIDI informations


outvalue "status", gkstatus
outvalue "chan", gkchan
outvalue "data1", gkdata1
outvalue "data2", gkdata2


gkGet		invalue "Get"	; Read the snaphot pointer


endin

;============== RANDOM GENERATORS ==================

instr 21;----> Random Gen. 1

	if gksw3 == 1 goto on
	outvalue "led3",0
	gkfauto1 = 0
	turnoff
	on:
	outvalue "led3",1

	gkfauto1 randh (1-gkran1_mute) * gkpad_X1L * gkran1_amp*25000, gkran1_vel


	outvalue "disp_rand1", gkfauto1

endin

instr 22;----> Random Gen. 2
	if gksw4 == 1 goto on
	outvalue "led4",0
	gkfauto2 = 0
	turnoff
	on:
	outvalue "led4",1

	gkfauto2 randh (1-gkran2_mute)*gkpad_X2L * gkran2_amp*25000, gkran2_vel
	outvalue "disp_rand2", gkfauto2
endin



;==================  Switch off Leds at start
instr 9; ----> All LEDS OFF
;ftload "/Users/eg/Documents/QuteCSEX/data.txt", 1, gisna50

outvalue "led_TIMER1", 0
outvalue "led_TIMER2", 0 

outvalue "L01",0
outvalue "L02",0
outvalue "L03",0
outvalue "L04",0
outvalue "L05",0
outvalue "L06",0
outvalue "L07",0
outvalue "L08",0
outvalue "L09",0
outvalue "L10",0
outvalue "L11",0
outvalue "L12",0
outvalue "L13",0
outvalue "L14",0
outvalue "L15",0
outvalue "L16",0
outvalue "L17",0
outvalue "L18",0
outvalue "L19",0
outvalue "L20",0
outvalue "L21",0
outvalue "L22",0
outvalue "L23",0
outvalue "L24",0
outvalue "L25",0
outvalue "L26",0
outvalue "L27",0
outvalue "L28",0
outvalue "L29",0
outvalue "L30",0
outvalue "L31",0
outvalue "L32",0
outvalue "L33",0
outvalue "L34",0
outvalue "L35",0
outvalue "L36",0
outvalue "L37",0
outvalue "L38",0
outvalue "L39",0
outvalue "L40",0
outvalue "L41",0
outvalue "L42",0
outvalue "L43",0
outvalue "L44",0
outvalue "L45",0
outvalue "L46",0
outvalue "L47",0
outvalue "L48",0

outvalue "led1", 0
outvalue "led2", 0
outvalue "led3", 0
outvalue "led4", 0
outvalue "led_G", 0
outvalue "led_H", 0
outvalue "led_F", 0

outvalue "progress", 0
outvalue "progress_lin", 0
outvalue "mins", 0
outvalue "secs", 0

outvalue "warn", ""
outvalue "LED_WRITE", 0
outvalue "rectimedisp",0

outvalue "ledseq", 0
outvalue "ledton", 0
outvalue "fftONOFF", 0
outvalue "seqblink",0
outvalue "mpercent", 0

outvalue "timeline", 0
outvalue "seq_tot_time", 0
outvalue "timelaps", 0
turnoff
endin

;=======================  GEOM. SPECTRA GENERATOR ==================
instr 10;----> CREATE GEOMETRIC

giGEOMETRIC init 1
ind init 0
iG_fund = i(gk_G_fund)

if iG_fund == 1 then
	i_int_note = i(gk_G_oct) + 4
	i_decimal_note = i(gk_G_key) * 0.01
	inote = i_int_note + i_decimal_note
	ifreq = cpspch(inote)

else

ifreq init i(gk_outf)
endif

imode_in = i(gkmode_in)

ifreq0 = ifreq

inum = i(gk_num)
iden = i(gk_den)
iratio = inum/iden


if imode_in == 1 then

else
iratio = i(gk_ratio)
endif



if ifreq <= 0 igoto stop
if iratio < 1 igoto stop

do:
ifreq = ifreq0 * iratio^ind		; Geometric Formula
if ifreq > sr/2 goto stop

tabw_i	ifreq, ind, 300
tabw_i	ifreq, ind, 301


gifreq = ifreq
ind = ind + 1
gind = ind	; copia il valore massimo dell'indice in gind

igoto do

stop:
;ifreq = ifreq_old

outvalue "max_index", ind + 1
outvalue "last_freq", ifreq
outvalue "G_fre", ifreq0
outvalue "led_G", 1
outvalue "led_H", 0
outvalue "led_F", 0
gisw_G = 1
gisw_H = 0
gisw_F = 0

;ftsave "/Users/eg/Documents/QuteCSEX/debug.txt", 1, 300
turnoff


endin


;=============== HARMONIC SPECTRA GENERATOR ======================

instr 12;----> CREATE HARMONIC
giHARMONIC init 1
ind init 0


iH_fund = i(gk_H_fund)

if iH_fund == 1 then
	i_int_note = i(gk_H_oct) + 4
	i_decimal_note = i(gk_H_key) * 0.01
	inote = i_int_note + i_decimal_note

ifund = cpspch(inote)
ifreq0 = ifund

else
ifreq0 = 0
ifund = i(gk_ffund)
endif



iexp = i(gk_exp)
imaxharm = i(gk_maxharm)
icurfreq = ifund

do:

if ind > (imaxharm - 1) igoto stop
gifreq = icurfreq
ind = ind + 1
iexpval pow ind, (1+iexp)	;   Harmonic Formula
icurfreq = ifund * iexpval
tabw_i	icurfreq, ind - 1, 300
tabw_i	icurfreq, ind - 1, 301
gind = ind
gifreq = icurfreq
igoto do

stop:

outvalue "H_fre", ifreq0
outvalue "led_G", 0
outvalue "led_H", 1
outvalue "led_F", 0
gisw_G = 0
gisw_H = 1
gisw_F = 0

turnoff

endin

;============= FIBONACCI


instr 13; ----> CREATE FIBONACCI
giFIBO init 1
index init 0
iPHI init (1 + sqrt(5))/2

istart  	= 	i(gkFIB_Start)
ifund   	= 	i(gkFIB_Fund)
;print ifund

ifreq = ifund

do:

ifreq_old = ifreq


ifreq = ifund * ((iPHI ^(index + istart) - (1 - iPHI)^(index + istart))/ sqrt(5))
if ifreq > sr/2 goto stop
tabw_i	ifreq, index, 300
tabw_i	ifreq, index, 301
;print index , ifreq
gifreq = ifreq
index = index + 1
gind = index	; copia il valore massimo dell'indice in gind


igoto do

stop:
outvalue "led_G", 0
outvalue "led_H", 0
outvalue "led_F", 1
outvalue "max_index_FI",index
gisw_G = 0
gisw_H = 0
gisw_F = 1

turnoff

endin




;=========== WRITE MIDI CC MAP & MIDIVAR ON TABLE 11 =======
instr 14; Write Midi cc Map e Midivar on Tab 11

icc1 = i(gkcc1)
icc2 = i(gkcc2)
icc3 = i(gkcc3)
icc4 = i(gkcc4)
icc5 = i(gkcc5)
icc6 = i(gkcc6)
icc7 = i(gkcc7)
icc8 = i(gkcc8)

ipar1 = i(gkMIDIVAR_1)
ipar2 = i(gkMIDIVAR_2)
ipar3 = i(gkMIDIVAR_3)
ipar4 = i(gkMIDIVAR_4)
ipar5 = i(gkMIDIVAR_5)
ipar6 = i(gkMIDIVAR_6)
ipar7 = i(gkMIDIVAR_7)
ipar8 = i(gkMIDIVAR_8)



tabw_i icc1, 0, 11
tabw_i icc2, 1, 11
tabw_i icc3, 2, 11
tabw_i icc4, 3, 11
tabw_i icc5, 4, 11
tabw_i icc6, 5, 11
tabw_i icc7, 6, 11
tabw_i icc8, 7, 11


tabw_i ipar1,8, 11
tabw_i ipar2,9, 11
tabw_i ipar3,10, 11
tabw_i ipar4,11, 11
tabw_i ipar5,12, 11
tabw_i ipar6,13, 11
tabw_i ipar7,14, 11
tabw_i ipar8,15, 11




turnoff

endin



;================== WAVEFORM MORPHING AND SINE LED CONTROL ===================

instr 60;----> Basic wave morph

kindex port gkfun1 - 1, 0.2
ftmorf  kindex, 9,10
if gkfun1 <= 1  then
outvalue "sine", 1
else
outvalue "sine", 0
endif


if gkfun2 <= 1  then
outvalue "sine2", 1
else
outvalue "sine2", 0
endif

endin



;=========================== SWITCH ON SNAPSHOT LED =========
instr 70  ;  Switch on the corrisponding write led
inum = i(gkGet) + 1

if inum == 1 then
	outvalue "L01", 1
elseif inum == 2 then
	outvalue "L02", 1
elseif inum == 3 then
	outvalue "L03", 1
elseif inum == 4 then
	outvalue "L04", 1
elseif inum == 5 then
	outvalue "L05", 1
elseif inum == 6 then
	outvalue "L06", 1
elseif inum == 7 then
	outvalue "L07", 1
elseif inum == 8 then
	outvalue "L08", 1
elseif inum == 9 then
	outvalue "L09", 1
elseif inum == 10 then
	outvalue "L10", 1
elseif inum == 11 then
	outvalue "L11", 1
elseif inum == 12 then
	outvalue "L12", 1
elseif inum == 13 then
	outvalue "L13", 1
elseif inum == 14 then
	outvalue "L14", 1
elseif inum == 15 then
	outvalue "L15", 1
elseif inum == 16 then
	outvalue "L16", 1
elseif inum == 17 then
	outvalue "L17", 1
elseif inum == 18 then
	outvalue "L18", 1
elseif inum == 19 then
	outvalue "L19", 1
elseif inum == 20 then
	outvalue "L20", 1
elseif inum == 21 then
	outvalue "L21", 1
elseif inum == 22 then
	outvalue "L22", 1
elseif inum == 23 then
	outvalue "L23", 1
elseif inum == 24 then
	outvalue "L24", 1
elseif inum == 25 then
	outvalue "L25", 1
elseif inum == 26 then
	outvalue "L26", 1
elseif inum == 27 then
	outvalue "L27", 1
elseif inum == 28 then
	outvalue "L28", 1
elseif inum == 29 then
	outvalue "L29", 1
elseif inum == 30 then
	outvalue "L30", 1
elseif inum == 31 then
	outvalue "L31", 1
elseif inum == 32 then
	outvalue "L32", 1
elseif inum == 33 then
	outvalue "L33", 1
elseif inum == 34 then
	outvalue "L34", 1
elseif inum == 35 then
	outvalue "L35", 1
elseif inum == 36 then
	outvalue "L36", 1
elseif inum == 37 then
	outvalue "L37", 1
elseif inum == 38 then
	outvalue "L38", 1
elseif inum == 39 then
	outvalue "L39", 1
elseif inum == 40 then
	outvalue "L40", 1
elseif inum == 41 then
	outvalue "L41", 1
elseif inum == 42 then
	outvalue "L42", 1
elseif inum == 43 then
	outvalue "L43", 1
elseif inum == 44 then
	outvalue "L44", 1
elseif inum == 45 then
	outvalue "L45", 1
elseif inum == 46 then
	outvalue "L46", 1
elseif inum == 47 then
	outvalue "L47", 1
elseif inum == 48 then
	outvalue "L48", 1
endif

turnoff


endin

;======================== SWITCH OFF SNAPSHOT LED AND CLEAR 1st VALUE =================
instr 71
inum = i(gkGet) + 1		; Get the snapshop pointer value

if     inum == 1 then
	outvalue "L01", 0
	vtabwi	0, 200, 0
elseif inum == 2 then
	outvalue "L02", 0
	vtabwi	0, 201, 0
elseif inum == 3 then
	outvalue "L03", 0
	vtabwi	0, 202, 0
elseif inum == 4 then
	outvalue "L04", 0
	vtabwi	0, 203, 0
elseif inum == 5 then
	outvalue "L05", 0
	vtabwi	0, 204, 0
elseif inum == 6 then
	outvalue "L06", 0
	vtabwi	0, 205, 0
elseif inum == 7 then
	outvalue "L07", 0
	vtabwi	0, 206, 0
elseif inum == 8 then
	outvalue "L08", 0
	vtabwi	0, 207, 0
elseif inum == 9 then
	outvalue "L09", 0
	vtabwi	0, 208, 0
elseif inum == 10 then
	outvalue "L10", 0
	vtabwi	0, 209, 0
elseif inum == 11 then
	outvalue "L11", 0
	vtabwi	0, 210, 0
elseif inum == 12 then
	outvalue "L12", 0
	vtabwi	0, 211, 0

elseif inum == 13 then
	outvalue "L13", 0
	vtabwi	0, 212, 0
elseif inum == 14 then
	outvalue "L14", 0
	vtabwi	0, 213, 0
elseif inum == 15 then
	outvalue "L15", 0
	vtabwi	0, 214, 0
elseif inum == 16 then
	outvalue "L16", 0
	vtabwi	0, 215, 0
elseif inum == 17 then
	outvalue "L17", 0
	vtabwi	0, 216, 0
elseif inum == 18 then
	outvalue "L18", 0
	vtabwi	0, 217, 0
elseif inum == 19 then
	outvalue "L19", 0
	vtabwi	0, 218, 0
elseif inum == 20 then
	outvalue "L20", 0
	vtabwi	0, 219, 0
elseif inum == 21 then
	outvalue "L21", 0
	vtabwi	0, 220, 0
elseif inum == 22 then
	outvalue "L22", 0
	vtabwi	0, 221, 0
elseif inum == 23 then
	outvalue "L23", 0
	vtabwi	0, 222, 0
elseif inum == 24 then
	outvalue "L24", 0
	vtabwi	0, 223, 0
elseif inum == 25 then
	outvalue "L25", 0
	vtabwi	0, 224, 0
elseif inum == 26 then
	outvalue "L26", 0
	vtabwi	0, 225, 0
elseif inum == 27 then
	outvalue "L27", 0
	vtabwi	0, 226, 0
elseif inum == 28 then
	outvalue "L28", 0
	vtabwi	0, 227, 0
elseif inum == 29 then
	outvalue "L29", 0
	vtabwi	0, 228, 0
elseif inum == 30 then
	outvalue "L30", 0
	vtabwi	0, 229, 0
elseif inum == 31 then
	outvalue "L31", 0
	vtabwi	0, 230, 0
elseif inum == 32 then
	outvalue "L32", 0
	vtabwi	0, 231, 0
elseif inum == 33 then
	outvalue "L33", 0
	vtabwi	0, 232, 0
elseif inum == 34 then
	outvalue "L34", 0
	vtabwi	0, 200, 0
elseif inum == 33 then
	outvalue "L35", 0
	vtabwi	0, 234, 0
elseif inum == 36 then
	outvalue "L36", 0
	vtabwi	0, 235, 0
elseif inum == 37 then
	outvalue "L37", 0
	vtabwi	0, 236, 0
elseif inum == 38 then
	outvalue "L38", 0
	vtabwi	0, 237, 0
elseif inum == 39 then
	outvalue "L39", 0
	vtabwi	0, 238, 0
elseif inum == 40 then
	outvalue "L40", 0
	vtabwi	0, 239, 0
elseif inum == 41 then
	outvalue "L41", 0
	vtabwi	0, 240, 0
elseif inum == 42 then
	outvalue "L42", 0
	vtabwi	0, 241, 0
elseif inum == 43 then
	outvalue "L43", 0
	vtabwi	0, 242, 0
elseif inum == 44 then
	outvalue "L44", 0
	vtabwi	0, 243, 0
elseif inum == 45 then
	outvalue "L45", 0
	vtabwi	0, 244, 0
elseif inum == 46 then
	outvalue "L46", 0
	vtabwi	0, 245, 0
elseif inum == 47 then
	outvalue "L47", 0
	vtabwi	0, 246, 0
elseif inum == 48 then
	outvalue "L48", 0
	vtabwi	0, 247, 0


endif

turnoff


endin



;======================== SWITCH OFF ALL SNAPSHOT LEDS AND CLEAR 1st VALUE =================

instr 72;----> Clear Snap Leds and first value (table 200)


outvalue "L01", 0
vtabwi	0, 200, 0
outvalue "L02", 0
vtabwi	0, 201, 0
outvalue "L03", 0
vtabwi	0, 202, 0
outvalue "L04", 0
vtabwi	0, 203, 0
outvalue "L05", 0
vtabwi	0, 204, 0
outvalue "L06", 0
vtabwi	0, 205, 0
outvalue "L07", 0
vtabwi	0, 206, 0
outvalue "L08", 0
vtabwi	0, 207, 0
outvalue "L09", 0
vtabwi	0, 208, 0
outvalue "L10", 0
vtabwi	0, 209, 0
outvalue "L11", 0
vtabwi	0, 200, 0
outvalue "L12", 0
vtabwi	0, 211, 0
outvalue "L13", 0
vtabwi	0, 212, 0
outvalue "L14", 0
vtabwi	0, 213, 0
outvalue "L15", 0
vtabwi	0, 214, 0
outvalue "L16", 0
vtabwi	0, 215, 0
outvalue "L17", 0
vtabwi	0, 216, 0
outvalue "L18", 0
vtabwi	0, 217, 0
outvalue "L19", 0
vtabwi	0, 218, 0
outvalue "L20", 0
vtabwi	0, 219, 0
outvalue "L21", 0
vtabwi	0, 220, 0
outvalue "L22", 0
vtabwi	0, 221, 0
outvalue "L23", 0
vtabwi	0, 222, 0
outvalue "L24", 0
vtabwi	0, 223, 0
outvalue "L25", 0
vtabwi	0, 224, 0
outvalue "L26", 0
vtabwi	0, 235, 0
outvalue "L27", 0
vtabwi	0, 246, 0
outvalue "L28", 0
vtabwi	0, 227, 0
outvalue "L29", 0
vtabwi	0, 228, 0
outvalue "L30", 0
vtabwi	0, 229, 0
outvalue "L31", 0
vtabwi	0, 230, 0
outvalue "L32", 0
vtabwi	0, 231, 0
outvalue "L33", 0
vtabwi	0, 232, 0
outvalue "L34", 0
vtabwi	0, 233, 0
outvalue "L35", 0
vtabwi	0, 234, 0
outvalue "L36", 0
vtabwi	0, 235, 0
outvalue "L37", 0
vtabwi	0, 236, 0
outvalue "L38", 0
vtabwi	0, 237, 0
outvalue "L39", 0
vtabwi	0, 238, 0
outvalue "L40", 0
vtabwi	0, 239, 0
outvalue "L41", 0
vtabwi	0, 240, 0
outvalue "L42", 0
vtabwi	0, 241, 0
outvalue "L43", 0
vtabwi	0, 242, 0
outvalue "L44", 0
vtabwi	0, 243, 0
outvalue "L45", 0
vtabwi	0, 244, 0
outvalue "L46", 0
vtabwi	0, 245, 0
outvalue "L47", 0
vtabwi	0, 246, 0
outvalue "L48", 0
vtabwi	0, 247, 0

turnoff

endin


;==================== PREPARE TWO TABLES FOR SNAP TRANSITION

instr 91 ; READ SNAP	&  MORPH

; Freeze in table 703 the current values of the parameters
vtabwi 0,703,\
i(gkband),i(gkrate),i(gkdur),\
i(gk_CAR_min),i(gk_CAR_max), i(gk_MOD_min), i(gk_MOD_max),\
i(gkindx1),i(gkindx2),\
i(gklev_1),i(gklev_2),\
i(gkran1_amp),i(gkran2_amp),\
i(gkran1_vel),i(gkran2_vel),\
i(gkvoi),i(gkstep),\
i(gkfun1),i(gkfun2),\
i(gkpad_X1),i(gkpad_Y1),\
i(gkpad_X2),i(gkpad_Y2), \
i(gkover_0),\
i(gkREVLEV),i(gkROOM),i(gkHF), \
i(gkATK1), i(gkATK2), \
i(gkREL1), i(gkREL2), \
i(gkREVSEND1), i(gkREVSEND2), \
i(gkxfade_0), \
i(gkSHAPE_0), \
i(gkTIME), i(gkTYPE),\   ; index 35, 36
i(gkmute1),i(gkmute2),i(gk_cm),i(gk_ADSYN), \ ; index = 37, 38, 39, 40
gisw_G, gisw_H, gisw_F, \							;index = 41, 42, 43
i(gk_ratio), i(gk_num), i(gk_den), i(gkmode_in), i(gk_outf),i(gk_G_fund),i(gk_G_oct), i(gk_G_key),\
i(gk_ffund), i(gk_exp), i(gk_maxharm), i(gk_H_fund), i(gk_H_oct), i(gk_H_key), \
i(gkFIB_Start), i(gkFIB_Fund),\
i(gkran1_mute), i(gkran2_mute)

;print giSEQ
if giSEQ == 0 then	; test if SEQUENCER is  active  (0 : inactive  / !=0 : active)

isnap = i(gkGet) ;if yes snapshot got from combobox

else

isnap = giPrn-1   ; if not snapshot got from sequencer descriptor

endif


tableicopy	704, 200 + isnap   ; Make a copy of all the parameters of the current snapshot in table 704
schedule 92, 0, 3600  ; call the sequencer

turnoff


endin

;========================= LOAD SNAP WITH  NO And WITH TRANSITION

instr 92  ;++++>LOAD SNAP - called by instr 91 (readsnap)

gkstop init 0
kTr init 0
;iTIME = i(gkTIME)+ 0.01
;iTYPE = i(gkTYPE)
iBYSTTIME = i(gkBYSTTIME)


if giSEQ == 0 then
iSNAP = i(gkGet)
iTIME = i(gkTIME)+ 0.01
iTYPE = i(gkTYPE)
else
iSNAP = giPrn-1
iTIME = giTtran
iTYPE = giMode
endif
;print iSNAP


ifirst_value 	table 0, 200 + iSNAP ; read first value of table 200

if ifirst_value != 0 goto proceed

SEmptySnap sprintf "WARNING ! Snap %d is empty", iSNAP + 1

outvalue	"warn", SEmptySnap

turnoff

proceed:
outvalue "warn", ""

SLoadingSnap	sprintf	"Loading Snap %d .... ", iSNAP + 1

outvalue "warn",SLoadingSnap


if iBYSTTIME == 1 goto bypass				; IF iBYSTTIE == 1 DON'T USES THE MORPH TIME FROM SNAPSHOT
			iTIME table 35, 200 + iSNAP
 			outvalue "TIME", iTIME
			iTYPE table 36, 200 + iSNAP
 			outvalue "TYPE", iTYPE
			;imute1 table 37, 200 + iSNAP
bypass:
			imute1 table 37, 200 + iSNAP
			outvalue "MUTE1", imute1
			imute2 table 38, 200 + iSNAP
 			outvalue "MUTE2", imute2
			icm 	table 39, 200 + iSNAP
 			outvalue "cm", icm
			iADSYN table 40, 200 + iSNAP
 			outvalue "ADSYN", iADSYN



			iGEO 	table 41, 200 + iSNAP
			iHARM 	table 42, 200 + iSNAP
			iFIB 	table 43, 200 + iSNAP

;i(gk_ratio), i(gk_num), i(gk_den), i(gkmode_in), i(gk_outf),i(gk_G_fund),i(gk_G_oct), i(gk_G_key)
;iRATIO		iNUM			iDEN		iMODE_IN		iOUTF			iG_FUND		iG_OCT			iG_KEY

			iRATIO		table 44, 200 + iSNAP
			iNUM		table 45, 200 + iSNAP
			iDEN		table 46, 200 + iSNAP
			iMODE_IN	table 47, 200 + iSNAP
			iOUTF		table 48, 200 + iSNAP
			iG_FUND		table 49, 200 + iSNAP
			iG_OCT		table 50, 200 + iSNAP
			iG_KEY		table 51, 200 + iSNAP

;i(gk_ffund), i(gk_exp), i(gk_maxharm), i(gk_H_fund), i(gk_H_oct), i(gk_H_key)
;iFFUND			iEXP		iMAXHARM		iHFUND				iHOCT			iHKEY

			iFFUND		table 52, 200 + iSNAP
			iEXP		table 53, 200 + iSNAP
			iMAXHARM	table 54, 200 + iSNAP
			iHFUND		table 55, 200 + iSNAP
			iHOCT		table 56, 200 + iSNAP
			iHKEY		table 57, 200 + iSNAP

;i(gkFIB_Start), i(gkFIB_Fund)
;iFIBSTART, 		iFIBFUND

			iFIBSTART	table 58, 200 + iSNAP
			iFIBFUND	table 59, 200 + iSNAP

			iRAN1MUTE 	table 60, 200 + iSNAP
			iRAN2MUTE 	table 61, 200 + iSNAP

			outvalue 	"RAN1MUTE", iRAN1MUTE
			outvalue 	"RAN2MUTE", iRAN2MUTE

if iGEO == 1 then
 ;schedule 10, 0, 3600
	schedule 200, 0, 3600, iRATIO, iNUM, iDEN, iMODE_IN, iOUTF, iG_FUND, iG_OCT, iG_KEY

elseif  iHARM == 1  then
	;schedule 12, 0, 3600
	schedule 202, 0, 3600, iFFUND,iEXP,iMAXHARM,iHFUND,iHOCT,iHKEY
elseif iFIB == 1  then
	;schedule 13, 0, 3600
	schedule 203, 0, 3600, iFIBSTART, iFIBFUND
endif



tableicopy 301,300


gkstop invalue "STOP"					; CHECK TRANSITION MANUAL STOP
kTr_LIN line 0,iTIME, 1
kTr 	transeg 0, iTIME, iTYPE, 1

if gkgrid_morph == 1 then				;CHECK IF GRID MORPH IS ACTIVE
ftmorf kTr, 303, 300

else
tablecopy 300,302
endif
ftmorf kTr, 701, 702					; EXECUTING MORPHING BETWEEN TWO SNAPSHOTS


; READ ALL PARAMETERS
vtabk 0,702,\
gkband,gkrate,gkdur,\
gk_CAR_min,gk_CAR_max,gk_MOD_min,gk_MOD_max,\
gkindx1,gkindx2,\
gklev_1,gklev_2,\
gkran1_amp,gkran2_amp,\
gkran1_vel,gkran2_vel,\
gkvoi, gkstep,\
gkfun1,gkfun2,\
gkpad_X1,gkpad_Y1,\
gkpad_X2,gkpad_Y2,\
gkover_0, \
gkREVLEV,gkROOM,gkHF ,\
gkATK1, gkATK2, \
gkREL1, gkREL2, \
gkREVSEND1, gkREVSEND2, \
gkxfade_0,\
gkSHAPE_0


; UPDATE PARAMETERS AND WIDGETS
outvalue "progress", kTr
outvalue "progress_lin", kTr_LIN
outvalue "transtime", kTr_LIN * (iTIME - 0.01)

kmorph_percent = kTr * 100
outvalue "mpercent", kmorph_percent

;printk2 kTr

outvalue "band", gkband

outvalue "dur", gkdur
outvalue "rate",gkrate


outvalue "vox", gkvoi
outvalue "knob154",gkstep

outvalue	"Lev_1", gklev_1
outvalue  "pad_X1", gkpad_X1
outvalue  "pad_Y1", gkpad_Y1
outvalue  "Fun_1", gkfun1
outvalue 	"indx1", gkindx1

outvalue	"Lev_2", gklev_2
outvalue  "pad_X2", gkpad_X2
outvalue  "pad_Y2", gkpad_Y2
outvalue  "Fun_2", gkfun2
outvalue 	"indx2", gkindx2

outvalue 	"ran1amp", gkran1_amp
outvalue 	"ran1vel", gkran1_vel
outvalue 	"ran2amp", gkran2_amp
outvalue 	"ran2vel", gkran2_vel

outvalue 	"REVSEND1", gkREVSEND1
outvalue 	"REVSEND2", gkREVSEND2

outvalue	"REVLEV", gkREVLEV
outvalue	"ROOM", gkROOM
outvalue	"HF", gkHF

outvalue	"AT1", gkATK1
outvalue	"AT2", gkATK2
outvalue	"RE1", gkREL1
outvalue	"RE2", gkREL2

outvalue 	"CAR_min", gk_CAR_min
outvalue 	"CAR_max", gk_CAR_max
outvalue 	"MOD_min", gk_MOD_min
outvalue 	"MOD_max", gk_MOD_max

outvalue 	"XFADE", gkxfade_0
outvalue 	"SHAPE", gkSHAPE_0

if kTr < 1 goto go
 outvalue "progress",0
 outvalue "progress_lin",0
 SLoadedSnap	sprintf	"Snap %d Loaded ! ", iSNAP + 1
 outvalue "warn", SLoadedSnap
 turnoff
go:
  if gkstop == 1 then

   gkstop = 0
   turnoff
   endif


endin



;==============================   SAVE PARAMETERS  SNAP USED WITH TRANSITION
instr 100 ;++++> WRITE SNAP (schedule i70 and copy all 60 parameters into table 200)

schedule 70, 0, 3600

;saves all parameters into the table of the current snap
vtabwi 0,200 + i(gkGet),\
i(gkband),i(gkrate),i(gkdur),\
i(gk_CAR_min),i(gk_CAR_max), i(gk_MOD_min), i(gk_MOD_max),\
i(gkindx1),i(gkindx2),\
i(gklev_1),i(gklev_2),\
i(gkran1_amp),i(gkran2_amp),\
i(gkran1_vel),i(gkran2_vel),\
i(gkvoi),i(gkstep),\
i(gkfun1),i(gkfun2),\
i(gkpad_X1),i(gkpad_Y1),\
i(gkpad_X2),i(gkpad_Y2), \
i(gkover_0), \
i(gkREVLEV),i(gkROOM),i(gkHF),\
i(gkATK1), i(gkATK2), \
i(gkREL1), i(gkREL2), \
i(gkREVSEND1), i(gkREVSEND2),\
i(gkxfade_0),\
i(gkSHAPE_0),\
i(gkTIME), i(gkTYPE),\   ; index 35, 36
i(gkmute1),i(gkmute2),i(gk_cm),i(gk_ADSYN), \ ; index = 37, 38, 39, 40
gisw_G, gisw_H, gisw_F, \							;index = 41, 42, 43
i(gk_ratio), i(gk_num), i(gk_den), i(gkmode_in), i(gk_outf),i(gk_G_fund),i(gk_G_oct), i(gk_G_key), \
i(gk_ffund), i(gk_exp), i(gk_maxharm), i(gk_H_fund), i(gk_H_oct), i(gk_H_key), \
i(gkFIB_Start), i(gkFIB_Fund), \ ; index 58, 59
i(gkran1_mute), i(gkran2_mute)   ; index 60, 61



turnoff
endin


;=====================

instr 101;-=-=-> CALLING INSTRUMENT 1



reset:

itime = 	i(gkrate)		;reads and freeze grain rate
gidur = 	i(gkdur)		;reads and freeze duration
iatk = 	i(gkATK1)			;reads and freeze attack time
irel = 	i(gkREL1)			;reads and freeze release time

istep_0 = i(gkstep)	;reads step value
istep = int(istep_0)	;cast to integer
ifauto1 = i(gkfauto1)


if gkkeyb_SW == 0 goto nokeyb	; check if MIDI keyboard is selected

if1gr = gind *(i(gkdata1)-12)/96	; Maps the MIDI keyboard
iXKB = if1gr / gind
outvalue "pad_X1", iXKB
goto nxt
nokeyb:
kpad_X1L = gkpad_X1L*gind
if1gr = abs(int(i(kpad_X1L))); scale X PAD1 on variable gind


nxt:
kpad_X1L = gkpad_X1L*gind
if1gr = i(kpad_X1L)	; sscale X PAD1 on variable gind



if1gr_int = int(if1gr)



outvalue "grid_index", if1gr
gif1 tab_i		if1gr,300			; reads 1st partial freq.
outvalue "grid_XFREQ", gif1
gif2 tab_i		if1gr_int +        istep, 300	;reads 2nst
gif3 tab_i		if1gr_int +    2 * istep, 300	;..
gif4 tab_i		if1gr_int +    3 * istep, 300	;..
gif5 tab_i		if1gr_int +    4 * istep, 300	;..
gif6 tab_i		if1gr_int +    5 * istep ,300	;..
gif7 tab_i		if1gr_int +    6 * istep, 300	;..
gif8 tab_i		if1gr_int +    7 * istep, 300	;legge il valore di frequenza della 8va parziale

gifreq_ref1 = gif1 + ifauto1	;add random 1 to 1st partial
gifreq_ref2 = gif2 + ifauto1	;add random 1 to 2nd partial
gifreq_ref3 = gif3 + ifauto1 ;..
gifreq_ref4 = gif4 + ifauto1
gifreq_ref5 = gif5 + ifauto1
gifreq_ref6 = gif6 + ifauto1
gifreq_ref7 = gif7 + ifauto1
gifreq_ref8 = gif8 + ifauto1

irand_dev1 = i(gkpad_Y1L)		;reads  Y PAD1  and set frequency deviation
ilev_1 tab_i 	i(gklev_1)*0.5,20,1 ; set Lev1 to non linear
;klev_1 = ilev_1

timout 0,itime,cont	;START TIME scheduler of each grain
reinit reset

cont:
if gksw1 == 1 goto go
outvalue "led1", 0
turnoff
go:
outvalue "led1", 1


schedule 151, 0, (4.1-gidur), gifreq_ref1, irand_dev1,ilev_1, gifreq_ref2, gifreq_ref3, gifreq_ref4,\
                   gifreq_ref5, gifreq_ref6, gifreq_ref7, gifreq_ref8,iatk,irel


endin

;==============================

instr 102;-=-=-> CALLING INSTRUMENT 2

reset:
itime = 	i(gkrate)		;reads and freeze grain rate
gidur = 	i(gkdur)		;reads and freeze duration
iatk2 = 	i(gkATK2)		;reads and freeze attack time
irel2 = 	i(gkREL2)		;reads and freeze release time
ifun2 =	i(gkfun2)


kpad_X2L = gkpad_X2L* 2500
ifreq_ref2 = i(kpad_X2L)+ i(gkfauto2)
irand_dev2 = i(gkpad_Y2L)
ilev_2 tab_i i(gklev_2)*0.5,20,1


timout 0,itime,cont		;START TIME schedulator
reinit reset


cont:


if gksw2 = 1 goto go
outvalue "led2", 0
turnoff
go:
outvalue "led2", 1
schedule  152, 0, (4.1-gidur),ifreq_ref2,irand_dev2,ilev_2,iatk2,irel2,ifun2


endin


;===================================

instr   151;====> CALLED INSTRUMENT 1 (GRID)


ilev = p6

irandfreq   = birnd(p5)			;extracts random number for freq. dev.

ichan = birnd(1)					;extracts random number for stereo distrib.
ileft = (ichan <= 0 ? 1 : 0)
iright = (ichan > 0 ? 1 : 0)

icar  random	i(gk_CAR_min), i(gk_CAR_max);extracts random number for	car_min
imod  random  	i(gk_MOD_min), i(gk_MOD_max) ;extracts random number for car_max


icar = (i(gk_cm) = 0 ?  int(icar) : icar)	;select if use integer or float values
imod = (i(gk_cm) = 0 ?  int(imod) : imod)

iindex random 0,i(gkindx1)					;extracts random number for modulation index


iampH1 tab_i 0, 500+i(gkSHAPE)		;shape in amplitude 1st voice
iampH2 tab_i 1, 500+i(gkSHAPE)		;shape in amplitude 2nd voice
iampH3 tab_i 2, 500+i(gkSHAPE)
iampH4 tab_i 3, 500+i(gkSHAPE)
iampH5 tab_i 4, 500+i(gkSHAPE)
iampH6 tab_i 5, 500+i(gkSHAPE)
iampH7 tab_i 6, 500+i(gkSHAPE)
iampH8 tab_i 7, 500+i(gkSHAPE)
iat  = p3 * p14						;set attack time
irel = p3 * p15						;set release
ion  = p3 - (iat+irel)					;set duration
invoices  = i(gkvoi_i)				;set number of simultaneous voices


							;k1	linen ilev, iat,p3,irel
							;	kindex  linseg 0,p3/2,iindex,p3/2,0

kindex  linseg 0,p3/2,iindex,p3/2,0		;FM modulation index envelope
;ak1	  linen ilev, iat,p3,irel				;amplitude envelope



;ak1	transeg 0,p3/2,2,ilev,p3/2,2,0
ak1	transeg 0,p3/2,2,ilev, p3/2,2,0   ;  come in AFM8

if i(gk_ADSYN)  == 1 goto ADSYN

FM:

if invoices == 1 goto FMvoices1
if invoices == 2 goto FMvoices2
if invoices == 3 goto FMvoices3
if invoices == 4 goto FMvoices4
if invoices == 5 goto FMvoices5
if invoices == 6 goto FMvoices6
if invoices == 7 goto FMvoices7


FMvoice8:
;ak1	linen ilev, iat,p3,irel
;kindex  linseg 0,p3/2,iindex,p3/2,0
a1	foscili iampH1*ak1,p4+irandfreq*gkband, icar,imod, kindex, 10
a2	foscili iampH2*ak1,p7+irandfreq*gkband, icar,imod, kindex, 10
a3	foscili iampH3*ak1,p8+irandfreq*gkband, icar,imod, kindex, 10
a4	foscili iampH4*ak1,p9+irandfreq*gkband, icar,imod, kindex, 10
a5	foscili iampH5*ak1,p10+irandfreq*gkband, icar,imod, kindex, 10
a6	foscili iampH6*ak1,p11+irandfreq*gkband, icar,imod, kindex, 10
a7	foscili iampH7*ak1,p12+irandfreq*gkband, icar,imod, kindex, 10
a8	foscili iampH8*ak1,p13+irandfreq*gkband, icar,imod, kindex, 10
outvalue "F1", gif1
outvalue "F2", gif2
outvalue "F3", gif3
outvalue "F4", gif4
outvalue "F5", gif5
outvalue "F6", gif6
outvalue "F7", gif7
outvalue "F8", gif8


aout sum a1,a2,a3,a4,a5,a6,a7,a8
goto outsum

FMvoices7:
;ak1	linen ilev, iat,p3,irel
;kindex  linseg 0,p3/2,iindex,p3/2,0
a1	foscili iampH1*ak1,p4+irandfreq*gkband, icar,imod, kindex, 10
a2	foscili iampH2*ak1,p7+irandfreq*gkband, icar,imod, kindex, 10
a3	foscili iampH3*ak1,p8+irandfreq*gkband, icar,imod, kindex, 10
a4	foscili iampH4*ak1,p9+irandfreq*gkband, icar,imod, kindex, 10
a5	foscili iampH5*ak1,p10+irandfreq*gkband, icar,imod, kindex, 10
a6	foscili iampH6*ak1,p11+irandfreq*gkband, icar,imod, kindex, 10
a7	foscili iampH7*ak1,p12+irandfreq*gkband, icar,imod, kindex, 10
outvalue "F1", gif1
outvalue "F2", gif2
outvalue "F3", gif3
outvalue "F4", gif4
outvalue "F5", gif5
outvalue "F6", gif6
outvalue "F7", gif7

aout sum a1,a2,a3,a4,a5,a6,a7
goto outsum

FMvoices6:
;ak1	linen ilev, iat,p3,irel
;kindex  linseg 0,p3/2,iindex,p3/2,0
a1	foscili iampH1*ak1,p4+irandfreq*gkband, icar,imod, kindex, 10
a2	foscili iampH2*ak1,p7+irandfreq*gkband, icar,imod, kindex, 10
a3	foscili iampH3*ak1,p8+irandfreq*gkband, icar,imod, kindex, 10
a4	foscili iampH4*ak1,p9+irandfreq*gkband, icar,imod, kindex, 10
a5	foscili iampH5*ak1,p10+irandfreq*gkband, icar,imod, kindex, 10
a6	foscili iampH6*ak1,p11+irandfreq*gkband, icar,imod, kindex, 10
outvalue "F1", gif1
outvalue "F2", gif2
outvalue "F3", gif3
outvalue "F4", gif4
outvalue "F5", gif5
outvalue "F6", gif6

aout sum a1,a2,a3,a4,a5,a6
goto outsum

FMvoices5:
;ak1	linen ilev, iat,p3,irel
;kindex  linseg 0,p3/2,iindex,p3/2,0
a1	foscili iampH1*ak1,p4+irandfreq*gkband, icar,imod, kindex, 10
a2	foscili iampH2*ak1,p7+irandfreq*gkband, icar,imod, kindex, 10
a3	foscili iampH3*ak1,p8+irandfreq*gkband, icar,imod, kindex, 10
a4	foscili iampH4*ak1,p9+irandfreq*gkband, icar,imod, kindex, 10
a5	foscili iampH5*ak1,p10+irandfreq*gkband, icar,imod, kindex, 10
outvalue "F1", gif1
outvalue "F2", gif2
outvalue "F3", gif3
outvalue "F4", gif4
outvalue "F5", gif5

aout sum a1,a2,a3,a4,a5
goto outsum

FMvoices4:
;ak1	linen ilev, iat,p3,irel
;kindex  linseg 0,p3/2,iindex,p3/2,0
a1	foscili iampH1*ak1,p4+irandfreq*gkband, icar,imod, kindex, 10
a2	foscili iampH2*ak1,p7+irandfreq*gkband, icar,imod, kindex, 10
a3	foscili iampH3*ak1,p8+irandfreq*gkband, icar,imod, kindex, 10
a4	foscili iampH4*ak1,p9+irandfreq*gkband, icar,imod, kindex, 10
outvalue "F1", gif1
outvalue "F2", gif2
outvalue "F3", gif3
outvalue "F4", gif4

aout sum a1,a2,a3,a4
goto outsum

FMvoices3:
;ak1	linen ilev, iat,p3,irel
;kindex  linseg 0,p3/2,iindex,p3/2,0
a1	foscili iampH1*ak1,p4+irandfreq*gkband, icar,imod, kindex, 10
a2	foscili iampH2*ak1,p7+irandfreq*gkband, icar,imod, kindex, 10
a3	foscili iampH3*ak1,p8+irandfreq*gkband, icar,imod, kindex, 10
outvalue "F1", gif1
outvalue "F2", gif2
outvalue "F3", gif3

aout sum a1,a2,a3
goto outsum

FMvoices2:
;ak1	linen ilev, iat,p3,irel
;kindex  linseg 0,p3/2,iindex,p3/2,0
a1	foscili iampH1*ak1,p4+irandfreq*gkband, icar,imod, kindex, 10
a2	foscili iampH2*ak1,p7+irandfreq*gkband, icar,imod, kindex, 10
outvalue "F1", gif1
outvalue "F2", gif2

aout sum a1,a2
goto outsum

FMvoices1:
;ak1	linen ilev, iat,p3,irel
;kindex  linseg 0,p3/2,iindex,p3/2,0
a1	foscili iampH1*ak1,p4+irandfreq*gkband, icar,imod, kindex, 10
outvalue "F1", gif1

aout sum a1
goto outsum

ADSYN:


if invoices == 1 goto ADvoices1
if invoices == 2 goto ADvoices2
if invoices == 3 goto ADvoices3
if invoices == 4 goto ADvoices4
if invoices == 5 goto ADvoices5
if invoices == 6 goto ADvoices6
if invoices == 7 goto ADvoices7

ADvoices8:
;ak1	linen ilev, iat,p3,irel
a1	oscil iampH1*ak1,p4+irandfreq*gkband, 10
a2	oscil iampH2*ak1,p7+irandfreq*gkband, 10
a3	oscil iampH3*ak1,p8+irandfreq*gkband, 10
a4	oscil iampH4*ak1,p9+irandfreq*gkband, 10
a5	oscil iampH5*ak1,p10+irandfreq*gkband, 10
a6	oscil iampH6*ak1,p11+irandfreq*gkband, 10
a7	oscil iampH7*ak1,p12+irandfreq*gkband, 10
a8	oscil iampH8*ak1,p13+irandfreq*gkband, 10
outvalue "F1", gif1
outvalue "F2", gif2
outvalue "F3", gif3
outvalue "F4", gif4
outvalue "F5", gif5
outvalue "F6", gif6
outvalue "F7", gif7
outvalue "F8", gif8


aout sum a1,a2,a3,a4,a5,a6,a7,a8
goto outsum

ADvoices7:
;ak1	linen ilev, iat,p3,irel
a1	oscil iampH1*ak1,p4+irandfreq*gkband, 10
a2	oscil iampH2*ak1,p7+irandfreq*gkband, 10
a3	oscil iampH3*ak1,p8+irandfreq*gkband, 10
a4	oscil iampH4*ak1,p9+irandfreq*gkband, 10
a5	oscil iampH5*ak1,p10+irandfreq*gkband, 10
a6	oscil iampH6*ak1,p11+irandfreq*gkband, 10
a7	oscil iampH7*ak1,p12+irandfreq*gkband, 10
outvalue "F1", gif1
outvalue "F2", gif2
outvalue "F3", gif3
outvalue "F4", gif4
outvalue "F5", gif5
outvalue "F6", gif6
outvalue "F7", gif7

aout sum a1,a2,a3,a4,a5,a6,a7
goto outsum


ADvoices6:
;ak1	linen ilev, iat,p3,irel
a1	oscil iampH1*ak1,p4+irandfreq*gkband, 10
a2	oscil iampH2*ak1,p7+irandfreq*gkband, 10
a3	oscil iampH3*ak1,p8+irandfreq*gkband, 10
a4	oscil iampH4*ak1,p9+irandfreq*gkband, 10
a5	oscil iampH5*ak1,p10+irandfreq*gkband, 10
a6	oscil iampH6*ak1,p11+irandfreq*gkband, 10
outvalue "F1", gif1
outvalue "F2", gif2
outvalue "F3", gif3
outvalue "F4", gif4
outvalue "F5", gif5
outvalue "F6", gif6

aout sum a1,a2,a3,a4,a5,a6
goto outsum


ADvoices5:
;ak1	linen ilev, iat,p3,irel
a1	oscil iampH1*ak1,p4+irandfreq*gkband, 10
a2	oscil iampH2*ak1,p7+irandfreq*gkband, 10
a3	oscil iampH3*ak1,p8+irandfreq*gkband, 10
a4	oscil iampH4*ak1,p9+irandfreq*gkband, 10
a5	oscil iampH5*ak1,p10+irandfreq*gkband, 10
outvalue "F1", gif1
outvalue "F2", gif2
outvalue "F3", gif3
outvalue "F4", gif4
outvalue "F5", gif5

aout sum a1,a2,a3,a4,a5
goto outsum

ADvoices4:
;ak1	linen ilev, iat,p3,irel
a1	oscil iampH1*ak1,p4+irandfreq*gkband, 10
a2	oscil iampH2*ak1,p7+irandfreq*gkband, 10
a3	oscil iampH3*ak1,p8+irandfreq*gkband, 10
a4	oscil iampH4*ak1,p9+irandfreq*gkband, 10
outvalue "F1", gif1
outvalue "F2", gif2
outvalue "F3", gif3
outvalue "F4", gif4

aout sum a1,a2,a3,a4
goto outsum

ADvoices3:
;ak1	linen ilev, iat,p3,irel
a1	oscil iampH1*ak1,p4+irandfreq*gkband, 10
a2	oscil iampH2*ak1,p7+irandfreq*gkband, 10
a3	oscil iampH3*ak1,p8+irandfreq*gkband, 10
outvalue "F1", gif1
outvalue "F2", gif2
outvalue "F3", gif3

aout sum a1,a2,a3
goto outsum

ADvoices2:
;ak1	linen ilev, iat,p3,irel
a1	oscil iampH1*ak1,p4+irandfreq*gkband, 10
a2	oscil iampH2*ak1,p7+irandfreq*gkband, 10
outvalue "F1", gif1
outvalue "F2", gif2

aout sum a1,a2
goto outsum

ADvoices1:
;ak1	linen ilev, iat,p3,irel
a1	oscil iampH1*ak1,p4+irandfreq*gkband, 10
outvalue "F1", gif1

aout sum a1


outsum:
aL = (1-gkmute1) * gkover * aout * $SCALEFACTOR1 * ileft * (1 - gkxfade)
aR = (1-gkmute1) * gkover * aout * $SCALEFACTOR1 * iright * (1 - gkxfade)
aL dcblock aL
aR dcblock aR
	outs	aL, aR   ;  Audio to DAC -  outs PAD N. 1 

gaFFT = gaFFT + aL
gaREVL= gaREVL + aL * gkREVSEND1
gaREVR=gaREVR + aR * gkREVSEND1

gaMETER_L = gaMETER_L + aL
gaMETER_R = gaMETER_R + aR

gaWRITE_L = gaWRITE_L + aL
gaWRITE_R = gaWRITE_R + aR


gaCONV_L = gaCONV_L + aL
gaCONV_R = gaCONV_R + aR

	endin

;==========================================

instr   152 ;====> CALLED INSTRUMENT 2 (NO GRID)

ilev = p6
ifun = p9

irandfreq   = birnd(p5)
ichan = birnd(1)
ileft = (ichan <= 0 ? 1 : 0)
iright = (ichan > 0 ? 1 : 0)

icar  random	i(gk_CAR_min), i(gk_CAR_max)			;6,14
imod  random  	i(gk_MOD_min), i(gk_MOD_max)		 ;5,13


icar = (i(gk_cm) = 0 ?  int(icar) : icar)
imod = (i(gk_cm) = 0 ?  int(imod) : imod)

iindex random 0,i(gkindx2)


iat = p3 * p7
irel = p3 * p8
ion = p3 - (iat+irel)

ak1		linen ilev, iat,p3,irel
kindex	linseg 0,p3/2,iindex,p3/2,0



a1	foscil ak1,p4+irandfreq*gkband, icar,imod, kindex, ifun

aL = gkover * a1 * $SCALEFACTOR2 * ileft  * (1- gkmute2)*gkxfade
aR = gkover * a1 * $SCALEFACTOR2 * iright * (1 - gkmute2)*gkxfade
aL dcblock aL
aR dcblock aR
	outs	aL,aR	;  Audio to DAC -  outs PAD N. 2

gaFFT  = gaFFT + aL
gaREVL = gaREVL + aL * gkREVSEND2
gaREVR = gaREVR + aR * gkREVSEND2

gaMETER_L = gaMETER_L + aL
gaMETER_R = gaMETER_R + aR

gaWRITE_L = gaWRITE_L + aL
gaWRITE_R = gaWRITE_R + aR


	endin

;==========================================

instr 200;-----> GEOM. COMPILER AFTER SNAP READ
;  p4      p5     p6        p7    p8        p9      p10		p11
;iRATIO, iNUM, iDEN,   iMODE_IN, iOUTF, iG_FUND, iG_OCT, iG_KEY
;print p4,p5,p6,p7,p8,p9,p10,p11
outvalue "ratio", p4
outvalue "num",p5
outvalue "den",p6
outvalue "mode_in",p7
outvalue "outf",p8
outvalue "G_fund",p9
outvalue "G_oct",p10
outvalue "G_key",p11

ind init 0
iG_fund = p9										;iG_fund = i(gk_G_fund)

if iG_fund == 1 then
i_int_note = p10 + 4								;i_int_note = i(gk_G_oct) + 4
i_decimal_note = p11 * 0.01						;i_decimal_note = i(gk_G_key) * 0.01
	inote = i_int_note + i_decimal_note

ifreq = cpspch(inote)
;ifreq0 = ifreq

else
;ifreq0 = 0
ifreq init p8									;ifreq init i(gk_outf)
endif

ifreq0 = ifreq
imode_in = p7									;imode_in = i(gkmode_in)


inum = p5										;inum = i(gk_num)
iden = p6								;iden = i(gk_den)

if imode_in == 1 then
iratio = inum/iden
else
iratio = p4								;iratio = i(gk_ratio)
endif

;print iratio



if ifreq <= 0 igoto stop



if iratio < 1 goto stop


;print ifreq
do:
    ifreq = ifreq0 * iratio^ind
    if ifreq > sr/2 goto stop
;print ind, ifreq
tabw_i	ifreq, ind, 302
tabw_i	ifreq, ind, 301


;ifreq_old = ifreq
;ifreq = ifreq * iratio


gifreq = ifreq
ind = ind + 1
gind = ind	; copia il valore massimo dell'indice in gind


igoto do

stop:
;ifreq = ifreq_old

outvalue "max_index", ind
outvalue "last_freq", ifreq
outvalue "G_fre", ifreq0
outvalue "led_G", 1
outvalue "led_H", 0
outvalue "led_F", 0
gisw_G = 1
gisw_H = 0
gisw_F = 0

turnoff


endin


;==========================================

instr 202;-----> HARM. SPECTRA COMPILER AFTER SNAP READ

ind init 0


;    p4   p5     p6      p7    p8    p9
;iFFUND,iEXP,iMAXHARM,iHFUND,iHOCT,iHKEY

outvalue "ffund",	p4
outvalue "exp",		p5
outvalue "maxharm",	p6
outvalue "H_fund",	p7
outvalue "H_oct",	p8
outvalue "H_key",	p9




iH_fund = p7		;legge lo stato dello switch di modo per l'immisione della freq. fond.


if iH_fund == 1 then
	i_int_note = p8 + 4
	i_decimal_note = p9 * 0.01
	inote = i_int_note + i_decimal_note
;print inote

ifund = cpspch(inote)
ifreq0 = ifund

else
ifreq0 = 0
ifund = p4
endif



iexp = p5
imaxharm = p6
icurfreq = ifund

do:

if ind > (imaxharm - 1) igoto stop
gifreq = icurfreq
ind = ind + 1
iexpval pow ind, (1+iexp)
icurfreq = ifund * iexpval
tabw_i	icurfreq, ind - 1, 302
tabw_i	icurfreq, ind - 1, 301

gind = ind
gifreq = icurfreq
igoto do

stop:

outvalue "H_fre", ifreq0
outvalue "led_G", 0
outvalue "led_H", 1
outvalue "led_F", 0
gisw_G = 0
gisw_H = 1
gisw_F = 0

turnoff

endin

;==========================================

instr 203;-----> FIBONACCI COMPILER AFTER SNAP READ
;   p4         p5
;iFIBSTART, iFIBFUND
index init 0
iPHI init (1 + sqrt(5))/2

outvalue "FIB_Start",	p4
outvalue "FIB_Fund",	p5

istart  	= 	p4
ifund   	= 	p5

ifreq = ifund

do:

ifreq_old = ifreq


ifreq = ifund * ((iPHI ^(index + istart) - (1 - iPHI)^(index + istart))/ sqrt(5))
if ifreq > sr/2 goto stop
tabw_i	ifreq, index, 302
tabw_i	ifreq, index, 301

;print index , ifreq
gifreq = ifreq
index = index + 1
gind = index	; copia il valore massimo dell'indice in gind


igoto do

stop:
outvalue "led_G", 0
outvalue "led_H", 0
outvalue "led_F", 1
gisw_G = 0
gisw_H = 0
gisw_F = 1

turnoff

endin


;==========================================

instr 300;-----> SAVE BANK ON DISK


String_Read	invalue "_Browse1"
String_Read2 strcat String_Read, "-> Saved !"

outvalue	"strout", String_Read2



ftsave String_Read	,1,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,\
			216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,\
			232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247



kpos strindexk	String_Read,"."		;Rileva la posizione del punto nella stringa

SubString	strsubk String_Read, 0, kpos	;Estrae il nome ptima del punto


Sfile_MIDISetup  strcat SubString, "_MIDI.txt"   ;Concatena con _MIDI.txt per formare il nome
;if gkMIDIsave == 1 then
;outvalue "dispstring", Sfile_MIDISetup
ftsave Sfile_MIDISetup, 1, 11
;else
;endif
turnoff
endin

;==========================================

instr 301;-----> LOAD BANK FROM DISK

;String_Read	invalue "string"
;outvalue		"strout", String_Read

String_Read  invalue "_Browse1"


String_Read2 strcat String_Read, "-> Loaded !"

kpos strindexk	String_Read,"."		;Rileva la posizione del punto nella stringa
SubString	strsubk String_Read, 0, kpos	;Estrae il nome ptima del punto
Sfile_MIDISetup  strcat SubString, "_MIDI.txt"   ;Concatena con _MIDI.txt per formare il nome

outvalue		"strout", String_Read2

if gkMIDIsave == 0 goto noload

	ftload Sfile_MIDISetup, 1, 11
iCC1 tab_i 0, 11
iCC2 tab_i 1, 11
iCC3 tab_i 2, 11
iCC4 tab_i 3, 11
iCC5 tab_i 4, 11
iCC6 tab_i 5, 11
iCC7 tab_i 6, 11
iCC8 tab_i 7, 11
iMIDI1 tab_i 8, 11
iMIDI2 tab_i 9, 11
iMIDI3 tab_i 10, 11
iMIDI4 tab_i 11, 11
iMIDI5 tab_i 12, 11
iMIDI6 tab_i 13, 11
iMIDI7 tab_i 14, 11
iMIDI8 tab_i 15, 11

outvalue "cc1", iCC1
outvalue "cc2", iCC2
outvalue "cc3", iCC3
outvalue "cc4", iCC4
outvalue "cc5", iCC5
outvalue "cc6", iCC6
outvalue "cc7", iCC7
outvalue "cc8", iCC8

outvalue "MIDIVAR_1", iMIDI1
outvalue "MIDIVAR_2", iMIDI2
outvalue "MIDIVAR_3", iMIDI3
outvalue "MIDIVAR_4", iMIDI4
outvalue "MIDIVAR_5", iMIDI5
outvalue "MIDIVAR_6", iMIDI6
outvalue "MIDIVAR_7", iMIDI7
outvalue "M8", iMIDI8


noload:


; Clear location 0
tabw_i 0,0,200
tabw_i 0,0,201
tabw_i 0,0,202
tabw_i 0,0,203
tabw_i 0,0,204
tabw_i 0,0,205
tabw_i 0,0,206
tabw_i 0,0,207
tabw_i 0,0,208
tabw_i 0,0,209
tabw_i 0,0,200
tabw_i 0,0,211
tabw_i 0,0,212
tabw_i 0,0,213
tabw_i 0,0,214
tabw_i 0,0,215
tabw_i 0,0,216
tabw_i 0,0,217
tabw_i 0,0,218
tabw_i 0,0,219
tabw_i 0,0,220
tabw_i 0,0,221
tabw_i 0,0,222
tabw_i 0,0,223
tabw_i 0,0,224
tabw_i 0,0,225
tabw_i 0,0,226
tabw_i 0,0,227
tabw_i 0,0,228
tabw_i 0,0,229
tabw_i 0,0,230
tabw_i 0,0,231
tabw_i 0,0,232
tabw_i 0,0,233
tabw_i 0,0,234
tabw_i 0,0,235
tabw_i 0,0,236
tabw_i 0,0,237
tabw_i 0,0,238
tabw_i 0,0,239
tabw_i 0,0,240
tabw_i 0,0,241
tabw_i 0,0,242
tabw_i 0,0,243
tabw_i 0,0,244
tabw_i 0,0,245
tabw_i 0,0,246
tabw_i 0,0,247



ftload String_Read	, 1,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,\
			216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,\
			232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247

iP1  	tab_i 0, 200		; Read 1st parameter of each snap : if !=0 lit LED SNAP On
iP2  	tab_i 0, 201
iP3  	tab_i 0, 202
iP4  	tab_i 0, 203
iP5  	tab_i 0, 204
iP6  	tab_i 0, 205
iP7  	tab_i 0, 206
iP8  	tab_i 0, 207
iP9		tab_i 0, 208
iP10  tab_i 0, 209
iP11  tab_i 0, 210
iP12  tab_i 0, 211
iP13  tab_i 0, 212
iP14  tab_i 0, 213
iP15  tab_i 0, 214
iP16  tab_i 0, 215
iP17  tab_i 0, 216
iP18  tab_i 0, 217
iP19  tab_i 0, 218
iP20  tab_i 0, 219
iP21  tab_i 0, 220
iP22  tab_i 0, 221
iP23  tab_i 0, 222
iP24  tab_i 0, 223
iP25  tab_i 0, 224
iP26  tab_i 0, 225
iP27  tab_i 0, 226
iP28  tab_i 0, 227
iP29  tab_i 0, 228
iP30  tab_i 0, 229
iP31  tab_i 0, 230
iP32  tab_i 0, 231
iP33  tab_i 0, 232
iP34  tab_i 0, 233
iP35  tab_i 0, 234
iP36  tab_i 0, 235
iP37  tab_i 0, 236
iP38  tab_i 0, 237
iP39  tab_i 0, 238
iP40  tab_i 0, 239
iP41  tab_i 0, 240
iP42  tab_i 0, 241
iP43  tab_i 0, 242
iP44  tab_i 0, 243
iP45  tab_i 0, 244
iP46  tab_i 0, 245
iP47  tab_i 0, 246
iP48  tab_i 0, 247


if iP1 !=0 then
 	outvalue  "L01", 1
else
	outvalue "L01", 0
endif
if iP2 !=0 then
	outvalue  "L02", 1
else
outvalue "L02", 0
endif

if iP3 !=0 then
 	outvalue  "L03", 1
else
outvalue "L03", 0
endif

if iP4 !=0 then
	outvalue  "L04", 1
else
outvalue  "L04", 0
endif

if iP5 !=0 then
	outvalue  "L05", 1
else
outvalue  "L05", 0
endif

if iP6 !=0 then
	outvalue  "L06", 1
else
outvalue  "L06", 0
endif

if iP7 !=0 then
	outvalue  "L07", 1
else
outvalue  "L07", 0
endif

if iP8 !=0 then
	outvalue  "L08", 1
else
outvalue  "L08", 0
endif

if iP9 !=0 then
	outvalue  "L09", 1
else
outvalue  "L09", 0
endif

if iP10 !=0 then
	outvalue  "L10", 1
else
outvalue  "L010", 0
endif

if iP11 !=0 then
	outvalue  "L11", 1
else
outvalue  "L11", 0
endif

if iP12 !=0 then
	outvalue  "L12", 1
else
outvalue  "L12", 0
endif

if iP13 !=0 then
	outvalue  "L13", 1
else
outvalue  "L13", 0
endif

if iP14 !=0 then
	outvalue  "L14", 1
else
outvalue  "L14", 0
endif

if iP15 !=0 then
	outvalue  "L15", 1
else
outvalue  "L15", 0
endif

if iP16 !=0 then
	outvalue  "L16", 1
else
outvalue  "L16", 0
endif

if iP17 !=0 then
	outvalue  "L17", 1
else
outvalue  "L17", 0
endif

if iP18 !=0 then
	outvalue  "L18", 1
else
outvalue  "L18", 0
endif

if iP19 !=0 then
	outvalue  "L19", 1
else
outvalue  "L19", 0
endif

if iP20 !=0 then
	outvalue  "L20", 1
else
outvalue  "L20", 0
endif

if iP21 !=0 then
	outvalue  "L21", 1
else
outvalue  "L21", 0
endif

if iP22 !=0 then
	outvalue  "L22", 1
else
outvalue  "L22", 0
endif

if iP23 !=0 then
	outvalue  "L23", 1
else
outvalue  "L23", 0
endif

if iP24 !=0 then
	outvalue  "L24", 1
else
outvalue  "L24", 0
endif

if iP25 !=0 then
	outvalue  "L25", 1
else
outvalue  "L25", 0
endif

if iP26 !=0 then
	outvalue  "L26", 1
else
outvalue  "L26", 0
endif

if iP27 !=0 then
	outvalue  "L27", 1
else
outvalue  "L27", 0
endif

if iP28 !=0 then
	outvalue  "L28", 1
else
outvalue  "L28", 0
endif

if iP29 !=0 then
	outvalue  "L29", 1
else
outvalue  "L29", 0
endif

if iP30 !=0 then
	outvalue  "L30", 1
else
outvalue  "L30", 0
endif

if iP31 !=0 then
	outvalue  "L31", 1
else
outvalue  "L31", 0
endif

if iP32 !=0 then
	outvalue  "L32", 1
else
outvalue  "L32", 0
endif

if iP33 !=0 then
	outvalue  "L33", 1
else
outvalue  "L33", 0
endif

if iP34 !=0 then
	outvalue  "L34", 1
else
outvalue  "L34", 0
endif

if iP35 !=0 then
	outvalue  "L35", 1
else
outvalue  "L35", 0
endif

if iP36 !=0 then
	outvalue  "L36", 1
else
outvalue  "L36", 0
endif

if iP37 !=0 then
	outvalue  "L37", 1
else
outvalue  "L37", 0
endif

if iP38 !=0 then
	outvalue  "L38", 1
else
outvalue  "L38", 0
endif

if iP39 !=0 then
	outvalue  "L39", 1
else
outvalue  "L39", 0
endif

if iP40 !=0 then
	outvalue  "L40", 1
else
outvalue  "L40", 0
endif

if iP41 !=0 then
	outvalue  "L41", 1
else
outvalue  "L41", 0
endif

if iP42 !=0 then
	outvalue  "L42", 1
else
outvalue  "L42", 0
endif

if iP43 !=0 then
	outvalue  "L43", 1
else
outvalue  "L43", 0
endif

if iP44 !=0 then
	outvalue  "L44", 1
else
outvalue  "L44", 0
endif

if iP45 !=0 then
	outvalue  "L45", 1
else
outvalue  "L45", 0
endif

if iP46 !=0 then
	outvalue  "L46", 1
else
outvalue  "L46", 0
endif

if iP47 !=0 then
	outvalue  "L47", 1
else
outvalue  "L47", 0
endif

if iP48 !=0 then
	outvalue  "L48", 1
else
outvalue  "L48", 0
endif

outvalue "warn",""
turnoff
endin



;==========================================

instr 600  ;-----> Assignable  XY controller

kcontrol_X invalue "control_X"
kcontrol_Y invalue "control_Y"
;printk2 kcontrol_X
kX0 invalue "X"
kY0 invalue "Y"
gkX limit kX0, 0, 1
gkY limit kY0, 0, 1
;printk2 kX

ktr	changed gkX, gkY


if kcontrol_X == 1 then
	schedkwhen ktr, 0, 1,601 ,0, -1
elseif  kcontrol_X == 2 then
	schedkwhen ktr, 0, 1,602 ,0, -1
elseif  kcontrol_X == 3 then
	schedkwhen ktr, 0, 1,603 ,0, -1
elseif  kcontrol_X == 4 then
	schedkwhen ktr, 0, 1,604 ,0, -1
elseif  kcontrol_X == 5 then
	schedkwhen ktr, 0, 1,605 ,0, -1
elseif  kcontrol_X == 6 then
	schedkwhen ktr, 0, 1,606 ,0, -1
elseif  kcontrol_X == 7 then
	schedkwhen ktr, 0, 1,607 ,0, -1
elseif  kcontrol_X == 8 then
	schedkwhen ktr, 0, 1,608 ,0, -1
endif

if	kcontrol_Y == 1 then
	schedkwhen ktr, 0, 1,611 ,0, -1
elseif kcontrol_Y == 2 then
	schedkwhen ktr, 0, 1,612 ,0, -1
elseif kcontrol_Y == 3 then
	schedkwhen ktr, 0, 1,613 ,0, -1
elseif kcontrol_Y == 4 then
	schedkwhen ktr, 0, 1,614 ,0, -1
elseif kcontrol_Y == 5 then
	schedkwhen ktr, 0, 1,615 ,0, -1
elseif kcontrol_Y == 6 then
	schedkwhen ktr, 0, 1,616 ,0, -1
endif


endin


;=============== ONE SHOT CALL BY XY ASSIGNABLE CONTROLLER

instr 601

outvalue "band", (gkX	 * 99.9999) + 0.0001
turnoff

endin

instr 602

outvalue "vox", 1 + int(gkX * 7)
turnoff

endin

instr 603
outvalue "knob154", 1 + int(gkX * 8)
turnoff
endin

instr 604
outvalue "indx1", 4* gkX
turnoff
endin

instr 605
outvalue "CAR_min", 1 + 13* gkX
turnoff
endin

instr 606
outvalue "MOD_min", 1 + 12* gkX
turnoff
endin

instr 607
outvalue "Fun_1",  1 + 7 * gkX
turnoff
endin

instr 608
outvalue "pad_X1", gkX
turnoff
endin

;---------- PARAMETERS AFFECTED BY XY CONFIGURABILE CONTROLLER

instr 611
outvalue "Lev_1", gkY							;  Controlla Livello GENERATORE 1
turnoff
endin

instr 612
outvalue "ran1amp", 0.001 + 0.199 * gkY		; Controlla parametro amp di RAND 1
turnoff
endin

instr 613
outvalue "ran1vel", 0.01 + 3.99 * gkY		; Controlla parametro vel (rate) di RAND 1
turnoff
endin

instr 614
outvalue "XFADE", gkY							; Controlla XFADE
turnoff
endin

instr 615
outvalue "pad_Y1", gkY							; Controlla lo spread frequenziale relativo
turnoff
endin

instr 616
outvalue "band", (gkY	 * 99.9999) + 0.0001	; Controlla lo spread frequenziale assoluto
turnoff
endin



;instr 700 ;========= Live input (future expansion)

;a_STRIA_L = gaCONV_L
;a_STRIA_R = gaCONV_R

;aLiveInPre	inch		1
;kingaindb	invalue	"ingaindb"
;kLiveInGain	=		ampdb(kingaindb)
;aLiveInPost	=		aLiveInPre * kLiveInGain
;iphasfreq	=		1 / (ftlen(giLiveBuf) / sr); phasor frequency
;kfreeze	invalue	"freeze"; if checked, freeze writing (and reading) of the buffer
;kphasfreq	=		(kfreeze == 1 ? 0 : iphasfreq)
;awritpnt	phasor		kphasfreq
;		tablew		aLiveInPost, awritpnt, giLiveBuf, 1, 0, 1

;a1 oscili 1, sr/ftlen(giLiveBuf), giLiveBuf




;a_STRIA_L = 0
;a_STRIA_R = 0
;endin

;==========================================

instr 801 ;----> MIDI CC EXTERNAL PARAM.MANAGER   (1st)

reset:
ival tab_i 0, 11
timout 0, 0.1, cont
reinit reset
cont:
;                                CHAN		CC num					Min						Max
gkval_1		chanctrl         	1,       ival,           		0,                  1

kchan changed gkval_1

schedkwhen kchan, 0, 0,901,0, -1

endin

;==========================================

instr 802
reset:
ival tab_i 1, 11
timout 0, 0.1, cont
reinit reset
cont:
;                            CHAN		CC num					Min						Max
gkval_2		chanctrl         	1,       ival,           		0,                  1

kchan changed gkval_2

schedkwhen kchan, 0, 0,902,0, -1

endin

;==========================================

instr 803
reset:
ival tab_i 2, 11
timout 0, 0.1, cont
reinit reset
cont:
;                                CHAN		CC num					Min						Max
gkval_3		chanctrl         	1,       ival,           			0,                  1

kchan changed gkval_3

schedkwhen kchan, 0, 0,903,0, -1

endin

;==========================================================

instr 804
reset:
ival tab_i 3, 11
timout 0, 0.1, cont
reinit reset
cont:
;                                CHAN		CC num					Min						Max
gkval_4		chanctrl         	1,       ival,           			0,                  1

kchan changed gkval_4

schedkwhen kchan, 0, 0,904,0, -1

endin

;==========================================

instr 805
reset:
ival tab_i 4, 11
timout 0, 0.1, cont
reinit reset
cont:
;                                CHAN		CC num					Min						Max
gkval_5		chanctrl         	1,       ival,           			0,                  1

kchan changed gkval_5

schedkwhen kchan, 0, 0,905,0, -1

endin

;==========================================

instr 806
reset:
ival tab_i 5, 11
timout 0, 0.1, cont
reinit reset
cont:
;                                CHAN		CC num					Min						Max
gkval_6		chanctrl         	1,       ival,           			0,                  1

kchan changed gkval_6

schedkwhen kchan, 0, 0,906,0, -1

endin

;==========================================

instr 807
reset:
ival tab_i 6, 11
timout 0, 0.1, cont
reinit reset
cont:
;                                CHAN		CC num					Min						Max
gkval_7		chanctrl         	1,       ival,           			0,                  1

kchan changed gkval_7

schedkwhen kchan, 0, 0,907,0, -1

endin

;==========================================

instr 808
reset:
ival tab_i 7, 11
timout 0, 0.1, cont
reinit reset
cont:
;                                CHAN		CC num					Min						Max
gkval_8		chanctrl         	1,       ival,           			0,                  1

kchan changed gkval_8

schedkwhen kchan, 0, 0,908,0, -1

endin

;==========================================

instr 811;-----> Additional switch control (MIDI)

reset:

ival tab_i 8, 11
timout 0, 0.1, cont
reinit reset
cont:
;                                CHAN		CC num					Min						Max
gkval_11		chanctrl         	1,       ival,           			0,                  1

kchan1 changed gkval_11 ; !!!! Il doppio controllo serve per aspettare il ritorno a zero dello switch
kchan2 changed kchan1	; esterno

;outvalue "disp", gkval_11

; kchan2, 0, 0,911,0, -1

endin

;==========================================

instr 901  ; Connects ext. MIDI cc to the selected parameter  (1st controller)

if gkinv_1 == 0 then
kval  =  gkval_1 * gkcc1_lev
else
kval = (1 - gkval_1) * gkcc1_lev
endif

if 		gkMIDIVAR_1 == 1 goto Lev1
if 		gkMIDIVAR_1 == 2 goto PadX1
if 		gkMIDIVAR_1 == 3 goto PadY1
if 		gkMIDIVAR_1 == 4 goto Fun1
if 		gkMIDIVAR_1 == 5 goto Im1
if 		gkMIDIVAR_1 == 6 goto Atk1
if 		gkMIDIVAR_1 == 7 goto Rel1
if 		gkMIDIVAR_1 == 8 goto Rana1
if 		gkMIDIVAR_1 == 9 goto Ranr1
if 		gkMIDIVAR_1 == 10 goto Voi
if 		gkMIDIVAR_1 == 11 goto step
if 		gkMIDIVAR_1 == 12 goto Rev1
if 		gkMIDIVAR_1 == 13 goto Focus
if 		gkMIDIVAR_1 == 14 goto LongShort
if 		gkMIDIVAR_1 == 15 goto FastSlow
if 		gkMIDIVAR_1 == 16 goto shape
if 		gkMIDIVAR_1 == 17 goto Xfade
if 		gkMIDIVAR_1 == 18 goto PadX2
if 		gkMIDIVAR_1 == 19 goto Lev2
if 		gkMIDIVAR_1 == 20 goto Fun2
if 		gkMIDIVAR_1 == 21 goto Im2
if 		gkMIDIVAR_1 == 22 goto Rana2
if 		gkMIDIVAR_1 == 23 goto Ranr2
if 		gkMIDIVAR_1 == 24 goto Rev2
if 		gkMIDIVAR_1 == 25 goto Volume
if		gkMIDIVAR_1 == 26 goto Carmin
if		gkMIDIVAR_1 == 27 goto Carmax
if		gkMIDIVAR_1 == 28 goto Modmin
if		gkMIDIVAR_1 == 29 goto Modmax
goto next

Fun1:
	outvalue "Fun_1", 1 + 7 * kval
goto next

PadX1:
	outvalue "pad_X1", kval
goto next

PadY1:
	outvalue "pad_Y1", kval
goto next

Lev1:
	outvalue "Lev_1", kval
goto next

Im1:
outvalue "indx1", 4 * kval
goto next

Atk1:
outvalue "AT1", 0.005 + 0.85 * kval
goto next

Rel1:
outvalue "RE1", 0.005 + 0.85 * kval
goto next

Rana1:
outvalue "ran1amp", 0.001 + 0.199 * kval
goto next

Ranr1:
outvalue "ran1vel", 0.001 + 3.99 * kval
goto next

Voi:
outvalue "vox", 1.0 + 7.0 * kval
goto next

Rev1:
outvalue "REVSEND1",  kval
goto next

step:
outvalue "knob154", 1.0 + 8.0 * kval
goto next

Focus:
outvalue "band", 0.001 + 99.999 * kval
goto next

LongShort:
outvalue "dur", 0.2 + 2.8 * kval
goto next

FastSlow:
outvalue "rate", 0.1 + 0.4 * kval
goto next

shape:
outvalue "SHAPE",  8 * kval
goto next

Xfade:
outvalue "XFADE",  kval
goto next

PadX2:
outvalue "pad_X2",  kval
goto next

Lev2:
	outvalue "Lev_2", kval

Fun2:
	outvalue "Fun_2", 1 + 7 * kval
goto next

Im2:
outvalue "indx2", 4 * kval
goto next

Rana2:
outvalue "ran2amp", 0.001 + 0.199 * kval
goto next

Ranr2:
outvalue "ran2vel", 0.001 + 3.99 * kval
goto next

Carmin:
outvalue "CAR_min", 1 + kval * 13
goto next

Carmax:
outvalue "CAR_max", 1 + kval * 13
goto next

Modmin:
outvalue "MOD_min", 1 + kval * 13
goto next

Modmax:
outvalue "MOD_max", 1 + kval * 13
goto next


Rev2:
outvalue "REVSEND2",  kval
goto next

Volume:
outvalue "over",  kval



next:

turnoff

endin

;==========================================

instr 902

if gkinv_2 == 0 then
kval  =  gkval_2 * gkcc2_lev
else
kval = (1 - gkval_2) * gkcc2_lev
endif


if 		gkMIDIVAR_2 == 1 goto Lev1
if 		gkMIDIVAR_2 == 2 goto PadX1
if 		gkMIDIVAR_2 == 3 goto PadY1
if 		gkMIDIVAR_2 == 4 goto Fun1
if 		gkMIDIVAR_2 == 5 goto Im1
if 		gkMIDIVAR_2 == 6 goto Atk1
if 		gkMIDIVAR_2 == 7 goto Rel1
if 		gkMIDIVAR_2 == 8 goto Rana1
if 		gkMIDIVAR_2 == 9 goto Ranr1
if 		gkMIDIVAR_2 == 10 goto Voi
if 		gkMIDIVAR_2 == 11 goto step
if 		gkMIDIVAR_2 == 12 goto Rev1
if 		gkMIDIVAR_2 == 13 goto Focus
if 		gkMIDIVAR_2 == 14 goto LongShort
if 		gkMIDIVAR_2 == 15 goto FastSlow
if 		gkMIDIVAR_2 == 16 goto shape
if 		gkMIDIVAR_2 == 17 goto Xfade
if 		gkMIDIVAR_2 == 18 goto PadX2
if 		gkMIDIVAR_2 == 19 goto Lev2
if 		gkMIDIVAR_2 == 20 goto Fun2
if 		gkMIDIVAR_2 == 21 goto Im2
if 		gkMIDIVAR_2 == 22 goto Rana2
if 		gkMIDIVAR_2 == 23 goto Ranr2
if 		gkMIDIVAR_2 == 24 goto Rev2
if 		gkMIDIVAR_2 == 25 goto Volume
if		gkMIDIVAR_2 == 26 goto Carmin
if		gkMIDIVAR_2 == 27 goto Carmax
if		gkMIDIVAR_2 == 28 goto Modmin
if		gkMIDIVAR_2 == 29 goto Modmax
goto next

Fun1:
	outvalue "Fun_1", 1 + 7 * kval
goto next

PadX1:
	outvalue "pad_X1", kval
goto next

PadY1:
	outvalue "pad_Y1", kval
goto next

Lev1:
	outvalue "Lev_1", kval
goto next

Im1:
outvalue "indx1", 4 * kval
goto next

Atk1:
outvalue "AT1", 0.005 + 0.85 * kval
goto next

Rel1:
outvalue "RE1", 0.005 + 0.85 * kval
goto next

Rana1:
outvalue "ran1amp", 0.001 + 0.199 * kval
goto next

Ranr1:
outvalue "ran1vel", 0.001 + 3.99 * kval
goto next

Voi:
outvalue "vox", 1.0 + 7.0 * kval
goto next

Rev1:
outvalue "REVSEND1",  kval
goto next

step:
outvalue "knob154", 1.0 + 8.0 * kval
goto next

Focus:
outvalue "band", 0.001 + 99.999 * kval
goto next

LongShort:
outvalue "dur", 0.2 + 2.8 * kval
goto next

FastSlow:
outvalue "rate", 0.1 + 0.4 * kval
goto next

shape:
outvalue "SHAPE",  8 * kval
goto next

Xfade:
outvalue "XFADE",  kval
goto next

PadX2:
	outvalue "pad_X2", kval
goto next


Lev2:
	outvalue "Lev_2", kval
goto next

Fun2:
	outvalue "Fun_2", 1 + 7 * kval
goto next

Im2:
outvalue "indx2", 4 * kval
goto next

Rana2:
outvalue "ran2amp", 0.001 + 0.199 * kval
goto next

Ranr2:
outvalue "ran2vel", 0.001 + 3.99 * kval
goto next

Carmin:
outvalue "CAR_min", 1 + kval * 13
goto next

Carmax:
outvalue "CAR_max", 1 + kval * 13
goto next

Modmin:
outvalue "MOD_min", 1 + kval * 13
goto next

Modmax:
outvalue "MOD_max", 1 + kval * 13
goto next


Rev2:
outvalue "REVSEND2",  kval
goto next

Volume:
outvalue "over",  kval



next:

turnoff

endin

;==========================================

instr 903

if gkinv_3 == 0 then
kval  =  gkval_3 * gkcc3_lev
else
kval = (1 - gkval_3) * gkcc3_lev
endif


if 		gkMIDIVAR_3 == 1 goto Lev1
if 		gkMIDIVAR_3 == 2 goto PadX1
if 		gkMIDIVAR_3 == 3 goto PadY1
if 		gkMIDIVAR_3 == 4 goto Fun1
if 		gkMIDIVAR_3 == 5 goto Im1
if 		gkMIDIVAR_3 == 6 goto Atk1
if 		gkMIDIVAR_3 == 7 goto Rel1
if 		gkMIDIVAR_3 == 8 goto Rana1
if 		gkMIDIVAR_3 == 9 goto Ranr1
if 		gkMIDIVAR_3 == 10 goto Voi
if 		gkMIDIVAR_3 == 11 goto step
if 		gkMIDIVAR_3 == 12 goto Rev1
if 		gkMIDIVAR_3 == 13 goto Focus
if 		gkMIDIVAR_3 == 14 goto LongShort
if 		gkMIDIVAR_3 == 15 goto FastSlow
if 		gkMIDIVAR_3 == 16 goto shape
if 		gkMIDIVAR_3 == 17 goto Xfade
if 		gkMIDIVAR_3 == 18 goto PadX2
if 		gkMIDIVAR_3 == 19 goto Lev2
if 		gkMIDIVAR_3 == 20 goto Fun2
if 		gkMIDIVAR_3 == 21 goto Im2
if 		gkMIDIVAR_3 == 22 goto Rana2
if 		gkMIDIVAR_3 == 23 goto Ranr2
if 		gkMIDIVAR_3 == 24 goto Rev2
if 		gkMIDIVAR_3 == 25 goto Volume
if		gkMIDIVAR_3 == 26 goto Carmin
if		gkMIDIVAR_3 == 27 goto Carmax
if		gkMIDIVAR_3 == 28 goto Modmin
if		gkMIDIVAR_3 == 29 goto Modmax
goto next

Fun1:
	outvalue "Fun_1", 1 + 7 * kval
goto next

PadX1:
	outvalue "pad_X1", kval
goto next

PadY1:
	outvalue "pad_Y1", kval
goto next

Lev1:
	outvalue "Lev_1", kval
goto next

Im1:
outvalue "indx1", 4 * kval
goto next

Atk1:
outvalue "AT1", 0.005 + 0.85 * kval
goto next

Rel1:
outvalue "RE1", 0.005 + 0.85 * kval
goto next

Rana1:
outvalue "ran1amp", 0.001 + 0.199 * kval
goto next

Ranr1:
outvalue "ran1vel", 0.001 + 3.99 * kval
goto next

Voi:
outvalue "vox", 1.0 + 7.0 * kval
goto next

Rev1:
outvalue "REVSEND1",  kval
goto next

step:
outvalue "knob154", 1.0 + 8.0 * kval
goto next

Focus:
outvalue "band", 0.001 + 99.999 * kval
goto next

LongShort:
outvalue "dur", 0.2 + 2.8 * kval
goto next

FastSlow:
outvalue "rate", 0.1 + 0.4 * kval
goto next

shape:
outvalue "SHAPE",  8 * kval
goto next

Xfade:
outvalue "XFADE",  kval
goto next

PadX2:
	outvalue "pad_X2", kval
goto next

Lev2:
	outvalue "Lev_2", kval
goto next

Fun2:
	outvalue "Fun_2", 1 + 7 * kval
goto next

Im2:
outvalue "indx2", 4 * kval
goto next

Rana2:
outvalue "ran2amp", 0.001 + 0.199 * kval
goto next

Ranr2:
outvalue "ran2vel", 0.001 + 3.99 * kval
goto next

Carmin:
outvalue "CAR_min", 1 + kval * 13
goto next

Carmax:
outvalue "CAR_max", 1 + kval * 13
goto next

Modmin:
outvalue "MOD_min", 1 + kval * 13
goto next

Modmax:
outvalue "MOD_max", 1 + kval * 13
goto next


Rev2:
outvalue "REVSEND2",  kval
goto next

Volume:
outvalue "over",  kval



next:

turnoff

endin

;==========================================

instr 904


if gkinv_4 == 0 then
kval  =  gkval_4 * gkcc4_lev
else
kval = (1 - gkval_4) * gkcc4_lev
endif


if 		gkMIDIVAR_4 == 1 goto Lev1
if 		gkMIDIVAR_4 == 2 goto PadX1
if 		gkMIDIVAR_4 == 3 goto PadY1
if 		gkMIDIVAR_4 == 4 goto Fun1
if 		gkMIDIVAR_4 == 5 goto Im1
if 		gkMIDIVAR_4 == 6 goto Atk1
if 		gkMIDIVAR_4 == 7 goto Rel1
if 		gkMIDIVAR_4 == 8 goto Rana1
if 		gkMIDIVAR_4 == 9 goto Ranr1
if 		gkMIDIVAR_4 == 10 goto Voi
if 		gkMIDIVAR_4 == 11 goto step
if 		gkMIDIVAR_4 == 12 goto Rev1
if 		gkMIDIVAR_4 == 13 goto Focus
if 		gkMIDIVAR_4 == 14 goto LongShort
if 		gkMIDIVAR_4 == 15 goto FastSlow
if 		gkMIDIVAR_4 == 16 goto shape
if 		gkMIDIVAR_4 == 17 goto Xfade
if 		gkMIDIVAR_4 == 18 goto PadX2
if 		gkMIDIVAR_4 == 19 goto Lev2
if 		gkMIDIVAR_4 == 20 goto Fun2
if 		gkMIDIVAR_4 == 21 goto Im2
if 		gkMIDIVAR_4 == 22 goto Rana2
if 		gkMIDIVAR_4 == 23 goto Ranr2
if 		gkMIDIVAR_4 == 24 goto Rev2
if 		gkMIDIVAR_4 == 25 goto Volume
if		gkMIDIVAR_4 == 26 goto Carmin
if		gkMIDIVAR_4 == 27 goto Carmax
if		gkMIDIVAR_4 == 28 goto Modmin
if		gkMIDIVAR_4 == 29 goto Modmax
goto next

Fun1:
	outvalue "Fun_1", 1 + 7 * kval
goto next

PadX1:
	outvalue "pad_X1", kval
goto next

PadY1:
	outvalue "pad_Y1", kval
goto next

Lev1:
	outvalue "Lev_1", kval
goto next

Im1:
outvalue "indx1", 4 * kval
goto next

Atk1:
outvalue "AT1", 0.005 + 0.85 * kval
goto next

Rel1:
outvalue "RE1", 0.005 + 0.85 * kval
goto next

Rana1:
outvalue "ran1amp", 0.001 + 0.199 * kval
goto next

Ranr1:
outvalue "ran1vel", 0.001 + 3.99 * kval
goto next

Voi:
outvalue "vox", 1.0 + 7.0 * kval
goto next

Rev1:
outvalue "REVSEND1",  kval
goto next

step:
outvalue "knob154", 1.0 + 8.0 * kval
goto next

Focus:
outvalue "band", 0.001 + 99.999 * kval
goto next

LongShort:
outvalue "dur", 0.2 + 2.8 * kval
goto next

FastSlow:
outvalue "rate", 0.1 + 0.4 * kval
goto next

shape:
outvalue "SHAPE",  8 * kval
goto next

Xfade:
outvalue "XFADE",  kval
goto next

PadX2:
	outvalue "pad_X2", kval
goto next

Lev2:
	outvalue "Lev_2", kval
goto next

Fun2:
	outvalue "Fun_2", 1 + 7 * kval
goto next

Im2:
outvalue "indx2", 4 * kval
goto next

Rana2:
outvalue "ran2amp", 0.001 + 0.199 * kval
goto next

Ranr2:
outvalue "ran2vel", 0.001 + 3.99 * kval
goto next

Carmin:
outvalue "CAR_min", 1 + kval * 13
goto next

Carmax:
outvalue "CAR_max", 1 + kval * 13
goto next

Modmin:
outvalue "MOD_min", 1 + kval * 13
goto next

Modmax:
outvalue "MOD_max", 1 + kval * 13
goto next


Rev2:
outvalue "REVSEND2",  kval
goto next

Volume:
outvalue "over",  kval



next:

turnoff

endin

;==========================================

instr 905


if gkinv_5 == 0 then
 kval  =  gkval_5 * gkcc5_lev
 else
 kval = (1 - gkval_5) * gkcc5_lev
endif


if 		gkMIDIVAR_5 == 1 goto Lev1
if 		gkMIDIVAR_5 == 2 goto PadX1
if 		gkMIDIVAR_5 == 3 goto PadY1
if 		gkMIDIVAR_5 == 4 goto Fun1
if 		gkMIDIVAR_5 == 5 goto Im1
if 		gkMIDIVAR_5 == 6 goto Atk1
if 		gkMIDIVAR_5 == 7 goto Rel1
if 		gkMIDIVAR_5 == 8 goto Rana1
if 		gkMIDIVAR_5 == 9 goto Ranr1
if 		gkMIDIVAR_5 == 10 goto Voi
if 		gkMIDIVAR_5 == 11 goto step
if 		gkMIDIVAR_5 == 12 goto Rev1
if 		gkMIDIVAR_5 == 13 goto Focus
if 		gkMIDIVAR_5 == 14 goto LongShort
if 		gkMIDIVAR_5 == 15 goto FastSlow
if 		gkMIDIVAR_5 == 16 goto shape
if 		gkMIDIVAR_5 == 17 goto Xfade
if 		gkMIDIVAR_5 == 18 goto PadX2
if 		gkMIDIVAR_5 == 19 goto Lev2
if 		gkMIDIVAR_5 == 20 goto Fun2
if 		gkMIDIVAR_5 == 21 goto Im2
if 		gkMIDIVAR_5 == 22 goto Rana2
if 		gkMIDIVAR_5 == 23 goto Ranr2
if 		gkMIDIVAR_5 == 24 goto Rev2
if 		gkMIDIVAR_5 == 25 goto Volume
if		gkMIDIVAR_5 == 26 goto Carmin
if		gkMIDIVAR_5 == 27 goto Carmax
if		gkMIDIVAR_5 == 28 goto Modmin
if		gkMIDIVAR_5 == 29 goto Modmax
goto next

Fun1:
	outvalue "Fun_1", 1 + 7 * kval
goto next

PadX1:
	outvalue "pad_X1", kval
goto next

PadY1:
	outvalue "pad_Y1", kval
goto next

Lev1:
	outvalue "Lev_1", kval
goto next

Im1:
outvalue "indx1", 4 * kval
goto next

Atk1:
outvalue "AT1", 0.005 + 0.85 * kval
goto next

Rel1:
outvalue "RE1", 0.005 + 0.85 * kval
goto next

Rana1:
outvalue "ran1amp", 0.001 + 0.199 * kval
goto next

Ranr1:
outvalue "ran1vel", 0.001 + 3.99 * kval
goto next

Voi:
outvalue "vox", 1.0 + 7.0 * kval
goto next

Rev1:
outvalue "REVSEND1",  kval
goto next

step:
outvalue "knob154", 1.0 + 8.0 * kval
goto next

Focus:
outvalue "band", 0.001 + 99.999 * kval
goto next

LongShort:
outvalue "dur", 0.2 + 2.8 * kval
goto next

FastSlow:
outvalue "rate", 0.1 + 0.4 * kval
goto next

shape:
outvalue "SHAPE",  8 * kval
goto next

Xfade:
outvalue "XFADE",  kval
goto next

PadX2:
	outvalue "pad_X2", kval
goto next

Lev2:
	outvalue "Lev_2", kval
goto next

Fun2:
	outvalue "Fun_2", 1 + 7 * kval
goto next

Im2:
outvalue "indx2", 4 * kval
goto next

Rana2:
outvalue "ran2amp", 0.001 + 0.199 * kval
goto next

Ranr2:
outvalue "ran2vel", 0.001 + 3.99 * kval
goto next

Carmin:
outvalue "CAR_min", 1 + kval * 13
goto next

Carmax:
outvalue "CAR_max", 1 + kval * 13
goto next

Modmin:
outvalue "MOD_min", 1 + kval * 13
goto next

Modmax:
outvalue "MOD_max", 1 + kval * 13
goto next


Rev2:
outvalue "REVSEND2",  kval
goto next

Volume:
outvalue "over",  kval



next:

turnoff

endin

;==========================================

instr 906

if gkinv_6 == 0 then
kval  =  gkval_6 * gkcc6_lev
else
kval = (1 - gkval_6) * gkcc6_lev
endif


if 		gkMIDIVAR_6 == 1 goto Lev1
if 		gkMIDIVAR_6 == 2 goto PadX1
if 		gkMIDIVAR_6 == 3 goto PadY1
if 		gkMIDIVAR_6 == 4 goto Fun1
if 		gkMIDIVAR_6 == 5 goto Im1
if 		gkMIDIVAR_6 == 6 goto Atk1
if 		gkMIDIVAR_6 == 7 goto Rel1
if 		gkMIDIVAR_6 == 8 goto Rana1
if 		gkMIDIVAR_6 == 9 goto Ranr1
if 		gkMIDIVAR_6 == 10 goto Voi
if 		gkMIDIVAR_6 == 11 goto step
if 		gkMIDIVAR_6 == 12 goto Rev1
if 		gkMIDIVAR_6 == 13 goto Focus
if 		gkMIDIVAR_6 == 14 goto LongShort
if 		gkMIDIVAR_6 == 15 goto FastSlow
if 		gkMIDIVAR_6 == 16 goto shape
if 		gkMIDIVAR_6 == 17 goto Xfade
if 		gkMIDIVAR_6 == 18 goto PadX2
if 		gkMIDIVAR_6 == 19 goto Lev2
if 		gkMIDIVAR_6 == 20 goto Fun2
if 		gkMIDIVAR_6 == 21 goto Im2
if 		gkMIDIVAR_6 == 22 goto Rana2
if 		gkMIDIVAR_6 == 23 goto Ranr2
if 		gkMIDIVAR_6 == 24 goto Rev2
if 		gkMIDIVAR_6 == 25 goto Volume
if		gkMIDIVAR_6 == 26 goto Carmin
if		gkMIDIVAR_6 == 27 goto Carmax
if		gkMIDIVAR_6 == 28 goto Modmin
if		gkMIDIVAR_6 == 29 goto Modmax
goto next

Fun1:
	outvalue "Fun_1", 1 + 7 * kval
goto next

PadX1:
	outvalue "pad_X1", kval
goto next

PadY1:
	outvalue "pad_Y1", kval
goto next

Lev1:
	outvalue "Lev_1", kval
goto next

Im1:
outvalue "indx1", 4 * kval
goto next

Atk1:
outvalue "AT1", 0.005 + 0.85 * kval
goto next

Rel1:
outvalue "RE1", 0.005 + 0.85 * kval
goto next

Rana1:
outvalue "ran1amp", 0.001 + 0.199 * kval
goto next

Ranr1:
outvalue "ran1vel", 0.001 + 3.99 * kval
goto next

Voi:
outvalue "vox", 1.0 + 7.0 * kval
goto next

Rev1:
outvalue "REVSEND1",  kval
goto next

step:
outvalue "knob154", 1.0 + 8.0 * kval
goto next

Focus:
outvalue "band", 0.001 + 99.999 * kval
goto next

LongShort:
outvalue "dur", 0.2 + 2.8 * kval
goto next

FastSlow:
outvalue "rate", 0.1 + 0.4 * kval
goto next

shape:
outvalue "SHAPE",  8 * kval
goto next

Xfade:
outvalue "XFADE",  kval
goto next

PadX2:
	outvalue "pad_X2", kval
goto next

Lev2:
	outvalue "Lev_2", kval
goto next

Fun2:
	outvalue "Fun_2", 1 + 7 * kval
goto next

Im2:
outvalue "indx2", 4 * kval
goto next

Rana2:
outvalue "ran2amp", 0.001 + 0.199 * kval
goto next

Ranr2:
outvalue "ran2vel", 0.001 + 3.99 * kval
goto next

Carmin:
outvalue "CAR_min", 1 + kval * 13
goto next

Carmax:
outvalue "CAR_max", 1 + kval * 13
goto next

Modmin:
outvalue "MOD_min", 1 + kval * 13
goto next

Modmax:
outvalue "MOD_max", 1 + kval * 13
goto next


Rev2:
outvalue "REVSEND2",  kval
goto next

Volume:
outvalue "over",  kval



next:

turnoff

endin

;==========================================

instr 907

if gkinv_7 == 0 then
kval  =  gkval_7 * gkcc7_lev
else
kval = (1 - gkval_7) * gkcc7_lev
endif


if 		gkMIDIVAR_7 == 1 goto Lev1
if 		gkMIDIVAR_7 == 2 goto PadX1
if 		gkMIDIVAR_7 == 3 goto PadY1
if 		gkMIDIVAR_7 == 4 goto Fun1
if 		gkMIDIVAR_7 == 5 goto Im1
if 		gkMIDIVAR_7 == 6 goto Atk1
if 		gkMIDIVAR_7 == 7 goto Rel1
if 		gkMIDIVAR_7 == 8 goto Rana1
if 		gkMIDIVAR_7 == 9 goto Ranr1
if 		gkMIDIVAR_7 == 10 goto Voi
if 		gkMIDIVAR_7 == 11 goto step
if 		gkMIDIVAR_7 == 12 goto Rev1
if 		gkMIDIVAR_7 == 13 goto Focus
if 		gkMIDIVAR_7 == 14 goto LongShort
if 		gkMIDIVAR_7 == 15 goto FastSlow
if 		gkMIDIVAR_7 == 16 goto shape
if 		gkMIDIVAR_7 == 17 goto Xfade
if 		gkMIDIVAR_7 == 18 goto PadX2
if 		gkMIDIVAR_7 == 19 goto Lev2
if 		gkMIDIVAR_7 == 20 goto Fun2
if 		gkMIDIVAR_7 == 21 goto Im2
if 		gkMIDIVAR_7 == 22 goto Rana2
if 		gkMIDIVAR_7 == 23 goto Ranr2
if 		gkMIDIVAR_7 == 24 goto Rev2
if 		gkMIDIVAR_7 == 25 goto Volume
if		gkMIDIVAR_7 == 26 goto Carmin
if		gkMIDIVAR_7 == 27 goto Carmax
if		gkMIDIVAR_7 == 28 goto Modmin
if		gkMIDIVAR_7 == 29 goto Modmax
goto next

Fun1:
	outvalue "Fun_1", 1 + 7 * kval
goto next

PadX1:
	outvalue "pad_X1", kval
goto next

PadY1:
	outvalue "pad_Y1", kval
goto next

Lev1:
	outvalue "Lev_1", kval
goto next

Im1:
outvalue "indx1", 4 * kval
goto next

Atk1:
outvalue "AT1", 0.005 + 0.85 * kval
goto next

Rel1:
outvalue "RE1", 0.005 + 0.85 * kval
goto next

Rana1:
outvalue "ran1amp", 0.001 + 0.199 * kval
goto next

Ranr1:
outvalue "ran1vel", 0.001 + 3.99 * kval
goto next

Voi:
outvalue "vox", 1.0 + 7.0 * kval
goto next

Rev1:
outvalue "REVSEND1",  kval
goto next

step:
outvalue "knob154", 1.0 + 8.0 * kval
goto next

Focus:
outvalue "band", 0.001 + 99.999 * kval
goto next

LongShort:
outvalue "dur", 0.2 + 2.8 * kval
goto next

FastSlow:
outvalue "rate", 0.1 + 0.4 * kval
goto next

shape:
outvalue "SHAPE",  8 * kval
goto next

Xfade:
outvalue "XFADE",  kval
goto next

PadX2:
	outvalue "pad_X2", kval
goto next

Lev2:
	outvalue "Lev_2", kval
goto next

Fun2:
	outvalue "Fun_2", 1 + 7 * kval
goto next

Im2:
outvalue "indx2", 4 * kval
goto next

Rana2:
outvalue "ran2amp", 0.001 + 0.199 * kval
goto next

Ranr2:
outvalue "ran2vel", 0.001 + 3.99 * kval
goto next

Carmin:
outvalue "CAR_min", 1 + kval * 13
goto next

Carmax:
outvalue "CAR_max", 1 + kval * 13
goto next

Modmin:
outvalue "MOD_min", 1 + kval * 13
goto next

Modmax:
outvalue "MOD_max", 1 + kval * 13
goto next


Rev2:
outvalue "REVSEND2",  kval
goto next

Volume:
outvalue "over",  kval



next:

turnoff

endin

;==========================================

instr 908

if gkinv_8 == 0 then
kval  =  gkval_8 * gkcc8_lev
else
kval = (1 - gkval_8) * gkcc8_lev
endif


if 		gkMIDIVAR_8 == 1 goto Lev1
if 		gkMIDIVAR_8 == 2 goto PadX1
if 		gkMIDIVAR_8 == 3 goto PadY1
if 		gkMIDIVAR_8 == 4 goto Fun1
if 		gkMIDIVAR_8 == 5 goto Im1
if 		gkMIDIVAR_8 == 6 goto Atk1
if 		gkMIDIVAR_8 == 7 goto Rel1
if 		gkMIDIVAR_8 == 8 goto Rana1
if 		gkMIDIVAR_8 == 9 goto Ranr1
if 		gkMIDIVAR_8 == 10 goto Voi
if 		gkMIDIVAR_8 == 11 goto step
if 		gkMIDIVAR_8 == 12 goto Rev1
if 		gkMIDIVAR_8 == 13 goto Focus
if 		gkMIDIVAR_8 == 14 goto LongShort
if 		gkMIDIVAR_8 == 15 goto FastSlow
if 		gkMIDIVAR_8 == 16 goto shape
if 		gkMIDIVAR_8 == 17 goto Xfade
if 		gkMIDIVAR_8 == 18 goto PadX2
if 		gkMIDIVAR_8 == 19 goto Lev2
if 		gkMIDIVAR_8 == 20 goto Fun2
if 		gkMIDIVAR_8 == 21 goto Im2
if 		gkMIDIVAR_8 == 22 goto Rana2
if 		gkMIDIVAR_8 == 23 goto Ranr2
if 		gkMIDIVAR_8 == 24 goto Rev2
if 		gkMIDIVAR_8 == 25 goto Volume
if		gkMIDIVAR_8 == 26 goto Carmin
if		gkMIDIVAR_8 == 27 goto Carmax
if		gkMIDIVAR_8 == 28 goto Modmin
if		gkMIDIVAR_8 == 29 goto Modmax
goto next

Fun1:
	outvalue "Fun_1", 1 + 7 * kval
goto next

PadX1:
	outvalue "pad_X1", kval
goto next

PadY1:
	outvalue "pad_Y1", kval
goto next

Lev1:
	outvalue "Lev_1", kval
goto next

Im1:
outvalue "indx1", 4 * kval
goto next

Atk1:
outvalue "AT1", 0.005 + 0.85 * kval
goto next

Rel1:
outvalue "RE1", 0.005 + 0.85 * kval
goto next

Rana1:
outvalue "ran1amp", 0.001 + 0.199 * kval
goto next

Ranr1:
outvalue "ran1vel", 0.001 + 3.99 * kval
goto next

Voi:
outvalue "vox", 1.0 + 7.0 * kval
goto next

Rev1:
outvalue "REVSEND1",  kval
goto next

step:
outvalue "knob154", 1.0 + 8.0 * kval
goto next

Focus:
outvalue "band", 0.001 + 99.999 * kval
goto next

LongShort:
outvalue "dur", 0.2 + 2.8 * kval
goto next

FastSlow:
outvalue "rate", 0.1 + 0.4 * kval
goto next

shape:
outvalue "SHAPE",  8 * kval
goto next

Xfade:
outvalue "XFADE",  kval
goto next

PadX2:
	outvalue "pad_X2", kval
goto next

Lev2:
	outvalue "Lev_2", kval
goto next

Fun2:
	outvalue "Fun_2", 1 + 7 * kval
goto next

Im2:
outvalue "indx2", 4 * kval
goto next

Rana2:
outvalue "ran2amp", 0.001 + 0.199 * kval
goto next

Ranr2:
outvalue "ran2vel", 0.001 + 3.99 * kval
goto next

Carmin:
outvalue "CAR_min", 1 + kval * 13
goto next

Carmax:
outvalue "CAR_max", 1 + kval * 13
goto next

Modmin:
outvalue "MOD_min", 1 + kval * 13
goto next

Modmax:
outvalue "MOD_max", 1 + kval * 13
goto next


Rev2:
outvalue "REVSEND2",  kval
goto next

Volume:
outvalue "over",  kval



next:

turnoff

endin

;==========================================

; MKG instr 911; Not Used

;event "i", 12, 0, 1

;turnoff

; MKG endin

;==========================================

instr 900;-----> REVERB

ainL = gaREVL
ainR = gaREVR
denorm ainL
denorm ainR
;arevL, arevR 	freeverb  ainL, ainR, gkROOM, gkHF

arevL, arevR reverbsc ainL, ainR, gkROOM*0.98, gkHF * sr/2
outs arevL*gkREVLEV, arevR*gkREVLEV	;  Audio to DAC -  REVERB out 	

gaREVREC_L = arevL*gkREVLEV
gaREVREC_R = arevR*gkREVLEV

gaREVL= 0
gaREVR = 0
endin

;========================================

instr 997 ;-----> VU-METER

asigL = gaMETER_L
asigR = gaMETER_R

krmsL rms asigL
krmsR rms asigR

krmsL_LOG10  =  log(krmsL)
krmsR_LOG10  =  log(krmsR)
;outvalue "DISPLAY", krmsL_LOG10 * 20 * 0.003
outvalue "rms_L", krmsL_LOG10 * 20 * 0.006
outvalue "rms_R", krmsR_LOG10 * 20 * 0.006
gaMETER_L = 0
gaMETER_R = 0
endin

;=======================================

instr 998 ;-----> FFT

kfft_onoff invalue "fftONOFF"
if kfft_onoff != 0 then
 outvalue "disptab", 82
 asig = gaFFT
 dispfft asig,0.3,512, 1
 gaFFT = 0
endif

;asig = gaFFT
; dispfft asig,0.3,512, 1
 ;gaFFT = 0
endin

;========================================

instr 950   ;-----> Timer
ilamp init 1
isign init 1
isecs init -1
imins init 0
kval_secs init 0
kval_mins init 0
;print isecs,imins

reset:
isign = -isign
 

ilamp = (ilamp + isign)
ineglamp = 1 - ilamp
;print ilamp, ineglamp

isecs = isecs + 1
if isecs != 60 igoto norm
imins = imins + 1
isecs = 0
norm:

timout 0,1,next
reinit reset
next:
kval_secs = isecs
kval_mins = imins


outvalue "secs", kval_secs
outvalue "mins", kval_mins
outvalue "led_TIMER1", ilamp
outvalue "led_TIMER2", ineglamp




if gksw5 != 0 kgoto on
turnoff
on:
endin

;==========================================

instr 960;-----> RECORD File wav

kdatares invalue "_datares"  ; select bit depth for audio saved data
idatares = i(kdatares)
if idatares == 0 then
 itype = 0						; 16 bit integer  	(code 14)
 elseif idatares == 1 then
 itype = 4						; 24 bit integer  	(code 18)
 else
 itype = 1						; 32 bit float		(code 15)
endif


Sfile	invalue "_Browse3"		; Browse the file to save in

outvalue "LED_WRITE", 1
irectime = abs(i(gkrectime) * p3)
p3 = irectime


k1 			timeinsts

go:

icurrent_type =  14+itype

fout Sfile, icurrent_type, gaWRITE_L+gaREVREC_L, gaWRITE_R+gaREVREC_R   ; save stereo audio data

gaWRITE_L = 0
gaWRITE_R = 0

gaREVREC_L = 0
gaREVREC_R = 0


  			outvalue "DisplayTime", k1
			outvalue "rectimedisp", k1/p3

endin

;==========================================

instr 961;-----> Manage Led Record File

outvalue "LED_WRITE",0
turnoff2 960, 0,0
endin

;==========================================

instr 970  ;-----> THE SEQUENCER
icont init 0

event_i "i", 977, 0, 1
event_i "i", 975, 0, 3600

event_i "i", 978, 0, 3600


imetronome = i(gkmetronome)
giSEQ = 1						; set sequencer flag active (= 1)
outvalue "ledseq", 1
iaddress init -5				; start pointer 4 location before first descriptor element
seq:

icont = icont + 1
;print icont
if icont == gimaxindex then
giSEQ = 0
outvalue "ledseq", 0
outvalue "ledton",0

turnoff
else
endif

iaddress = iaddress + 5		; increment pointer



giSEQ = 1

;print giDEBUG_01

iTon  	tab_i iaddress + 1, 900   ; read 2nd element..(tempo di ON prima della transizione)
giPrn  	tab_i iaddress + 2, 900	; read 3rd element..(snapshot)
giTtran	tab_i iaddress + 3, 900	; read 4th element..(tempo  transizione)
giMode		tab_i iaddress + 4, 900
outvalue "Get",giPrn-1
outvalue "TYPE", giMode

iTon = iTon / imetronome
giTtran = giTtran / imetronome

schedule 91, iTon, 3600


isumtime = giTtran + 0.001 + iTon

if iTon > 0 then
outvalue "ledton", 1
else
outvalue "ledton", 0
endif

timout 0, isumtime, wait
                      
reinit seq

                   
wait:

imetronome = i(gkmetronome)

endin

;==========================================

instr 971 ;-----> Halt sequencer

giSEQ = 0
outvalue "ledseq",0
outvalue "ledon", 0
outvalue "seqblink", 0
turnoff2 970,0,0
turnoff2 92,0,0
turnoff2 91,0,0
turnoff2 975,0,0
turnoff
endin

;==========================================

instr 972 ;-----> Load Sequence

Sfile	invalue "_Browse2"
;ftload "/Users/eg/Documents/QuteCSEX/stria/sequencesave.txt", 1, 900
ftload Sfile, 1, 900
schedule 974, 0, 3600
schedule 977, 0, 1
turnoff2 978, 0, 0
endin

;==========================================
instr 973 ;-----> Save Sequence

Sfile	invalue "_Browse2"

;ftsave "/Users/eg/Documents/QuteCSEX/stria/sequencesave.txt", 1, 901
ftsave Sfile, 1, 900
turnoff
endin

;==========================================
instr 974
index init 0
start:

;print index
iend 		tab_i index*5, 900		 ; read 1st element of descriptor iaddress-th  (flag di ultimo elemento)

index = index + 1
if iend !=0 igoto stop

igoto start

stop:

gimaxindex = index - 1
;print gimaxindex
turnoff

endin

;==========================================
instr 975;-----> Blink red led during sequence

kblink oscil 1, 2, 902
outvalue "seqblink", kblink
endin

;==========================================
instr 976;----->Read sequencer data (after file load)

kindex	invalue "readindex"


reset:

index =		i(kindex)* 5
;print index



iend 		tab_i index, 900		 ; read 1st element of descriptor iaddress-th  (flag di ultimo elemento)
iton  		tab_i index + 1, 900   ; read 2nd element..(tempo di ON prima della transizione)
isnap  	    tab_i index + 2, 900	; read 3rd element..(snapshot)
ittran		tab_i index + 3, 900	; read 4th element..(tempo  transizione)
itype		tab_i index + 4, 900




outvalue "readend", iend
outvalue "readton", iton
outvalue "readsnap", isnap
outvalue "readttran", ittran
outvalue "readtype", itype


timout 0, 0.2, nop
reinit reset

nop:

endin

;==========================================
instr 977 ;  ------>  Evaluate total time sequence
gitot_TIME init 0
imetronome = i(gkmetronome)
;print imetronome

index  init 0
repeat:

iHOLD_index =  (5*index) + 1
iMORPH_index = (5*index) + 3

i_HOLD_TIME tab_i iHOLD_index , 900
i_MORPH_TIME tab_i iMORPH_index, 900 
;print i_HOLD_TIME, i_MORPH_TIME

gitot_TIME = (gitot_TIME + i_HOLD_TIME + i_MORPH_TIME)
;print i_HOLD_TIME, i_MORPH_TIME, gitot_TIME

;print index, iHOLD_index, iMORPH_index
loop_le index, 1, gimaxindex-1, repeat
gitot_TIME = gitot_TIME / imetronome
outvalue "seq_tot_time",gitot_TIME
;print  gitot_TIME



turnoff
endin



instr 978  ; ; ------>  Manage sequencer time laps

print gitot_TIME
kSEQ = giSEQ


ktime timeinsts

ktimeline = ktime/gitot_TIME

outvalue "timelaps", ktime
outvalue "timeline", ktimeline
if (ktime >= gitot_TIME + 0.2 || kSEQ == 0)  then

schedkwhen 1, 0, 1, 971, 0, 1 
turnoff2 975,0,0
outvalue "timelaps", gitot_TIME

turnoff
endif


endin




;==========================================

instr 980 ; ------> Add Element (Build sequence)

kindex	invalue "readindex"
iindex = i(kindex)
in_index 		=	iindex * 5

in_readend 		= 	i(gkin_readend)
in_readton 		= 	i(gkin_readton)
in_readsnap		=	i(gkin_readsnap)
in_readtran		= 	i(gkin_readtran)
in_readtype		= 	i(gkin_readtype)

print in_index, in_readend, in_readton, in_readsnap, in_readtran, in_readtype


tableiw  in_readend, in_index ,900
tableiw  in_readton, in_index  + 1, 900
tableiw  in_readsnap,in_index  + 2, 900
tableiw  in_readtran,in_index  + 3, 900
tableiw  in_readtype,in_index  + 4, 900

event_i "i", 977,0,1
turnoff
endin

;==========================================
instr 981  ;  ------> Delete Element
kindex	invalue "readindex"
iindex = i(kindex)
iindex = iindex - 1
again:

iindex = iindex+1

in_index 		=	iindex * 5

inext_index = (iindex + 1)* 5

iend 	    tab_i inext_index, 900		; 
iton  	    tab_i inext_index + 1, 900   ; 
isnap  	    tab_i inext_index + 2, 900	; 
ittran		tab_i inext_index + 3, 900	; 
itype		tab_i inext_index + 4, 900

tableiw  iend,    in_index ,900
tableiw  iton,    in_index  + 1, 900
tableiw  isnap,   in_index  + 2, 900
tableiw  ittran,  in_index  + 3, 900
tableiw  itype,   in_index  + 4, 900

print iend, iton, isnap, ittran, itype

if iend == 0 igoto again

event_i "i", 977,0,1 
turnoff 

endin




;==========================================
instr 982 ; ------>   Insert Element
kindex	invalue "readindex"
iindex = i(kindex)
iorig_index = iindex
in_index = iindex * 5

iend tab_i iindex * 5, 900 

;print iend

in_readend 		= 	i(gkin_readend)
in_readton 		= 	i(gkin_readton)
in_readsnap		=	i(gkin_readsnap)
in_readtran		= 	i(gkin_readtran)
in_readtype		= 	i(gkin_readtype)

if iend ==0 igoto loop


;print in_readend, in_readton

tableiw  in_readend,    in_index ,900
tableiw  in_readton,    in_index  + 1, 900
tableiw  in_readsnap,   in_index  + 2, 900
tableiw  in_readtran,   in_index  + 3, 900
tableiw  in_readtype,   in_index  + 4, 900


;Find an 1 in the first element
loop:
iindex = iindex + 1
in_index = iindex * 5

iend tab_i in_index, 900

print iindex,iend
if iend == 0 goto loop

print iindex, in_index

loop1:
iindex = iindex -1
in_index = iindex * 5
 
 
iend 	    tab_i in_index, 900		 ; 
iton  	    tab_i in_index + 1, 900   ; 
isnap  	    tab_i in_index + 2, 900	; 
ittran	    tab_i in_index + 3, 900	; 
itype      tab_i in_index + 4, 900

in_index = in_index + 5

tableiw  iend,    in_index ,900
tableiw  iton,    in_index  + 1, 900
tableiw  isnap,   in_index  + 2, 900
tableiw  ittran,  in_index  + 3, 900
tableiw  itype,   in_index  + 4, 900

if iindex != iorig_index igoto loop1

in_index = iorig_index * 5

;print in_readend,in_readton,in_readsnap,in_readtran,in_readtype,  in_index

tableiw   in_readend,  in_index, 900
tableiw   in_readton,  in_index  + 1, 900
tableiw   in_readsnap, in_index  + 2, 900	
tableiw   in_readtran, in_index  + 3, 900	
tableiw   in_readtype, in_index  + 4, 900	

event_i "i", 977,0,1 
turnoff
endin
</CsInstruments>
<CsScore>

f9  	0 8 -2 1 2 3 4 5 6 7 8	; Contains the numbers of tables affected by ftmorf
f10		0 16384 10 1			; Morph table
f11 	0 16 -2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0


f300	0 2048 -2 0  			;Contains pitch grid generated from GUI
f301	0 2048 -2 0			    ;A copy of f300
f302	0 2048 -2 0			    ;Contains pitch grid after a snap read
f303	0  2   -2  301 302 	;List

f701  	0  2   -2  703 704	;Contains the list of tables for snap morphing  (2 tables)
f702  	0  64  10  1			; Morph table (don't care initial content)
f703  	0  64  -2  0  		    ; 1st table
f704  	0  64  -2  0			; 2nd table

f800 0   32 7 1 15 1 1 -1 15 -1
;             y/n On  Prn  Tt
f900 0 512 -7 1 512 1
f901 0 512 -2 0
;MKG f902 0 512 -2 0

f902 0 512 7 1 128 1 0 0 384 0
;-------------------------------------------------

i 1 0 36000
i 4 0 36000

i 9 0 -1
i 60 0 36000

i 600 0 36000


i 801 0 36000
i 802 0 36000
i 803 0 36000
i 804 0 36000
i 805 0 36000
i 806 0 36000
i 807 0 36000
i 808 0 36000


i 900 0 36000
i 976 0 36000

i 997 0 36000
i 998 0 36000
e
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>43</x>
 <y>125</y>
 <width>1502</width>
 <height>925</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>92</r>
  <g>126</g>
  <b>166</b>
 </bgcolor>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>387</x>
  <y>351</y>
  <width>377</width>
  <height>75</height>
  <uuid>{61264b23-81c4-4638-8132-d2fd1323b864}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>112</r>
   <g>135</g>
   <b>143</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>3</x>
  <y>42</y>
  <width>382</width>
  <height>820</height>
  <uuid>{fc7d52f7-0833-4f1e-b03c-093d233b237e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>51</r>
   <g>51</g>
   <b>51</b>
  </color>
  <bgcolor mode="background">
   <r>41</r>
   <g>103</g>
   <b>154</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>766</x>
  <y>641</y>
  <width>318</width>
  <height>221</height>
  <uuid>{f9f9497a-066e-411f-957e-1fedda6c07dd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Helvetica</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>67</r>
   <g>94</g>
   <b>128</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>387</x>
  <y>682</y>
  <width>377</width>
  <height>180</height>
  <uuid>{0df9a44f-4ebd-4c8e-adba-c2a15ace3bfd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Helvetica</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>1</r>
   <g>143</g>
   <b>194</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>Lev_1</objectName>
  <x>67</x>
  <y>750</y>
  <width>19</width>
  <height>71</height>
  <uuid>{b29f897e-ff40-41dc-808b-ec16b72c1e03}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.59968677</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>pad_X1</objectName>
  <x>11</x>
  <y>553</y>
  <width>128</width>
  <height>128</height>
  <uuid>{ca339ec4-5284-43c2-a15b-eca1d7a653a3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>pad_Y1</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.34400000</xValue>
  <yValue>0.75098814</yValue>
  <type>point</type>
  <pointsize>10</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>102</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>pad_X2</objectName>
  <x>243</x>
  <y>552</y>
  <width>128</width>
  <height>128</height>
  <uuid>{ff7fdf48-351a-465e-a494-8562d5822b8e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>pad_Y2</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.10552092</xValue>
  <yValue>0.92187500</yValue>
  <type>point</type>
  <pointsize>10</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>128</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>_ON1</objectName>
  <x>2</x>
  <y>382</y>
  <width>127</width>
  <height>31</height>
  <uuid>{41af202e-8d03-47a4-ac49-d45130e3ecb6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>On/Off#1</text>
  <image>/</image>
  <eventLine>i2 0 1 1</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>_RAND1</objectName>
  <x>1</x>
  <y>351</y>
  <width>127</width>
  <height>31</height>
  <uuid>{bda0bdb3-2374-49ae-82b2-e3465c8a3fd2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>0.00000000</pressedValue>
  <stringvalue/>
  <text>Rand_1</text>
  <image>/</image>
  <eventLine>i2 0 -1 3</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>ran1vel</objectName>
  <x>4</x>
  <y>328</y>
  <width>128</width>
  <height>17</height>
  <uuid>{c91cc871-1836-4acf-ba84-166f57600abb}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.01000000</minimum>
  <maximum>4.00000000</maximum>
  <value>0.19703100</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>ran1amp</objectName>
  <x>5</x>
  <y>293</y>
  <width>128</width>
  <height>17</height>
  <uuid>{025202fe-0871-4fd5-83a3-8b4b39439681}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00100000</minimum>
  <maximum>0.20000000</maximum>
  <value>0.04453100</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>indx1</objectName>
  <x>117</x>
  <y>750</y>
  <width>20</width>
  <height>72</height>
  <uuid>{b24326ee-b2e7-4114-b7d7-3ee4ac7f8424}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>4.00000000</maximum>
  <value>0.83333333</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>slider25</objectName>
  <x>-1684370995</x>
  <y>-1632653275</y>
  <width>128</width>
  <height>17</height>
  <uuid>{a4040c5c-7782-4032-ab10-2b6e55169af9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.36718800</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>_ON2</objectName>
  <x>234</x>
  <y>382</y>
  <width>127</width>
  <height>31</height>
  <uuid>{ef32a9a3-d053-47ba-971d-cf3e814341ec}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>On/Off#2</text>
  <image>/</image>
  <eventLine>i2 0 -1 2</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>Rand_2</objectName>
  <x>234</x>
  <y>347</y>
  <width>127</width>
  <height>31</height>
  <uuid>{e8870e05-5ee3-4a34-91b5-82af8f1103b6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Rand_2</text>
  <image>/</image>
  <eventLine>i2 0 -1 4</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>Rand_1</objectName>
  <x>-1684370995</x>
  <y>-1632653259</y>
  <width>127</width>
  <height>31</height>
  <uuid>{f4ecdd29-59f7-4274-9594-4ab663283f16}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Rand_1</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>hor98</objectName>
  <x>-1684370793</x>
  <y>-1632653247</y>
  <width>29</width>
  <height>10</height>
  <uuid>{c1d73d2a-c55d-41f1-beea-d72617cbbebc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert98</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.70000000</xValue>
  <yValue>0.07500000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>234</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>Lev_1</objectName>
  <x>55</x>
  <y>724</y>
  <width>50</width>
  <height>22</height>
  <uuid>{63f996fb-28d1-4fa4-b9a9-12455b324109}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.600</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName/>
  <x>126</x>
  <y>68</y>
  <width>197</width>
  <height>25</height>
  <uuid>{1c5835d1-a5b3-4955-870a-58e57c86241d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Focused-----------------Diffuse</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>204</r>
   <g>255</g>
   <b>102</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName/>
  <x>126</x>
  <y>113</y>
  <width>197</width>
  <height>25</height>
  <uuid>{269cba8d-d5a2-47d8-9ab0-c33c027bacbb}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Long ---------------------Short</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>204</r>
   <g>255</g>
   <b>102</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>rate</objectName>
  <x>126</x>
  <y>137</y>
  <width>197</width>
  <height>23</height>
  <uuid>{aa6771a6-2a4e-4510-b5d8-db97dec7c1a2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.17000000</minimum>
  <maximum>0.50000000</maximum>
  <value>0.27892755</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName/>
  <x>126</x>
  <y>159</y>
  <width>197</width>
  <height>25</height>
  <uuid>{bfe8f970-0be0-42c5-8947-1d58f37f7941}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Fast -----------------------Slow</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>204</r>
   <g>255</g>
   <b>102</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>SHAPE</objectName>
  <x>247</x>
  <y>204</y>
  <width>120</width>
  <height>22</height>
  <uuid>{067f5083-a238-490a-aa22-6ac18c48de7e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>FLAT</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> 1-->0  Ramp</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>0-->1 Ramp</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>1-->0 Log</name>
    <value>3</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>0-->1 Log</name>
    <value>4</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>1-->0 Exp</name>
    <value>5</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>0 -->1 Exp</name>
    <value>6</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>V-Shape</name>
    <value>7</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>Inv. V-Shape</name>
    <value>8</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>1</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>387</x>
  <y>42</y>
  <width>377</width>
  <height>224</height>
  <uuid>{77bea759-a707-4684-9f3a-43a63b437574}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>128</r>
   <g>128</g>
   <b>128</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>ratio</objectName>
  <x>407</x>
  <y>92</y>
  <width>18</width>
  <height>142</height>
  <uuid>{38874f56-ab5d-4128-baf3-d4b0a769e682}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.01100000</minimum>
  <maximum>2.00000000</maximum>
  <value>1.01100000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName/>
  <x>386</x>
  <y>237</y>
  <width>64</width>
  <height>21</height>
  <uuid>{da58cd1f-d781-43a9-8450-a6cb21b2ae98}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>USER RATIO</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName/>
  <x>464</x>
  <y>141</y>
  <width>46</width>
  <height>22</height>
  <uuid>{b160e134-36e7-4212-abd9-8057d6813835}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>DEN</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName/>
  <x>462</x>
  <y>88</y>
  <width>46</width>
  <height>22</height>
  <uuid>{0f0c81c9-5182-4bd3-83d7-c830cbe31f7d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>NUM</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName/>
  <x>535</x>
  <y>237</y>
  <width>85</width>
  <height>24</height>
  <uuid>{bd8f2f46-2d4b-411f-8f69-9cc79e4fc2ee}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>FREQ_REF(Hz)</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>_GEO</objectName>
  <x>624</x>
  <y>63</y>
  <width>134</width>
  <height>28</height>
  <uuid>{9422b830-28f5-473d-bafd-6e348a4a1ed1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Create GEOMETRIC</text>
  <image>/</image>
  <eventLine>i10 0 -1</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>last_freq</objectName>
  <x>660</x>
  <y>111</y>
  <width>73</width>
  <height>22</height>
  <uuid>{a387cb10-71d5-4181-98ae-8011874f304d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>22233.261</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName/>
  <x>661</x>
  <y>137</y>
  <width>72</width>
  <height>22</height>
  <uuid>{244dda06-e003-4f29-88da-6774d53ae4fa}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Last_FREQ</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>max_index</objectName>
  <x>662</x>
  <y>162</y>
  <width>71</width>
  <height>22</height>
  <uuid>{e5ebcc8d-6a14-4492-90ad-e22dc6197a76}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>612.000</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName/>
  <x>666</x>
  <y>188</y>
  <width>65</width>
  <height>22</height>
  <uuid>{0777b626-ea29-4a06-b12c-b606779199ba}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>#of_FREQS</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>766</x>
  <y>42</y>
  <width>318</width>
  <height>224</height>
  <uuid>{d73ddad6-3fe8-4529-8278-783e1f8cb64b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>128</r>
   <g>128</g>
   <b>128</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>ffund</objectName>
  <x>809</x>
  <y>93</y>
  <width>21</width>
  <height>144</height>
  <uuid>{1cb850d5-6712-40cb-875c-b913663e2d7f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>400.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>782</x>
  <y>241</y>
  <width>79</width>
  <height>21</height>
  <uuid>{69bfeaa3-63d1-4c1c-af62-cc4f0076a931}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>FUND FREQ (Hz)</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>menu146</objectName>
  <x>926223910</x>
  <y>1029660209</y>
  <width>10</width>
  <height>83</height>
  <uuid>{d52e180f-83d2-4592-9eb4-987b9d0ca846}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>UP</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> DOWN</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>0</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>exp</objectName>
  <x>872</x>
  <y>93</y>
  <width>20</width>
  <height>142</height>
  <uuid>{6bd2c929-36bc-4380-a304-5db26a5f96b9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>-0.01000000</minimum>
  <maximum>0.01000000</maximum>
  <value>0.00028200</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>862</x>
  <y>241</y>
  <width>55</width>
  <height>21</height>
  <uuid>{6515965c-f436-468b-b0f2-7347cd787709}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>INHARM</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>maxharm</objectName>
  <x>1002</x>
  <y>149</y>
  <width>61</width>
  <height>24</height>
  <uuid>{3a9fccd1-f28e-4731-9bbd-ff6d0b46970b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>1.00000000</resolution>
  <minimum>1</minimum>
  <maximum>40</maximum>
  <randomizable group="0">false</randomizable>
  <value>36</value>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName/>
  <x>954</x>
  <y>58</y>
  <width>126</width>
  <height>27</height>
  <uuid>{dd81d472-15c7-46fe-a2ba-79e0844243b3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Create HARMONIC</text>
  <image>/</image>
  <eventLine>i12 0 -1</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>996</x>
  <y>176</y>
  <width>72</width>
  <height>21</height>
  <uuid>{ecbd576b-7572-437c-b149-bf20fe8df334}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>#of FREQS</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1087</x>
  <y>42</y>
  <width>342</width>
  <height>224</height>
  <uuid>{fa784921-a774-48ae-bdf5-aff54933cd95}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>84</r>
   <g>120</g>
   <b>116</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1086</x>
  <y>268</y>
  <width>344</width>
  <height>160</height>
  <uuid>{1193ada3-1abf-49d6-8846-aa21b454804d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>127</r>
   <g>139</g>
   <b>128</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1086</x>
  <y>430</y>
  <width>344</width>
  <height>431</height>
  <uuid>{c25eaef7-b44a-46e7-abe7-ac082545efd9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>77</r>
   <g>96</g>
   <b>115</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>Get</objectName>
  <x>1219</x>
  <y>771</y>
  <width>80</width>
  <height>24</height>
  <uuid>{5819a833-4b1f-4749-8010-d09c4297fb29}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>01</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>02</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>03</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>04</name>
    <value>3</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>05</name>
    <value>4</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>06</name>
    <value>5</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>07</name>
    <value>6</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>08</name>
    <value>7</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>09</name>
    <value>8</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>10</name>
    <value>9</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>11</name>
    <value>10</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>12</name>
    <value>11</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>13</name>
    <value>12</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>14</name>
    <value>13</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>15</name>
    <value>14</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>16</name>
    <value>15</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>17</name>
    <value>16</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>18</name>
    <value>17</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>19</name>
    <value>18</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>20</name>
    <value>19</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>21</name>
    <value>20</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>22</name>
    <value>21</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>23</name>
    <value>22</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>24</name>
    <value>23</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>25</name>
    <value>24</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>26</name>
    <value>25</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>27</name>
    <value>26</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>28</name>
    <value>27</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>29</name>
    <value>28</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>30</name>
    <value>29</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>31</name>
    <value>30</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>32</name>
    <value>31</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>33</name>
    <value>32</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>34</name>
    <value>33</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>35</name>
    <value>34</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>36</name>
    <value>35</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>37</name>
    <value>36</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>38</name>
    <value>37</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>39</name>
    <value>38</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>40</name>
    <value>39</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>41</name>
    <value>40</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>42</name>
    <value>41</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>43</name>
    <value>42</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>44</name>
    <value>43</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>45</name>
    <value>44</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>46</name>
    <value>45</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>47</name>
    <value>46</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>48</name>
    <value>47</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>34</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>write_snap</objectName>
  <x>1105</x>
  <y>742</y>
  <width>100</width>
  <height>30</height>
  <uuid>{23cc8f64-2a6c-45c3-bc39-8f4a808e7b16}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>WRITE SNAP</text>
  <image>/</image>
  <eventLine>i100 0 3600</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>read_snap</objectName>
  <x>1312</x>
  <y>742</y>
  <width>100</width>
  <height>30</height>
  <uuid>{aac24853-d844-4e19-8b8a-67108c215dae}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>READ SNAP</text>
  <image>/</image>
  <eventLine>i91 0 3600</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>button1</objectName>
  <x>1104</x>
  <y>799</y>
  <width>102</width>
  <height>23</height>
  <uuid>{7294b8dd-f8db-48ad-ae45-8fa3aebd4a70}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>SAVE BANK</text>
  <image>/</image>
  <eventLine>i300 0 10</eventLine>
  <latch>false</latch>
  <latched>true</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>button1</objectName>
  <x>1310</x>
  <y>796</y>
  <width>101</width>
  <height>29</height>
  <uuid>{d389237f-49e9-43e1-b725-dfbf9076b4f7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>LOAD BANK</text>
  <image>/</image>
  <eventLine>i301 0 10</eventLine>
  <latch>false</latch>
  <latched>true</latched>
 </bsbObject>
 <bsbObject type="BSBLineEdit" version="2">
  <objectName>_Browse1</objectName>
  <x>1091</x>
  <y>831</y>
  <width>329</width>
  <height>23</height>
  <uuid>{57a14cba-5a31-46a2-8812-4527bd244cdd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>/Users/eug/Desktop/StriaEXMP/EXMP_IMPRO.txt</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>232</r>
   <g>232</g>
   <b>232</b>
  </bgcolor>
  <background>nobackground</background>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>CAR_min</objectName>
  <x>1099</x>
  <y>286</y>
  <width>50</width>
  <height>22</height>
  <uuid>{779bd783-4f70-48e6-b257-c27bb7323ed9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>1.000</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1098</x>
  <y>386</y>
  <width>59</width>
  <height>21</height>
  <uuid>{429529ec-6b3b-4288-a24a-2632e33ac74f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>CAR Min</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>CAR_max</objectName>
  <x>1159</x>
  <y>287</y>
  <width>50</width>
  <height>22</height>
  <uuid>{43c84062-ea57-4457-b8b4-d5247404f64d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>3.275</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1156</x>
  <y>386</y>
  <width>64</width>
  <height>21</height>
  <uuid>{fca1280b-2fe3-4469-9cc4-3f5a504af1a8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>CAR Max</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>64</r>
   <g>0</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>MOD_min</objectName>
  <x>1318</x>
  <y>307</y>
  <width>18</width>
  <height>80</height>
  <uuid>{aac066de-93ed-498c-ae63-41072fec5f90}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>13.00000000</maximum>
  <value>1.15000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>MOD_min</objectName>
  <x>1301</x>
  <y>286</y>
  <width>50</width>
  <height>22</height>
  <uuid>{e41fa2ef-ca07-4879-aaef-f4a235bda239}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>1.150</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1293</x>
  <y>386</y>
  <width>62</width>
  <height>22</height>
  <uuid>{c1e17a05-18fa-44fd-8ae3-ba6f5c10a81d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>MOD Min</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>MOD_max</objectName>
  <x>1377</x>
  <y>307</y>
  <width>16</width>
  <height>80</height>
  <uuid>{cc339e7a-6fc5-409a-b59b-76664373c173}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>13.00000000</maximum>
  <value>3.10000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>MOD_max</objectName>
  <x>1363</x>
  <y>286</y>
  <width>48</width>
  <height>22</height>
  <uuid>{5ea68fd2-12a5-4cd3-8fe4-1a3f0dd28192}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>3.100</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1357</x>
  <y>386</y>
  <width>64</width>
  <height>22</height>
  <uuid>{b76c5a5e-b11c-443e-a5ca-f4c4ba3462bd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>MOD Max</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>4</x>
  <y>7</y>
  <width>1425</width>
  <height>33</height>
  <uuid>{dc64f028-5104-43f1-9ab8-e4f576ac58ab}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>            StriaCSO 2.61 -Multilevel Interactive Sound Synthesizer</label>
  <alignment>left</alignment>
  <font>Papyrus</font>
  <fontsize>20</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>244</r>
   <g>225</g>
   <b>181</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>5</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>Fun_1</objectName>
  <x>15</x>
  <y>749</y>
  <width>20</width>
  <height>72</height>
  <uuid>{3b18d4d7-b670-4888-a5b2-79eafa660627}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>8.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>ran2vel</objectName>
  <x>235</x>
  <y>328</y>
  <width>128</width>
  <height>17</height>
  <uuid>{c8902a5c-f6b3-4e9f-b2d6-2aa9bc171926}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.01000000</minimum>
  <maximum>4.00000000</maximum>
  <value>0.66460900</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>ran2amp</objectName>
  <x>236</x>
  <y>293</y>
  <width>128</width>
  <height>17</height>
  <uuid>{8e15f754-dbed-42be-8b39-f7955830c42b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.01000000</minimum>
  <maximum>0.20000000</maximum>
  <value>0.06640625</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>slider25</objectName>
  <x>-1684370995</x>
  <y>-1632653275</y>
  <width>128</width>
  <height>17</height>
  <uuid>{bf314fea-50d5-44d4-8064-0cc43430c93e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.36718800</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>Rand_1</objectName>
  <x>-1684370995</x>
  <y>-1632653259</y>
  <width>127</width>
  <height>31</height>
  <uuid>{31f4b905-de9d-41e5-96ce-43cfd22c739f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Rand_1</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>hor98</objectName>
  <x>-1684370793</x>
  <y>-1632653247</y>
  <width>29</width>
  <height>10</height>
  <uuid>{fcb38ffe-033c-49cd-b523-4534fb820dfa}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert98</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.70000000</xValue>
  <yValue>0.07500000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>234</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>disppad_Y1</objectName>
  <x>36</x>
  <y>680</y>
  <width>50</width>
  <height>25</height>
  <uuid>{811693bf-bf7f-4828-ae46-fdf3be4165e2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.751</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>64</r>
   <g>0</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>menu146</objectName>
  <x>926223910</x>
  <y>1029660209</y>
  <width>10</width>
  <height>83</height>
  <uuid>{34306c40-1274-4e2b-8ff6-2bf986018995}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>UP</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> DOWN</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>0</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>TIME</objectName>
  <x>1164</x>
  <y>624</y>
  <width>20</width>
  <height>70</height>
  <uuid>{eb94ca80-3664-4c28-9390-8eb7af73093e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>240.00000000</maximum>
  <value>42.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>TYPE</objectName>
  <x>1307</x>
  <y>624</y>
  <width>21</width>
  <height>70</height>
  <uuid>{e647e3a6-8327-473d-a1cf-befd1c4a1a52}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>-5.00000000</minimum>
  <maximum>5.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1140</x>
  <y>698</y>
  <width>80</width>
  <height>22</height>
  <uuid>{2f420641-69ad-444e-835f-be650417794d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Morph Time</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1284</x>
  <y>695</y>
  <width>89</width>
  <height>22</height>
  <uuid>{c3f46981-3604-40c7-9ad5-c1941ef61fc3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Transition Type</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>TYPE</objectName>
  <x>1289</x>
  <y>601</y>
  <width>59</width>
  <height>22</height>
  <uuid>{e8bd0673-6177-4cb1-8b39-6b8c8cd5c423}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.000</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>dur</objectName>
  <x>126</x>
  <y>91</y>
  <width>197</width>
  <height>23</height>
  <uuid>{bebfdbca-ed23-4ccb-893f-a958530d520f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.20000000</minimum>
  <maximum>3.00000000</maximum>
  <value>0.45583756</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>band</objectName>
  <x>125</x>
  <y>51</y>
  <width>197</width>
  <height>18</height>
  <uuid>{23615c3d-0e23-4387-bf37-61904bae866d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00010000</minimum>
  <maximum>100.00000000</maximum>
  <value>0.00010000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>led1</objectName>
  <x>97</x>
  <y>393</y>
  <width>19</width>
  <height>7</height>
  <uuid>{9f6d6271-32de-49c9-9626-a777050a33cd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>led</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.70000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>0</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>mode_in</objectName>
  <x>445</x>
  <y>171</y>
  <width>103</width>
  <height>22</height>
  <uuid>{21685f68-bea8-44d0-8f76-de0a088cdf3c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>User Ratio</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>Num/Dem</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>0</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>disp_numdem</objectName>
  <x>456</x>
  <y>203</y>
  <width>68</width>
  <height>22</height>
  <uuid>{2f9f38a0-b81d-4e89-8e13-73f3b65634de}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>1.500</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName/>
  <x>459</x>
  <y>237</y>
  <width>66</width>
  <height>21</height>
  <uuid>{606bff5e-de3f-48c9-954b-be25d429bcc3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>NUM/DEM</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>over</objectName>
  <x>1097</x>
  <y>90</y>
  <width>22</width>
  <height>123</height>
  <uuid>{3bacc595-572b-4526-839f-5f675f94c922}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.20325203</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>button1</objectName>
  <x>-1684371026</x>
  <y>-1632653224</y>
  <width>10</width>
  <height>10</height>
  <uuid>{bd2a2358-3bb9-49ca-b417-53734c3cd154}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>On/Off#1</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>true</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>Rand_1</objectName>
  <x>-1684371026</x>
  <y>-1632653254</y>
  <width>10</width>
  <height>10</height>
  <uuid>{024aeb39-0b00-4c79-9a87-d70be0d848b4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Rand_1</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>hor98</objectName>
  <x>-1684370924</x>
  <y>-1632653218</y>
  <width>10</width>
  <height>10</height>
  <uuid>{7a25d3ce-d16a-46ac-9874-ab9d5f8ec553}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert98</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.70000000</xValue>
  <yValue>0.07500000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>234</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>hor98</objectName>
  <x>-1684370923</x>
  <y>-1632653246</y>
  <width>10</width>
  <height>10</height>
  <uuid>{042c5fe9-b5d2-4d7d-9e50-cef4e53ade8d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert98</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.70000000</xValue>
  <yValue>0.07500000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>234</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>disppad_X1</objectName>
  <x>-6</x>
  <y>679</y>
  <width>50</width>
  <height>25</height>
  <uuid>{47a8a255-4639-48b7-94aa-6d5f729cd3b8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.344</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>64</r>
   <g>0</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>grid_index</objectName>
  <x>80</x>
  <y>681</y>
  <width>47</width>
  <height>24</height>
  <uuid>{7bb493b1-ee4d-4fa9-8562-3dd23e1703b7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>33.469</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>64</r>
   <g>0</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>0</x>
  <y>696</y>
  <width>44</width>
  <height>21</height>
  <uuid>{7dab7091-3c7e-4814-9153-6e01f4c0b074}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>INDEX</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>102</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>46</x>
  <y>696</y>
  <width>35</width>
  <height>21</height>
  <uuid>{f413d706-a6bd-46b5-aab3-8fd11195a35f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>DHz</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>102</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>Fun_1</objectName>
  <x>5</x>
  <y>724</y>
  <width>49</width>
  <height>22</height>
  <uuid>{096996fb-a70e-4029-81bb-d011258aad73}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>1.000</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>indx1</objectName>
  <x>106</x>
  <y>724</y>
  <width>48</width>
  <height>22</height>
  <uuid>{73fd691e-4c28-4501-8cb1-2ea008f4aaaf}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.833</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>96</x>
  <y>822</y>
  <width>59</width>
  <height>22</height>
  <uuid>{68b428d0-5090-4197-aa89-e93b768fb669}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>IM1</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>-5</x>
  <y>822</y>
  <width>59</width>
  <height>22</height>
  <uuid>{61543449-06d6-434e-932d-8e4a554e7f0e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>F1</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>52</x>
  <y>822</y>
  <width>51</width>
  <height>22</height>
  <uuid>{94c22cce-a4c6-4954-bdd1-8418db2ef185}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>LEV_1</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>102</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>5</x>
  <y>271</y>
  <width>90</width>
  <height>22</height>
  <uuid>{c2994d81-0352-4b3a-a55a-20e5b9dde15f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>RAN AMP 1 -></label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>4</x>
  <y>307</y>
  <width>89</width>
  <height>22</height>
  <uuid>{4f6f9a88-80c1-4f5f-a46d-89c119d179d0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>RAN RATE 1 -></label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>led2</objectName>
  <x>330</x>
  <y>393</y>
  <width>19</width>
  <height>7</height>
  <uuid>{debf3aa1-350f-495d-b2a7-24fa83303649}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>led</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.70000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>102</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>led4</objectName>
  <x>329</x>
  <y>358</y>
  <width>19</width>
  <height>7</height>
  <uuid>{0322d9a7-cf83-4dd7-a5d4-689b3c265ba4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>led</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>led3</objectName>
  <x>97</x>
  <y>362</y>
  <width>19</width>
  <height>7</height>
  <uuid>{24bed986-0b12-4f2c-99c3-6ee0215722bb}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>led</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>0</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>X</objectName>
  <x>388</x>
  <y>426</y>
  <width>375</width>
  <height>253</height>
  <uuid>{a8967b8a-5206-43e2-965c-6f5550e21706}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>Y</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.34400000</xValue>
  <yValue>0.75098814</yValue>
  <type>crosshair</type>
  <pointsize>20</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>128</g>
   <b>64</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>hor153</objectName>
  <x>1132</x>
  <y>78</y>
  <width>6</width>
  <height>134</height>
  <uuid>{89a62851-1f43-40e3-8455-aae5a24e5ab8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>rms_L</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>-inf</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>102</r>
   <g>255</g>
   <b>102</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>hor153</objectName>
  <x>1143</x>
  <y>78</y>
  <width>6</width>
  <height>134</height>
  <uuid>{3748c079-5661-4827-ae59-d8be873989ff}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>rms_R</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>-inf</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>102</r>
   <g>255</g>
   <b>102</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>766</x>
  <y>268</y>
  <width>318</width>
  <height>371</height>
  <uuid>{e0b806d8-4889-4fae-b269-dd130f3b8403}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>103</r>
   <g>115</g>
   <b>132</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>F1</objectName>
  <x>5</x>
  <y>226</y>
  <width>80</width>
  <height>27</height>
  <uuid>{5fb517b2-b830-43d6-b46f-97f168421484}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>39.453</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>64</r>
   <g>0</g>
   <b>128</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>F2</objectName>
  <x>5</x>
  <y>200</y>
  <width>80</width>
  <height>27</height>
  <uuid>{92b5b1fd-d452-46c8-9ca9-91715e743c9c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>39.887</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>64</r>
   <g>0</g>
   <b>138</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>F3</objectName>
  <x>5</x>
  <y>174</y>
  <width>80</width>
  <height>27</height>
  <uuid>{b58d0c22-3f16-438b-9dda-9cc8cfe753e3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>40.326</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>64</r>
   <g>0</g>
   <b>148</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>F4</objectName>
  <x>5</x>
  <y>148</y>
  <width>80</width>
  <height>27</height>
  <uuid>{8223d269-275b-4f0c-9d3d-4f46ff61ffa9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>40.770</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>64</r>
   <g>0</g>
   <b>159</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>F5</objectName>
  <x>5</x>
  <y>122</y>
  <width>80</width>
  <height>27</height>
  <uuid>{e1515acd-bf65-4817-adb3-f59606ee7215}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>41.218</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>64</r>
   <g>0</g>
   <b>170</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>5</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>F6</objectName>
  <x>5</x>
  <y>96</y>
  <width>80</width>
  <height>27</height>
  <uuid>{445b188d-842b-40fe-9105-2e992af953d0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>41.672</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>64</r>
   <g>0</g>
   <b>188</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>F7</objectName>
  <x>5</x>
  <y>70</y>
  <width>80</width>
  <height>27</height>
  <uuid>{88c7d5b5-d6a2-4858-9199-236995d92d5c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>770.357</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>64</r>
   <g>0</g>
   <b>198</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>F8</objectName>
  <x>5</x>
  <y>44</y>
  <width>80</width>
  <height>27</height>
  <uuid>{3ba8605f-4687-4845-b183-cd6d40de0081}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>880.442</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>64</r>
   <g>0</g>
   <b>211</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>disp_rand1</objectName>
  <x>130</x>
  <y>325</y>
  <width>53</width>
  <height>22</height>
  <uuid>{e3edd5e6-3729-40e6-84f1-ab7274249bd6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>-23.840</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>204</r>
   <g>255</g>
   <b>102</b>
  </color>
  <bgcolor mode="nobackground">
   <r>64</r>
   <g>0</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>status</objectName>
  <x>792</x>
  <y>578</y>
  <width>60</width>
  <height>24</height>
  <uuid>{6113eb38-586d-4b3a-b8fc-7e10e873c5b0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.000</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>204</g>
   <b>102</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>chan</objectName>
  <x>858</x>
  <y>578</y>
  <width>60</width>
  <height>24</height>
  <uuid>{000770d1-0211-466f-aa8d-69872017a014}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.000</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>204</g>
   <b>102</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>data1</objectName>
  <x>924</x>
  <y>578</y>
  <width>60</width>
  <height>24</height>
  <uuid>{6b53557a-be5b-4cc9-aeb7-4a784f894795}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.000</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>204</g>
   <b>102</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>data2</objectName>
  <x>991</x>
  <y>578</y>
  <width>60</width>
  <height>24</height>
  <uuid>{a5ae21f2-a55c-4040-894e-29484827eb0c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.000</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>204</g>
   <b>102</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>hor156</objectName>
  <x>86</x>
  <y>45</y>
  <width>37</width>
  <height>208</height>
  <uuid>{45059b64-b50e-44de-a61c-8b3d8a9ddf71}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>metervoi</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.43181800</xValue>
  <yValue>0.75000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>102</r>
   <g>102</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>791</x>
  <y>600</y>
  <width>59</width>
  <height>22</height>
  <uuid>{7555f70a-7a5a-4629-8e59-90bbb829286e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>STATUS</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>857</x>
  <y>600</y>
  <width>60</width>
  <height>21</height>
  <uuid>{98942cdc-9a6f-4b74-8aea-916b0cf5b0a1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>CHAN</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>922</x>
  <y>600</y>
  <width>60</width>
  <height>22</height>
  <uuid>{3213c76f-1ea5-4480-8994-3b15c3bbcb78}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>DATA 1</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>989</x>
  <y>600</y>
  <width>61</width>
  <height>21</height>
  <uuid>{b3ecac6c-56dd-42d9-8eb7-0a638d2e2ecd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>DATA 2</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>391</x>
  <y>358</y>
  <width>95</width>
  <height>37</height>
  <uuid>{7ebecc7a-39f0-41a1-b409-1615d246fbe9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Configurable
Controller</label>
  <alignment>left</alignment>
  <font>Helvetica</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>ROOM</objectName>
  <x>405</x>
  <y>735</y>
  <width>21</width>
  <height>70</height>
  <uuid>{b1ac27ad-299f-4dcc-84fe-46adc41d9aaa}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>0.99000000</maximum>
  <value>0.99000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>slider165</objectName>
  <x>336156730</x>
  <y>853334705</y>
  <width>20</width>
  <height>100</height>
  <uuid>{13adff2e-a2ce-4d36-85e2-338e843335c5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>HF</objectName>
  <x>450</x>
  <y>735</y>
  <width>21</width>
  <height>70</height>
  <uuid>{ea1debea-a58d-429f-96b3-0e432a56a825}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.36708900</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>442</x>
  <y>804</y>
  <width>40</width>
  <height>22</height>
  <uuid>{4357487e-cd33-48fd-af53-15d1ab732f91}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>HF</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>259</x>
  <y>228</y>
  <width>97</width>
  <height>24</height>
  <uuid>{bc937f22-a17c-499e-9899-b00f9d68c7ad}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>MiXTURE Shape</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>-1</x>
  <y>250</y>
  <width>82</width>
  <height>24</height>
  <uuid>{1859d3c3-c8d3-4d8d-83f7-fa8c63350c60}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>MIXTURE  [Hz]</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>REVLEV</objectName>
  <x>494</x>
  <y>735</y>
  <width>21</width>
  <height>70</height>
  <uuid>{d188e35c-727f-4468-8807-b4a66f84c07e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.92857100</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>483</x>
  <y>804</y>
  <width>51</width>
  <height>21</height>
  <uuid>{3675af4e-4763-4a90-aff7-8e086f74021f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>REV LEV</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName/>
  <x>387</x>
  <y>42</y>
  <width>198</width>
  <height>24</height>
  <uuid>{d5ac31f8-09e2-42fa-92c5-a62a2c90dfe0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Geometric Spectra Compiler</label>
  <alignment>left</alignment>
  <font>Helvetica</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>102</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName/>
  <x>764</x>
  <y>42</y>
  <width>194</width>
  <height>23</height>
  <uuid>{4b9c4a64-7b2f-4fa6-b706-3b4c0d24027b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label> Harmonic Spectra Compiler</label>
  <alignment>left</alignment>
  <font>Helvetica</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>102</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBCheckBox" version="2">
  <objectName>MUTE1</objectName>
  <x>127</x>
  <y>388</y>
  <width>20</width>
  <height>20</height>
  <uuid>{da77a0b7-82f5-4859-8ea8-821e8ec58610}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>sine</objectName>
  <x>37</x>
  <y>776</y>
  <width>21</width>
  <height>7</height>
  <uuid>{727525a2-685c-486a-9b1c-0a340720e819}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>vert180</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>234</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>led_ADSYN</objectName>
  <x>1271</x>
  <y>383</y>
  <width>19</width>
  <height>7</height>
  <uuid>{922b8c8a-1beb-406d-a9be-0449c55649ef}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>led</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.70000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>128</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>led_FM</objectName>
  <x>1271</x>
  <y>360</y>
  <width>19</width>
  <height>7</height>
  <uuid>{aeee10ad-cfa7-4ee9-a1f5-a2afa86c9696}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>led</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.70000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>128</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1238</x>
  <y>355</y>
  <width>28</width>
  <height>20</height>
  <uuid>{97678d6e-f02d-4e84-8919-ae6d9232af64}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>FM</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>204</r>
   <g>204</g>
   <b>204</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1235</x>
  <y>374</y>
  <width>35</width>
  <height>20</height>
  <uuid>{6400a540-11bb-450a-8962-2027232e8f9b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>WS</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>204</r>
   <g>204</g>
   <b>204</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>G_key</objectName>
  <x>589</x>
  <y>158</y>
  <width>59</width>
  <height>24</height>
  <uuid>{d496957d-191b-429f-8bd9-f7730885b3fa}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>C</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>C#</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>D</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>D#</name>
    <value>3</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>E</name>
    <value>4</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>F</name>
    <value>5</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>F#</name>
    <value>6</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>G</name>
    <value>7</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>G#</name>
    <value>8</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>A</name>
    <value>9</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>A#</name>
    <value>10</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>B</name>
    <value>11</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>9</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>G_oct</objectName>
  <x>589</x>
  <y>134</y>
  <width>58</width>
  <height>23</height>
  <uuid>{28e73f78-b3ff-4064-b843-e39912723f11}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>0</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>1</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>2</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>3</name>
    <value>3</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>4</name>
    <value>4</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>5</name>
    <value>5</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>6</name>
    <value>6</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>7</name>
    <value>7</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>8</name>
    <value>8</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>0</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName/>
  <x>589</x>
  <y>111</y>
  <width>54</width>
  <height>23</height>
  <uuid>{e8c8c09d-8c63-467a-95ad-842f5a4dc5f9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Octave</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName/>
  <x>591</x>
  <y>183</y>
  <width>54</width>
  <height>22</height>
  <uuid>{d7880186-b34d-477b-9f22-078bc35da701}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Key</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBCheckBox" version="2">
  <objectName>G_fund</objectName>
  <x>607</x>
  <y>92</y>
  <width>20</width>
  <height>20</height>
  <uuid>{bd493a22-bd01-47db-90f7-45d4074be968}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>true</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>G_fre</objectName>
  <x>590</x>
  <y>205</y>
  <width>62</width>
  <height>22</height>
  <uuid>{77b7bc95-ab76-4eed-8aff-e2e6ec279789}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>27.498</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>H_key</objectName>
  <x>921</x>
  <y>167</y>
  <width>59</width>
  <height>24</height>
  <uuid>{ce7d039a-d0e5-4fd6-9783-3d0f27a0ff58}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>C</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>C#</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>D</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>D#</name>
    <value>3</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>E</name>
    <value>4</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>F</name>
    <value>5</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>F#</name>
    <value>6</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>G</name>
    <value>7</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>G#</name>
    <value>8</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>A</name>
    <value>9</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>A#</name>
    <value>10</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>B</name>
    <value>11</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>9</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>H_oct</objectName>
  <x>921</x>
  <y>143</y>
  <width>58</width>
  <height>23</height>
  <uuid>{ef346d00-811d-4587-a279-8fd093459063}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>0</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>1</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>2</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>3</name>
    <value>3</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>4</name>
    <value>4</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>5</name>
    <value>5</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>6</name>
    <value>6</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>7</name>
    <value>7</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>8</name>
    <value>8</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>1</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName/>
  <x>921</x>
  <y>120</y>
  <width>54</width>
  <height>23</height>
  <uuid>{7a575bb5-9460-4c20-97ee-b6777b49adbd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Octave</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName/>
  <x>924</x>
  <y>189</y>
  <width>54</width>
  <height>23</height>
  <uuid>{9edcf60b-70ac-455f-a828-b73b3f056a80}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Key</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBCheckBox" version="2">
  <objectName>H_fund</objectName>
  <x>938</x>
  <y>97</y>
  <width>20</width>
  <height>20</height>
  <uuid>{42ad30f2-9386-4529-ada8-b7edbd64037f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>true</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>H_fre</objectName>
  <x>922</x>
  <y>214</y>
  <width>62</width>
  <height>22</height>
  <uuid>{004cbe0d-c5da-4f41-9f29-641c32263395}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>54.995</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>hor198</objectName>
  <x>1766595507</x>
  <y>-1131970832</y>
  <width>37</width>
  <height>10</height>
  <uuid>{5ea81ee8-59d6-462a-8bfc-d3f66ff4355a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert198</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>234</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>led_G</objectName>
  <x>629</x>
  <y>54</y>
  <width>125</width>
  <height>10</height>
  <uuid>{29af271f-8dae-4bd3-8b02-7afeef18a995}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>vert199</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>234</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>led_H</objectName>
  <x>958</x>
  <y>49</y>
  <width>117</width>
  <height>10</height>
  <uuid>{09302ca8-823c-4001-b332-9b4e1a832616}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert199</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>255</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>control_X</objectName>
  <x>606</x>
  <y>367</y>
  <width>146</width>
  <height>22</height>
  <uuid>{37e30598-fafb-419c-8a06-fe6a82801d66}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>NONE</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Focused/Diffuse</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Voices On</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Grid Step</name>
    <value>3</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Modulation Index</name>
    <value>4</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Car Min</name>
    <value>5</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Mod Min</name>
    <value>6</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> F1</name>
    <value>7</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Freq</name>
    <value>8</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>8</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName/>
  <x>483</x>
  <y>366</y>
  <width>126</width>
  <height>20</height>
  <uuid>{a55a6d17-7623-49ec-8ef5-9b4d149e6640}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>ASSIGN X_PAD TO -></label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>control_Y</objectName>
  <x>606</x>
  <y>391</y>
  <width>146</width>
  <height>22</height>
  <uuid>{267ca3cf-97ea-4a42-9fc8-57c6abbafbcc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>NONE</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Level_1</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>  Rand_1 Depth</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Rand_1 Rate</name>
    <value>3</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> X-Fade</name>
    <value>4</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Span Freq</name>
    <value>5</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>Focused/Diffuse</name>
    <value>6</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>5</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName/>
  <x>481</x>
  <y>391</y>
  <width>126</width>
  <height>20</height>
  <uuid>{bdb86a6f-932d-4825-977e-2271731a8ddc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>ASSIGN Y_PAD TO -></label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>active</objectName>
  <x>125</x>
  <y>231</y>
  <width>43</width>
  <height>22</height>
  <uuid>{e1e8d964-5223-42d3-9487-08488ab2a1d3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.000</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>255</g>
   <b>102</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>235</x>
  <y>523</y>
  <width>36</width>
  <height>21</height>
  <uuid>{a597d981-2bf1-44d1-bb59-0083b148eef3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>ATK2</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>274</x>
  <y>523</y>
  <width>42</width>
  <height>22</height>
  <uuid>{2339a1bb-01bb-4b1b-84b6-8edcd0e20232}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>REL_2</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>AT2</objectName>
  <x>250</x>
  <y>443</y>
  <width>14</width>
  <height>82</height>
  <uuid>{900ecb0f-1661-4ed8-8e3c-68c2d5c7d99e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.05000000</minimum>
  <maximum>0.90000000</maximum>
  <value>0.34100299</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>RE2</objectName>
  <x>290</x>
  <y>443</y>
  <width>14</width>
  <height>82</height>
  <uuid>{2d22ac08-8247-4e57-aa6e-ead2a14895a8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.05000000</minimum>
  <maximum>0.90000000</maximum>
  <value>0.82682852</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>REVSEND2</objectName>
  <x>328</x>
  <y>443</y>
  <width>16</width>
  <height>82</height>
  <uuid>{323f0713-36a7-4ba7-9526-1c8ec9a33dad}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>318</x>
  <y>523</y>
  <width>45</width>
  <height>22</height>
  <uuid>{69e3f149-2f3a-46b6-b9ae-261848f06db5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>REVS2</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>102</r>
   <g>255</g>
   <b>204</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>26</x>
  <y>523</y>
  <width>31</width>
  <height>22</height>
  <uuid>{b7d4979d-337d-4072-b211-e3e1bc6734a5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>STEP</label>
  <alignment>right</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>-3</x>
  <y>523</y>
  <width>37</width>
  <height>20</height>
  <uuid>{e19aaf56-a336-4d19-a188-987de350124e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label># VOI</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>56</x>
  <y>523</y>
  <width>35</width>
  <height>20</height>
  <uuid>{c5d4917e-479f-438b-91f1-2ae46f3d13ed}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>ATK1</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>90</x>
  <y>523</y>
  <width>43</width>
  <height>22</height>
  <uuid>{eb238e84-3395-4235-91dd-cef558f5966e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>REL_1</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>vox</objectName>
  <x>5</x>
  <y>443</y>
  <width>14</width>
  <height>84</height>
  <uuid>{2a19a4b3-4317-49b1-b238-fb1adcd4325b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>8.00000000</maximum>
  <value>6.95046362</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>knob154</objectName>
  <x>35</x>
  <y>443</y>
  <width>14</width>
  <height>82</height>
  <uuid>{beef446c-f708-43b2-8294-cbaf5b45a054}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>9.00000000</maximum>
  <value>1.87804878</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>vox</objectName>
  <x>-2</x>
  <y>420</y>
  <width>36</width>
  <height>26</height>
  <uuid>{82230e1b-2220-4381-8ab9-afff3a1f4fef}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>6.950</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>64</r>
   <g>0</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>knob154</objectName>
  <x>27</x>
  <y>420</y>
  <width>38</width>
  <height>24</height>
  <uuid>{8be15226-cb79-4e7f-987c-7b16c55a0c6f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>1.878</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>64</r>
   <g>0</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>AT1</objectName>
  <x>67</x>
  <y>443</y>
  <width>14</width>
  <height>82</height>
  <uuid>{7d817cef-7686-4f7a-b429-22b938fe0e49}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.05000000</minimum>
  <maximum>0.90000000</maximum>
  <value>0.69991001</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>RE1</objectName>
  <x>102</x>
  <y>443</y>
  <width>14</width>
  <height>82</height>
  <uuid>{74dcef88-2ca2-4ea2-9ae4-a4dde400816d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.05000000</minimum>
  <maximum>0.90000000</maximum>
  <value>0.67317862</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>REVSEND1</objectName>
  <x>138</x>
  <y>443</y>
  <width>14</width>
  <height>82</height>
  <uuid>{fb9efe43-88c0-475b-9f14-3b682984515d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>128</x>
  <y>523</y>
  <width>45</width>
  <height>22</height>
  <uuid>{068ba869-18b6-4d5f-87c0-126899518d32}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>REVS1</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>102</r>
   <g>255</g>
   <b>204</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>Lev_2</objectName>
  <x>290</x>
  <y>749</y>
  <width>14</width>
  <height>72</height>
  <uuid>{57db54b2-e29a-4a69-a417-0c7e67be43a6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.55196614</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>indx2</objectName>
  <x>336</x>
  <y>749</y>
  <width>15</width>
  <height>72</height>
  <uuid>{ac76dcc5-6e09-40e2-94e4-19104e85055f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>0.00000000</minimum>
  <maximum>2.00000000</maximum>
  <value>2.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>Lev_2</objectName>
  <x>275</x>
  <y>724</y>
  <width>47</width>
  <height>22</height>
  <uuid>{941a64ea-9dc5-4736-a934-872b40be71ac}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.552</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>indx2</objectName>
  <x>323</x>
  <y>724</y>
  <width>47</width>
  <height>22</height>
  <uuid>{ceb40ec3-f47c-4870-99eb-b9ef49f6f6e5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>2.000</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>318</x>
  <y>823</y>
  <width>51</width>
  <height>22</height>
  <uuid>{d7084eac-3089-4f0b-8678-331cb14e3674}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>IM2</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>272</x>
  <y>823</y>
  <width>51</width>
  <height>22</height>
  <uuid>{87f36b2c-68bb-4c92-a2d5-936ab8bbdf5f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>LEV_2</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>102</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>Fun_2</objectName>
  <x>243</x>
  <y>749</y>
  <width>15</width>
  <height>72</height>
  <uuid>{1e0aa7c6-ded1-4434-be30-b7787198437a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>1.00000000</minimum>
  <maximum>8.00000000</maximum>
  <value>1.77777778</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>Fun_2</objectName>
  <x>227</x>
  <y>724</y>
  <width>47</width>
  <height>22</height>
  <uuid>{dafb5695-9f3c-4869-ad20-62f6046a82d5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>1.778</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>228</x>
  <y>823</y>
  <width>44</width>
  <height>22</height>
  <uuid>{da77cfc5-60a3-4380-bbc3-5e5831f5bfd4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>F2</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBCheckBox" version="2">
  <objectName>MUTE2</objectName>
  <x>360</x>
  <y>386</y>
  <width>20</width>
  <height>20</height>
  <uuid>{bfd17378-219a-42f5-bc92-2ca7659e715a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>sine2</objectName>
  <x>262</x>
  <y>778</y>
  <width>21</width>
  <height>7</height>
  <uuid>{748ab458-a1e8-4abf-80be-e33af7e10b97}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>vert180</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>234</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBCheckBox" version="2">
  <objectName>cm</objectName>
  <x>1211</x>
  <y>315</y>
  <width>20</width>
  <height>20</height>
  <uuid>{33cbc1bb-69e6-4d84-9e67-e146f21a5474}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>led_FLOAT</objectName>
  <x>1271</x>
  <y>329</y>
  <width>19</width>
  <height>7</height>
  <uuid>{4f6a5f47-f08e-43e1-8223-7bfbc4e7d715}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>led</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>128</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>led_INT</objectName>
  <x>1271</x>
  <y>308</y>
  <width>19</width>
  <height>7</height>
  <uuid>{535099f7-6b09-414a-897c-8a9b28fe857c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>led</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>128</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1235</x>
  <y>304</y>
  <width>28</width>
  <height>20</height>
  <uuid>{6be4ae38-b6d4-4c1c-ae34-4a6ae46b3261}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>INT</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>204</r>
   <g>204</g>
   <b>204</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1230</x>
  <y>322</y>
  <width>41</width>
  <height>21</height>
  <uuid>{885b882a-98fe-43f3-806f-c3fa81dcc192}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>FLOAT</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>204</r>
   <g>204</g>
   <b>204</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>XFADE</objectName>
  <x>152</x>
  <y>611</y>
  <width>79</width>
  <height>16</height>
  <uuid>{71d90790-9d2c-4446-909a-edf670213a8f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.56962000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>174</x>
  <y>621</y>
  <width>44</width>
  <height>21</height>
  <uuid>{07b31920-1aeb-484c-845c-fd86c76a603a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>XFADE</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>XFADE</objectName>
  <x>174</x>
  <y>586</y>
  <width>46</width>
  <height>22</height>
  <uuid>{ae6f29a6-780d-4fc0-9faa-b72f3d2d0fd5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.570</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>64</r>
   <g>0</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>hor220</objectName>
  <x>233</x>
  <y>552</y>
  <width>10</width>
  <height>128</height>
  <uuid>{9fc5ef30-b360-4c5e-b5a9-da77b66df51c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>disp_G2LEV</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.80000000</xValue>
  <yValue>0.56962000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>128</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>hor220</objectName>
  <x>141</x>
  <y>553</y>
  <width>10</width>
  <height>129</height>
  <uuid>{a74dd8ed-bd68-4266-ab1f-3209a3f7d4b7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>disp_G1LEV</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.80000000</xValue>
  <yValue>0.43038000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>disp_rand2</objectName>
  <x>184</x>
  <y>324</y>
  <width>54</width>
  <height>21</height>
  <uuid>{808d323d-6d70-49b4-be90-883c7a6cb84e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>-53.489</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>204</r>
   <g>255</g>
   <b>102</b>
  </color>
  <bgcolor mode="nobackground">
   <r>64</r>
   <g>0</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>-253921141</x>
  <y>677009588</y>
  <width>10</width>
  <height>187</height>
  <uuid>{f1ccd7ed-1c35-44a4-bcdc-e60c05b05ed1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>New Label</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>MIDIVAR_8</objectName>
  <x>1852447484</x>
  <y>2059320742</y>
  <width>132</width>
  <height>24</height>
  <uuid>{af17d496-6a80-4c61-b351-7dd6fa09d969}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>nul</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> LEV_1</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> X1</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Y1</name>
    <value>3</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> F_1</name>
    <value>4</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> IM_1</name>
    <value>5</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> ATK_1</name>
    <value>6</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REL_1</name>
    <value>7</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN AMP_1</name>
    <value>8</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN RATE_1</name>
    <value>9</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> VOI</name>
    <value>10</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> STEP</name>
    <value>11</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> XFADE</name>
    <value>12</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> LEV_2</name>
    <value>13</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> F_2</name>
    <value>14</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> IM_2</name>
    <value>15</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN AMP_2</name>
    <value>16</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN RATE_2</name>
    <value>17</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REV_2</name>
    <value>18</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>0</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>transtime</objectName>
  <x>1214</x>
  <y>652</y>
  <width>73</width>
  <height>25</height>
  <uuid>{3e4479f8-8d4d-4379-9c51-87b74fe92e57}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>28.574</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>102</r>
   <g>102</g>
   <b>102</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName/>
  <x>884</x>
  <y>288</y>
  <width>194</width>
  <height>28</height>
  <uuid>{45582961-ca11-4ece-b3bc-daf5dfc8991f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Read MIDI cc and  Write Table</text>
  <image>/</image>
  <eventLine>i14 0 0.1</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>cc1</objectName>
  <x>815</x>
  <y>349</y>
  <width>67</width>
  <height>22</height>
  <uuid>{afc5c82f-ed7d-4391-ab5d-ca5dd00294f1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>1.00000000</resolution>
  <minimum>-1e+12</minimum>
  <maximum>1e+12</maximum>
  <randomizable group="0">false</randomizable>
  <value>0</value>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>cc2</objectName>
  <x>814</x>
  <y>376</y>
  <width>68</width>
  <height>24</height>
  <uuid>{56bfa3b4-3d6f-4e8c-a23c-f9e0efc71e96}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>1.00000000</resolution>
  <minimum>-1e+12</minimum>
  <maximum>1e+12</maximum>
  <randomizable group="0">false</randomizable>
  <value>0</value>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>cc3</objectName>
  <x>814</x>
  <y>403</y>
  <width>68</width>
  <height>24</height>
  <uuid>{f1cdbc35-bdb1-4055-b1d4-2a6542096139}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>1.00000000</resolution>
  <minimum>-1e+12</minimum>
  <maximum>1e+12</maximum>
  <randomizable group="0">false</randomizable>
  <value>0</value>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>cc4</objectName>
  <x>813</x>
  <y>430</y>
  <width>68</width>
  <height>24</height>
  <uuid>{9c6976ff-44bc-4929-b78d-3e18c95f98f2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>1.00000000</resolution>
  <minimum>-1e+12</minimum>
  <maximum>1e+12</maximum>
  <randomizable group="0">false</randomizable>
  <value>0</value>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>cc5</objectName>
  <x>813</x>
  <y>457</y>
  <width>68</width>
  <height>24</height>
  <uuid>{9537badc-b4c1-45ec-9773-341057882511}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>1.00000000</resolution>
  <minimum>-1e+12</minimum>
  <maximum>1e+12</maximum>
  <randomizable group="0">false</randomizable>
  <value>0</value>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>cc6</objectName>
  <x>813</x>
  <y>484</y>
  <width>68</width>
  <height>24</height>
  <uuid>{20108b30-a7a0-4e76-963b-2e97693b7f90}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>1.00000000</resolution>
  <minimum>-1e+12</minimum>
  <maximum>1e+12</maximum>
  <randomizable group="0">false</randomizable>
  <value>0</value>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>cc7</objectName>
  <x>813</x>
  <y>511</y>
  <width>68</width>
  <height>24</height>
  <uuid>{9d03473e-f387-4d98-a2ef-e1e002a473cd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>1.00000000</resolution>
  <minimum>-1e+12</minimum>
  <maximum>1e+12</maximum>
  <randomizable group="0">false</randomizable>
  <value>0</value>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>cc8</objectName>
  <x>812</x>
  <y>538</y>
  <width>68</width>
  <height>24</height>
  <uuid>{88e9fb83-b9c3-4f08-981d-05621c15df7f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>1.00000000</resolution>
  <minimum>-1e+12</minimum>
  <maximum>1e+12</maximum>
  <randomizable group="0">false</randomizable>
  <value>0</value>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1084</x>
  <y>211</y>
  <width>52</width>
  <height>20</height>
  <uuid>{963b4f44-b590-41ff-ab09-e3f30e9fef57}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Volume</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>793</x>
  <y>348</y>
  <width>25</width>
  <height>24</height>
  <uuid>{f38daa91-ff3e-404b-8d83-b8ea51a68fe3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>CC</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>ABOUT</objectName>
  <x>1332</x>
  <y>12</y>
  <width>83</width>
  <height>23</height>
  <uuid>{b9b547f0-e8bd-4e9f-a26a-c140e2876b15}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>About:   Stria is written by Eugenio Giordani as a tribute to prof. John Chowning - Ver. 2.61  - 14 november 2014</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>Who:     Eugenio Giordani is professor of Electroacoustic Music at "G. Rossini" Conservatory - Pesaro - ITALY</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>Where:    LEMS (Electronic Laboratory for Experimental Music)- Pesaro-Italy</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>www:     www.eugenio-giordani.it/www.rossinispace.it/www.conservatoriorossini.it</name>
    <value>3</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>Contact: e.giordani@conservatoriorossini.it</name>
    <value>4</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>0</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>387</x>
  <y>268</y>
  <width>377</width>
  <height>81</height>
  <uuid>{4241df49-525e-4125-8cd1-44ce95572c10}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>128</r>
   <g>128</g>
   <b>128</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>button1</objectName>
  <x>625</x>
  <y>287</y>
  <width>134</width>
  <height>32</height>
  <uuid>{fd7cec78-9036-41d2-989e-467c46de560c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Create FIBONACCI</text>
  <image>/</image>
  <eventLine>i13 0 -1</eventLine>
  <latch>false</latch>
  <latched>true</latched>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName/>
  <x>395</x>
  <y>325</y>
  <width>50</width>
  <height>21</height>
  <uuid>{ab03f153-0a4c-4d8a-b1d9-342d36f06f6c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>1st </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>hor267</objectName>
  <x>168076941</x>
  <y>426667403</y>
  <width>31</width>
  <height>10</height>
  <uuid>{afd7f9e7-6157-4bf2-a11c-5fbfb3796d54}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert267</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>234</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>led_F</objectName>
  <x>630</x>
  <y>278</y>
  <width>125</width>
  <height>10</height>
  <uuid>{d630ca3a-c108-456d-965d-6a95d1aa55d6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>vert268</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>0</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName/>
  <x>470</x>
  <y>324</y>
  <width>50</width>
  <height>21</height>
  <uuid>{2f14454d-f8c0-4f84-ac8d-7522dd888d83}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Fund</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>progress</objectName>
  <x>1092</x>
  <y>727</y>
  <width>332</width>
  <height>5</height>
  <uuid>{686353e6-aabc-40f6-acc1-9b33b80358ae}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>progress</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>128</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1323</x>
  <y>647</y>
  <width>43</width>
  <height>23</height>
  <uuid>{a81bda6d-b91e-494a-a034-b965243883d6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>-- Lin</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1332</x>
  <y>619</y>
  <width>30</width>
  <height>22</height>
  <uuid>{630c08dd-b4cc-4119-8e4c-4516f3ee197e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Exp</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1331</x>
  <y>676</y>
  <width>34</width>
  <height>22</height>
  <uuid>{a12ee17e-0e74-47d1-b45c-12d4e3b01b3e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Log</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>AT1</objectName>
  <x>55</x>
  <y>420</y>
  <width>40</width>
  <height>25</height>
  <uuid>{e3ec5963-8ad7-4097-a9c8-aec7b7e55b5c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.700</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>64</r>
   <g>0</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>RE1</objectName>
  <x>92</x>
  <y>420</y>
  <width>36</width>
  <height>25</height>
  <uuid>{6f09c3ed-30c4-46f7-b4bc-ca47885ca713}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.673</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>64</r>
   <g>0</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>REVSEND1</objectName>
  <x>125</x>
  <y>420</y>
  <width>40</width>
  <height>25</height>
  <uuid>{2ff5f9ed-f843-4c56-86bc-47180f344e65}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>1.000</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>64</r>
   <g>0</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>AT2</objectName>
  <x>238</x>
  <y>418</y>
  <width>40</width>
  <height>25</height>
  <uuid>{0b6763e1-7355-410d-8368-a262aefe9c23}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.341</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>64</r>
   <g>0</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>RE2</objectName>
  <x>279</x>
  <y>418</y>
  <width>40</width>
  <height>25</height>
  <uuid>{e91ae135-dbf7-4998-b4e9-f4d468038c38}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.827</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>64</r>
   <g>0</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>REVSEND2</objectName>
  <x>320</x>
  <y>418</y>
  <width>40</width>
  <height>25</height>
  <uuid>{c4597131-9594-4b08-bd46-a5ed624a75a9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>1.000</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>64</r>
   <g>0</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>ran1amp</objectName>
  <x>93</x>
  <y>273</y>
  <width>41</width>
  <height>22</height>
  <uuid>{daf46d05-620f-4261-8d12-f928493ccc53}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.045</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>ran1vel</objectName>
  <x>93</x>
  <y>308</y>
  <width>41</width>
  <height>22</height>
  <uuid>{c791519a-c4ac-41d3-bf86-7641dd8bf2fe}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.197</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>235</x>
  <y>271</y>
  <width>90</width>
  <height>21</height>
  <uuid>{89651332-834c-4a4c-88ae-5fc416a870ac}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>RAN AMP 2 -></label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>ran2amp</objectName>
  <x>325</x>
  <y>272</y>
  <width>39</width>
  <height>22</height>
  <uuid>{5e108611-300e-468a-b894-24b2c7c1886b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.066</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>234</x>
  <y>310</y>
  <width>91</width>
  <height>20</height>
  <uuid>{4c2c08d9-de29-4411-9853-2884b38f83fa}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>RAN RATE 2 -></label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>ran2vel</objectName>
  <x>323</x>
  <y>308</y>
  <width>39</width>
  <height>22</height>
  <uuid>{23d34afa-69ba-43b3-9e51-009e167ce0ae}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.665</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>4</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>STOP</objectName>
  <x>1219</x>
  <y>689</y>
  <width>66</width>
  <height>27</height>
  <uuid>{1f3b3f3c-9ada-4c9f-ac6f-5e7f799898ea}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>STOP</text>
  <image>/</image>
  <eventLine/>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L01</objectName>
  <x>769</x>
  <y>677</y>
  <width>20</width>
  <height>13</height>
  <uuid>{5fe18a73-20dd-4c61-be35-6e42d2cc5d73}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.42857100</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>clear_snap</objectName>
  <x>1104</x>
  <y>771</y>
  <width>100</width>
  <height>30</height>
  <uuid>{4b9b831d-9095-4fca-a4eb-c66acb0e70d5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>CLEAR SNAP</text>
  <image>/</image>
  <eventLine>i71 0 3600</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>767</x>
  <y>689</y>
  <width>22</width>
  <height>20</height>
  <uuid>{362ce1fd-31db-4e61-8247-d79980fb4add}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>01 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>794</x>
  <y>689</y>
  <width>22</width>
  <height>20</height>
  <uuid>{9e923663-b7cb-4f4c-86e6-ae306859126c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>02 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>821</x>
  <y>689</y>
  <width>22</width>
  <height>20</height>
  <uuid>{764b61bc-6a59-458e-8b0e-8ece8612bf92}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>03</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>846</x>
  <y>689</y>
  <width>22</width>
  <height>20</height>
  <uuid>{6ab4e64b-45fb-406d-b752-20d9b302d3f3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>04</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>873</x>
  <y>689</y>
  <width>22</width>
  <height>20</height>
  <uuid>{b71c9c1d-11d6-4a8f-9932-71fef8fe34b1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>05</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>899</x>
  <y>689</y>
  <width>22</width>
  <height>20</height>
  <uuid>{393ac026-de58-4c09-b0e3-ca6d065acb34}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>06</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>925</x>
  <y>689</y>
  <width>22</width>
  <height>20</height>
  <uuid>{25e3dc61-644a-42f2-91df-c2355ea022b7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>07 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>952</x>
  <y>689</y>
  <width>22</width>
  <height>20</height>
  <uuid>{6d51f5ec-a56e-4240-958b-ac4144578299}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>08 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>978</x>
  <y>689</y>
  <width>22</width>
  <height>20</height>
  <uuid>{e749fa8d-e0dd-4eea-b02c-f9504731895d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>09 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1004</x>
  <y>689</y>
  <width>22</width>
  <height>20</height>
  <uuid>{d97513a7-86fa-4313-9755-f2b04defdc4e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>10 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1031</x>
  <y>689</y>
  <width>22</width>
  <height>20</height>
  <uuid>{4af81a57-f728-43b3-9ca2-3b0e9ab109a7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>11</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1057</x>
  <y>689</y>
  <width>22</width>
  <height>20</height>
  <uuid>{17cf08be-f380-4ab6-aadc-d5e583fe1e48}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>12 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L02</objectName>
  <x>795</x>
  <y>677</y>
  <width>20</width>
  <height>13</height>
  <uuid>{1cd90ea5-30bf-48db-a7d4-a1610f01d883}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L03</objectName>
  <x>821</x>
  <y>677</y>
  <width>20</width>
  <height>13</height>
  <uuid>{5c0ec921-f997-4a3a-a14b-30b256956167}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.42857100</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L04</objectName>
  <x>848</x>
  <y>677</y>
  <width>20</width>
  <height>13</height>
  <uuid>{9ac16084-65d1-49c1-b574-68a451be2ec1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.42857100</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L05</objectName>
  <x>874</x>
  <y>677</y>
  <width>20</width>
  <height>13</height>
  <uuid>{988033de-8b08-4c37-a17d-d925f3b7c671}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.42857100</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L06</objectName>
  <x>900</x>
  <y>677</y>
  <width>20</width>
  <height>13</height>
  <uuid>{db3e3e63-ecab-44e4-8aa9-a90a18283e5b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.42857100</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L07</objectName>
  <x>927</x>
  <y>677</y>
  <width>20</width>
  <height>13</height>
  <uuid>{867377a0-8bdd-480d-b323-fb1613a77de2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.42857100</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L08</objectName>
  <x>953</x>
  <y>677</y>
  <width>20</width>
  <height>13</height>
  <uuid>{3c467034-4f9b-4d3d-9892-a24f981867bc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.42857100</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L09</objectName>
  <x>980</x>
  <y>677</y>
  <width>20</width>
  <height>13</height>
  <uuid>{c74455b4-937e-40fe-b404-3a697f182147}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.42857100</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L10</objectName>
  <x>1006</x>
  <y>677</y>
  <width>20</width>
  <height>13</height>
  <uuid>{6f35cbfe-0063-4031-8443-2e663b489700}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.42857100</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L11</objectName>
  <x>1033</x>
  <y>677</y>
  <width>20</width>
  <height>13</height>
  <uuid>{55417800-63aa-4a0b-bf0c-fbbdc470d1d6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.42857100</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L12</objectName>
  <x>1059</x>
  <y>677</y>
  <width>20</width>
  <height>13</height>
  <uuid>{760d9a68-a30a-4e00-8ef1-770db6d70873}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.42857100</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L13</objectName>
  <x>770</x>
  <y>716</y>
  <width>20</width>
  <height>13</height>
  <uuid>{7b193c7b-7d71-4866-bb59-25734f3441da}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>768</x>
  <y>728</y>
  <width>23</width>
  <height>20</height>
  <uuid>{45c28e6f-1ae9-430e-b83c-663a3afc78e9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>13 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>795</x>
  <y>728</y>
  <width>23</width>
  <height>20</height>
  <uuid>{70b1c459-183b-472a-bf66-120bb24f64ca}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>14 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>821</x>
  <y>728</y>
  <width>23</width>
  <height>20</height>
  <uuid>{6666080f-1b6f-4ad8-a855-fb826dd70e9f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>15 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>847</x>
  <y>728</y>
  <width>23</width>
  <height>20</height>
  <uuid>{b4734dd5-df49-4d58-9f18-b0dcdd1ee3bd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>16 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>875</x>
  <y>728</y>
  <width>23</width>
  <height>20</height>
  <uuid>{e9480902-387c-44d6-be30-38e42cba2267}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>17 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>900</x>
  <y>728</y>
  <width>23</width>
  <height>20</height>
  <uuid>{000ccb22-22dc-4d0c-8720-f128ec246024}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>18</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>926</x>
  <y>728</y>
  <width>23</width>
  <height>20</height>
  <uuid>{a1486d1b-73ae-49c8-b7c9-ae6ecf9d7ee0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>19 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>953</x>
  <y>728</y>
  <width>23</width>
  <height>20</height>
  <uuid>{53716b44-db3e-4769-b20f-5aac7896d9a6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>20 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>979</x>
  <y>728</y>
  <width>23</width>
  <height>20</height>
  <uuid>{cbc754f7-fc87-4bd0-9234-fc667838e535}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>21 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1005</x>
  <y>728</y>
  <width>23</width>
  <height>20</height>
  <uuid>{e02781b0-606c-4476-9706-14724db15800}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>22 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1032</x>
  <y>728</y>
  <width>23</width>
  <height>20</height>
  <uuid>{ae7875f2-fc12-427a-a46e-19de39d5586e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>23 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1058</x>
  <y>728</y>
  <width>23</width>
  <height>20</height>
  <uuid>{c4b09e7e-0ff0-4865-a701-b5925bb288c8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>24 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L14</objectName>
  <x>796</x>
  <y>716</y>
  <width>20</width>
  <height>13</height>
  <uuid>{262742d9-6ecb-4ef1-8418-ff4658cb8a94}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L15</objectName>
  <x>822</x>
  <y>716</y>
  <width>20</width>
  <height>13</height>
  <uuid>{08519a70-a535-4309-89e5-7f98d9db8546}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L16</objectName>
  <x>849</x>
  <y>716</y>
  <width>20</width>
  <height>13</height>
  <uuid>{6b3ae187-5353-4db6-8954-a1c500e3876c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L17</objectName>
  <x>875</x>
  <y>716</y>
  <width>20</width>
  <height>13</height>
  <uuid>{56e7f22f-c6d8-4eb1-8bad-dc9519ba7b4e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L18</objectName>
  <x>901</x>
  <y>716</y>
  <width>20</width>
  <height>13</height>
  <uuid>{8ab04a1a-9f1c-4d92-b2f5-7eaa5216f24b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L19</objectName>
  <x>928</x>
  <y>716</y>
  <width>20</width>
  <height>13</height>
  <uuid>{5a0801cf-2b0e-4fc7-a460-aed16593e313}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L20</objectName>
  <x>954</x>
  <y>716</y>
  <width>20</width>
  <height>13</height>
  <uuid>{014b8cf4-425f-4a5c-a8f8-0bfcf148d410}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L21</objectName>
  <x>981</x>
  <y>716</y>
  <width>20</width>
  <height>13</height>
  <uuid>{800f8210-7f36-470e-9ba0-1c323a96326a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L22</objectName>
  <x>1007</x>
  <y>716</y>
  <width>20</width>
  <height>13</height>
  <uuid>{d3502302-a1c8-4d42-be33-fb51461b734b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L23</objectName>
  <x>1034</x>
  <y>716</y>
  <width>20</width>
  <height>13</height>
  <uuid>{b016b961-0b60-40b5-adfd-69c79add0005}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L24</objectName>
  <x>1060</x>
  <y>716</y>
  <width>20</width>
  <height>13</height>
  <uuid>{8d7aa834-f997-4a6a-9e46-0e169fd1cdf8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L25</objectName>
  <x>769</x>
  <y>756</y>
  <width>20</width>
  <height>13</height>
  <uuid>{27473f19-3e35-4f3b-b9ad-f4b04005d2d7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>767</x>
  <y>768</y>
  <width>23</width>
  <height>20</height>
  <uuid>{6befa2ba-45cf-4a94-ac5d-56a19fb56e72}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>25</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>794</x>
  <y>768</y>
  <width>23</width>
  <height>20</height>
  <uuid>{5a242307-b8a1-43c7-9eab-f4d3c9ef249d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>26</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>820</x>
  <y>768</y>
  <width>23</width>
  <height>20</height>
  <uuid>{a18a932b-0ee5-4bf6-aff2-dc7ee4f1a94f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>27</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>846</x>
  <y>768</y>
  <width>23</width>
  <height>20</height>
  <uuid>{d4e6a714-b39c-43ef-a164-6bda00bf2733}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>28</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>873</x>
  <y>768</y>
  <width>23</width>
  <height>20</height>
  <uuid>{3f405d61-9019-4b88-b7f3-c00d6ebfe024}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>29 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>899</x>
  <y>768</y>
  <width>23</width>
  <height>20</height>
  <uuid>{4dda7c12-0556-43ed-817f-8781b9ca27c8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>30</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>925</x>
  <y>768</y>
  <width>23</width>
  <height>20</height>
  <uuid>{aa17d62e-3883-41d0-8551-1874957d142c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>31 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>952</x>
  <y>768</y>
  <width>23</width>
  <height>20</height>
  <uuid>{41e77579-f7da-454d-8da2-c7f34f7bf476}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>32</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>978</x>
  <y>768</y>
  <width>23</width>
  <height>20</height>
  <uuid>{eec23f38-f9b9-4220-a40a-42c0e93c5447}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>33 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1004</x>
  <y>768</y>
  <width>23</width>
  <height>20</height>
  <uuid>{e13c6434-7fff-4527-89ad-395c61db91ae}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>34 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1031</x>
  <y>768</y>
  <width>23</width>
  <height>20</height>
  <uuid>{75f7d08d-fb93-4304-93c6-f7953867d048}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>35</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1057</x>
  <y>768</y>
  <width>23</width>
  <height>20</height>
  <uuid>{fe6c7795-8707-4a55-85f9-3a9471b1ed68}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>36</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L26</objectName>
  <x>795</x>
  <y>756</y>
  <width>20</width>
  <height>13</height>
  <uuid>{1beefb1b-cdbc-47be-8692-bb5bc67b636e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L27</objectName>
  <x>821</x>
  <y>756</y>
  <width>20</width>
  <height>13</height>
  <uuid>{620ea43b-f0f8-4148-8c42-e17d37221d0d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L28</objectName>
  <x>848</x>
  <y>756</y>
  <width>20</width>
  <height>13</height>
  <uuid>{cba551bb-004e-4625-9e0a-caeeb4eb3527}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L29</objectName>
  <x>874</x>
  <y>756</y>
  <width>20</width>
  <height>13</height>
  <uuid>{7f88191f-4f04-4fb3-ac14-dd727c946b37}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L30</objectName>
  <x>900</x>
  <y>756</y>
  <width>20</width>
  <height>13</height>
  <uuid>{0b39a815-a013-4e5e-8aa1-ea5096218165}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L31</objectName>
  <x>927</x>
  <y>756</y>
  <width>20</width>
  <height>13</height>
  <uuid>{9a8554cb-6910-4d20-b490-55a957fc63f4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L32</objectName>
  <x>953</x>
  <y>756</y>
  <width>20</width>
  <height>13</height>
  <uuid>{9ddd4dfe-b2b8-48ef-895a-8a97d4dee941}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L33</objectName>
  <x>980</x>
  <y>756</y>
  <width>20</width>
  <height>13</height>
  <uuid>{95cd70ad-3cea-4bcd-8a38-3f849c9d4357}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L34</objectName>
  <x>1006</x>
  <y>756</y>
  <width>20</width>
  <height>13</height>
  <uuid>{5259eb99-74b3-4f47-8486-4d1b75706a15}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L35</objectName>
  <x>1033</x>
  <y>756</y>
  <width>20</width>
  <height>13</height>
  <uuid>{bc44e866-6e0a-4c7e-960c-be1cbd86c2f2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>1.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L36</objectName>
  <x>1059</x>
  <y>756</y>
  <width>20</width>
  <height>13</height>
  <uuid>{08b24f55-b8c4-4b52-b561-f5a50860b786}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L37</objectName>
  <x>769</x>
  <y>793</y>
  <width>20</width>
  <height>13</height>
  <uuid>{70a51052-d4fb-4cc1-9c18-0fa60dc90838}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>768</x>
  <y>805</y>
  <width>23</width>
  <height>20</height>
  <uuid>{032b8a6e-b7e8-4370-b7a4-7c09121b7444}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>37 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>795</x>
  <y>805</y>
  <width>23</width>
  <height>20</height>
  <uuid>{779e244a-83ad-452b-a414-dc5c1cfdb871}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>38 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>821</x>
  <y>805</y>
  <width>23</width>
  <height>20</height>
  <uuid>{e194e611-5d9e-4a60-9345-d4acace5b0f5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>39 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>204</r>
   <g>102</g>
   <b>0</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>847</x>
  <y>805</y>
  <width>23</width>
  <height>20</height>
  <uuid>{d3468473-0360-4e02-9d08-fdada35e5808}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>40</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>874</x>
  <y>805</y>
  <width>23</width>
  <height>20</height>
  <uuid>{f006d8c0-4a75-4ccf-83dc-47d10fef7ad2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>41</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>900</x>
  <y>805</y>
  <width>23</width>
  <height>20</height>
  <uuid>{1436dd20-5537-46f4-8b1e-6aa6e0e6c9c2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>42 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>926</x>
  <y>805</y>
  <width>23</width>
  <height>20</height>
  <uuid>{178e8e0d-167e-4657-b33a-4304cc1b2851}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>43</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>953</x>
  <y>805</y>
  <width>23</width>
  <height>20</height>
  <uuid>{620e5437-7e2d-41cc-91d4-0af82deb598b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>44</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>979</x>
  <y>805</y>
  <width>23</width>
  <height>20</height>
  <uuid>{5cf19371-03a9-41ab-8394-28f069a57171}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>45</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1005</x>
  <y>805</y>
  <width>23</width>
  <height>20</height>
  <uuid>{4f0ce1a1-3cb8-4949-8969-11167e288397}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>46</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1032</x>
  <y>805</y>
  <width>23</width>
  <height>20</height>
  <uuid>{0365a18e-6cdb-4148-a136-c737b5cc3a0d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>47 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1058</x>
  <y>805</y>
  <width>22</width>
  <height>20</height>
  <uuid>{abd8a586-8cd9-450b-8904-34395aa66da6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>48 </label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L38</objectName>
  <x>795</x>
  <y>793</y>
  <width>20</width>
  <height>13</height>
  <uuid>{d167f52e-29fe-40f3-819f-27d13ca63c20}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L39</objectName>
  <x>821</x>
  <y>793</y>
  <width>20</width>
  <height>13</height>
  <uuid>{ea2d64b6-d195-48e7-a2a1-68a53e7a938f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L40</objectName>
  <x>848</x>
  <y>793</y>
  <width>20</width>
  <height>13</height>
  <uuid>{7476cfbe-47d3-46bd-86cd-8b2db56ca85b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L41</objectName>
  <x>874</x>
  <y>793</y>
  <width>20</width>
  <height>13</height>
  <uuid>{b33605bf-5283-49ae-a18e-fbcf1a6410a7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L42</objectName>
  <x>900</x>
  <y>793</y>
  <width>20</width>
  <height>13</height>
  <uuid>{a66c5904-b28a-44c9-b2cf-a9dc6d258f37}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L43</objectName>
  <x>927</x>
  <y>793</y>
  <width>20</width>
  <height>13</height>
  <uuid>{814b029e-b559-46f4-9a3b-664bba8e90e6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L44</objectName>
  <x>953</x>
  <y>793</y>
  <width>20</width>
  <height>13</height>
  <uuid>{d7badcd2-11bc-4ad1-8ca7-bbe012cd74c6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L45</objectName>
  <x>980</x>
  <y>793</y>
  <width>20</width>
  <height>13</height>
  <uuid>{ec9301e1-eb13-4228-96d5-b8031ba607b0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>46</objectName>
  <x>1006</x>
  <y>793</y>
  <width>20</width>
  <height>13</height>
  <uuid>{f2e6d2fc-0aa9-417f-b609-16b4d3d62f35}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L47</objectName>
  <x>1033</x>
  <y>793</y>
  <width>20</width>
  <height>13</height>
  <uuid>{cfdce1b7-123d-4f10-848a-a1a46de0de24}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>L48</objectName>
  <x>1059</x>
  <y>793</y>
  <width>20</width>
  <height>13</height>
  <uuid>{9a01b1a1-c533-4c8c-bba8-d5258d398fe3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert273</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1083</x>
  <y>433</y>
  <width>112</width>
  <height>34</height>
  <uuid>{69999325-a32b-4e0d-843d-5d75936fd86d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>SNAP Morph
&amp; Sequencer</label>
  <alignment>left</alignment>
  <font>Helvetica</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBCheckBox" version="2">
  <objectName>BYSTTIME</objectName>
  <x>1244</x>
  <y>600</y>
  <width>20</width>
  <height>20</height>
  <uuid>{82556f93-b6c9-4d45-b2d3-afa19cd7bb93}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <selected>true</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>771</x>
  <y>271</y>
  <width>42</width>
  <height>24</height>
  <uuid>{03c572d9-293e-45b7-b535-40953fede582}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>MIDI</label>
  <alignment>left</alignment>
  <font>Helvetica</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>102</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>_Play</objectName>
  <x>1295</x>
  <y>47</y>
  <width>117</width>
  <height>29</height>
  <uuid>{d39dfd02-e85b-43f7-b4d1-eebe7c46cbda}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>RUN/STOP</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>ROOM</objectName>
  <x>396</x>
  <y>710</y>
  <width>40</width>
  <height>24</height>
  <uuid>{bc33df27-673c-453c-9376-8b9c2655b9ad}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.990</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>HF</objectName>
  <x>441</x>
  <y>710</y>
  <width>40</width>
  <height>24</height>
  <uuid>{ef115b20-1e9d-40a6-9618-28870d28e9ef}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.367</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>REVLEV</objectName>
  <x>486</x>
  <y>710</y>
  <width>40</width>
  <height>24</height>
  <uuid>{de72f0b2-2f96-483a-a369-afe9ad185839}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.929</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBCheckBox" version="2">
  <objectName>RAN1MUTE</objectName>
  <x>126</x>
  <y>355</y>
  <width>20</width>
  <height>20</height>
  <uuid>{1bd94d56-d289-4b9d-8781-4f8f505df555}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBCheckBox" version="2">
  <objectName>RAN2MUTE</objectName>
  <x>359</x>
  <y>351</y>
  <width>20</width>
  <height>20</height>
  <uuid>{ea28963a-ade4-4bbc-9393-da77c00fa57c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>119</x>
  <y>371</y>
  <width>37</width>
  <height>20</height>
  <uuid>{e7805161-5186-443d-91e9-655d1e50b1e4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>MUTE</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1206</x>
  <y>616</y>
  <width>104</width>
  <height>25</height>
  <uuid>{8a9283b5-db3e-4165-8360-6c93b8e9bf3c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Ignore Saved Time</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1121</x>
  <y>211</y>
  <width>46</width>
  <height>23</height>
  <uuid>{4a166606-a527-4b2d-8f6f-0840ae017790}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>  L   R</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>392</x>
  <y>272</y>
  <width>182</width>
  <height>24</height>
  <uuid>{c5790e5b-aeb0-40bd-adf5-add4f733f604}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Fibonacci Spectra Compiler</label>
  <alignment>left</alignment>
  <font>Helvetica</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>102</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>strout</objectName>
  <x>768</x>
  <y>831</y>
  <width>312</width>
  <height>23</height>
  <uuid>{482e16ef-e8a7-4624-b7bd-bcf6d8896c0d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>/Users/eug/Desktop/StriaEXMP/EXMP_IMPRO.txt-> Loaded !</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>128</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>179</r>
   <g>179</g>
   <b>179</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>_Browse1</objectName>
  <x>1219</x>
  <y>796</y>
  <width>83</width>
  <height>30</height>
  <uuid>{3b5447a2-6344-40f1-a2f1-b8fe284ede89}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue>/Users/eug/Desktop/StriaEXMP/EXMP_IMPRO.txt</stringvalue>
  <text>BROWSE</text>
  <image>/</image>
  <eventLine/>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>clear_snap</objectName>
  <x>1217</x>
  <y>742</y>
  <width>83</width>
  <height>31</height>
  <uuid>{a7ee1700-dd2a-4a2f-9eeb-e74fd7cfb5da}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>CLEAR ALL</text>
  <image>/</image>
  <eventLine>i72 0 3600</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBCheckBox" version="2">
  <objectName>MIDIsave</objectName>
  <x>1051</x>
  <y>321</y>
  <width>26</width>
  <height>20</height>
  <uuid>{2b253c87-3071-4456-a422-748b513e9a47}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>true</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>926</x>
  <y>321</y>
  <width>126</width>
  <height>20</height>
  <uuid>{ba200599-b433-433e-9428-2f48c76e4b1c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Associate to BANK---></label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>778</x>
  <y>565</y>
  <width>289</width>
  <height>61</height>
  <uuid>{5b4a7464-c79b-4818-b1d0-59430938f5be}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>7</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>128</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>5</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBScrollNumber" version="2">
  <objectName>TIME</objectName>
  <x>1143</x>
  <y>601</y>
  <width>59</width>
  <height>22</height>
  <uuid>{a5645fc0-431c-479d-9ba5-3e9434531067}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <value>42.00000000</value>
  <resolution>0.01000000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>999999999999.00000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>770</x>
  <y>649</y>
  <width>92</width>
  <height>25</height>
  <uuid>{e1171953-438f-46a4-a014-db1ac0c49a80}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>SNAP Status</label>
  <alignment>left</alignment>
  <font>Helvetica</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>102</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1094</x>
  <y>46</y>
  <width>41</width>
  <height>21</height>
  <uuid>{6ff74b45-b76a-46d0-bbd6-30e5a107a38a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Main
</label>
  <alignment>left</alignment>
  <font>Helvetica</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>button1</objectName>
  <x>1219</x>
  <y>237</y>
  <width>127</width>
  <height>32</height>
  <uuid>{17bd9b33-a756-476d-8201-3d835ecc43b9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>TIMER Start/Stop</text>
  <image>/</image>
  <eventLine>i2 0 -1 5</eventLine>
  <latch>false</latch>
  <latched>true</latched>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>mins</objectName>
  <x>1215</x>
  <y>214</y>
  <width>61</width>
  <height>24</height>
  <uuid>{3f51a6f2-6d42-4eaf-9059-549c57186a3e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.000</label>
  <alignment>center</alignment>
  <font>Eurostile</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>251</r>
   <g>255</g>
   <b>170</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1274</x>
  <y>210</y>
  <width>21</width>
  <height>29</height>
  <uuid>{7f584f4c-c1a2-4f7d-944a-5db15b2c51d2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>:</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>18</fontsize>
  <precision>3</precision>
  <color>
   <r>102</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBCheckBox" version="2">
  <objectName>grid_morph</objectName>
  <x>1115</x>
  <y>631</y>
  <width>19</width>
  <height>22</height>
  <uuid>{f1d7b603-14d7-4043-b246-ddbd025184c6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1092</x>
  <y>648</y>
  <width>61</width>
  <height>22</height>
  <uuid>{a9645513-08da-4284-90c4-41dca386caf0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Slide Grid</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>79</x>
  <y>250</y>
  <width>59</width>
  <height>24</height>
  <uuid>{383e8e5d-b231-40cc-a19b-f4f2c0335e00}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>Voices On</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>secs</objectName>
  <x>1287</x>
  <y>214</y>
  <width>73</width>
  <height>24</height>
  <uuid>{3e72313b-1cdd-4499-919d-7c7cd40b4978}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.000</label>
  <alignment>center</alignment>
  <font>Eurostile</font>
  <fontsize>14</fontsize>
  <precision>3</precision>
  <color>
   <r>102</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>251</r>
   <g>255</g>
   <b>170</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>88</x>
  <y>696</y>
  <width>34</width>
  <height>20</height>
  <uuid>{d89237fc-9c3f-43f9-88aa-77aeece84742}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Grid</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>102</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>grid_XFREQ</objectName>
  <x>122</x>
  <y>681</y>
  <width>54</width>
  <height>24</height>
  <uuid>{7d982227-0f5d-4935-a487-68387a50a41a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>39.453</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>64</r>
   <g>0</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>125</x>
  <y>696</y>
  <width>34</width>
  <height>20</height>
  <uuid>{724b349f-e5bd-4859-af02-bdf12a3514c1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Hz</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBCheckBox" version="2">
  <objectName>keyb_SW</objectName>
  <x>192</x>
  <y>456</y>
  <width>20</width>
  <height>20</height>
  <uuid>{d549d795-149c-4e51-a3d3-a435a040ab1e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>158</x>
  <y>473</y>
  <width>87</width>
  <height>23</height>
  <uuid>{58075c72-06cd-4f70-a772-af49f2ae2197}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>MIDI Keyb. On
</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>32</x>
  <y>785</y>
  <width>30</width>
  <height>22</height>
  <uuid>{d34a3143-a017-406b-9e5b-8422b71bc0fc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Sine</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>260</x>
  <y>788</y>
  <width>30</width>
  <height>22</height>
  <uuid>{0ad21dd0-3af5-4db8-a4a6-0dcda03af8a0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Sine</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>warn</objectName>
  <x>868</x>
  <y>646</y>
  <width>207</width>
  <height>26</height>
  <uuid>{b1ee6d29-f55d-46c8-8727-e5d8cf90dbb7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label/>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>0</g>
   <b>51</b>
  </color>
  <bgcolor mode="background">
   <r>204</r>
   <g>204</g>
   <b>204</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>5</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>198</x>
  <y>37</y>
  <width>82</width>
  <height>20</height>
  <uuid>{d1dbefed-5b8d-4ee4-a941-8b81fa1d5bea}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>FREQ. SPREAD</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>195</x>
  <y>79</y>
  <width>82</width>
  <height>21</height>
  <uuid>{e83aa138-c1dd-4b9d-a2ea-70b7810f4b4f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>DURATION</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>191</x>
  <y>125</y>
  <width>84</width>
  <height>20</height>
  <uuid>{47b0d2e9-0bea-493a-8d11-93b5e33b3e3a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>RATE</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>band</objectName>
  <x>321</x>
  <y>48</y>
  <width>52</width>
  <height>22</height>
  <uuid>{79f389d4-b4fe-42e7-a60c-8416596e7375}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.000</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>dur</objectName>
  <x>321</x>
  <y>91</y>
  <width>52</width>
  <height>22</height>
  <uuid>{64e90c2c-03a2-4f4e-b465-3d9f2155c102}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.456</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>rate</objectName>
  <x>321</x>
  <y>137</y>
  <width>52</width>
  <height>22</height>
  <uuid>{c084c4a6-5c70-498f-9e63-323c097334c6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.279</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>MIDIVAR_1</objectName>
  <x>927</x>
  <y>346</y>
  <width>131</width>
  <height>24</height>
  <uuid>{15e3eb0a-9593-4ff8-81d1-d8d7f17f554b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>Not Assigned</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> LEV_1</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> X1</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Y1</name>
    <value>3</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> F_1</name>
    <value>4</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> IM_1</name>
    <value>5</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> ATK_1</name>
    <value>6</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REL_1</name>
    <value>7</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN AMP_1</name>
    <value>8</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN RATE_1</name>
    <value>9</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> VOI</name>
    <value>10</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> STEP</name>
    <value>11</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REV_1</name>
    <value>12</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> FOCUS/DIFF</name>
    <value>13</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> LONG/SHORT</name>
    <value>14</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> FAST/SLOW</name>
    <value>15</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> SHAPE</name>
    <value>16</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> XFADE</name>
    <value>17</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> X2</name>
    <value>18</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> LEV_2</name>
    <value>19</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> F_2</name>
    <value>20</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> IM_2</name>
    <value>21</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN AMP_2</name>
    <value>22</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN RATE_2</name>
    <value>23</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REV_2</name>
    <value>24</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Volume</name>
    <value>25</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> CARmin</name>
    <value>26</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> CARmax</name>
    <value>27</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> MODmin</name>
    <value>28</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> MODmax</name>
    <value>29</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>0</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>CAR_min</objectName>
  <x>1114</x>
  <y>307</y>
  <width>20</width>
  <height>80</height>
  <uuid>{6634db4e-2b53-4f3d-8344-85c2eca80ddc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>14.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>CAR_max</objectName>
  <x>1172</x>
  <y>307</y>
  <width>20</width>
  <height>80</height>
  <uuid>{6a4fbb47-ca15-4e40-a026-faa746cb1772}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>1.00000000</minimum>
  <maximum>14.00000000</maximum>
  <value>3.27500000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>MIDIVAR_2</objectName>
  <x>929</x>
  <y>376</y>
  <width>131</width>
  <height>24</height>
  <uuid>{f1601c37-e7e2-42b5-9b8d-d1dd8149d3b0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>Not Assigned</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> LEV_1</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> X1</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Y1</name>
    <value>3</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> F_1</name>
    <value>4</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> IM_1</name>
    <value>5</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> ATK_1</name>
    <value>6</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REL_1</name>
    <value>7</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN AMP_1</name>
    <value>8</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN RATE_1</name>
    <value>9</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> VOI</name>
    <value>10</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> STEP</name>
    <value>11</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REV_1</name>
    <value>12</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> FOCUS/DIFF</name>
    <value>13</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> LONG/SHORT</name>
    <value>14</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> FAST/SLOW</name>
    <value>15</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> SHAPE</name>
    <value>16</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> XFADE</name>
    <value>17</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> X2</name>
    <value>18</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> LEV_2</name>
    <value>19</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> F_2</name>
    <value>20</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> IM_2</name>
    <value>21</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN AMP_2</name>
    <value>22</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN RATE_2</name>
    <value>23</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REV_2</name>
    <value>24</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Volume</name>
    <value>25</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> CARmin</name>
    <value>26</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> CARmax</name>
    <value>27</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> MODmin</name>
    <value>28</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> MODmax</name>
    <value>29</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>0</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>MIDIVAR_3</objectName>
  <x>929</x>
  <y>402</y>
  <width>131</width>
  <height>24</height>
  <uuid>{62845f53-f96e-4139-bd1e-fab732cac216}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>Not Assigned</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> LEV_1</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> X1</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Y1</name>
    <value>3</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> F_1</name>
    <value>4</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> IM_1</name>
    <value>5</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> ATK_1</name>
    <value>6</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REL_1</name>
    <value>7</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN AMP_1</name>
    <value>8</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN RATE_1</name>
    <value>9</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> VOI</name>
    <value>10</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> STEP</name>
    <value>11</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REV_1</name>
    <value>12</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> FOCUS/DIFF</name>
    <value>13</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> LONG/SHORT</name>
    <value>14</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> FAST/SLOW</name>
    <value>15</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> SHAPE</name>
    <value>16</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> XFADE</name>
    <value>17</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> X2</name>
    <value>18</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> LEV_2</name>
    <value>19</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> F_2</name>
    <value>20</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> IM_2</name>
    <value>21</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN AMP_2</name>
    <value>22</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN RATE_2</name>
    <value>23</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REV_2</name>
    <value>24</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Volume</name>
    <value>25</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> CARmin</name>
    <value>26</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> CARmax</name>
    <value>27</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> MODmin</name>
    <value>28</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> MODmax</name>
    <value>29</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>0</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>MIDIVAR_4</objectName>
  <x>928</x>
  <y>428</y>
  <width>131</width>
  <height>24</height>
  <uuid>{50d0b7e9-624a-461b-9bdb-0d3fbaf98da8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>Not Assigned</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> LEV_1</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> X1</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Y1</name>
    <value>3</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> F_1</name>
    <value>4</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> IM_1</name>
    <value>5</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> ATK_1</name>
    <value>6</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REL_1</name>
    <value>7</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN AMP_1</name>
    <value>8</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN RATE_1</name>
    <value>9</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> VOI</name>
    <value>10</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> STEP</name>
    <value>11</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REV_1</name>
    <value>12</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> FOCUS/DIFF</name>
    <value>13</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> LONG/SHORT</name>
    <value>14</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> FAST/SLOW</name>
    <value>15</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> SHAPE</name>
    <value>16</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> XFADE</name>
    <value>17</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> X2</name>
    <value>18</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> LEV_2</name>
    <value>19</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> F_2</name>
    <value>20</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> IM_2</name>
    <value>21</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN AMP_2</name>
    <value>22</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN RATE_2</name>
    <value>23</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REV_2</name>
    <value>24</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Volume</name>
    <value>25</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> CARmin</name>
    <value>26</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> CARmax</name>
    <value>27</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> MODmin</name>
    <value>28</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> MODmax</name>
    <value>29</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>0</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>MIDIVAR_5</objectName>
  <x>928</x>
  <y>456</y>
  <width>131</width>
  <height>24</height>
  <uuid>{05d78177-142d-4cd4-a2fa-aa8180458f35}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>Not Assigned</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> LEV_1</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> X1</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Y1</name>
    <value>3</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> F_1</name>
    <value>4</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> IM_1</name>
    <value>5</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> ATK_1</name>
    <value>6</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REL_1</name>
    <value>7</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN AMP_1</name>
    <value>8</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN RATE_1</name>
    <value>9</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> VOI</name>
    <value>10</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> STEP</name>
    <value>11</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REV_1</name>
    <value>12</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> FOCUS/DIFF</name>
    <value>13</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> LONG/SHORT</name>
    <value>14</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> FAST/SLOW</name>
    <value>15</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> SHAPE</name>
    <value>16</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> XFADE</name>
    <value>17</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> X2</name>
    <value>18</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> LEV_2</name>
    <value>19</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> F_2</name>
    <value>20</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> IM_2</name>
    <value>21</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN AMP_2</name>
    <value>22</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN RATE_2</name>
    <value>23</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REV_2</name>
    <value>24</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Volume</name>
    <value>25</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> CARmin</name>
    <value>26</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> CARmax</name>
    <value>27</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> MODmin</name>
    <value>28</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> MODmax</name>
    <value>29</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>0</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>MIDIVAR_6</objectName>
  <x>928</x>
  <y>481</y>
  <width>131</width>
  <height>24</height>
  <uuid>{2cc9e210-ef60-42ad-bbbb-3d11328e747d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>Not Assigned</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> LEV_1</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> X1</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Y1</name>
    <value>3</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> F_1</name>
    <value>4</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> IM_1</name>
    <value>5</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> ATK_1</name>
    <value>6</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REL_1</name>
    <value>7</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN AMP_1</name>
    <value>8</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN RATE_1</name>
    <value>9</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> VOI</name>
    <value>10</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> STEP</name>
    <value>11</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REV_1</name>
    <value>12</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> FOCUS/DIFF</name>
    <value>13</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> LONG/SHORT</name>
    <value>14</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> FAST/SLOW</name>
    <value>15</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> SHAPE</name>
    <value>16</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> XFADE</name>
    <value>17</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> X2</name>
    <value>18</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> LEV_2</name>
    <value>19</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> F_2</name>
    <value>20</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> IM_2</name>
    <value>21</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN AMP_2</name>
    <value>22</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN RATE_2</name>
    <value>23</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REV_2</name>
    <value>24</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Volume</name>
    <value>25</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> CARmin</name>
    <value>26</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> CARmax</name>
    <value>27</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> MODmin</name>
    <value>28</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> MODmax</name>
    <value>29</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>0</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>MIDIVAR_7</objectName>
  <x>927</x>
  <y>507</y>
  <width>131</width>
  <height>24</height>
  <uuid>{bff8a470-cbf7-4e68-8aaa-92d977a38966}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>Not Assigned</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> LEV_1</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> X1</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Y1</name>
    <value>3</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> F_1</name>
    <value>4</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> IM_1</name>
    <value>5</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> ATK_1</name>
    <value>6</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REL_1</name>
    <value>7</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN AMP_1</name>
    <value>8</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN RATE_1</name>
    <value>9</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> VOI</name>
    <value>10</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> STEP</name>
    <value>11</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REV_1</name>
    <value>12</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> FOCUS/DIFF</name>
    <value>13</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> LONG/SHORT</name>
    <value>14</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> FAST/SLOW</name>
    <value>15</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> SHAPE</name>
    <value>16</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> XFADE</name>
    <value>17</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> X2</name>
    <value>18</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> LEV_2</name>
    <value>19</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> F_2</name>
    <value>20</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> IM_2</name>
    <value>21</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN AMP_2</name>
    <value>22</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN RATE_2</name>
    <value>23</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REV_2</name>
    <value>24</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Volume</name>
    <value>25</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> CARmin</name>
    <value>26</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> CARmax</name>
    <value>27</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> MODmin</name>
    <value>28</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> MODmax</name>
    <value>29</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>0</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>MIDIVAR_8</objectName>
  <x>927</x>
  <y>535</y>
  <width>131</width>
  <height>24</height>
  <uuid>{1a189d70-a877-4ee9-8f60-07e726535e0c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>Not Assigned</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> LEV_1</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> X1</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Y1</name>
    <value>3</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> F_1</name>
    <value>4</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> IM_1</name>
    <value>5</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> ATK_1</name>
    <value>6</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REL_1</name>
    <value>7</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN AMP_1</name>
    <value>8</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN RATE_1</name>
    <value>9</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> VOI</name>
    <value>10</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> STEP</name>
    <value>11</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REV_1</name>
    <value>12</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> FOCUS/DIFF</name>
    <value>13</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> LONG/SHORT</name>
    <value>14</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> FAST/SLOW</name>
    <value>15</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> SHAPE</name>
    <value>16</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> XFADE</name>
    <value>17</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> X2</name>
    <value>18</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Lev_2</name>
    <value>19</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> F_2</name>
    <value>20</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> IM_2</name>
    <value>21</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN AMP_2</name>
    <value>22</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN RATE_2</name>
    <value>23</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REV_2</name>
    <value>24</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Volume</name>
    <value>25</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> CARmin</name>
    <value>26</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> CARmax</name>
    <value>27</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> MODmin</name>
    <value>28</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> MODmax</name>
    <value>29</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>0</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>792</x>
  <y>404</y>
  <width>25</width>
  <height>24</height>
  <uuid>{f7297329-c364-4490-838b-e09e786d0140}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>CC</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>792</x>
  <y>430</y>
  <width>25</width>
  <height>24</height>
  <uuid>{a6307d7f-6077-4586-90e0-815f8281e941}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>CC</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>791</x>
  <y>457</y>
  <width>25</width>
  <height>24</height>
  <uuid>{1f0de50f-d837-4e16-a687-259ce6e444cd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>CC</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>791</x>
  <y>485</y>
  <width>25</width>
  <height>24</height>
  <uuid>{d256b310-6d8e-4110-9a80-dda648bf99d0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>CC</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>791</x>
  <y>512</y>
  <width>25</width>
  <height>24</height>
  <uuid>{0386cfb9-e478-4c9e-afe0-b1724fd76462}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>CC</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>791</x>
  <y>538</y>
  <width>25</width>
  <height>24</height>
  <uuid>{b5f17d94-8051-4951-b1d3-452f23381692}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>CC</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>slider434</objectName>
  <x>2057484235</x>
  <y>1151514430</y>
  <width>194</width>
  <height>2</height>
  <uuid>{b5079378-da9d-46e1-8b43-e3159b389b3f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>cc1_lev</objectName>
  <x>881</x>
  <y>351</y>
  <width>50</width>
  <height>15</height>
  <uuid>{70f7aa81-2e08-444d-b777-bfdbaf390684}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>cc5_lev</objectName>
  <x>880</x>
  <y>461</y>
  <width>50</width>
  <height>15</height>
  <uuid>{72cf3f75-48c6-4c71-a007-a59fd7c47a1c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>cc2_lev</objectName>
  <x>882</x>
  <y>380</y>
  <width>50</width>
  <height>15</height>
  <uuid>{1275c177-b13d-4fd4-ac31-5ba16f4e63f4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>cc3_lev</objectName>
  <x>882</x>
  <y>407</y>
  <width>50</width>
  <height>15</height>
  <uuid>{8a9e492b-3a5c-4393-b4c9-fd5395b4973a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.89400000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>cc4_lev</objectName>
  <x>881</x>
  <y>434</y>
  <width>50</width>
  <height>15</height>
  <uuid>{064b74d6-f92b-434c-8bc3-aba7262eee36}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.11000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>cc6_lev</objectName>
  <x>880</x>
  <y>487</y>
  <width>50</width>
  <height>15</height>
  <uuid>{51ad6850-5b0a-42d6-994b-0c2c1e713991}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.28300000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>cc7_lev</objectName>
  <x>880</x>
  <y>514</y>
  <width>50</width>
  <height>15</height>
  <uuid>{09baf813-ed0d-4e0f-9df7-5c8de0b37feb}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>cc8_lev</objectName>
  <x>880</x>
  <y>541</y>
  <width>50</width>
  <height>15</height>
  <uuid>{0bd4d5c9-6881-47e5-9612-3314f77f6196}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>1.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBScrollNumber" version="2">
  <objectName>cc1_lev</objectName>
  <x>891</x>
  <y>339</y>
  <width>33</width>
  <height>13</height>
  <uuid>{038559c4-5ffe-4da1-afab-7a213a3461a3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>0</g>
   <b>128</b>
  </bgcolor>
  <value>1.00000000</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>99999999999999.00000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject type="BSBScrollNumber" version="2">
  <objectName>cc2_lev</objectName>
  <x>891</x>
  <y>366</y>
  <width>33</width>
  <height>13</height>
  <uuid>{552ed9a0-6507-49fc-bb51-47354d792e51}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>0</g>
   <b>128</b>
  </bgcolor>
  <value>-0.14700000</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>99999999999999.00000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject type="BSBScrollNumber" version="2">
  <objectName>cc3_lev</objectName>
  <x>891</x>
  <y>395</y>
  <width>33</width>
  <height>13</height>
  <uuid>{5016736f-1466-4e53-b4eb-1471618c5dc5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>0</g>
   <b>128</b>
  </bgcolor>
  <value>0.89400000</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>99999999999999.00000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject type="BSBScrollNumber" version="2">
  <objectName>cc4_lev</objectName>
  <x>891</x>
  <y>421</y>
  <width>33</width>
  <height>13</height>
  <uuid>{82fed31c-e7e9-49f9-a097-4e1956aa9cf4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>0</g>
   <b>128</b>
  </bgcolor>
  <value>0.11000000</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>99999999999999.00000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject type="BSBScrollNumber" version="2">
  <objectName>cc5_lev</objectName>
  <x>891</x>
  <y>449</y>
  <width>33</width>
  <height>13</height>
  <uuid>{305603c0-ad1e-4a2a-a0a6-df8b29f38547}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>0</g>
   <b>128</b>
  </bgcolor>
  <value>1.46900000</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>99999999999999.00000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject type="BSBScrollNumber" version="2">
  <objectName>cc6_lev</objectName>
  <x>891</x>
  <y>474</y>
  <width>33</width>
  <height>13</height>
  <uuid>{f709c0ad-d578-4379-acf5-34b348aeaea6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>0</g>
   <b>128</b>
  </bgcolor>
  <value>0.28300000</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>99999999999999.00000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject type="BSBScrollNumber" version="2">
  <objectName>cc7_lev</objectName>
  <x>891</x>
  <y>501</y>
  <width>33</width>
  <height>13</height>
  <uuid>{bd03ced8-5b39-47d0-8b82-8b9f11081cb6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>0</g>
   <b>128</b>
  </bgcolor>
  <value>1.00000000</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>99999999999999.00000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject type="BSBScrollNumber" version="2">
  <objectName>cc8_lev</objectName>
  <x>891</x>
  <y>529</y>
  <width>33</width>
  <height>13</height>
  <uuid>{ecb08edc-a276-4f89-9816-06fba941093e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>0</g>
   <b>128</b>
  </bgcolor>
  <value>1.00000000</value>
  <resolution>0.00100000</resolution>
  <minimum>-999999999999.00000000</minimum>
  <maximum>99999999999999.00000000</maximum>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject type="BSBCheckBox" version="2">
  <objectName>inv1</objectName>
  <x>771</x>
  <y>349</y>
  <width>20</width>
  <height>20</height>
  <uuid>{88c896a0-652d-448b-927c-0f273350c88c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBCheckBox" version="2">
  <objectName>inv2</objectName>
  <x>771</x>
  <y>379</y>
  <width>20</width>
  <height>20</height>
  <uuid>{c7678f80-465d-46a6-bb86-1f1bdbd2dda1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBCheckBox" version="2">
  <objectName>inv3</objectName>
  <x>771</x>
  <y>407</y>
  <width>20</width>
  <height>20</height>
  <uuid>{0ac53a44-964a-45bd-8077-f7a7758b65ad}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBCheckBox" version="2">
  <objectName>inv4</objectName>
  <x>771</x>
  <y>434</y>
  <width>20</width>
  <height>20</height>
  <uuid>{1cdffc4f-2586-4da7-b959-1ba2ffef21c9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBCheckBox" version="2">
  <objectName>inv5</objectName>
  <x>771</x>
  <y>460</y>
  <width>20</width>
  <height>20</height>
  <uuid>{566045e1-eec3-4004-836e-ac13aebfdccb}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBCheckBox" version="2">
  <objectName>inv6</objectName>
  <x>771</x>
  <y>487</y>
  <width>20</width>
  <height>20</height>
  <uuid>{e8e27c2c-e137-48e7-acce-c438485ce9a5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBCheckBox" version="2">
  <objectName>inv7</objectName>
  <x>771</x>
  <y>515</y>
  <width>20</width>
  <height>20</height>
  <uuid>{a9a49878-a36d-4ead-b769-31c6e5b7eca7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBCheckBox" version="2">
  <objectName>inv8</objectName>
  <x>771</x>
  <y>542</y>
  <width>20</width>
  <height>20</height>
  <uuid>{6a489939-89fe-4e5b-bb1f-189c62fe4878}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>768</x>
  <y>321</y>
  <width>27</width>
  <height>23</height>
  <uuid>{ff8efcae-d11d-45cd-8a09-24c7211eb0b4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Inv</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>4</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>slider25</objectName>
  <x>-1684370995</x>
  <y>-1632653275</y>
  <width>128</width>
  <height>17</height>
  <uuid>{68ff242e-aff0-4ae3-9bd3-d4ee2fa91625}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.36718800</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>Rand_1</objectName>
  <x>-1684370995</x>
  <y>-1632653259</y>
  <width>127</width>
  <height>31</height>
  <uuid>{3dd8d09c-df46-4434-b436-3c60bd1aa7d2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Rand_1</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>hor98</objectName>
  <x>-1684370793</x>
  <y>-1632653247</y>
  <width>29</width>
  <height>10</height>
  <uuid>{a9fccdaa-8f61-443a-9642-03c2e757ea82}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert98</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.70000000</xValue>
  <yValue>0.07500000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>234</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>menu146</objectName>
  <x>926223910</x>
  <y>1029660209</y>
  <width>10</width>
  <height>83</height>
  <uuid>{0a9c6687-3269-453b-a46f-b3445691ac6d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>UP</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> DOWN</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>0</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>slider25</objectName>
  <x>-1684370995</x>
  <y>-1632653275</y>
  <width>128</width>
  <height>17</height>
  <uuid>{9ebf8a78-d75d-46fb-8606-c8aa466ab692}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.36718800</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>Rand_1</objectName>
  <x>-1684370995</x>
  <y>-1632653259</y>
  <width>127</width>
  <height>31</height>
  <uuid>{0021512d-e993-4719-b4a0-dcaaabf20b9c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Rand_1</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>hor98</objectName>
  <x>-1684370793</x>
  <y>-1632653247</y>
  <width>29</width>
  <height>10</height>
  <uuid>{8840bdce-08b2-4c3d-8ab5-252c45ff63d7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert98</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.70000000</xValue>
  <yValue>0.07500000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>234</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>menu146</objectName>
  <x>926223910</x>
  <y>1029660209</y>
  <width>10</width>
  <height>83</height>
  <uuid>{79c8d462-4f99-40d8-a2ce-f3c5b1423d7b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>UP</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> DOWN</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>0</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>button1</objectName>
  <x>-1684371026</x>
  <y>-1632653224</y>
  <width>10</width>
  <height>10</height>
  <uuid>{9f1104bc-d497-46b7-9fb1-0c7aa5121f60}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>On/Off#1</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>true</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>Rand_1</objectName>
  <x>-1684371026</x>
  <y>-1632653254</y>
  <width>10</width>
  <height>10</height>
  <uuid>{e5505495-2dce-4689-813e-2fe4552c56d3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Rand_1</text>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>hor98</objectName>
  <x>-1684370924</x>
  <y>-1632653218</y>
  <width>10</width>
  <height>10</height>
  <uuid>{54bd6b4a-f5d7-4c75-be8f-f5a0ccfdaaa5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert98</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.70000000</xValue>
  <yValue>0.07500000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>234</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>hor98</objectName>
  <x>-1684370923</x>
  <y>-1632653246</y>
  <width>10</width>
  <height>10</height>
  <uuid>{cb6ef301-cf00-4fa2-a9c2-4a8ec845a28b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert98</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.70000000</xValue>
  <yValue>0.07500000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>234</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>slider165</objectName>
  <x>336156730</x>
  <y>853334705</y>
  <width>20</width>
  <height>100</height>
  <uuid>{7108172b-b53b-4b2e-9956-02b264c8be56}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>391</x>
  <y>804</y>
  <width>48</width>
  <height>22</height>
  <uuid>{670a3087-8a3d-49ce-bc5b-a83ff3bdadda}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>ROOM</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName/>
  <x>1088</x>
  <y>268</y>
  <width>82</width>
  <height>24</height>
  <uuid>{20871dd3-9eae-4b02-96a6-a7f6a3fffd5d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>FM Control</label>
  <alignment>left</alignment>
  <font>Helvetica</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>204</r>
   <g>204</g>
   <b>204</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>hor198</objectName>
  <x>1766595507</x>
  <y>-1131970832</y>
  <width>37</width>
  <height>10</height>
  <uuid>{b9137a93-b816-4fef-a998-f3e06790aeb3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert198</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>234</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>-253921141</x>
  <y>677009588</y>
  <width>10</width>
  <height>187</height>
  <uuid>{16dbd935-9d0c-4b11-a7a9-97cacfeda793}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>New Label</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>MIDIVAR_8</objectName>
  <x>1852447484</x>
  <y>2059320742</y>
  <width>132</width>
  <height>24</height>
  <uuid>{92b1fca1-244b-4af8-ab12-352d213a7db9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>nul</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> LEV_1</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> X1</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> Y1</name>
    <value>3</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> F_1</name>
    <value>4</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> IM_1</name>
    <value>5</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> ATK_1</name>
    <value>6</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REL_1</name>
    <value>7</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN AMP_1</name>
    <value>8</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN RATE_1</name>
    <value>9</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> VOI</name>
    <value>10</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> STEP</name>
    <value>11</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> XFADE</name>
    <value>12</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> LEV_2</name>
    <value>13</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> F_2</name>
    <value>14</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> IM_2</name>
    <value>15</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN AMP_2</name>
    <value>16</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> RAN RATE_2</name>
    <value>17</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> REV_2</name>
    <value>18</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>0</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>hor267</objectName>
  <x>168076941</x>
  <y>426667403</y>
  <width>31</width>
  <height>10</height>
  <uuid>{6677cb04-3751-4cd0-b488-0056f7ed1827}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert267</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>234</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>349</x>
  <y>368</y>
  <width>39</width>
  <height>20</height>
  <uuid>{7c52267b-88f9-49a8-9b91-842cdfcb8a7b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>MUTE</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>8</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>792</x>
  <y>377</y>
  <width>25</width>
  <height>24</height>
  <uuid>{484b0fb8-5e8e-4678-8329-c79f1f0233ed}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <label>CC</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>slider434</objectName>
  <x>2057484235</x>
  <y>1151514430</y>
  <width>194</width>
  <height>2</height>
  <uuid>{eeb2db0e-4245-442b-9278-4d4ff7dc8b3d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>button1</objectName>
  <x>614</x>
  <y>689</y>
  <width>49</width>
  <height>25</height>
  <uuid>{6f83dbcc-1846-4106-8bae-019dbe3ba8d5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>REC</text>
  <image>/</image>
  <eventLine>i960 0 1</eventLine>
  <latch>false</latch>
  <latched>true</latched>
 </bsbObject>
 <bsbObject type="BSBScrollNumber" version="2">
  <objectName>rectime</objectName>
  <x>633</x>
  <y>718</y>
  <width>77</width>
  <height>21</height>
  <uuid>{b8be62b1-403d-4762-9e1a-514c52422166}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>230</g>
   <b>97</b>
  </bgcolor>
  <value>100.00000000</value>
  <resolution>1.00000000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>3600.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>5</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>LED_WRITE</objectName>
  <x>669</x>
  <y>697</y>
  <width>12</width>
  <height>12</height>
  <uuid>{1ccd072b-c074-4f22-977e-8d83d4283c40}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>LED_WRITE</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>0</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>DisplayTime</objectName>
  <x>635</x>
  <y>778</y>
  <width>79</width>
  <height>24</height>
  <uuid>{37b1e989-9bff-4d98-b6d4-95326b525f42}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>24</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>5</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>rectimedisp</objectName>
  <x>611</x>
  <y>763</y>
  <width>136</width>
  <height>9</height>
  <uuid>{26b99f3a-4b08-4991-8271-18be2527fc06}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <objectName2>vert499</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>button1</objectName>
  <x>685</x>
  <y>690</y>
  <width>56</width>
  <height>25</height>
  <uuid>{f7f107a3-7708-4e72-93b9-af57ac0d6642}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>STOP</text>
  <image>/</image>
  <eventLine>i961 0 1</eventLine>
  <latch>false</latch>
  <latched>true</latched>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>707</x>
  <y>717</y>
  <width>30</width>
  <height>22</height>
  <uuid>{62a5de70-eb52-40e3-afc2-28059bfdab27}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>sec</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>622</x>
  <y>739</y>
  <width>103</width>
  <height>21</height>
  <uuid>{128c9907-b88b-4d3a-976f-1248fa9d2571}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>RecTime</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>button1</objectName>
  <x>1084</x>
  <y>468</y>
  <width>71</width>
  <height>25</height>
  <uuid>{a2bbbbbf-433d-4661-9061-b272524452af}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Start Seq</text>
  <image>/</image>
  <eventLine>i970 0 3600</eventLine>
  <latch>false</latch>
  <latched>true</latched>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>ledseq</objectName>
  <x>1246</x>
  <y>480</y>
  <width>104</width>
  <height>5</height>
  <uuid>{5ec00ee9-8b8c-451f-b69d-e4c8b27e3991}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>vert505</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.70000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>0</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>ledton</objectName>
  <x>1219</x>
  <y>480</y>
  <width>25</width>
  <height>5</height>
  <uuid>{1fd49133-263e-4cf3-9269-670cf0696b49}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>vert505</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.70000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>128</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>button1</objectName>
  <x>1150</x>
  <y>468</y>
  <width>70</width>
  <height>25</height>
  <uuid>{a83da1f0-11f9-43e1-848d-56f53417d434}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Halt Seq</text>
  <image>/</image>
  <eventLine>i971 0 1</eventLine>
  <latch>false</latch>
  <latched>true</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>button1</objectName>
  <x>1355</x>
  <y>510</y>
  <width>72</width>
  <height>28</height>
  <uuid>{2ed98655-8698-407c-baa9-d86ec0e0a03c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Load Seq</text>
  <image>/</image>
  <eventLine>i972 0 1</eventLine>
  <latch>false</latch>
  <latched>true</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>button1</objectName>
  <x>1355</x>
  <y>483</y>
  <width>72</width>
  <height>28</height>
  <uuid>{f9634069-6c10-4295-9cda-91b30f526e04}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Save Seq</text>
  <image>/</image>
  <eventLine>i973 0 1</eventLine>
  <latch>false</latch>
  <latched>true</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>button1</objectName>
  <x>1354</x>
  <y>544</y>
  <width>71</width>
  <height>23</height>
  <uuid>{24127d80-f240-436d-8c28-371dbbfec4ba}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Add</text>
  <image>/</image>
  <eventLine>i980 0 1</eventLine>
  <latch>false</latch>
  <latched>true</latched>
 </bsbObject>
 <bsbObject type="BSBCheckBox" version="2">
  <objectName>ADSYN</objectName>
  <x>1212</x>
  <y>365</y>
  <width>20</width>
  <height>20</height>
  <uuid>{a4110ed2-d473-4514-85ef-433b3dec5e21}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>_Browse2</objectName>
  <x>1355</x>
  <y>457</y>
  <width>72</width>
  <height>30</height>
  <uuid>{1aa01640-4512-47b4-aae7-b7fddc61e4d0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue>/Users/eug/Documents/StriaAndres/SEQ_prova.txt</stringvalue>
  <text>BROWSE</text>
  <image>/</image>
  <eventLine/>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>readend</objectName>
  <x>1122</x>
  <y>493</y>
  <width>44</width>
  <height>20</height>
  <uuid>{04f186ef-53e1-4b58-bcd9-c426ef04c072}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>1.000</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>102</r>
   <g>255</g>
   <b>204</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>readton</objectName>
  <x>1167</x>
  <y>493</y>
  <width>46</width>
  <height>20</height>
  <uuid>{e6886748-0a01-4848-9bc6-3231f1a3621c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>1.000</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>204</g>
   <b>102</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>readsnap</objectName>
  <x>1214</x>
  <y>493</y>
  <width>44</width>
  <height>20</height>
  <uuid>{5ffb1ede-547d-44a7-bd27-27bcf4327cd1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>1.000</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>204</r>
   <g>204</g>
   <b>204</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>readttran</objectName>
  <x>1259</x>
  <y>493</y>
  <width>46</width>
  <height>20</height>
  <uuid>{00fce5c5-3c03-4ab1-a104-a14fe3629afa}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>1.000</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>128</r>
   <g>128</g>
   <b>0</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>readindex</objectName>
  <x>1088</x>
  <y>492</y>
  <width>36</width>
  <height>25</height>
  <uuid>{16e4955d-a3b6-4012-a4ec-ff9a7234f21c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>1.00000000</resolution>
  <minimum>0</minimum>
  <maximum>99</maximum>
  <randomizable group="0">false</randomizable>
  <value>4</value>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>readtype</objectName>
  <x>1306</x>
  <y>493</y>
  <width>46</width>
  <height>20</height>
  <uuid>{a9c8025d-1d2c-4af7-98d2-c12fed91c805}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>1.000</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>102</r>
   <g>153</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1117</x>
  <y>528</y>
  <width>56</width>
  <height>22</height>
  <uuid>{f415c1f3-07f6-4999-a079-d70b793910f5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Run/Stop</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1174</x>
  <y>528</y>
  <width>36</width>
  <height>20</height>
  <uuid>{e0955066-6db4-4145-8c43-b674d6a5d396}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Hold</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1218</x>
  <y>528</y>
  <width>41</width>
  <height>23</height>
  <uuid>{84c87fe5-815b-4aa7-bb3d-ae782e1cc062}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Snap</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1265</x>
  <y>528</y>
  <width>42</width>
  <height>23</height>
  <uuid>{a4863738-0a75-45f7-be55-fe7ffb59c9a7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Tmrph</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1310</x>
  <y>528</y>
  <width>41</width>
  <height>23</height>
  <uuid>{c2ff49a2-248c-4730-b829-f413d4937af8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Type</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>ratio</objectName>
  <x>391</x>
  <y>67</y>
  <width>64</width>
  <height>25</height>
  <uuid>{837da043-443b-4fbe-8666-d69be0756530}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>179</r>
   <g>179</g>
   <b>179</b>
  </bgcolor>
  <resolution>0.00100000</resolution>
  <minimum>1.011</minimum>
  <maximum>2</maximum>
  <randomizable group="0">false</randomizable>
  <value>1.011</value>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>num</objectName>
  <x>461</x>
  <y>67</y>
  <width>64</width>
  <height>25</height>
  <uuid>{7dfe2d1d-b3cc-4b1f-b686-dec085231606}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>179</r>
   <g>179</g>
   <b>179</b>
  </bgcolor>
  <resolution>0.00100000</resolution>
  <minimum>1</minimum>
  <maximum>90</maximum>
  <randomizable group="0">false</randomizable>
  <value>3</value>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>den</objectName>
  <x>463</x>
  <y>119</y>
  <width>64</width>
  <height>25</height>
  <uuid>{0725c926-bae8-4b92-821f-75fd90c57f35}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>179</r>
   <g>179</g>
   <b>179</b>
  </bgcolor>
  <resolution>0.00100000</resolution>
  <minimum>1</minimum>
  <maximum>90</maximum>
  <randomizable group="0">false</randomizable>
  <value>2</value>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>outf</objectName>
  <x>544</x>
  <y>66</y>
  <width>67</width>
  <height>26</height>
  <uuid>{7bb0aae7-f218-4d36-a997-6a7b58f04a1d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>179</r>
   <g>179</g>
   <b>179</b>
  </bgcolor>
  <resolution>0.00100000</resolution>
  <minimum>50</minimum>
  <maximum>400</maximum>
  <randomizable group="0">false</randomizable>
  <value>180.636</value>
 </bsbObject>
 <bsbObject type="BSBCheckBox" version="2">
  <objectName>fftONOFF</objectName>
  <x>1175</x>
  <y>49</y>
  <width>20</width>
  <height>20</height>
  <uuid>{73604df9-c2f6-46c9-9e78-df62c21796ea}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <selected>false</selected>
  <label/>
  <pressedValue>1</pressedValue>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName/>
  <x>1200</x>
  <y>48</y>
  <width>82</width>
  <height>24</height>
  <uuid>{eae95cb0-60b9-44e9-a7ba-62ee82dca9e1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>FFT On/Off</label>
  <alignment>left</alignment>
  <font>Helvetica</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>204</r>
   <g>204</g>
   <b>204</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>outf</objectName>
  <x>560</x>
  <y>91</y>
  <width>18</width>
  <height>142</height>
  <uuid>{d60f7c25-9c76-4930-a7c3-e4a1c988f95a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <minimum>50.00000000</minimum>
  <maximum>400.00000000</maximum>
  <value>180.63600000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>ffund</objectName>
  <x>793</x>
  <y>69</y>
  <width>65</width>
  <height>25</height>
  <uuid>{f5784961-dcaa-4e3e-965f-fe9875bbd87e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>179</r>
   <g>179</g>
   <b>179</b>
  </bgcolor>
  <resolution>0.00100000</resolution>
  <minimum>1</minimum>
  <maximum>400</maximum>
  <randomizable group="0">false</randomizable>
  <value>1</value>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>exp</objectName>
  <x>859</x>
  <y>69</y>
  <width>64</width>
  <height>25</height>
  <uuid>{d0067cb0-6c36-47f2-b022-23fc76f0433d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>179</r>
   <g>179</g>
   <b>179</b>
  </bgcolor>
  <resolution>0.00100000</resolution>
  <minimum>-0.01</minimum>
  <maximum>0.01</maximum>
  <randomizable group="0">false</randomizable>
  <value>0.000282</value>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>_Browse3</objectName>
  <x>603</x>
  <y>803</y>
  <width>138</width>
  <height>27</height>
  <uuid>{ce236138-7abb-476e-9bfc-f8759a3a30c7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue>/Users/eug/Desktop/provarec.wav</stringvalue>
  <text>BROWSE SOUNDFILE</text>
  <image>/</image>
  <eventLine/>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBScrollNumber" version="2">
  <objectName>in_readend</objectName>
  <x>1122</x>
  <y>517</y>
  <width>44</width>
  <height>17</height>
  <uuid>{28de78f2-4452-4f4b-940f-863714f2e994}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>0.00000000</value>
  <resolution>1.00000000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>4</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject type="BSBScrollNumber" version="2">
  <objectName>in_readton</objectName>
  <x>1168</x>
  <y>517</y>
  <width>44</width>
  <height>17</height>
  <uuid>{21665e42-e5dc-476f-b782-1318675aa4c9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>2.00000000</value>
  <resolution>0.10000000</resolution>
  <minimum>0.00000000</minimum>
  <maximum>60.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>4</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject type="BSBScrollNumber" version="2">
  <objectName>in_readsnap</objectName>
  <x>1214</x>
  <y>517</y>
  <width>44</width>
  <height>17</height>
  <uuid>{fdd5edcf-5181-4266-ae2e-b89a48ca9d6d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>35.00000000</value>
  <resolution>1.00000000</resolution>
  <minimum>1.00000000</minimum>
  <maximum>48.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>4</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject type="BSBScrollNumber" version="2">
  <objectName>in_readtran</objectName>
  <x>1259</x>
  <y>517</y>
  <width>46</width>
  <height>17</height>
  <uuid>{9620189d-d9e0-430d-9651-9bd3ad23395e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>20.00000000</value>
  <resolution>0.10000000</resolution>
  <minimum>0.10000000</minimum>
  <maximum>60.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>4</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject type="BSBScrollNumber" version="2">
  <objectName>in_readtype</objectName>
  <x>1306</x>
  <y>517</y>
  <width>45</width>
  <height>17</height>
  <uuid>{c8af1296-b752-4b15-b4f1-b41995a76e45}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>0.00000000</value>
  <resolution>0.10000000</resolution>
  <minimum>-5.00000000</minimum>
  <maximum>5.00000000</maximum>
  <bordermode>border</bordermode>
  <borderradius>4</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>FIB_Start</objectName>
  <x>392</x>
  <y>298</y>
  <width>72</width>
  <height>26</height>
  <uuid>{4bb49b5c-a276-4ca2-ae1d-a9ca97f844e2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>1.00000000</resolution>
  <minimum>1</minimum>
  <maximum>50</maximum>
  <randomizable group="0">false</randomizable>
  <value>8</value>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>FIB_Fund</objectName>
  <x>466</x>
  <y>297</y>
  <width>72</width>
  <height>26</height>
  <uuid>{e2bc5aa4-cbdb-4368-b59f-db179cc2e0af}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>1.00000000</resolution>
  <minimum>1</minimum>
  <maximum>30</maximum>
  <randomizable group="0">false</randomizable>
  <value>12</value>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName/>
  <x>135</x>
  <y>767</y>
  <width>108</width>
  <height>33</height>
  <uuid>{3057a1e5-1bac-4563-91b4-2fb6cc9aed63}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>GAUSS SHOT</text>
  <image>/</image>
  <eventLine>i3 0 -1</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>button495</objectName>
  <x>812</x>
  <y>288</y>
  <width>58</width>
  <height>22</height>
  <uuid>{a3a903ec-7d67-4b2f-a770-c69646640a8b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>CLEAR</text>
  <image>/</image>
  <eventLine>i5 0 -1</eventLine>
  <latch>false</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>band</objectName>
  <x>319</x>
  <y>71</y>
  <width>65</width>
  <height>18</height>
  <uuid>{1c2ddb04-3a79-4e75-a4c9-fb3700c1fd5c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.00010000</resolution>
  <minimum>0.0001</minimum>
  <maximum>100</maximum>
  <randomizable group="0">false</randomizable>
  <value>0.0001</value>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>metronome</objectName>
  <x>1219</x>
  <y>441</y>
  <width>80</width>
  <height>25</height>
  <uuid>{427c0956-3071-4659-a273-541a2bf58740}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <resolution>0.01000000</resolution>
  <minimum>0.1</minimum>
  <maximum>20</maximum>
  <randomizable group="0">false</randomizable>
  <value>0.7</value>
 </bsbObject>
 <bsbObject type="BSBLineEdit" version="2">
  <objectName>_Browse2</objectName>
  <x>1091</x>
  <y>575</y>
  <width>330</width>
  <height>24</height>
  <uuid>{69c51266-9ae9-499d-acff-f4da45ccb426}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>/Users/eug/Documents/StriaAndres/SEQ_prova.txt</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>232</r>
   <g>232</g>
   <b>232</b>
  </bgcolor>
  <background>nobackground</background>
 </bsbObject>
 <bsbObject type="BSBLineEdit" version="2">
  <objectName>_Browse3</objectName>
  <x>389</x>
  <y>832</y>
  <width>370</width>
  <height>23</height>
  <uuid>{0d04efa5-c7a8-402c-bc84-8d19866367db}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>provarec.wav</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>232</r>
   <g>232</g>
   <b>232</b>
  </bgcolor>
  <background>nobackground</background>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>seqblink</objectName>
  <x>1096</x>
  <y>524</y>
  <width>7</width>
  <height>7</height>
  <uuid>{e2e2d59b-c488-4fd4-98ec-7907152a156c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>seqblink</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>0</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>395</x>
  <y>685</y>
  <width>60</width>
  <height>23</height>
  <uuid>{7974ef0c-e8b3-4bbe-a5c4-cfe0f8ff9524}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Reverb </label>
  <alignment>left</alignment>
  <font>Helvetica</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>102</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>_datares</objectName>
  <x>556</x>
  <y>716</y>
  <width>75</width>
  <height>22</height>
  <uuid>{035355d3-a1af-4196-bc06-77ad8450e509}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>16 bit</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> 24 bit</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> 32 bit</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>1</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>552</x>
  <y>686</y>
  <width>2</width>
  <height>146</height>
  <uuid>{5a2ff84e-e3a5-4968-947c-d8545f5e3c3f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>label500</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>179</r>
   <g>179</g>
   <b>179</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>555</x>
  <y>688</y>
  <width>56</width>
  <height>21</height>
  <uuid>{1befb0f5-45fe-4ca8-9a2e-88e530fbc55a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Record</label>
  <alignment>left</alignment>
  <font>Helvetica</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>102</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>progress_lin</objectName>
  <x>1092</x>
  <y>733</y>
  <width>332</width>
  <height>5</height>
  <uuid>{54cb8d10-7d84-4a65-9a0c-49540e995941}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>progress_lin</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>2.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>34</r>
   <g>255</g>
   <b>12</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>mpercent</objectName>
  <x>1374</x>
  <y>697</y>
  <width>38</width>
  <height>23</height>
  <uuid>{786c51b2-b8d3-490b-a051-e23bc85cb6e8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.000</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>11</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>69</r>
   <g>211</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>6</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1404</x>
  <y>697</y>
  <width>31</width>
  <height>22</height>
  <uuid>{763dfad7-6f52-43ac-877d-af2e0d6f50c2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>%</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBScope" version="2">
  <objectName/>
  <x>6</x>
  <y>10</y>
  <width>40</width>
  <height>28</height>
  <uuid>{0dbdc8b0-fc05-4581-9839-390c2b0e26d7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <value>-255.00000000</value>
  <type>poincare</type>
  <zoomx>18.00000000</zoomx>
  <zoomy>15.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <mode>0.00000000</mode>
 </bsbObject>
 <bsbObject type="BSBSpinBox" version="2">
  <objectName>Get</objectName>
  <x>1296</x>
  <y>769</y>
  <width>16</width>
  <height>28</height>
  <uuid>{64c5953b-a497-45ca-b6e5-0f9f8c4246b5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>0</fontsize>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>204</g>
   <b>102</b>
  </bgcolor>
  <resolution>1.00000000</resolution>
  <minimum>0</minimum>
  <maximum>47</maximum>
  <randomizable group="0">false</randomizable>
  <value>34</value>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>49</x>
  <y>404</y>
  <width>47</width>
  <height>23</height>
  <uuid>{16ce171a-bf51-4d58-a22b-30406fe325fd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>G1_grid</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>102</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>279</x>
  <y>404</y>
  <width>37</width>
  <height>21</height>
  <uuid>{51e5e3cd-287b-4b26-b9c1-4b80ab332869}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>G2</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>102</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBGraph" version="2">
  <objectName>disptab</objectName>
  <x>1160</x>
  <y>79</y>
  <width>252</width>
  <height>134</height>
  <uuid>{df7371bb-57ed-442d-9cb0-b69bbd6fc3ae}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <value>82</value>
  <objectName2/>
  <zoomx>1.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <modex>lin</modex>
  <modey>lin</modey>
  <all>true</all>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>IM1_SW</objectName>
  <x>118</x>
  <y>838</y>
  <width>13</width>
  <height>14</height>
  <uuid>{5d55657e-9b08-4cf1-8084-a582e7d7f67c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text/>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>F1_SW</objectName>
  <x>19</x>
  <y>838</y>
  <width>13</width>
  <height>14</height>
  <uuid>{b48650aa-361e-4bcd-80d8-1f54fc5f10d9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text/>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>X1_SW</objectName>
  <x>152</x>
  <y>548</y>
  <width>13</width>
  <height>15</height>
  <uuid>{9b53a133-0863-4865-9eef-908be7bd3aa6}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text/>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>X2_SW</objectName>
  <x>219</x>
  <y>546</y>
  <width>13</width>
  <height>15</height>
  <uuid>{ac5d6394-0aeb-44c2-8cfa-a39d30ccb16b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text/>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>VOI_SW</objectName>
  <x>7</x>
  <y>534</y>
  <width>13</width>
  <height>14</height>
  <uuid>{5439183a-4b25-4290-8475-a9b5e2cfd566}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text/>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>STEP_SW</objectName>
  <x>37</x>
  <y>534</y>
  <width>13</width>
  <height>14</height>
  <uuid>{8f25ea20-d7bf-45fa-b65b-6ff2501c30ff}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text/>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>AT1_SW</objectName>
  <x>66</x>
  <y>534</y>
  <width>13</width>
  <height>14</height>
  <uuid>{5e62ef73-109e-4cd2-9d9e-4aa2b6b58cf0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text/>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>REL1_SW</objectName>
  <x>102</x>
  <y>534</y>
  <width>13</width>
  <height>14</height>
  <uuid>{d0df1cab-c659-4396-a3e3-d374c5bb2651}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text/>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>REV1_SW</objectName>
  <x>137</x>
  <y>534</y>
  <width>13</width>
  <height>14</height>
  <uuid>{0b4aa9f4-218a-494f-989b-d145ce55ccdb}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text/>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>AT2_SW</objectName>
  <x>246</x>
  <y>534</y>
  <width>13</width>
  <height>14</height>
  <uuid>{7878e3cb-acf6-4900-9fc1-e2b401ce5610}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text/>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>REL2_SW</objectName>
  <x>287</x>
  <y>534</y>
  <width>13</width>
  <height>14</height>
  <uuid>{64bb996b-ce56-4d3b-924a-e8fcc8fde170}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text/>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>REV2_SW</objectName>
  <x>333</x>
  <y>534</y>
  <width>13</width>
  <height>14</height>
  <uuid>{224ec89c-6bf3-4415-970e-add6a17fde4c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text/>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>IM2_SW</objectName>
  <x>336</x>
  <y>837</y>
  <width>13</width>
  <height>14</height>
  <uuid>{9ff89b46-07ef-4f0e-802b-1a1199c22e58}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text/>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>LEV2_SW</objectName>
  <x>289</x>
  <y>838</y>
  <width>14</width>
  <height>14</height>
  <uuid>{f1b7f4df-a44e-4b96-a0e6-fe4e0c506b70}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text/>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>F2_SW</objectName>
  <x>243</x>
  <y>838</y>
  <width>13</width>
  <height>14</height>
  <uuid>{84dc4251-6955-4f0d-94cf-009c894ac78c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text/>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>SHAPE_SW</objectName>
  <x>231</x>
  <y>205</y>
  <width>13</width>
  <height>14</height>
  <uuid>{e00bb5ae-1779-40df-9c1f-ce0ebd532ae0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text/>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>RATE_SW</objectName>
  <x>220</x>
  <y>149</y>
  <width>13</width>
  <height>14</height>
  <uuid>{ab84a741-79d6-4ac2-ab49-73db21449acf}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text/>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>DUR_SW</objectName>
  <x>220</x>
  <y>103</y>
  <width>13</width>
  <height>14</height>
  <uuid>{a6d9e28a-6644-41e7-bb38-b62bd976bf09}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text/>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>BAND_SW</objectName>
  <x>220</x>
  <y>60</y>
  <width>13</width>
  <height>14</height>
  <uuid>{db3c1a40-c491-4681-8a01-d86eaf8f66f9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text/>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>LEV1_SW</objectName>
  <x>69</x>
  <y>839</y>
  <width>13</width>
  <height>14</height>
  <uuid>{447ffde1-aaa9-4fed-a6e3-9140282d4f94}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text/>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>CARMIN_SW</objectName>
  <x>1118</x>
  <y>405</y>
  <width>13</width>
  <height>14</height>
  <uuid>{4ed9bee6-586f-4c73-8d80-a25d9a63e57f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text/>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>CARMAX_SW</objectName>
  <x>1178</x>
  <y>405</y>
  <width>13</width>
  <height>14</height>
  <uuid>{f048459d-e254-49ac-8b7a-f88e1e7f7e28}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text/>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>MODMIN_SW</objectName>
  <x>1320</x>
  <y>405</y>
  <width>13</width>
  <height>14</height>
  <uuid>{8829971f-047b-44cb-9591-fbac670bd1f8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text/>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>MODMAX_SW</objectName>
  <x>1378</x>
  <y>405</y>
  <width>13</width>
  <height>14</height>
  <uuid>{c87973c4-2eca-4071-a26c-c5feb4c836a9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text/>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>FADE_SW</objectName>
  <x>187</x>
  <y>641</y>
  <width>13</width>
  <height>15</height>
  <uuid>{025a478e-7c81-4542-b14c-32dac50906b5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text/>
  <image>/</image>
  <eventLine>i1 0 10</eventLine>
  <latch>true</latch>
  <latched>false</latched>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1186</x>
  <y>216</y>
  <width>31</width>
  <height>21</height>
  <uuid>{4b77d8ee-4fd9-4733-9bb5-ec66b0ee9671}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>min</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1352</x>
  <y>216</y>
  <width>35</width>
  <height>21</height>
  <uuid>{27f13c28-de91-4654-995e-df400c9f4c34}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>secs</label>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>led_TIMER1</objectName>
  <x>1210</x>
  <y>248</y>
  <width>7</width>
  <height>7</height>
  <uuid>{6c7cc8d4-3855-4f0d-8ab4-d9bbcf901185}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>led_TIMER1</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>led_TIMER2</objectName>
  <x>1348</x>
  <y>248</y>
  <width>7</width>
  <height>7</height>
  <uuid>{3799bbd0-18b1-4668-b216-582890766d77}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>led_TIMER2</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>255</r>
   <g>128</g>
   <b>0</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>max_index_FI</objectName>
  <x>667</x>
  <y>319</y>
  <width>71</width>
  <height>22</height>
  <uuid>{24ba47c9-ccce-439e-a906-e78e9396f49a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>10.000</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName/>
  <x>601</x>
  <y>324</y>
  <width>65</width>
  <height>22</height>
  <uuid>{405fbdad-d354-438c-b533-947fed66fa5e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>#of_FREQS</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>102</r>
   <g>204</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>timelaps</objectName>
  <x>1301</x>
  <y>443</y>
  <width>54</width>
  <height>21</height>
  <uuid>{4d8252e2-d3fc-40c8-ac48-4e25d3c3d434}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.000</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>204</r>
   <g>204</g>
   <b>204</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>seq_tot_time</objectName>
  <x>1164</x>
  <y>443</y>
  <width>53</width>
  <height>21</height>
  <uuid>{06a81177-27bb-4e66-bf58-1a33c3feb736}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>87.143</label>
  <alignment>center</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>102</r>
   <g>255</g>
   <b>102</b>
  </bgcolor>
  <bordermode>border</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>timeline</objectName>
  <x>1090</x>
  <y>569</y>
  <width>331</width>
  <height>5</height>
  <uuid>{ec7130c5-a7dc-43f6-9dc3-faec7a3b947a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <objectName2>timeline</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <color>
   <r>0</r>
   <g>255</g>
   <b>255</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </bgcolor>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>over</objectName>
  <x>1085</x>
  <y>72</y>
  <width>46</width>
  <height>22</height>
  <uuid>{f7bf92ca-9057-48dc-8d7d-71fd02b35264}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>0.203</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>255</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>0</r>
   <g>64</g>
   <b>128</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>3</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>button1</objectName>
  <x>1225</x>
  <y>544</y>
  <width>71</width>
  <height>23</height>
  <uuid>{30e5f2d8-2ddb-4f45-9914-999ff0d3c71d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Delete</text>
  <image>/</image>
  <eventLine>i981 0 1</eventLine>
  <latch>false</latch>
  <latched>true</latched>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>button1</objectName>
  <x>1095</x>
  <y>544</y>
  <width>71</width>
  <height>23</height>
  <uuid>{00f285cb-e392-49d4-a855-88bbcdd3880d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Insert</text>
  <image>/</image>
  <eventLine>i982 0 1</eventLine>
  <latch>false</latch>
  <latched>true</latched>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1160</x>
  <y>558</y>
  <width>70</width>
  <height>2</height>
  <uuid>{c42cbbad-f00b-45c1-b3ae-3bf0f2e7d12e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>230</r>
   <g>230</g>
   <b>230</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1290</x>
  <y>558</y>
  <width>70</width>
  <height>2</height>
  <uuid>{d1cebcb2-123f-46cb-8f69-a47a277318a4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label/>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>230</r>
   <g>230</g>
   <b>230</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1226</x>
  <y>460</y>
  <width>63</width>
  <height>22</height>
  <uuid>{ed0119d9-e921-4a3c-9cd6-07cbdad783e0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Time Scale</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1161</x>
  <y>427</y>
  <width>63</width>
  <height>22</height>
  <uuid>{a9634dd4-160d-4c61-8c05-32eebd8b2a2f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Total Dur</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1300</x>
  <y>427</y>
  <width>63</width>
  <height>22</height>
  <uuid>{7960849f-bc4b-47fb-9111-7d994023108b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Curr Time</label>
  <alignment>left</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1236</x>
  <y>670</y>
  <width>30</width>
  <height>22</height>
  <uuid>{cddccb46-8aee-4d23-88d1-dc1b150d8291}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <label>Time</label>
  <alignment>center</alignment>
  <font>Lucida Grande</font>
  <fontsize>9</fontsize>
  <precision>3</precision>
  <color>
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>noborder</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
