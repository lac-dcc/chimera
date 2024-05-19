// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`ifndef  V_RF
`define  V_RF


/* 4x8 dual port register file
 */

`include "../74670/hct74670.v"
`timescale 1ns/1ns

module registerFile #(parameter LOG=0) (
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

    
    wire [3:0] wr_data_hi, wr_data_lo;
// verilator lint_off UNOPTFLAT
    wire [3:0] rdL_data_hi, rdL_data_lo, rdR_data_hi, rdR_data_lo;
// verilator lint_on UNOPTFLAT

    assign {wr_data_hi, wr_data_lo} = wr_data;
    assign rdL_data                 = {rdL_data_hi, rdL_data_lo};
    assign rdR_data                 = {rdR_data_hi, rdR_data_lo};

    hct74670 #(.LOG(0)) bankL_lo(
        _wr_en,
        wr_addr,
        wr_data_lo,
        _rdL_en,
        rdL_addr,
        rdL_data_lo
    );
    hct74670 #(.LOG(0)) bankL_hi(
        _wr_en,
        wr_addr,
        wr_data_hi,
        _rdL_en,
        rdL_addr,
        rdL_data_hi
    );
    
    hct74670 #(.LOG(0)) bankR_lo(
        _wr_en,
        wr_addr,
        wr_data_lo,
        _rdR_en,
        rdR_addr,
        rdR_data_lo
    );
    hct74670 #(.LOG(0)) bankR_hi(
        _wr_en,
        wr_addr,
        wr_data_hi,
        _rdR_en,
        rdR_addr,
        rdR_data_hi
    );
    
    if (LOG) always @(negedge _wr_en) begin 
        $display("%9t REGFILE : BEGIN WRITE _wr_en=%1b,  write[%d]=%-3d     _rdX_en=%1b, X[%d]=>%-3d    _rdY_en=%1b, Y[%d]=>%-3d" , $time, 
                    _wr_en, wr_addr, wr_data, 
                    _rdL_en, rdL_addr, rdL_data, 
                    _rdL_en, rdR_addr, rdR_data);
    end
    if (LOG) always @(posedge _wr_en) begin 
        $display("%9t REGFILE : END WRITE _wr_en=%1b,  write[%d]=%-3d     _rdX_en=%1b, X[%d]=>%-3d    _rdY_en=%1b, Y[%d]=>%-3d" , $time, 
                    _wr_en, wr_addr, wr_data, 
                    _rdL_en, rdL_addr, rdL_data, 
                    _rdL_en, rdR_addr, rdR_data);
    end

    // only need to bind to L or R as they have the same value
    if (LOG) always @(   
                    _wr_en//, wr_addr, wr_data, 
                    //_rdL_en, rdL_addr, rdL_data, 
                    //_rdL_en, rdR_addr, rdR_data
    ) begin
        $display("%9t ", $time, "REGFILE : _wr_en=%1b", //,  write[%d]=%-3d     _rdX_en=%1b, X[%d]=>%-3d    _rdY_en=%1b, Y[%d]=>%-3d" , 
                    _wr_en//, wr_addr, wr_data, 
                    //_rdL_en, rdL_addr, rdL_data, 
                    //_rdL_en, rdR_addr, rdR_data
                    );
    end

`ifndef verilator
    if (LOG) always @(   
                bankR_hi.registers[0] or bankR_lo.registers[0] or
                bankR_hi.registers[1] or bankR_lo.registers[1] or
                bankR_hi.registers[2] or bankR_lo.registers[2] or
                bankR_hi.registers[3] or bankR_lo.registers[3]
    ) begin
        $display("%9t ", $time, "REGFILE : DATA UPDATE A=%-3d(h%-2x)   B=%-3d(h%-2x)   C=%-3d(h%-2x)   D=%-3d(h%-2x)", 
                get(0), get(0), 
                get(1), get(1), 
                get(2), get(2), 
                get(3), get(3));
    end
`endif

    
    function [7:0] get([1:0] r);
        get = {bankL_hi.registers[r], bankL_lo.registers[r]};
    endfunction


endmodule

`endif
