// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`timescale 1ns/1ps

module ROM_ASIC #(
// Parameters
    parameter   DATA_WIDTH          = 16,
    parameter   ADDR_WIDTH          = 6,
    parameter   INIT                = "weight.txt",
    parameter   TYPE                = "block",
    parameter   ROM_DEPTH           = 1<<ADDR_WIDTH
) (
// Port Declarations
    input  wire                         CLK,
    input  wire                         RESET,
    input  wire  [ADDR_WIDTH-1:0]       ADDRESS,
    input  wire                         ENABLE,
    output reg   [DATA_WIDTH-1:0]       DATA_OUT,
    output reg                          DATA_OUT_VALID
);

// ******************************************************************
// Internal variables
// ******************************************************************

  localparam DEPTH = ROM_DEPTH;

  reg     [DATA_WIDTH-1:0]        rdata;
  wire     [ADDR_WIDTH-1:0]        address;

  assign address = ADDRESS;


  // `include "instructions.v"   // TODO
  always @(*) begin
	case(address)
/*****************************************************************************************/
//
// read [True, False, False, False]
// ['x(0,)', 'x(1,)', 'x(2,)', 'x(3,)', None, None, None, None, None, None, None, None, None, None, None, None]
// Data values: [2, 9, 6, 3, None, None, None, None, None, None, None, None, None, None, None, None]
// Dest PEs: [1, 2, 3, 4, None, None, None, None, None, None, None, None, None, None, None, None]
6'd0: rdata =    56'b00000000000000000000000000000000000000000000000000000001;
//
// shift amount: 15, Lanes IDs: [1, 2, 3, 4]
6'd1: rdata =    56'b00000000000000000000000000000000000100100100100001011111;
//
// read [True, False, False, False]
// ['x(4,)', 'x(5,)', 'x(7,)', 'x(8,)', None, None, None, None, None, None, None, None, None, None, None, None]
// Data values: [2, 1, 8, 6, None, None, None, None, None, None, None, None, None, None, None, None]
// Dest PEs: [5, 6, 7, 9, None, None, None, None, None, None, None, None, None, None, None, None]
6'd2: rdata =    56'b00000000000000000000000000000000000000000000000000000001;
//
// shift amount: 10, Lanes IDs: [9]
6'd3: rdata =    56'b00000000000000000000100000000000000000000000000001011010;
//
// shift amount: 11, Lanes IDs: [5, 6, 7]
6'd4: rdata =    56'b00000000000000000000000000100100100000000000000001011011;
//
// read [True, False, False, False]
// ['x(9,)', 'x(10,)', 'x(11,)', 'x(12,)', None, None, None, None, None, None, None, None, None, None, None, None]
// Data values: [3, 9, 9, 4, None, None, None, None, None, None, None, None, None, None, None, None]
// Dest PEs: [10, 11, 12, 13, None, None, None, None, None, None, None, None, None, None, None, None]
6'd5: rdata =    56'b00000000000000000000000000000000000000000000000000000001;
//
// shift amount: 6, Lanes IDs: [10, 11, 12, 13]
6'd6: rdata =    56'b00000000100100100100000000000000000000000000000001010110;
//
// read [True, False, False, False]
// ['x(14,)', 'x(15,)', 'x(16,)', 'x(17,)', None, None, None, None, None, None, None, None, None, None, None, None]
// Data values: [9, 3, 1, 1, None, None, None, None, None, None, None, None, None, None, None, None]
// Dest PEs: [14, 15, 17, 18, None, None, None, None, None, None, None, None, None, None, None, None]
6'd7: rdata =    56'b00000000000000000000000000000000000000000000000000000001;
//
// shift amount: 1, Lanes IDs: [1, 2]
6'd8: rdata =    56'b00000000000000000000000000000000000000001101100001010001;
//
// shift amount: 2, Lanes IDs: [14, 15]
6'd9: rdata =    56'b00100100000000000000000000000000000000000000000001010010;
//
// read [True, False, False, False]
// ['x(18,)', 'x(19,)', 'x(21,)', 'x(22,)', None, None, None, None, None, None, None, None, None, None, None, None]
// Data values: [1, 0, 3, 9, None, None, None, None, None, None, None, None, None, None, None, None]
// Dest PEs: [19, 20, 21, 22, None, None, None, None, None, None, None, None, None, None, None, None]
6'd10: rdata =   56'b00000000000000000000000000000000000000000000000000000001;
//
// shift amount: 13, Lanes IDs: [3, 4, 5, 6]
6'd11: rdata =   56'b00000000000000000000000000001101101101100000000001011101;
//
// read [True, False, False, False]
// ['x(24,)', 'x(25,)', 'x(27,)', 'x(28,)', None, None, None, None, None, None, None, None, None, None, None, None]
// Data values: [2, 5, 9, 3, None, None, None, None, None, None, None, None, None, None, None, None]
// Dest PEs: [23, 25, 26, 27, None, None, None, None, None, None, None, None, None, None, None, None]
6'd12: rdata =   56'b00000000000000000000000000000000000000000000000000000001;
//
// shift amount: 8, Lanes IDs: [9, 10, 11]
6'd13: rdata =   56'b00000000000001101101100000000000000000000000000001011000;
//
// shift amount: 9, Lanes IDs: [7]
6'd14: rdata =   56'b00000000000000000000000001100000000000000000000001011001;
//
// read [True, False, False, False]
// ['x(29,)', 'x(30,)', 'x(31,)', 'x(32,)', None, None, None, None, None, None, None, None, None, None, None, None]
// Data values: [0, 5, 1, 0, None, None, None, None, None, None, None, None, None, None, None, None]
// Dest PEs: [28, 29, 30, 31, None, None, None, None, None, None, None, None, None, None, None, None]
6'd15: rdata =   56'b00000000000000000000000000000000000000000000000000000001;
//
// shift amount: 4, Lanes IDs: [12, 13, 14, 15]
6'd16: rdata =   56'b01101101101100000000000000000000000000000000000001010100;
//
// read [True, False, False, False]
// ['x(34,)', 'x(35,)', 'x(36,)', 'x(37,)', None, None, None, None, None, None, None, None, None, None, None, None]
// Data values: [1, 5, 3, 5, None, None, None, None, None, None, None, None, None, None, None, None]
// Dest PEs: [33, 34, 35, 36, None, None, None, None, None, None, None, None, None, None, None, None]
6'd17: rdata =   56'b00000000000000000000000000000000000000000000000000000001;
//
// shift amount: 15, Lanes IDs: [1, 2, 3, 4]
6'd18: rdata =   56'b00000000000000000000000000000000010110110110100001011111;
//
// read [True, False, False, False]
// ['x(38,)', 'x(39,)', 'x(41,)', 'x(42,)', None, None, None, None, None, None, None, None, None, None, None, None]
// Data values: [3, 8, 1, 5, None, None, None, None, None, None, None, None, None, None, None, None]
// Dest PEs: [37, 38, 39, 41, None, None, None, None, None, None, None, None, None, None, None, None]
6'd19: rdata =   56'b00000000000000000000000000000000000000000000000000000001;
//
// shift amount: 10, Lanes IDs: [9]
6'd20: rdata =   56'b00000000000000000010100000000000000000000000000001011010;
//
// shift amount: 11, Lanes IDs: [5, 6, 7]
6'd21: rdata =   56'b00000000000000000000000010110110100000000000000001011011;
//
// read [True, False, False, False]
// ['x(43,)', 'x(44,)', 'x(45,)', 'x(46,)', None, None, None, None, None, None, None, None, None, None, None, None]
// Data values: [0, 0, 4, 3, None, None, None, None, None, None, None, None, None, None, None, None]
// Dest PEs: [42, 43, 44, 45, None, None, None, None, None, None, None, None, None, None, None, None]
6'd22: rdata =   56'b00000000000000000000000000000000000000000000000000000001;
//
// shift amount: 6, Lanes IDs: [10, 11, 12, 13]
6'd23: rdata =   56'b00000010110110110100000000000000000000000000000001010110;
//
// read [True, False, False, False]
// ['x(48,)', 'x(49,)', 'x(51,)', 'x(52,)', None, None, None, None, None, None, None, None, None, None, None, None]
// Data values: [7, 0, 5, 2, None, None, None, None, None, None, None, None, None, None, None, None]
// Dest PEs: [46, 47, 49, 50, None, None, None, None, None, None, None, None, None, None, None, None]
6'd24: rdata =   56'b00000000000000000000000000000000000000000000000000000001;
//
// shift amount: 1, Lanes IDs: [1, 2]
6'd25: rdata =   56'b00000000000000000000000000000000000000011111100001010001;
//
// shift amount: 2, Lanes IDs: [14, 15]
6'd26: rdata =   56'b10110100000000000000000000000000000000000000000001010010;
//
// read [True, False, False, False]
// ['x(6,)', 'x(13,)', 'x(20,)', 'x(23,)', None, None, None, None, None, None, None, None, None, None, None, None]
// Data values: [6, 9, 6, 2, None, None, None, None, None, None, None, None, None, None, None, None]
// Dest PEs: [51, 52, 53, 54, None, None, None, None, None, None, None, None, None, None, None, None]
6'd27: rdata =   56'b00000000000000000000000000000000000000000000000000000001;
//
// shift amount: 13, Lanes IDs: [3, 4, 5, 6]
6'd28: rdata =   56'b00000000000000000000000000011111111111100000000001011101;
//
// read [True, False, False, False]
// ['x(26,)', 'x(33,)', 'x(40,)', 'x(47,)', None, None, None, None, None, None, None, None, None, None, None, None]
// Data values: [7, 8, 8, 0, None, None, None, None, None, None, None, None, None, None, None, None]
// Dest PEs: [55, 57, 58, 59, None, None, None, None, None, None, None, None, None, None, None, None]
6'd29: rdata =   56'b00000000000000000000000000000000000000000000000000000001;
//
// shift amount: 8, Lanes IDs: [9, 10, 11]
6'd30: rdata =   56'b00000000000011111111100000000000000000000000000001011000;
//
// shift amount: 9, Lanes IDs: [7]
6'd31: rdata =   56'b00000000000000000000000011100000000000000000000001011001;
//
// read [True, False, False, False]
// ['x(50,)', 'x(53,)', 'y', None, None, None, None, None, None, None, None, None, None, None, None, None]
// Data values: [6, 4, 3, None, None, None, None, None, None, None, None, None, None, None, None, None]
// Dest PEs: [60, 61, 34, None, None, None, None, None, None, None, None, None, None, None, None, None]
6'd32: rdata =   56'b00000000000000000000000000000000000000000000000000000001;
//
// shift amount: 0, Lanes IDs: [2]
6'd33: rdata =   56'b00000000000000000000000000000000000000010100000001010000;
//
// shift amount: 4, Lanes IDs: [12, 13]
6'd34: rdata =   56'b00000011111100000000000000000000000000000000000001010100;
//
// wfi
6'd35: rdata =   56'b00000000000000000000000000000000000000000000000001100000;
//
// loop
6'd36: rdata =   56'b00000000000000000000000000000000000000000000000001110000;/****************************************************************************************/
default: rdata = 56'b00000000000000000000000000000000000000000000000001110000;

	endcase
	end

    //reg     [ADDR_WIDTH-1:0]        address;

// ******************************************************************
// Read Logic
// ******************************************************************

    always @ (posedge CLK)
    begin : READ_VALID
        if (RESET) begin
            DATA_OUT_VALID <= 1'b0;
        end else if (ENABLE) begin
            DATA_OUT_VALID <= 1'b1;
        end
    end



 always @(posedge CLK) begin
    if (ENABLE)
        DATA_OUT <= rdata;
end

endmodule
