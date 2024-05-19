// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`include "hct74377.v"
`include "../lib/assertion.v"

`timescale 1ns/1ns

module icarus_tb();
    
	logic [7:0] D, Q;
	logic CP, _EN;
    
	hct74377 #(.LOG(1)) register(
        .D, .Q,
        .CP, ._EN
	);
    
    initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars(0,  register);
        
`ifndef verilator        
        $monitor ("%9t ", $time, "TEST        CP=%b _EN=%b D=%8b Q=%8b", CP, _EN, D, Q);
`endif
    end

    initial begin
        parameter tPD = 14+1;

        D='0; 
        CP='x;
        _EN='x;

        $display("intial state x");
        `Equals(Q , 8'bxxxxxxxx);
        #1 

        $display("does not transitions to 0 (verilog register initial value) because I've hard coded to 'xz pattern to spot uninitialisd usage");
        #tPD 
        `Equals(Q , 8'bzxxzzxxz);

        $display("CP with enable loads");
        D='1;
        CP=0;
        _EN=0;
        #tPD 
        `Equals(Q , 8'bzxxzzxxz);

        CP=1;
        #tPD 
        `Equals(Q , '1);

        $display("CP with disable does not load");

        D='0;
        CP=0;
        _EN=1;
        #tPD 
        `Equals(Q , '1);

        CP=1;
        #tPD 
        `Equals(Q , '1);

    end
endmodule
