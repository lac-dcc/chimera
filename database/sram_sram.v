// This program was cloned from: https://github.com/bangonkali/sram
// License: MIT License

`timescale 1ns/1ps
//-----------------------------------------------------
// Design Name : ram_sp_ar_aw
// File Name   : ram_sp_ar_aw.v
// Function    : Asynchronous read write RAM
// Coder       : Deepak Kumar Tala
// Source      : http://www.asic-world.com/code/hdl_models/ram_sp_ar_aw.v
//-----------------------------------------------------

module sram (
	address, // Address Input
	data, // Data bi-directional
	chip_enable, // Chip Select (active low)
	write_enable, // Write Enable/Read Enable (write on low)
	output_enable, // Output Enable (active low)
	reset
);
	parameter DATA_WIDTH = 16;
	parameter ADDR_WIDTH = 8;
	parameter RAM_DEPTH = 256;

	//--------------Input Ports-----------------------
	input [ADDR_WIDTH-1:0] address;
	input chip_enable;
	input write_enable;
	input output_enable;
	input reset;

	//--------------Inout Ports-----------------------
	inout [DATA_WIDTH-1:0]  data       ;

	//--------------Internal variables----------------
	reg [DATA_WIDTH-1:0]   data_out ;
	reg [DATA_WIDTH-1:0] mem [0:RAM_DEPTH-1];

	//--------------Code Starts Here------------------

	// Tri-State Buffer control
	// output : When write_enable = 0, output_enable = 1, chip_enable = 1
	assign data = (!output_enable && write_enable) ? data_out : 16'bz;

	// Memory Write Block
	// Write Operation : When write_enable = 1, chip_enable = 1
	always @ (address or data or chip_enable or write_enable or output_enable)
	begin : MEM_WRITE
	   if ( !chip_enable && !write_enable && output_enable) begin
		   mem[address] = data;
	   end
	end

	// Memory Read Block
	// Read Operation : When write_enable = 0, output_enable = 1, chip_enable = 1
	always @ (address or chip_enable or write_enable or output_enable)
	begin : MEM_READ
		if (!chip_enable && write_enable && !output_enable)  begin
			 data_out = mem[address];
		end
	end

	always @ (posedge reset) begin
		mem [0] = 16'b0;
		mem [1] = 16'b0;
		mem [2] = 16'b0;
		mem [3] = 16'b0;
		mem [4] = 16'b0;
		mem [5] = 16'b0;
		mem [6] = 16'b0;
		mem [7] = 16'b0;
		mem [8] = 16'b0;
		mem [9] = 16'b0;
		mem [10] = 16'b0;
		mem [11] = 16'b0;
		mem [12] = 16'b0;
		mem [13] = 16'b0;
		mem [14] = 16'b0;
		mem [15] = 16'b0;
		mem [16] = 16'b0;
		mem [17] = 16'b0;
		mem [18] = 16'b0;
		mem [19] = 16'b0;
		mem [20] = 16'b0;
		mem [21] = 16'b0;
		mem [22] = 16'b0;
		mem [23] = 16'b0;
		mem [24] = 16'b0;
		mem [25] = 16'b0;
		mem [26] = 16'b0;
		mem [27] = 16'b0;
		mem [28] = 16'b0;
		mem [29] = 16'b0;
		mem [30] = 16'b0;
		mem [31] = 16'b0;
		mem [32] = 16'b0;
		mem [33] = 16'b0;
		mem [34] = 16'b0;
		mem [35] = 16'b0;
		mem [36] = 16'b0;
		mem [37] = 16'b0;
		mem [38] = 16'b0;
		mem [39] = 16'b0;
		mem [40] = 16'b0;
		mem [41] = 16'b0;
		mem [42] = 16'b0;
		mem [43] = 16'b0;
		mem [44] = 16'b0;
		mem [45] = 16'b0;
		mem [46] = 16'b0;
		mem [47] = 16'b0;
		mem [48] = 16'b0;
		mem [49] = 16'b0;
		mem [50] = 16'd115;
		mem [51] = 16'b0;
		mem [52] = 16'b0;
		mem [53] = 16'b0;
		mem [54] = 16'b0;
		mem [55] = 16'b0;
		mem [56] = 16'b0;
		mem [57] = 16'b0;
		mem [58] = 16'b0;
		mem [59] = 16'b0;
		mem [60] = 16'b0;
		mem [61] = 16'b0;
		mem [62] = 16'b0;
		mem [63] = 16'b0;
		mem [64] = 16'b0;
		mem [65] = 16'b0;
		mem [66] = 16'b0;
		mem [67] = 16'b0;
		mem [68] = 16'b0;
		mem [69] = 16'b0;
		mem [70] = 16'b0;
		mem [71] = 16'b0;
		mem [72] = 16'b0;
		mem [73] = 16'b0;
		mem [74] = 16'b0;
		mem [75] = 16'b0;
		mem [76] = 16'b0;
		mem [77] = 16'b0;
		mem [78] = 16'b0;
		mem [79] = 16'b0;
		mem [80] = 16'b0;
		mem [81] = 16'b0;
		mem [82] = 16'b0;
		mem [83] = 16'b0;
		mem [84] = 16'b0;
		mem [85] = 16'b0;
		mem [86] = 16'b0;
		mem [87] = 16'b0;
		mem [88] = 16'b0;
		mem [89] = 16'b0;
		mem [90] = 16'b0;
		mem [91] = 16'b0;
		mem [92] = 16'b0;
		mem [93] = 16'b0;
		mem [94] = 16'b0;
		mem [95] = 16'b0;
		mem [96] = 16'b0;
		mem [97] = 16'b0;
		mem [98] = 16'b0;
		mem [99] = 16'b0;
		mem [100] = 16'b0;
		mem [101] = 16'b0;
		mem [102] = 16'b0;
		mem [103] = 16'b0;
		mem [104] = 16'b0;
		mem [105] = 16'b0;
		mem [106] = 16'b0;
		mem [107] = 16'b0;
		mem [108] = 16'b0;
		mem [109] = 16'b0;
		mem [110] = 16'b0;
		mem [111] = 16'b0;
		mem [112] = 16'b0;
		mem [113] = 16'b0;
		mem [114] = 16'b0;
		mem [115] = 16'b0;
		mem [116] = 16'b0;
		mem [117] = 16'b0;
		mem [118] = 16'b0;
		mem [119] = 16'b0;
		mem [120] = 16'b0;
		mem [121] = 16'b0;
		mem [122] = 16'b0;
		mem [123] = 16'b0;
		mem [124] = 16'b0011011101111001; // 01011100 / 01010101 = 31868
		// mem [124] = 25456; // 01011100 / 01010101 = 31868
		mem [125] = 16'b0;
		mem [126] = 16'b0;
		mem [127] = 16'b0;
		mem [128] = 16'b0;
		mem [129] = 16'b0;
		mem [130] = 16'b0;
		mem [131] = 16'b0;
		mem [132] = 16'b0;
		mem [133] = 16'b0;
		mem [134] = 16'b0;
		mem [135] = 16'b0;
		mem [136] = 16'b0;
		mem [137] = 16'b0;
		mem [138] = 16'b0;
		mem [139] = 16'b0;
		mem [140] = 16'b0;
		mem [141] = 16'b0;
		mem [142] = 16'b0;
		mem [143] = 16'b0;
		mem [144] = 16'b0;
		mem [145] = 16'b0;
		mem [146] = 16'b0;
		mem [147] = 16'b0;
		mem [148] = 16'b0;
		mem [149] = 16'b0;
		mem [150] = 16'b0;
		mem [151] = 16'b0;
		mem [152] = 16'b0;
		mem [153] = 16'b0;
		mem [154] = 16'b0;
		mem [155] = 16'b0;
		mem [156] = 16'b0;
		mem [157] = 16'b0;
		mem [158] = 16'b0;
		mem [159] = 16'b0;
		mem [160] = 16'b0;
		mem [161] = 16'b0;
		mem [162] = 16'b0;
		mem [163] = 16'b0;
		mem [164] = 16'b0;
		mem [165] = 16'b0;
		mem [166] = 16'b0;
		mem [167] = 16'b0;
		mem [168] = 16'b0;
		mem [169] = 16'b0;
		mem [170] = 16'b0;
		mem [171] = 16'b0;
		mem [172] = 16'b0;
		mem [173] = 16'b0;
		mem [174] = 16'b0;
		mem [175] = 16'b0;
		mem [176] = 16'b0;
		mem [177] = 16'b0;
		mem [178] = 16'b0;
		mem [179] = 16'b0;
		mem [180] = 16'b0;
		mem [181] = 16'b0;
		mem [182] = 16'b0;
		mem [183] = 16'b0;
		mem [184] = 16'b0;
		mem [185] = 16'b0;
		mem [186] = 16'b0;
		mem [187] = 16'b0;
		mem [188] = 16'b0;
		mem [189] = 16'b0;
		mem [190] = 16'b0;
		mem [191] = 16'b0;
		mem [192] = 16'b0;
		mem [193] = 16'b0;
		mem [194] = 16'b0;
		mem [195] = 16'b0;
		mem [196] = 16'b0;
		mem [197] = 16'b0;
		mem [198] = 16'b0;
		mem [199] = 16'b0;
		mem [200] = 16'b0;
		mem [201] = 16'b0;
		mem [202] = 16'b0;
		mem [203] = 16'b0;
		mem [204] = 16'b0;
		mem [205] = 16'b0;
		mem [206] = 16'b0;
		mem [207] = 16'b0;
		mem [208] = 16'b0;
		mem [209] = 16'b0;
		mem [210] = 16'b0;
		mem [211] = 16'b0;
		mem [212] = 16'b0;
		mem [213] = 16'b0;
		mem [214] = 16'b0;
		mem [215] = 16'b0;
		mem [216] = 16'b0;
		mem [217] = 16'b0;
		mem [218] = 16'b0;
		mem [219] = 16'b0;
		mem [220] = 16'b0;
		mem [221] = 16'b0;
		mem [222] = 16'b0;
		mem [223] = 16'b0;
		mem [224] = 16'b0;
		mem [225] = 16'b0;
		mem [226] = 16'b0;
		mem [227] = 16'b0;
		mem [228] = 16'b0;
		mem [229] = 16'b0;
		mem [230] = 16'b0;
		mem [231] = 16'b0;
		mem [232] = 16'b0;
		mem [233] = 16'b0;
		mem [234] = 16'b0;
		mem [235] = 16'b0;
		mem [236] = 16'b0;
		mem [237] = 16'b0;
		mem [238] = 16'b0;
		mem [239] = 16'b0;
		mem [240] = 16'b0;
		mem [241] = 16'b0;
		mem [242] = 120;
		mem [243] = 16'b0;
		mem [244] = 16'b0;
		mem [245] = 16'b0;
		mem [246] = 16'b0;
		mem [247] = 16'b0;
		mem [248] = 16'b0;
		mem [249] = 16'b0;
		mem [250] = 16'b0;
		mem [251] = 16'b0;
		mem [252] = 16'b0;
		mem [253] = 16'b0;
		mem [254] = 16'b0;
		mem [255] = 16'b0;
	end

endmodule // End of Module ram_sp_ar_aw
