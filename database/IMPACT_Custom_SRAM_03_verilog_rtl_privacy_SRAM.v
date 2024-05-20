// This program was cloned from: https://github.com/LiamOswald/IMPACT_Custom_SRAM_03
// License: Apache License 2.0

(* blackbox *)
module privacy_SRAM (

`ifdef USE_POWER_PINS
	inout vccd1,	// User area 1 1.8V power
	inout vssd1,	// User area 1 digital ground
	inout vccd2,	// User area 1 variable 1.8V power
	inout vssd2,	// User area 1 digital ground
`endif

input PreB,
input read_en,
input write_en,

input DataIn0,
input DataIn1,
input DataIn2,
input DataIn3,
input DataIn4,
input DataIn5,
input DataIn6,
input DataIn7,
input DataIn8,
input DataIn9,

output DataOut0,
output DataOut1,
output DataOut2,
output DataOut3,
output DataOut4,
output DataOut5,
output DataOut6,
output DataOut7,
output DataOut8,
output DataOut9,

input WL0,
input WL1,
input WL2,
input WL3,
input WL4,
input WL5,
input WL6,
input WL7,
input WL8,
input WL9,
input WL10,
input WL11,
input WL12,
input WL13,
input WL14,
input WL15,
input WL16,
input WL17,
input WL18,
input WL19,
input WL20,
input WL21,
input WL22,
input WL23,
input WL24,
input WL25,
input WL26,
input WL27,
input WL28,
input WL29,
input WL30,
input WL31,
input WL32,
input WL33,
input WL34,
input WL35,
input WL36,
input WL37,
input WL38,
input WL39,
input WL40,
input WL41,
input WL42,
input WL43,
input WL44,
input WL45,
input WL46,
input WL47,
input WL48,
input WL49,
input WL50,
input WL51,
input WL52,
input WL53,
input WL54,
input WL55,
input WL56,
input WL57,
input WL58,
input WL59,
input WL60,
input WL61,
input WL62,
input WL63
   
);
endmodule
`default_nettype wire
