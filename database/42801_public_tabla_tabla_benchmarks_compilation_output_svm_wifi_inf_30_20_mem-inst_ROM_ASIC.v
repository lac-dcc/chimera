// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`timescale 1ns/1ps

module ROM_ASIC #(
// Parameters
    parameter   DATA_WIDTH          = 16,
    parameter   ADDR_WIDTH          = 4,
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
// ['x_train(0,)', 'x_train(1,)', 'x_train(2,)', 'x_train(3,)', None, None, None, None, None, None, None, None, None, None, None, None]
// Data values: [14, 11, 24, 46, None, None, None, None, None, None, None, None, None, None, None, None]
// Dest PEs: [1, 2, 3, 4, None, None, None, None, None, None, None, None, None, None, None, None]
4'd0: rdata =    56'b00000000000000000000000000000000000000000000000000000001;
//
// shift amount: 15, Lanes IDs: [1, 2, 3, 4]
4'd1: rdata =    56'b00000000000000000000000000000000000100100100100001011111;
//
// read [True, False, False, False]
// ['x_train(4,)', 'x_train(5,)', 'x_train(6,)', 'x_train(7,)', None, None, None, None, None, None, None, None, None, None, None, None]
// Data values: [24, 19, 31, 32, None, None, None, None, None, None, None, None, None, None, None, None]
// Dest PEs: [5, 6, 7, 9, None, None, None, None, None, None, None, None, None, None, None, None]
4'd2: rdata =    56'b00000000000000000000000000000000000000000000000000000001;
//
// shift amount: 10, Lanes IDs: [9]
4'd3: rdata =    56'b00000000000000000000100000000000000000000000000001011010;
//
// shift amount: 11, Lanes IDs: [5, 6, 7]
4'd4: rdata =    56'b00000000000000000000000000100100100000000000000001011011;
//
// read [True, False, False, False]
// ['x_train(8,)', 'x_train(9,)', 'x_train(10,)', 'x_train(11,)', None, None, None, None, None, None, None, None, None, None, None, None]
// Data values: [32, -1, 29, 33, None, None, None, None, None, None, None, None, None, None, None, None]
// Dest PEs: [10, 11, 12, 13, None, None, None, None, None, None, None, None, None, None, None, None]
4'd5: rdata =    56'b00000000000000000000000000000000000000000000000000000001;
//
// shift amount: 6, Lanes IDs: [10, 11, 12, 13]
4'd6: rdata =    56'b00000000100100100100000000000000000000000000000001010110;
//
// read [True, False, False, False]
// ['x_train(12,)', 'x_train(13,)', 'x_train(14,)', 'x_train(15,)', None, None, None, None, None, None, None, None, None, None, None, None]
// Data values: [2, 22, 36, 21, None, None, None, None, None, None, None, None, None, None, None, None]
// Dest PEs: [14, 15, 17, 18, None, None, None, None, None, None, None, None, None, None, None, None]
4'd7: rdata =    56'b00000000000000000000000000000000000000000000000000000001;
//
// shift amount: 1, Lanes IDs: [1, 2]
4'd8: rdata =    56'b00000000000000000000000000000000000000001101100001010001;
//
// shift amount: 2, Lanes IDs: [14, 15]
4'd9: rdata =    56'b00100100000000000000000000000000000000000000000001010010;
//
// read [True, False, False, False]
// ['x_train(16,)', 'x_train(17,)', 'x_train(18,)', 'x_train(19,)', None, None, None, None, None, None, None, None, None, None, None, None]
// Data values: [23, 13, 9, 31, None, None, None, None, None, None, None, None, None, None, None, None]
// Dest PEs: [19, 20, 21, 22, None, None, None, None, None, None, None, None, None, None, None, None]
4'd10: rdata =   56'b00000000000000000000000000000000000000000000000000000001;
//
// shift amount: 13, Lanes IDs: [3, 4, 5, 6]
4'd11: rdata =   56'b00000000000000000000000000001101101101100000000001011101;
//
// wfi
4'd12: rdata =   56'b00000000000000000000000000000000000000000000000001100000;
//
// loop
4'd13: rdata =   56'b00000000000000000000000000000000000000000000000001110000;/****************************************************************************************/
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
