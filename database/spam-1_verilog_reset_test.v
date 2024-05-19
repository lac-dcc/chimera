// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`include "../pc/pc.v"
`include "../lib/assertion.v"
`include "reset.v"

// verilator lint_off ASSIGNDLY
// verilator lint_off STMTDLY

`timescale 1ns/1ns


// "Do not use an asynchronous reset within your design." - https://zipcpu.com/blog/2017/08/21/rules-for-newbies.html
module test(
);

    parameter LOG=0;
    parameter GAP=100;

    logic _RESET_SWITCH;
    logic system_clk;
    
    wire _mrPos, _mrNeg, _phase_exec;

    reset RESET(
        ._RESET_SWITCH,
        .system_clk,
        ._phase_exec(_phase_exec),
        ._mrNeg
    );

    ///////////////////// PROGRAM COUNTER

    wire [7:0] pc_din = 8'haa;
    wire [7:0] PCHI, PCLO; // output of PC
    wire [15:0] pc = {PCHI, PCLO}; 

    logic _do_jmp = 1;
    logic _pclo_in = 1;
    logic _pchitmp_in = 1;
    
    // PC reset is sync with +ve edge of clock
    pc #(.LOG(0))  PC (
        .clk(system_clk),
        ._MR(_mrNeg),
        ._long_jump(_do_jmp),  // load both
        ._local_jump(_pclo_in), // load lo
        ._pchitmp_in(_pchitmp_in), // load tmp
        .D(pc_din),

        .PCLO(PCLO),
        .PCHI(PCHI)
    );


    integer count;

    initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars(0, test);

        _RESET_SWITCH = 1;
        system_clk=1;
        #GAP

        PC.PCHI_7_4.count = 15;
        PC.PCHI_3_0.count = 15;
        PC.PCLO_7_4.count = 15;
        PC.PCLO_3_0.count = 15;
        #GAP
        `Equals(pc, 16'hffff);

        system_clk=1;
        #GAP
        `Equals(_mrNeg, 'x);
        `Equals(_phase_exec, 1'b1);
        `Equals(pc, 16'hffff);
    
        $display("RESET HIGH");
        _RESET_SWITCH = 1;
        #GAP

        // cycle and count
        system_clk=1'b0;
        #GAP
        `Equals(_phase_exec, 1'b0);
        `Equals(_mrNeg, 1'b1);
        `Equals(pc, 16'hffff);

        system_clk=1;
        #GAP
        `Equals(_phase_exec, 1'b1);
        `Equals(_mrNeg, 1'b1);
        `Equals(pc, 16'h0000);


        // cycle and count
        system_clk=0;
        #GAP
        `Equals(_phase_exec, 1'b0);
        `Equals(_mrNeg, 1'b1);
        `Equals(pc, 16'h0000);

        system_clk=1;
        #GAP
        `Equals(_phase_exec, 1'b1);
        `Equals(_mrNeg, 1'b1);
        `Equals(pc, 16'h0001);

        $display("SET RESET LOW => instant _mrNeg=0 without clock");
        _RESET_SWITCH = 0;
        #GAP
        `Equals(_phase_exec, 1'b0); // pulled low by reset
        `Equals(_mrNeg, 1'b0); // pulled low by reset
        `Equals(pc, 16'h0001);


        // cycle and count
        $display("RESET STILL LOW => pc reset on system clock +ve");
        system_clk=0;
        #GAP
        `Equals(_phase_exec, 1'b0);
        `Equals(_mrNeg, 1'b0);
        `Equals(pc, 16'h0001);

        system_clk=1;
        #GAP
        `Equals(_phase_exec, 1'b0);
        `Equals(_mrNeg, 1'b0);
        `Equals(pc, 16'h0000);


        // cycle and count
        $display("RESET STILL LOW => no counting");
        system_clk=0;
        #GAP
        `Equals(_phase_exec, 1'b0);
        `Equals(_mrNeg, 1'b0);
        `Equals(pc, 16'h0000);

        system_clk=1;
        #GAP
        `Equals(_phase_exec, 1'b0);
        `Equals(_mrNeg, 1'b0);
        `Equals(pc, 16'h0000);


        // cycle and count
        $display("RESET RELEASE => _mrNeg stays low and no counting yet");
        _RESET_SWITCH = 1;
        system_clk=0;
        #GAP
        `Equals(_phase_exec, 1'b0);
        `Equals(_mrNeg, 1'b0);
        `Equals(pc, 16'h0000);

        system_clk=1;
        #GAP
        `Equals(_phase_exec, 1'b1);
        `Equals(_mrNeg, 1'b0);
        `Equals(pc, 16'h0000);


        // cycle and count
        $display("_mrNeg goes high and Counting starts");
        system_clk=0;
        #GAP
        `Equals(_phase_exec, 1'b0);
        `Equals(_mrNeg, 1'b1);
        `Equals(pc, 16'h0000);

        system_clk=1;
        #GAP
        `Equals(_phase_exec, 1'b1);
        `Equals(_mrNeg, 1'b1);
        `Equals(pc, 16'h0001);

        #GAP
        $display("DONE");
    end

    always @* $display("%9t ", $time, "      _mrNeg %1b  ", _mrNeg);
    always @* $display("%9t ", $time, "       pc %04h ", pc);

endmodule 
