// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`ifndef  V_RFS
`define  V_RFS

`include "syncRegisterFile.v"
`include "../lib/assertion.v"

`timescale 1ns/1ns

module testSync();
    
    logic _wr_en;
    logic [1:0] wr_addr;
    logic [7:0] wr_data;
    
    logic _rdL_en;
    logic [1:0] rdL_addr;
    logic [7:0] rdL_data;
    
    logic _rdR_en;
    logic [1:0] rdR_addr;
    logic [7:0] rdR_data;
    
    logic clk;

    parameter disabled       = 1;
    parameter enabled        = 0;

    syncRegisterFile #(.LOG(1)) regFile(
        clk,
        _wr_en,
        wr_addr,
        wr_data,
        
        _rdL_en,
        rdL_addr,
        rdL_data,
        
        _rdR_en,
        rdR_addr,
        rdR_data
    );

    
    parameter PD          = 100+25; // must be longer than the pulse width + prop delay inside the syncRegFile pulse generator
    
    initial begin
        $dumpfile("dumpfileSync.vcd");
`ifndef verilator
        $dumpvars(0, clk, _wr_en, wr_addr, wr_data, _rdL_en, rdL_addr, rdL_data, _rdR_en, rdR_addr, rdR_data);
        
        $display ("");
        $monitor ("%9t ", $time, " clk=%1b _wr_en=%1b wr_addr=%d   wr_data=%d  _rdL_en=%1b   rdL_addr=%d  rdL_data=%d  _rdR_en=%1b  rdR_addr=%d  rdR_data=%d",
                                    clk, _wr_en, wr_addr, wr_data, _rdL_en, rdL_addr, rdL_data, _rdR_en, rdR_addr, rdR_data);
`endif
    end
    
    initial begin
        
        $display("defaults: write enabled at 0 with 255, no read");
		clk=0;

        _wr_en   = enabled;
        wr_addr = 0;
        wr_data = 255;
        
        _rdL_en   = disabled;
        rdL_addr = 0;
        
        _rdR_en   = disabled;
        rdR_addr = 0;
        
        #PD;
        `assertEquals(rdL_data, 8'bz);
        `assertEquals(rdR_data, 8'bz);
        
        $display("write enabled with data=1, readL disabled, readR enabled, but no clock");
        _wr_en   = enabled;
        _rdL_en  = disabled;
        _rdR_en  = enabled;
        wr_data = 1;
        #PD
        // Not loaded yet
        `assertEquals(rdL_data, 8'bz);
        `assertEquals(rdR_data, 8'dx);

		// needs clock to be triggered
		clk=0; #PD; clk=1; #PD; clk=0;
        #PD
        `assertEquals(rdL_data, 8'bz);
        `assertEquals(rdR_data, 8'd1);

        $display("clock 255 into both");
        rdL_addr = 0;
        rdR_addr = 0;
        wr_addr = 0;
        wr_data = 255;
		clk=0; #PD; clk=1; #PD; clk=0;
        _wr_en   = enabled;
        _rdL_en  = enabled;
        _rdR_en  = enabled;
        wr_data = 8'hff;
        #PD
        `assertEquals(rdL_data, 8'hff);
        `assertEquals(rdR_data, 8'hff);
        `assertEquals(regFile.binding_for_tests, {8'd255, 8'h11, 8'h22, 8'h33} );

        $display("if address changes then old reg value gets applied to the regfile");
        wr_data = 123; // will not get thru register
        wr_addr = 1; // will smear data
        rdL_addr = 1;
        rdR_addr = 1;

        #PD
        `assertEquals(regFile.binding_for_tests, {8'd255, 8'd255, 8'h22, 8'h33} );
        `assertEquals(rdL_data, 8'hff);
        `assertEquals(rdR_data, 8'hff);

        $finish;
    end
    
endmodule

`endif
