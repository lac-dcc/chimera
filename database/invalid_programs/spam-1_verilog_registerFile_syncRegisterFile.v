// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
/*
    FOR 100% CORRECT OPERATION THE REGISTER MUST LATCH BEFORE THE _WE GOES LOW OTHERWISE THERE'S
    A WINDOW FOR ERROR WHERE THE PREVIOUS UNRELATED VALUE OF THE INPUT REGISTER GETS WRITTEN
    TO THE REG AND FLOWS THRU IF READING THE SAME LOCATION AND THIS MAY IMPACT DOWNSTREAM COMPONENTS.
    REALISTICALLY IF THE DELTA ON 
*/

`ifndef V_SYNC_REGFILE
`define V_SYNC_REGFILE
/* 4x8 dual port register file
* latches write data on postive edge, all other inputs remain async.
 */

//`include "../74423/hct74423.v"
`include "../registerFile/registerFile.v"
`include "../74574/hct74574.v"
`timescale 1ns/1ns
module syncRegisterFile #(parameter LOG=0, PulseWidth=100) (
    	input clk,

        input _wr_en, 
        input [1:0] wr_addr,
        input [7:0] wr_data,

        input _rdL_en,
        input [1:0] rdL_addr,
        output [7:0] rdL_data,

        input _rdR_en,
        input [1:0] rdR_addr,
        output [7:0] rdR_data
);
    logic [31:0] binding_for_tests;
    assign binding_for_tests = {
                {regFile.bankL_hi.registers[0] , regFile.bankL_lo.registers[0]} ,
                {regFile.bankL_hi.registers[1] , regFile.bankL_lo.registers[1]} ,
                {regFile.bankL_hi.registers[2] , regFile.bankL_lo.registers[2]} ,
                {regFile.bankL_hi.registers[3] , regFile.bankL_lo.registers[3]} };

    
    function [7:0] get([1:0] r);
        get = regFile.get(r);
    endfunction

	wire [7:0] wr_data_latched;

    hct74574 #(.LOG(0)) input_register( .D(wr_data), .Q(wr_data_latched), .CLK(clk), ._OE(1'b0)); // registers data on clk +ve & _pulse goes low slightly later.


    registerFile #(.LOG(LOG)) regFile (
        ._wr_en(_wr_en),
        .wr_addr,
        .wr_data(wr_data_latched),
        ._rdL_en,
        .rdL_addr,
        .rdL_data,
        ._rdR_en,
        .rdR_addr,
        .rdR_data
    );

/*
    if (LOG) always @(posedge clk) begin
        $display("%9t ", $time, "REGFILE : REGISTERED input data %08b", wr_data);
    end
*/

/*
    if (LOG) always @(*) begin
        //$display("%9t ", $time, "REGFILE-S : ARGS : _wr_en=%1b _pulse=%1b write[%d]=%d     _rdX_en=%1b X[%d]=>%d    _rdY_en=%1b Y[%d]=>%d   (preletch=%d)  _MR=%1b" ,
         //    _wr_en, _pulse, wr_addr, wr_data, _rdL_en, rdL_addr, rdL_data, _rdL_en, rdR_addr, rdR_data, wr_data_latched, _MR);

        if (!_wr_en) $display("%9t ", $time, "REGFILE : UPDATING write[%d] = %d", wr_addr, wr_data_latched);
    end

    if (LOG) always @(posedge _wr_en) begin
        $display("%9t ", $time, "REGFILE : LATCHED write[%d]=%d", wr_addr, wr_data_latched);
    end
*/

    
endmodule

`endif
