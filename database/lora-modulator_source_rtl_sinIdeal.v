// This program was cloned from: https://github.com/mehrdadh/lora-modulator
// License: MIT License

`include	"LoRaTXDefines.v"
`include	"RadioDefines.v"

module sinIdeal(angle, sinOut);

input		[`PRECISION-1:0]	angle;
output reg	[`SinSize-1:0]		sinOut;

reg [`PRECISION-1:0]	index;
always @(*) begin
	index = angle >> (25-`Sine_SR_Bits);
end

always @(index) begin
	if (index < 12)
		sinOut	=	`SinSize'b0000000000000;
	else if (index < 22)
		sinOut	=	`SinSize'b0000000111111;
	else if (index < 32)
		sinOut	=	`SinSize'b0000001111111;
	else if (index < 42)
		sinOut	=	`SinSize'b0000010111111;
	else if (index < 52)
		sinOut	=	`SinSize'b0000011111111;
	else if (index < 62)
		sinOut	=	`SinSize'b0000100111111;
	else if (index < 72)
		sinOut	=	`SinSize'b0000101111111;
	else if (index < 84)
		sinOut	=	`SinSize'b0000110111111;
	else if (index < 94)
		sinOut	=	`SinSize'b0000111111111;
	else if (index < 104)
		sinOut	=	`SinSize'b0001000111111;
	else if (index < 114)
		sinOut	=	`SinSize'b0001001111111;
	else if (index < 124)
		sinOut	=	`SinSize'b0001010111111;
	else if (index < 134)
		sinOut	=	`SinSize'b0001011111111;
	else if (index < 144)
		sinOut	=	`SinSize'b0001100111111;
	else if (index < 154)
		sinOut	=	`SinSize'b0001101111111;
	else if (index < 166)
		sinOut	=	`SinSize'b0001110111111;
	else if (index < 176)
		sinOut	=	`SinSize'b0001111111111;
	else if (index < 186)
		sinOut	=	`SinSize'b0010000111111;
	else if (index < 196)
		sinOut	=	`SinSize'b0010001111111;
	else if (index < 208)
		sinOut	=	`SinSize'b0010010111111;
	else if (index < 218)
		sinOut	=	`SinSize'b0010011111111;
	else if (index < 228)
		sinOut	=	`SinSize'b0010100111111;
	else if (index < 240)
		sinOut	=	`SinSize'b0010101111111;
	else if (index < 250)
		sinOut	=	`SinSize'b0010110111111;
	else if (index < 262)
		sinOut	=	`SinSize'b0010111111111;
	else if (index < 272)
		sinOut	=	`SinSize'b0011000111111;
	else if (index < 284)
		sinOut	=	`SinSize'b0011001111111;
	else if (index < 294)
		sinOut	=	`SinSize'b0011010111111;
	else if (index < 306)
		sinOut	=	`SinSize'b0011011111111;
	else if (index < 318)
		sinOut	=	`SinSize'b0011100111111;
	else if (index < 328)
		sinOut	=	`SinSize'b0011101111111;
	else if (index < 341)
		sinOut	=	`SinSize'b0011110111111;
	else if (index < 352)
		sinOut	=	`SinSize'b0011111111111;
	else if (index < 364)
		sinOut	=	`SinSize'b0100000111111;
	else if (index < 377)
		sinOut	=	`SinSize'b0100001111111;
	else if (index < 388)
		sinOut	=	`SinSize'b0100010111111;
	else if (index < 401)
		sinOut	=	`SinSize'b0100011111111;
	else if (index < 412)
		sinOut	=	`SinSize'b0100100111111;
	else if (index < 427)
		sinOut	=	`SinSize'b0100101111111;
	else if (index < 438)
		sinOut	=	`SinSize'b0100110111111;
	else if (index < 452)
		sinOut	=	`SinSize'b0100111111111;
	else if (index < 465)
		sinOut	=	`SinSize'b0101000111111;
	else if (index < 478)
		sinOut	=	`SinSize'b0101001111111;
	else if (index < 492)
		sinOut	=	`SinSize'b0101010111111;
	else if (index < 507)
		sinOut	=	`SinSize'b0101011111111;
	else if (index < 520)
		sinOut	=	`SinSize'b0101100111111;
	else if (index < 535)
		sinOut	=	`SinSize'b0101101111111;
	else if (index < 551)
		sinOut	=	`SinSize'b0101110111111;
	else if (index < 564)
		sinOut	=	`SinSize'b0101111111111;
	else if (index < 580)
		sinOut	=	`SinSize'b0110000111111;
	else if (index < 597)
		sinOut	=	`SinSize'b0110001111111;
	else if (index < 615)
		sinOut	=	`SinSize'b0110010111111;
	else if (index < 630)
		sinOut	=	`SinSize'b0110011111111;
	else if (index < 648)
		sinOut	=	`SinSize'b0110100111111;
	else if (index < 668)
		sinOut	=	`SinSize'b0110101111111;
	else if (index < 688)
		sinOut	=	`SinSize'b0110110111111;
	else if (index < 708)
		sinOut	=	`SinSize'b0110111111111;
	else if (index < 730)
		sinOut	=	`SinSize'b0111000111111;
	else if (index < 754)
		sinOut	=	`SinSize'b0111001111111;
	else if (index < 780)
		sinOut	=	`SinSize'b0111010111111;
	else if (index < 810)
		sinOut	=	`SinSize'b0111011111111;
	else if (index < 844)
		sinOut	=	`SinSize'b0111100111111;
	else if (index < 884)
		sinOut	=	`SinSize'b0111101111111;
	else if (index < 944)
		sinOut	=	`SinSize'b0111110111111;
	else if (index < 1108)
		sinOut	=	`SinSize'b0111111111111;
	else if (index < 1168)
		sinOut	=	`SinSize'b0111110111111;
	else if (index < 1208)
		sinOut	=	`SinSize'b0111101111111;
	else if (index < 1242)
		sinOut	=	`SinSize'b0111100111111;
	else if (index < 1272)
		sinOut	=	`SinSize'b0111011111111;
	else if (index < 1298)
		sinOut	=	`SinSize'b0111010111111;
	else if (index < 1322)
		sinOut	=	`SinSize'b0111001111111;
	else if (index < 1344)
		sinOut	=	`SinSize'b0111000111111;
	else if (index < 1364)
		sinOut	=	`SinSize'b0110111111111;
	else if (index < 1384)
		sinOut	=	`SinSize'b0110110111111;
	else if (index < 1405)
		sinOut	=	`SinSize'b0110101111111;
	else if (index < 1422)
		sinOut	=	`SinSize'b0110100111111;
	else if (index < 1438)
		sinOut	=	`SinSize'b0110011111111;
	else if (index < 1457)
		sinOut	=	`SinSize'b0110010111111;
	else if (index < 1472)
		sinOut	=	`SinSize'b0110001111111;
	else if (index < 1488)
		sinOut	=	`SinSize'b0110000111111;
	else if (index < 1502)
		sinOut	=	`SinSize'b0101111111111;
	else if (index < 1518)
		sinOut	=	`SinSize'b0101110111111;
	else if (index < 1532)
		sinOut	=	`SinSize'b0101101111111;
	else if (index < 1546)
		sinOut	=	`SinSize'b0101100111111;
	else if (index < 1560)
		sinOut	=	`SinSize'b0101011111111;
	else if (index < 1574)
		sinOut	=	`SinSize'b0101010111111;
	else if (index < 1589)
		sinOut	=	`SinSize'b0101001111111;
	else if (index < 1600)
		sinOut	=	`SinSize'b0101000111111;
	else if (index < 1614)
		sinOut	=	`SinSize'b0100111111111;
	else if (index < 1626)
		sinOut	=	`SinSize'b0100110111111;
	else if (index < 1640)
		sinOut	=	`SinSize'b0100101111111;
	else if (index < 1653)
		sinOut	=	`SinSize'b0100100111111;
	else if (index < 1664)
		sinOut	=	`SinSize'b0100011111111;
	else if (index < 1676)
		sinOut	=	`SinSize'b0100010111111;
	else if (index < 1689)
		sinOut	=	`SinSize'b0100001111111;
	else if (index < 1700)
		sinOut	=	`SinSize'b0100000111111;
	else if (index < 1713)
		sinOut	=	`SinSize'b0011111111111;
	else if (index < 1724)
		sinOut	=	`SinSize'b0011110111111;
	else if (index < 1735)
		sinOut	=	`SinSize'b0011101111111;
	else if (index < 1746)
		sinOut	=	`SinSize'b0011100111111;
	else if (index < 1758)
		sinOut	=	`SinSize'b0011011111111;
	else if (index < 1768)
		sinOut	=	`SinSize'b0011010111111;
	else if (index < 1780)
		sinOut	=	`SinSize'b0011001111111;
	else if (index < 1790)
		sinOut	=	`SinSize'b0011000111111;
	else if (index < 1802)
		sinOut	=	`SinSize'b0010111111111;
	else if (index < 1812)
		sinOut	=	`SinSize'b0010110111111;
	else if (index < 1824)
		sinOut	=	`SinSize'b0010101111111;
	else if (index < 1834)
		sinOut	=	`SinSize'b0010100111111;
	else if (index < 1845)
		sinOut	=	`SinSize'b0010011111111;
	else if (index < 1856)
		sinOut	=	`SinSize'b0010010111111;
	else if (index < 1867)
		sinOut	=	`SinSize'b0010001111111;
	else if (index < 1876)
		sinOut	=	`SinSize'b0010000111111;
	else if (index < 1887)
		sinOut	=	`SinSize'b0001111111111;
	else if (index < 1898)
		sinOut	=	`SinSize'b0001110111111;
	else if (index < 1909)
		sinOut	=	`SinSize'b0001101111111;
	else if (index < 1918)
		sinOut	=	`SinSize'b0001100111111;
	else if (index < 1928)
		sinOut	=	`SinSize'b0001011111111;
	else if (index < 1939)
		sinOut	=	`SinSize'b0001010111111;
	else if (index < 1948)
		sinOut	=	`SinSize'b0001001111111;
	else if (index < 1958)
		sinOut	=	`SinSize'b0001000111111;
	else if (index < 1969)
		sinOut	=	`SinSize'b0000111111111;
	else if (index < 1980)
		sinOut	=	`SinSize'b0000110111111;
	else if (index < 1991)
		sinOut	=	`SinSize'b0000101111111;
	else if (index < 2000)
		sinOut	=	`SinSize'b0000100111111;
	else if (index < 2011)
		sinOut	=	`SinSize'b0000011111111;
	else if (index < 2020)
		sinOut	=	`SinSize'b0000010111111;
	else if (index < 2030)
		sinOut	=	`SinSize'b0000001111111;
	else if (index < 2041)
		sinOut	=	`SinSize'b0000000111111;
	else if (index < 2060)
		sinOut	=	`SinSize'b0000000000000;
	else if (index < 2071)
		sinOut	=	`SinSize'b1111111000001;
	else if (index < 2080)
		sinOut	=	`SinSize'b1111110000001;
	else if (index < 2090)
		sinOut	=	`SinSize'b1111101000001;
	else if (index < 2101)
		sinOut	=	`SinSize'b1111100000001;
	else if (index < 2110)
		sinOut	=	`SinSize'b1111011000001;
	else if (index < 2121)
		sinOut	=	`SinSize'b1111010000001;
	else if (index < 2132)
		sinOut	=	`SinSize'b1111001000001;
	else if (index < 2143)
		sinOut	=	`SinSize'b1111000000001;
	else if (index < 2152)
		sinOut	=	`SinSize'b1110111000001;
	else if (index < 2162)
		sinOut	=	`SinSize'b1110110000001;
	else if (index < 2173)
		sinOut	=	`SinSize'b1110101000001;
	else if (index < 2182)
		sinOut	=	`SinSize'b1110100000001;
	else if (index < 2192)
		sinOut	=	`SinSize'b1110011000001;
	else if (index < 2203)
		sinOut	=	`SinSize'b1110010000001;
	else if (index < 2214)
		sinOut	=	`SinSize'b1110001000001;
	else if (index < 2225)
		sinOut	=	`SinSize'b1110000000001;
	else if (index < 2234)
		sinOut	=	`SinSize'b1101111000001;
	else if (index < 2245)
		sinOut	=	`SinSize'b1101110000001;
	else if (index < 2256)
		sinOut	=	`SinSize'b1101101000001;
	else if (index < 2267)
		sinOut	=	`SinSize'b1101100000001;
	else if (index < 2276)
		sinOut	=	`SinSize'b1101011000001;
	else if (index < 2289)
		sinOut	=	`SinSize'b1101010000001;
	else if (index < 2298)
		sinOut	=	`SinSize'b1101001000001;
	else if (index < 2311)
		sinOut	=	`SinSize'b1101000000001;
	else if (index < 2320)
		sinOut	=	`SinSize'b1100111000001;
	else if (index < 2333)
		sinOut	=	`SinSize'b1100110000001;
	else if (index < 2342)
		sinOut	=	`SinSize'b1100101000001;
	else if (index < 2355)
		sinOut	=	`SinSize'b1100100000001;
	else if (index < 2366)
		sinOut	=	`SinSize'b1100011000001;
	else if (index < 2377)
		sinOut	=	`SinSize'b1100010000001;
	else if (index < 2388)
		sinOut	=	`SinSize'b1100001000001;
	else if (index < 2401)
		sinOut	=	`SinSize'b1100000000001;
	else if (index < 2412)
		sinOut	=	`SinSize'b1011111000001;
	else if (index < 2424)
		sinOut	=	`SinSize'b1011110000001;
	else if (index < 2437)
		sinOut	=	`SinSize'b1011101000001;
	else if (index < 2448)
		sinOut	=	`SinSize'b1011100000001;
	else if (index < 2460)
		sinOut	=	`SinSize'b1011011000001;
	else if (index < 2474)
		sinOut	=	`SinSize'b1011010000001;
	else if (index < 2487)
		sinOut	=	`SinSize'b1011001000001;
	else if (index < 2501)
		sinOut	=	`SinSize'b1011000000001;
	else if (index < 2512)
		sinOut	=	`SinSize'b1010111000001;
	else if (index < 2526)
		sinOut	=	`SinSize'b1010110000001;
	else if (index < 2540)
		sinOut	=	`SinSize'b1010101000001;
	else if (index < 2554)
		sinOut	=	`SinSize'b1010100000001;
	else if (index < 2569)
		sinOut	=	`SinSize'b1010011000001;
	else if (index < 2583)
		sinOut	=	`SinSize'b1010010000001;
	else if (index < 2598)
		sinOut	=	`SinSize'b1010001000001;
	else if (index < 2612)
		sinOut	=	`SinSize'b1010000000001;
	else if (index < 2628)
		sinOut	=	`SinSize'b1001111000001;
	else if (index < 2644)
		sinOut	=	`SinSize'b1001110000001;
	else if (index < 2662)
		sinOut	=	`SinSize'b1001101000001;
	else if (index < 2678)
		sinOut	=	`SinSize'b1001100000001;
	else if (index < 2697)
		sinOut	=	`SinSize'b1001011000001;
	else if (index < 2716)
		sinOut	=	`SinSize'b1001010000001;
	else if (index < 2736)
		sinOut	=	`SinSize'b1001001000001;
	else if (index < 2756)
		sinOut	=	`SinSize'b1001000000001;
	else if (index < 2778)
		sinOut	=	`SinSize'b1000111000001;
	else if (index < 2802)
		sinOut	=	`SinSize'b1000110000001;
	else if (index < 2828)
		sinOut	=	`SinSize'b1000101000001;
	else if (index < 2858)
		sinOut	=	`SinSize'b1000100000001;
	else if (index < 2892)
		sinOut	=	`SinSize'b1000011000001;
	else if (index < 2932)
		sinOut	=	`SinSize'b1000010000001;
	else if (index < 2992)
		sinOut	=	`SinSize'b1000001000001;
	else if (index < 3156)
		sinOut	=	`SinSize'b1000000000001;
	else if (index < 3216)
		sinOut	=	`SinSize'b1000001000001;
	else if (index < 3256)
		sinOut	=	`SinSize'b1000010000001;
	else if (index < 3290)
		sinOut	=	`SinSize'b1000011000001;
	else if (index < 3320)
		sinOut	=	`SinSize'b1000100000001;
	else if (index < 3347)
		sinOut	=	`SinSize'b1000101000001;
	else if (index < 3370)
		sinOut	=	`SinSize'b1000110000001;
	else if (index < 3392)
		sinOut	=	`SinSize'b1000111000001;
	else if (index < 3413)
		sinOut	=	`SinSize'b1001000000001;
	else if (index < 3432)
		sinOut	=	`SinSize'b1001001000001;
	else if (index < 3452)
		sinOut	=	`SinSize'b1001010000001;
	else if (index < 3470)
		sinOut	=	`SinSize'b1001011000001;
	else if (index < 3486)
		sinOut	=	`SinSize'b1001100000001;
	else if (index < 3504)
		sinOut	=	`SinSize'b1001101000001;
	else if (index < 3520)
		sinOut	=	`SinSize'b1001110000001;
	else if (index < 3536)
		sinOut	=	`SinSize'b1001111000001;
	else if (index < 3551)
		sinOut	=	`SinSize'b1010000000001;
	else if (index < 3567)
		sinOut	=	`SinSize'b1010001000001;
	else if (index < 3580)
		sinOut	=	`SinSize'b1010010000001;
	else if (index < 3595)
		sinOut	=	`SinSize'b1010011000001;
	else if (index < 3608)
		sinOut	=	`SinSize'b1010100000001;
	else if (index < 3622)
		sinOut	=	`SinSize'b1010101000001;
	else if (index < 3636)
		sinOut	=	`SinSize'b1010110000001;
	else if (index < 3648)
		sinOut	=	`SinSize'b1010111000001;
	else if (index < 3662)
		sinOut	=	`SinSize'b1011000000001;
	else if (index < 3674)
		sinOut	=	`SinSize'b1011001000001;
	else if (index < 3688)
		sinOut	=	`SinSize'b1011010000001;
	else if (index < 3700)
		sinOut	=	`SinSize'b1011011000001;
	else if (index < 3712)
		sinOut	=	`SinSize'b1011100000001;
	else if (index < 3724)
		sinOut	=	`SinSize'b1011101000001;
	else if (index < 3736)
		sinOut	=	`SinSize'b1011110000001;
	else if (index < 3749)
		sinOut	=	`SinSize'b1011111000001;
	else if (index < 3760)
		sinOut	=	`SinSize'b1100000000001;
	else if (index < 3772)
		sinOut	=	`SinSize'b1100001000001;
	else if (index < 3782)
		sinOut	=	`SinSize'b1100010000001;
	else if (index < 3794)
		sinOut	=	`SinSize'b1100011000001;
	else if (index < 3806)
		sinOut	=	`SinSize'b1100100000001;
	else if (index < 3816)
		sinOut	=	`SinSize'b1100101000001;
	else if (index < 3828)
		sinOut	=	`SinSize'b1100110000001;
	else if (index < 3838)
		sinOut	=	`SinSize'b1100111000001;
	else if (index < 3850)
		sinOut	=	`SinSize'b1101000000001;
	else if (index < 3860)
		sinOut	=	`SinSize'b1101001000001;
	else if (index < 3872)
		sinOut	=	`SinSize'b1101010000001;
	else if (index < 3882)
		sinOut	=	`SinSize'b1101011000001;
	else if (index < 3892)
		sinOut	=	`SinSize'b1101100000001;
	else if (index < 3904)
		sinOut	=	`SinSize'b1101101000001;
	else if (index < 3914)
		sinOut	=	`SinSize'b1101110000001;
	else if (index < 3925)
		sinOut	=	`SinSize'b1101111000001;
	else if (index < 3934)
		sinOut	=	`SinSize'b1110000000001;
	else if (index < 3947)
		sinOut	=	`SinSize'b1110001000001;
	else if (index < 3956)
		sinOut	=	`SinSize'b1110010000001;
	else if (index < 3966)
		sinOut	=	`SinSize'b1110011000001;
	else if (index < 3976)
		sinOut	=	`SinSize'b1110100000001;
	else if (index < 3986)
		sinOut	=	`SinSize'b1110101000001;
	else if (index < 3997)
		sinOut	=	`SinSize'b1110110000001;
	else if (index < 4006)
		sinOut	=	`SinSize'b1110111000001;
	else if (index < 4016)
		sinOut	=	`SinSize'b1111000000001;
	else if (index < 4028)
		sinOut	=	`SinSize'b1111001000001;
	else if (index < 4038)
		sinOut	=	`SinSize'b1111010000001;
	else if (index < 4048)
		sinOut	=	`SinSize'b1111011000001;
	else if (index < 4058)
		sinOut	=	`SinSize'b1111100000001;
	else if (index < 4068)
		sinOut	=	`SinSize'b1111101000001;
	else if (index < 4079)
		sinOut	=	`SinSize'b1111110000001;
	else if (index < 4088)
		sinOut	=	`SinSize'b1111111000001;
	else
		sinOut	=	`SinSize'b0000000000000;
end
endmodule
