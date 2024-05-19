// This program was cloned from: https://github.com/mehrdadh/lora-modulator
// License: MIT License

`include	"LoRaTXDefines.v"
`include	"RadioDefines.v"

module cosIdeal(angle, cosOut);

input		[`PRECISION-1:0]	angle;
output reg	[`SinSize-1:0]		cosOut;

reg [`PRECISION-1:0]	index;
always @(*) begin
	index = angle >> (25-`Sine_SR_Bits);
end

always @(index) begin
	if (index < 84)
		cosOut	=	`SinSize'b0111111111111;
	else if (index < 144)
		cosOut	=	`SinSize'b0111110111111;
	else if (index < 184)
		cosOut	=	`SinSize'b0111101111111;
	else if (index < 218)
		cosOut	=	`SinSize'b0111100111111;
	else if (index < 248)
		cosOut	=	`SinSize'b0111011111111;
	else if (index < 274)
		cosOut	=	`SinSize'b0111010111111;
	else if (index < 298)
		cosOut	=	`SinSize'b0111001111111;
	else if (index < 320)
		cosOut	=	`SinSize'b0111000111111;
	else if (index < 341)
		cosOut	=	`SinSize'b0110111111111;
	else if (index < 361)
		cosOut	=	`SinSize'b0110110111111;
	else if (index < 381)
		cosOut	=	`SinSize'b0110101111111;
	else if (index < 399)
		cosOut	=	`SinSize'b0110100111111;
	else if (index < 414)
		cosOut	=	`SinSize'b0110011111111;
	else if (index < 432)
		cosOut	=	`SinSize'b0110010111111;
	else if (index < 449)
		cosOut	=	`SinSize'b0110001111111;
	else if (index < 465)
		cosOut	=	`SinSize'b0110000111111;
	else if (index < 478)
		cosOut	=	`SinSize'b0101111111111;
	else if (index < 494)
		cosOut	=	`SinSize'b0101110111111;
	else if (index < 509)
		cosOut	=	`SinSize'b0101101111111;
	else if (index < 522)
		cosOut	=	`SinSize'b0101100111111;
	else if (index < 536)
		cosOut	=	`SinSize'b0101011111111;
	else if (index < 551)
		cosOut	=	`SinSize'b0101010111111;
	else if (index < 564)
		cosOut	=	`SinSize'b0101001111111;
	else if (index < 577)
		cosOut	=	`SinSize'b0101000111111;
	else if (index < 591)
		cosOut	=	`SinSize'b0100111111111;
	else if (index < 602)
		cosOut	=	`SinSize'b0100110111111;
	else if (index < 617)
		cosOut	=	`SinSize'b0100101111111;
	else if (index < 628)
		cosOut	=	`SinSize'b0100100111111;
	else if (index < 641)
		cosOut	=	`SinSize'b0100011111111;
	else if (index < 652)
		cosOut	=	`SinSize'b0100010111111;
	else if (index < 664)
		cosOut	=	`SinSize'b0100001111111;
	else if (index < 676)
		cosOut	=	`SinSize'b0100000111111;
	else if (index < 688)
		cosOut	=	`SinSize'b0011111111111;
	else if (index < 700)
		cosOut	=	`SinSize'b0011110111111;
	else if (index < 710)
		cosOut	=	`SinSize'b0011101111111;
	else if (index < 722)
		cosOut	=	`SinSize'b0011100111111;
	else if (index < 734)
		cosOut	=	`SinSize'b0011011111111;
	else if (index < 744)
		cosOut	=	`SinSize'b0011010111111;
	else if (index < 756)
		cosOut	=	`SinSize'b0011001111111;
	else if (index < 766)
		cosOut	=	`SinSize'b0011000111111;
	else if (index < 778)
		cosOut	=	`SinSize'b0010111111111;
	else if (index < 788)
		cosOut	=	`SinSize'b0010110111111;
	else if (index < 800)
		cosOut	=	`SinSize'b0010101111111;
	else if (index < 810)
		cosOut	=	`SinSize'b0010100111111;
	else if (index < 820)
		cosOut	=	`SinSize'b0010011111111;
	else if (index < 832)
		cosOut	=	`SinSize'b0010010111111;
	else if (index < 842)
		cosOut	=	`SinSize'b0010001111111;
	else if (index < 852)
		cosOut	=	`SinSize'b0010000111111;
	else if (index < 862)
		cosOut	=	`SinSize'b0001111111111;
	else if (index < 874)
		cosOut	=	`SinSize'b0001110111111;
	else if (index < 884)
		cosOut	=	`SinSize'b0001101111111;
	else if (index < 894)
		cosOut	=	`SinSize'b0001100111111;
	else if (index < 904)
		cosOut	=	`SinSize'b0001011111111;
	else if (index < 914)
		cosOut	=	`SinSize'b0001010111111;
	else if (index < 924)
		cosOut	=	`SinSize'b0001001111111;
	else if (index < 934)
		cosOut	=	`SinSize'b0001000111111;
	else if (index < 944)
		cosOut	=	`SinSize'b0000111111111;
	else if (index < 956)
		cosOut	=	`SinSize'b0000110111111;
	else if (index < 966)
		cosOut	=	`SinSize'b0000101111111;
	else if (index < 976)
		cosOut	=	`SinSize'b0000100111111;
	else if (index < 986)
		cosOut	=	`SinSize'b0000011111111;
	else if (index < 996)
		cosOut	=	`SinSize'b0000010111111;
	else if (index < 1006)
		cosOut	=	`SinSize'b0000001111111;
	else if (index < 1016)
		cosOut	=	`SinSize'b0000000111111;
	else if (index < 1036)
		cosOut	=	`SinSize'b0000000000000;
	else if (index < 1046)
		cosOut	=	`SinSize'b1111111000001;
	else if (index < 1056)
		cosOut	=	`SinSize'b1111110000001;
	else if (index < 1066)
		cosOut	=	`SinSize'b1111101000001;
	else if (index < 1076)
		cosOut	=	`SinSize'b1111100000001;
	else if (index < 1086)
		cosOut	=	`SinSize'b1111011000001;
	else if (index < 1096)
		cosOut	=	`SinSize'b1111010000001;
	else if (index < 1108)
		cosOut	=	`SinSize'b1111001000001;
	else if (index < 1118)
		cosOut	=	`SinSize'b1111000000001;
	else if (index < 1128)
		cosOut	=	`SinSize'b1110111000001;
	else if (index < 1138)
		cosOut	=	`SinSize'b1110110000001;
	else if (index < 1148)
		cosOut	=	`SinSize'b1110101000001;
	else if (index < 1158)
		cosOut	=	`SinSize'b1110100000001;
	else if (index < 1168)
		cosOut	=	`SinSize'b1110011000001;
	else if (index < 1178)
		cosOut	=	`SinSize'b1110010000001;
	else if (index < 1190)
		cosOut	=	`SinSize'b1110001000001;
	else if (index < 1200)
		cosOut	=	`SinSize'b1110000000001;
	else if (index < 1210)
		cosOut	=	`SinSize'b1101111000001;
	else if (index < 1220)
		cosOut	=	`SinSize'b1101110000001;
	else if (index < 1232)
		cosOut	=	`SinSize'b1101101000001;
	else if (index < 1242)
		cosOut	=	`SinSize'b1101100000001;
	else if (index < 1252)
		cosOut	=	`SinSize'b1101011000001;
	else if (index < 1264)
		cosOut	=	`SinSize'b1101010000001;
	else if (index < 1274)
		cosOut	=	`SinSize'b1101001000001;
	else if (index < 1286)
		cosOut	=	`SinSize'b1101000000001;
	else if (index < 1296)
		cosOut	=	`SinSize'b1100111000001;
	else if (index < 1309)
		cosOut	=	`SinSize'b1100110000001;
	else if (index < 1318)
		cosOut	=	`SinSize'b1100101000001;
	else if (index < 1331)
		cosOut	=	`SinSize'b1100100000001;
	else if (index < 1342)
		cosOut	=	`SinSize'b1100011000001;
	else if (index < 1353)
		cosOut	=	`SinSize'b1100010000001;
	else if (index < 1364)
		cosOut	=	`SinSize'b1100001000001;
	else if (index < 1377)
		cosOut	=	`SinSize'b1100000000001;
	else if (index < 1388)
		cosOut	=	`SinSize'b1011111000001;
	else if (index < 1400)
		cosOut	=	`SinSize'b1011110000001;
	else if (index < 1413)
		cosOut	=	`SinSize'b1011101000001;
	else if (index < 1424)
		cosOut	=	`SinSize'b1011100000001;
	else if (index < 1436)
		cosOut	=	`SinSize'b1011011000001;
	else if (index < 1450)
		cosOut	=	`SinSize'b1011010000001;
	else if (index < 1463)
		cosOut	=	`SinSize'b1011001000001;
	else if (index < 1477)
		cosOut	=	`SinSize'b1011000000001;
	else if (index < 1488)
		cosOut	=	`SinSize'b1010111000001;
	else if (index < 1502)
		cosOut	=	`SinSize'b1010110000001;
	else if (index < 1516)
		cosOut	=	`SinSize'b1010101000001;
	else if (index < 1530)
		cosOut	=	`SinSize'b1010100000001;
	else if (index < 1545)
		cosOut	=	`SinSize'b1010011000001;
	else if (index < 1559)
		cosOut	=	`SinSize'b1010010000001;
	else if (index < 1574)
		cosOut	=	`SinSize'b1010001000001;
	else if (index < 1589)
		cosOut	=	`SinSize'b1010000000001;
	else if (index < 1604)
		cosOut	=	`SinSize'b1001111000001;
	else if (index < 1620)
		cosOut	=	`SinSize'b1001110000001;
	else if (index < 1639)
		cosOut	=	`SinSize'b1001101000001;
	else if (index < 1655)
		cosOut	=	`SinSize'b1001100000001;
	else if (index < 1672)
		cosOut	=	`SinSize'b1001011000001;
	else if (index < 1692)
		cosOut	=	`SinSize'b1001010000001;
	else if (index < 1713)
		cosOut	=	`SinSize'b1001001000001;
	else if (index < 1733)
		cosOut	=	`SinSize'b1001000000001;
	else if (index < 1755)
		cosOut	=	`SinSize'b1000111000001;
	else if (index < 1779)
		cosOut	=	`SinSize'b1000110000001;
	else if (index < 1804)
		cosOut	=	`SinSize'b1000101000001;
	else if (index < 1834)
		cosOut	=	`SinSize'b1000100000001;
	else if (index < 1868)
		cosOut	=	`SinSize'b1000011000001;
	else if (index < 1909)
		cosOut	=	`SinSize'b1000010000001;
	else if (index < 1969)
		cosOut	=	`SinSize'b1000001000001;
	else if (index < 2132)
		cosOut	=	`SinSize'b1000000000001;
	else if (index < 2192)
		cosOut	=	`SinSize'b1000001000001;
	else if (index < 2232)
		cosOut	=	`SinSize'b1000010000001;
	else if (index < 2267)
		cosOut	=	`SinSize'b1000011000001;
	else if (index < 2297)
		cosOut	=	`SinSize'b1000100000001;
	else if (index < 2322)
		cosOut	=	`SinSize'b1000101000001;
	else if (index < 2346)
		cosOut	=	`SinSize'b1000110000001;
	else if (index < 2368)
		cosOut	=	`SinSize'b1000111000001;
	else if (index < 2388)
		cosOut	=	`SinSize'b1001000000001;
	else if (index < 2408)
		cosOut	=	`SinSize'b1001001000001;
	else if (index < 2429)
		cosOut	=	`SinSize'b1001010000001;
	else if (index < 2446)
		cosOut	=	`SinSize'b1001011000001;
	else if (index < 2462)
		cosOut	=	`SinSize'b1001100000001;
	else if (index < 2481)
		cosOut	=	`SinSize'b1001101000001;
	else if (index < 2496)
		cosOut	=	`SinSize'b1001110000001;
	else if (index < 2512)
		cosOut	=	`SinSize'b1001111000001;
	else if (index < 2526)
		cosOut	=	`SinSize'b1010000000001;
	else if (index < 2542)
		cosOut	=	`SinSize'b1010001000001;
	else if (index < 2556)
		cosOut	=	`SinSize'b1010010000001;
	else if (index < 2570)
		cosOut	=	`SinSize'b1010011000001;
	else if (index < 2584)
		cosOut	=	`SinSize'b1010100000001;
	else if (index < 2598)
		cosOut	=	`SinSize'b1010101000001;
	else if (index < 2612)
		cosOut	=	`SinSize'b1010110000001;
	else if (index < 2624)
		cosOut	=	`SinSize'b1010111000001;
	else if (index < 2638)
		cosOut	=	`SinSize'b1011000000001;
	else if (index < 2650)
		cosOut	=	`SinSize'b1011001000001;
	else if (index < 2664)
		cosOut	=	`SinSize'b1011010000001;
	else if (index < 2676)
		cosOut	=	`SinSize'b1011011000001;
	else if (index < 2688)
		cosOut	=	`SinSize'b1011100000001;
	else if (index < 2700)
		cosOut	=	`SinSize'b1011101000001;
	else if (index < 2712)
		cosOut	=	`SinSize'b1011110000001;
	else if (index < 2725)
		cosOut	=	`SinSize'b1011111000001;
	else if (index < 2736)
		cosOut	=	`SinSize'b1100000000001;
	else if (index < 2748)
		cosOut	=	`SinSize'b1100001000001;
	else if (index < 2758)
		cosOut	=	`SinSize'b1100010000001;
	else if (index < 2770)
		cosOut	=	`SinSize'b1100011000001;
	else if (index < 2782)
		cosOut	=	`SinSize'b1100100000001;
	else if (index < 2792)
		cosOut	=	`SinSize'b1100101000001;
	else if (index < 2804)
		cosOut	=	`SinSize'b1100110000001;
	else if (index < 2814)
		cosOut	=	`SinSize'b1100111000001;
	else if (index < 2826)
		cosOut	=	`SinSize'b1101000000001;
	else if (index < 2836)
		cosOut	=	`SinSize'b1101001000001;
	else if (index < 2848)
		cosOut	=	`SinSize'b1101010000001;
	else if (index < 2858)
		cosOut	=	`SinSize'b1101011000001;
	else if (index < 2868)
		cosOut	=	`SinSize'b1101100000001;
	else if (index < 2880)
		cosOut	=	`SinSize'b1101101000001;
	else if (index < 2890)
		cosOut	=	`SinSize'b1101110000001;
	else if (index < 2901)
		cosOut	=	`SinSize'b1101111000001;
	else if (index < 2910)
		cosOut	=	`SinSize'b1110000000001;
	else if (index < 2923)
		cosOut	=	`SinSize'b1110001000001;
	else if (index < 2932)
		cosOut	=	`SinSize'b1110010000001;
	else if (index < 2942)
		cosOut	=	`SinSize'b1110011000001;
	else if (index < 2952)
		cosOut	=	`SinSize'b1110100000001;
	else if (index < 2962)
		cosOut	=	`SinSize'b1110101000001;
	else if (index < 2973)
		cosOut	=	`SinSize'b1110110000001;
	else if (index < 2982)
		cosOut	=	`SinSize'b1110111000001;
	else if (index < 2992)
		cosOut	=	`SinSize'b1111000000001;
	else if (index < 3004)
		cosOut	=	`SinSize'b1111001000001;
	else if (index < 3014)
		cosOut	=	`SinSize'b1111010000001;
	else if (index < 3024)
		cosOut	=	`SinSize'b1111011000001;
	else if (index < 3034)
		cosOut	=	`SinSize'b1111100000001;
	else if (index < 3044)
		cosOut	=	`SinSize'b1111101000001;
	else if (index < 3055)
		cosOut	=	`SinSize'b1111110000001;
	else if (index < 3064)
		cosOut	=	`SinSize'b1111111000001;
	else if (index < 3084)
		cosOut	=	`SinSize'b0000000000000;
	else if (index < 3094)
		cosOut	=	`SinSize'b0000000111111;
	else if (index < 3105)
		cosOut	=	`SinSize'b0000001111111;
	else if (index < 3114)
		cosOut	=	`SinSize'b0000010111111;
	else if (index < 3124)
		cosOut	=	`SinSize'b0000011111111;
	else if (index < 3134)
		cosOut	=	`SinSize'b0000100111111;
	else if (index < 3144)
		cosOut	=	`SinSize'b0000101111111;
	else if (index < 3156)
		cosOut	=	`SinSize'b0000110111111;
	else if (index < 3166)
		cosOut	=	`SinSize'b0000111111111;
	else if (index < 3176)
		cosOut	=	`SinSize'b0001000111111;
	else if (index < 3187)
		cosOut	=	`SinSize'b0001001111111;
	else if (index < 3196)
		cosOut	=	`SinSize'b0001010111111;
	else if (index < 3206)
		cosOut	=	`SinSize'b0001011111111;
	else if (index < 3216)
		cosOut	=	`SinSize'b0001100111111;
	else if (index < 3226)
		cosOut	=	`SinSize'b0001101111111;
	else if (index < 3238)
		cosOut	=	`SinSize'b0001110111111;
	else if (index < 3248)
		cosOut	=	`SinSize'b0001111111111;
	else if (index < 3259)
		cosOut	=	`SinSize'b0010000111111;
	else if (index < 3268)
		cosOut	=	`SinSize'b0010001111111;
	else if (index < 3281)
		cosOut	=	`SinSize'b0010010111111;
	else if (index < 3290)
		cosOut	=	`SinSize'b0010011111111;
	else if (index < 3300)
		cosOut	=	`SinSize'b0010100111111;
	else if (index < 3312)
		cosOut	=	`SinSize'b0010101111111;
	else if (index < 3322)
		cosOut	=	`SinSize'b0010110111111;
	else if (index < 3334)
		cosOut	=	`SinSize'b0010111111111;
	else if (index < 3344)
		cosOut	=	`SinSize'b0011000111111;
	else if (index < 3356)
		cosOut	=	`SinSize'b0011001111111;
	else if (index < 3366)
		cosOut	=	`SinSize'b0011010111111;
	else if (index < 3378)
		cosOut	=	`SinSize'b0011011111111;
	else if (index < 3391)
		cosOut	=	`SinSize'b0011100111111;
	else if (index < 3400)
		cosOut	=	`SinSize'b0011101111111;
	else if (index < 3413)
		cosOut	=	`SinSize'b0011110111111;
	else if (index < 3424)
		cosOut	=	`SinSize'b0011111111111;
	else if (index < 3436)
		cosOut	=	`SinSize'b0100000111111;
	else if (index < 3448)
		cosOut	=	`SinSize'b0100001111111;
	else if (index < 3460)
		cosOut	=	`SinSize'b0100010111111;
	else if (index < 3472)
		cosOut	=	`SinSize'b0100011111111;
	else if (index < 3485)
		cosOut	=	`SinSize'b0100100111111;
	else if (index < 3498)
		cosOut	=	`SinSize'b0100101111111;
	else if (index < 3510)
		cosOut	=	`SinSize'b0100110111111;
	else if (index < 3524)
		cosOut	=	`SinSize'b0100111111111;
	else if (index < 3536)
		cosOut	=	`SinSize'b0101000111111;
	else if (index < 3551)
		cosOut	=	`SinSize'b0101001111111;
	else if (index < 3564)
		cosOut	=	`SinSize'b0101010111111;
	else if (index < 3578)
		cosOut	=	`SinSize'b0101011111111;
	else if (index < 3592)
		cosOut	=	`SinSize'b0101100111111;
	else if (index < 3606)
		cosOut	=	`SinSize'b0101101111111;
	else if (index < 3622)
		cosOut	=	`SinSize'b0101110111111;
	else if (index < 3636)
		cosOut	=	`SinSize'b0101111111111;
	else if (index < 3652)
		cosOut	=	`SinSize'b0110000111111;
	else if (index < 3668)
		cosOut	=	`SinSize'b0110001111111;
	else if (index < 3686)
		cosOut	=	`SinSize'b0110010111111;
	else if (index < 3702)
		cosOut	=	`SinSize'b0110011111111;
	else if (index < 3721)
		cosOut	=	`SinSize'b0110100111111;
	else if (index < 3740)
		cosOut	=	`SinSize'b0110101111111;
	else if (index < 3760)
		cosOut	=	`SinSize'b0110110111111;
	else if (index < 3780)
		cosOut	=	`SinSize'b0110111111111;
	else if (index < 3802)
		cosOut	=	`SinSize'b0111000111111;
	else if (index < 3826)
		cosOut	=	`SinSize'b0111001111111;
	else if (index < 3852)
		cosOut	=	`SinSize'b0111010111111;
	else if (index < 3882)
		cosOut	=	`SinSize'b0111011111111;
	else if (index < 3916)
		cosOut	=	`SinSize'b0111100111111;
	else if (index < 3956)
		cosOut	=	`SinSize'b0111101111111;
	else if (index < 4016)
		cosOut	=	`SinSize'b0111110111111;
	else
		cosOut	=	`SinSize'b0111111111111;
end
endmodule
