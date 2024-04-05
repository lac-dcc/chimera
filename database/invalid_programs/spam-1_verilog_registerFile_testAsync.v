// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`ifndef  V_RFA
`define  V_RFA

`include "registerFile.v"
`include "../lib/assertion.v"

`timescale 1ns/1ns

module testAsync();
    
    logic _wr_en;
    logic [1:0] wr_addr;
    logic [7:0] wr_data;
    
    logic _rdL_en;
    logic [1:0] rdL_addr;
    logic [7:0] rdL_data;
    
    logic _rdB_en;
    logic [1:0] rdB_addr;
    logic [7:0] rdB_data;
    
    registerFile #(.LOG(1)) regFile(
        _wr_en,
        wr_addr,
        wr_data,
        
        _rdL_en,
        rdL_addr,
        rdL_data,
        
        _rdB_en,
        rdB_addr,
        rdB_data
    );
    
    parameter disabled       = 1;
    parameter enabled        = 0;

    localparam IC_PD_A_TO_Q  = 21;
    localparam IC_PD_D_TO_Q  = 27;

    localparam PD_MISC       = (IC_PD_A_TO_Q+1);
    localparam PD_A_TO_Q     = (IC_PD_A_TO_Q+1);
    
    initial begin
        $dumpfile("dumpfile.vcd");
`ifndef verilator
        $dumpvars(0, _wr_en, wr_addr, wr_data, _rdL_en, rdL_addr, rdL_data, _rdB_en, rdB_addr, rdB_data);
`endif
    end


    `define regEquals(A,B,C,D) begin \
            `Equals( regFile.get(0), 8'(A)); \
            `Equals( regFile.get(1), 8'(B)); \
            `Equals( regFile.get(2), 8'(C)); \
            `Equals( regFile.get(3), 8'(D)); \
        end

    
    initial begin
        
        `regEquals(8'h00, 8'h11, 8'h22, 8'h33);

        $display("%9t ", $time, " ----  0: defaults: write enabled at 0 with 255, no read");
        _wr_en   = enabled;
        wr_data = 255;
        wr_addr = 0;
        
        _rdL_en   = disabled;
        _rdB_en   = disabled;
        rdL_addr = 0;
        rdB_addr = 0;
        
        #1; // too quick for propagation
        `assertEquals(rdL_data, 8'bx);
        `assertEquals(rdB_data, 8'bx);

        #1000; // allow settling before rest of rests

        $display("%9t ", $time, " ----  1: write enabled at 0 with 1, readL disabled, readR en at 0");
        _wr_en   = enabled;
        wr_data = 1;
        _rdL_en  = disabled;
        _rdB_en  = enabled;
        rdL_addr = 'x;
        rdB_addr = 0;
        #PD_MISC
        `assertEquals(rdL_data, 8'bz);
        `assertEquals(rdB_data, 8'd1);
        

        $display("%9t ", $time, " ----  2: write enabled at 2 with 2, readL at 2, readR en at 0");
        wr_data  = 2;
        wr_addr  = 2;
        _rdB_en   = enabled;
        _rdL_en   = enabled;
        rdL_addr = 2;
        rdB_addr = 0;
        #PD_MISC
        `assertEquals(rdL_data, 8'd2);
        `assertEquals(rdB_data, 8'd1);

        `regEquals(1, 8'h11, 2, 8'h33);
        
        $display("%9t ", $time, " ----  3: write enabled at 1 with 255, readL at 2, readR en at 0");
        wr_addr = 1;
        wr_data = 255;
        rdL_addr = 2;
        rdB_addr = 0;
        #PD_MISC
        `assertEquals(rdL_data, 8'd2);
        `assertEquals(rdB_data, 8'd1);
        `regEquals(1, 255, 2, 8'h33);
        
        $display("%9t ", $time, " ----  4: write enabled at 1 with 255, readL at 2, readR disabled");
        _rdL_en=enabled;
        _rdB_en=disabled;
        rdL_addr = 2;
        rdB_addr = 0;
        #PD_MISC
        `assertEquals(rdL_data, 8'd2);
        `assertEquals(rdB_data, 8'dz);

        `regEquals(1, 255, 2, 8'h33);
        
        $display("%9t ", $time, " ----  5: write enabled at 1 with 255, readL at 2, readR at 2");
        _rdL_en=enabled;
        _rdB_en=enabled;
        rdL_addr = 2;
        rdB_addr = 2;
        #PD_MISC
        `assertEquals(rdL_data, 8'd2);
        `assertEquals(rdB_data, 8'd2);
        
        $display("%9t ", $time, " ----  6: read and write at same location, then change input data");
        _wr_en   = enabled;
        _rdL_en=enabled;
        _rdB_en=enabled;
        wr_data = 255;
        wr_addr = 2;
        rdL_addr = 2;
        rdB_addr = 2;
        #1000 // big settle
        `regEquals(1, 255, 255, 8'h33);
        wr_data = 0;
        #IC_PD_D_TO_Q // too soon
        `assertEquals(rdL_data, 8'd255);
        `assertEquals(rdB_data, 8'd255);
        `regEquals(1, 255, 0, 8'h33); // measures without PD
        #1
        `assertEquals(rdL_data, 8'd0);
        `assertEquals(rdB_data, 8'd0);
        `regEquals(1, 255, 0, 8'h33);

        $display("%9t ", $time, " ----  7: read and write at same location but write disabled, then change input data and enable write");
        _wr_en   = disabled;
        _rdL_en=enabled;
        _rdB_en=enabled;
        wr_data = 0;
        wr_addr = 2;
        rdL_addr = 2;
        rdB_addr = 2;
        #1000 // big settle
        `regEquals(1, 255, 0, 8'h33);
        wr_data = 0;
        #1000 // big settle
        `assertEquals(rdL_data, 8'd0);
        `assertEquals(rdB_data, 8'd0);
        `regEquals(1, 255, 0, 8'h33); // measures without PD

        // make the change
        _wr_en   = enabled;
        wr_data = 255;
        #IC_PD_D_TO_Q // too soon
        `assertEquals(rdL_data, 8'd0);
        `assertEquals(rdB_data, 8'd0);
        `regEquals(1, 255, 255, 8'h33); // measures without PD
        #1
        `assertEquals(rdL_data, 8'd255);
        `assertEquals(rdB_data, 8'd255);
        `regEquals(1, 255, 255, 8'h33); // measures without PD

        $display("%9t ", $time, " ----  8: write disabled at 1 with 1, readL at 2, readR at 2");
        _wr_en = disabled;
        wr_data = 1;
        _rdL_en=enabled;
        _rdB_en=enabled;
        rdL_addr = 2;
        rdB_addr = 2;
        #PD_MISC
        `assertEquals(rdL_data, 8'd255);
        `assertEquals(rdB_data, 8'd255);
        
        `regEquals(1, 255, 255, 8'h33);

        $display("%9t ", $time, " ----  9: write disabled, readL at 1, readR at 2");
        _wr_en = disabled;
        wr_data = 1;
        _rdL_en=enabled;
        _rdB_en=enabled;
        rdL_addr = 1;
        rdB_addr = 2;
        #PD_MISC
        `assertEquals(rdL_data, 8'd255);
        `assertEquals(rdB_data, 8'd255);
        `regEquals(1, 255, 255, 8'h33);

        #PD_MISC
        $display("%9t ", $time, " ----  DONE");
        $finish;
    end
    
endmodule

`endif
