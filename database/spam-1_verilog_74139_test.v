// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan


/* verilator lint_off ASSIGNDLY */
/* verilator lint_off STMTDLY */


`include "../lib/assertion.v"
`include "./hct74139.v"
`timescale 1ns/1ns

module test();

    reg _Ea=1'bx;
    reg _Eb;
    reg [1:0] Aa;
    reg [1:0] Ab;
    wire [3:0] _Ya;
    wire [3:0] _Yb;

    `include "../lib/display_snippet.sv"

    always @* begin
        $display("%9t ", $time, " TEST>   _Ea=%1b", _Ea, " Aa=%2b", Aa, " _Ya=%4b", _Ya, "  : %s ", label);
    end

    initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars(0, test);
    end
     
    time timer;

    hct74139 #(.LOG(1)) demux(
                    ._Ea,
                    ._Eb,
                    .Aa,
                    .Ab,
                    ._Ya,
                    ._Yb
                    );

    initial begin
      

        `DISPLAY("initial");
        `Equals(_Ya, 4'bx)

        `DISPLAY("setting address=0");
        Aa = 0;
        #400
        //`Equals(_Ya, 4'bx)

        `DISPLAY("disable");
        _Ea = 1;
        #40
        `Equals(_Ya, 4'b1111)

        `DISPLAY("enable");
        _Ea = 0;
        #40
        `Equals(_Ya, 4'b1110)

        `DISPLAY("address=1");
        Aa = 1;
        #400
        `Equals(_Ya, 4'b1101)

        `DISPLAY("address=2");
        Aa = 2;
        #400
        `Equals(_Ya, 4'b1011)

        `DISPLAY("address=3");
        Aa = 3;
        #400
        `Equals(_Ya, 4'b0111)

        `DISPLAY("disable");
        _Ea = 1;
        #40
        `Equals(_Ya, 4'b1111)
        
        `DISPLAY("enable output");
        timer=$time;
        _Ea = 0; // b->a
`ifndef verilator
        wait(_Ya === 4'b0111);
`endif
        if ($time - timer != 13) begin
            $display("BAD SPEED - EXPECTED 13ns - TOOK %-d", ($time - timer));
            $finish();
        end
        else
            $display("TOOK %-d", ($time - timer));
        
        #50

        `DISPLAY("change address");
        timer=$time;
        Aa = 0; // b->a
`ifndef verilator
        wait(_Ya === 4'b1110);
`endif
        if ($time - timer != 13)  begin
            $display("BAD SPEED - EXPECTED 13ns - TOOK %-d", ($time - timer));
            $finish();
        end
        else
            $display("TOOK %-d", ($time - timer));

      #50

        `DISPLAY("done");
        $finish;
    end

endmodule : test

