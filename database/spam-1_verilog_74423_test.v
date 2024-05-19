// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan

`include "hct74423.v"
`include "../lib/assertion.v"

`timescale 1ns/1ns

module icarus_tb();
    
	logic _A,  B, _R;
    wire Q, _Q;
    
	hct74423 #(.PulseWidth(100)) monostable(_A, B, _R, Q, _Q);
    
    initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars(0, monostable);
    end

    always @* $display ($time, "_A=%1b B=%1b _R=%1b  ->  Q=%1b _Q=%1b", _A, B, _R, Q, _Q);

    initial begin
        `Equals(Q, 1'bx);
        `Equals(_Q, 1'bx);

        #100
        `Equals(Q, 1'bx);
        `Equals(_Q, 1'bx);

        $display("reset");
        _R=0;
        #100
        `Equals(Q, 1'b0);
        `Equals(_Q, 1'b1);
            
        $display("unreset");
        _R=1;
        #100
        `Equals(Q, 1'b0);
        `Equals(_Q, 1'b1);
            
        $display("prep");
        _A=0;
        B=0;
        _R=1;
        #100
        `Equals(Q, 1'b0);
        `Equals(_Q, 1'b1);

        $display("trigger");
        B=1;
        #20 // less than PD
        `Equals(Q, 1'b0);
        `Equals(_Q, 1'b1);
        #20 // not more than PD
        `Equals(Q, 1'b1);
        `Equals(_Q, 1'b0);

        $display("pulse should have ended");
        #100 // not more than PD
        `Equals(Q, 1'b0);
        `Equals(_Q, 1'b1);

    end

endmodule
