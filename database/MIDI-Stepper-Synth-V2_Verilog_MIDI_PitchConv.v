/*
MIDI_PitchConv by Jonathan Kayne, December 2018
This module converts the MIDI pitch data into clock pulses.
The MIDI note value corresponds to a specific frequency. We want to use this to drive a "blink" module that
will generate a square wave at the same frequency (or octave higher/lower for resonances).
We want a number that is the number of clock cycles equivalent to half the period of our desired frequency.

The clock on the DE0-nano is 50MHz, so the period is 20ns.
To convert to the number of clock cycles use the following equation:
count = 1/(frequency*40ns)
*/
module MIDI_PitchConv(dataIn, pitchOut, velOut, Clk);
	input [15:0] dataIn;
	input Clk;
	output reg [23:0] pitchOut; //largest number was 20 bits long, so use a 24 bit register for safety
	output [7:0] velOut;
	
	assign velOut = dataIn[7:0];
	
	always @ (dataIn[15:8])
	begin
		//velOut = dataIn[7:0]; //pass through the velocity
		
		case (dataIn[15:8])
		//MIDI Note Value		Clock			Pitch	Frequency
			23	: pitchOut = 	806452;	//	B0		31
			24	: pitchOut = 	757576;	//	C1		33
			25	: pitchOut = 	714286;	//	CS1	35
			26	: pitchOut = 	675676;	//	D1		37
			27	: pitchOut = 	641026;	//	DS1	39
			28	: pitchOut = 	609756;	//	E1		41
			29	: pitchOut = 	568182;	//	F1		44
			30	: pitchOut = 	543478;	//	FS1	46
			31	: pitchOut = 	510204;	//	G1		49
			32	: pitchOut = 	480769;	//	GS1	52
			33	: pitchOut = 	454545;	//	A1		55
			34	: pitchOut = 	431034;	//	AS1	58
			35	: pitchOut = 	403226;	//	B1		62
			36	: pitchOut = 	384615;	//	C2		65
			37	: pitchOut = 	362319;	//	CS2	69
			38	: pitchOut = 	342466;	//	D2		73
			39	: pitchOut = 	320513;	//	DS2	78
			40	: pitchOut = 	304878;	//	E2		82
			41	: pitchOut = 	287356;	//	F2		87
			42	: pitchOut = 	268817;	//	FS2	93
			43	: pitchOut = 	255102;	//	G2		98
			44	: pitchOut = 	240385;	//	GS2	104
			45	: pitchOut = 	227273;	//	A2		110
			46	: pitchOut = 	213675;	//	AS2	117
			47	: pitchOut = 	203252;	//	B2		123
			48	: pitchOut = 	190840;	//	C3		131
			49	: pitchOut = 	179856;	//	CS3	139
			50	: pitchOut = 	170068;	//	D3		147
			51	: pitchOut = 	160256;	//	DS3	156
			52	: pitchOut = 	304878;	//	E3		165
			53	: pitchOut = 	287356;	//	F3		175
			54	: pitchOut = 	135135;	//	FS3	185
			55	: pitchOut = 	127551;	//	G3		196
			56	: pitchOut = 	120192;	//	GS3	208
			57	: pitchOut = 	113636;	//	A3		220
			58	: pitchOut = 	107296;	//	AS3	233
			59	: pitchOut = 	101215;	//	B3		247
			60	: pitchOut = 	95420;	//	C4		262
			61	: pitchOut = 	90253;	//	CS4	277
			62	: pitchOut = 	85034;	//	D4		294
			63	: pitchOut = 	80386;	//	DS4	311
			64	: pitchOut = 	75758;	//	E4		330
			65	: pitchOut = 	71633;	//	F4		349
			66	: pitchOut = 	67568;	//	FS4	370
			67	: pitchOut = 	63776;	//	G4		392
			68	: pitchOut = 	60241;	//	GS4	415
			69	: pitchOut = 	56818;	//	A4		440
			70	: pitchOut = 	53648;	//	AS4	466
			71	: pitchOut = 	50607;	//	B4		494
			72	: pitchOut = 	47801;	//	C5		523
			73	: pitchOut = 	45126;	//	CS5	554
			74	: pitchOut = 	42589;	//	D5		587
			75	: pitchOut = 	40193;	//	DS5	622
			76	: pitchOut = 	37936;	//	E5		659
			77	: pitchOut = 	35817;	//	F5		698
			78	: pitchOut = 	33784;	//	FS5	740
			79	: pitchOut = 	31888;	//	G5		784
			80	: pitchOut = 	30084;	//	GS5	831
			81	: pitchOut = 	28409;	//	A5		880
			82	: pitchOut = 	26824;	//	AS5	932
			83	: pitchOut = 	25304;	//	B5		988
			84	: pitchOut = 	23878;	//	C6		1047
			85	: pitchOut = 	22543;	//	CS6	1109
			86	: pitchOut = 	21277;	//	D6		1175
			87	: pitchOut = 	20080;	//	DS6	1245
			88	: pitchOut = 	18954;	//	E6		1319
			89	: pitchOut = 	17895;	//	F6		1397
			90	: pitchOut = 	16892;	//	FS6	1480
			91	: pitchOut = 	15944;	//	G6		1568
			92	: pitchOut = 	15051;	//	GS6	1661
			93	: pitchOut = 	14205;	//	A6		1760
			94	: pitchOut = 	13405;	//	AS6	1865
			95	: pitchOut = 	12652;	//	B6		1976
			96	: pitchOut = 	11945;	//	C7		2093
			97	: pitchOut = 	11276;	//	CS7	2217
			98	: pitchOut = 	10643;	//	D7		2349
			99	: pitchOut = 	10044;	//	DS7	2489
			100: pitchOut = 	9480;		//	E7		2637
			101: pitchOut = 	8948;		//	F7		2794
			102: pitchOut = 	8446;		//	FS7	2960
			103: pitchOut = 	7972;		//	G7		3136
			104: pitchOut = 	7526;		//	GS7	3322
			105: pitchOut = 	7102;		//	A7		3520
			106: pitchOut = 	6704;		//	AS7	3729
			107: pitchOut = 	6328;		//	B7		3951
			108: pitchOut = 	5972;		//	C8		4186
			109: pitchOut = 	5637;		//	CS8	4435
			110: pitchOut = 	5320;		//	D8		4699
			111: pitchOut = 	5022;		//	DS8	4978
			default pitchOut = 0;
		endcase
	end

endmodule
