// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
// verilator lint_off ASSIGNDLY 
// verilator lint_off STMTDLY


`include "../lib/assertion.v"
`include "./hct74138.v"
`timescale 1ns/1ns

module test();

    reg [2:0] A;
    wire [7:0] Y;

    logic Enable1_bar;
    logic Enable2_bar;
    logic Enable3;

    `include "../lib/display_snippet.sv"

    initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars(0, test);
    end
     
    time timer;

    hct74138 demux(
        .Enable1_bar,
        .Enable2_bar,
        .Enable3,
        .A,
        .Y
    );

    initial begin
      

        `DISPLAY("initial");
        `Equals(Y, 8'bx)

        `DISPLAY("setting address=0");
        A = 0;
        #400
        //`Equals(Y, 4'bx)

        `DISPLAY("disable");
        Enable1_bar = 1;
        Enable2_bar = 1;
        Enable3 = 1;
        #40
        `Equals(Y, 8'b11111111)

        `DISPLAY("enable");
        Enable1_bar = 0;
        Enable2_bar = 0;
        Enable3 = 1;
        #40
        `Equals(Y, 8'b11111110)

        `DISPLAY("address=1");
        A = 1;
        #400
        `Equals(Y, 8'b11111101)

        `DISPLAY("address=2");
        A = 2;
        #400
        `Equals(Y, 8'b11111011)

        `DISPLAY("address=3");
        A = 3;
        #400
        `Equals(Y, 8'b11110111)

        `DISPLAY("disable");
        Enable1_bar = 1;
        #40
        `Equals(Y, 8'b11111111)
        
        `DISPLAY("enable output");
        timer=$time;
        Enable1_bar = 0; // b->a
`ifndef verilator
        wait(Y === 8'b11110111);
`endif
        if ($time - timer != 19) begin
            $display("BAD SPEED - EXPECTED 19ns - TOOK %-d", ($time - timer));
            $finish();
        end
        else
            $display("TOOK %-d", ($time - timer));
        
        #50

        `DISPLAY("change address");
        timer=$time;
        A = 0; // b->a
`ifndef verilator
        wait(Y === 8'b11111110);
`endif
        if ($time - timer != 17)  begin
            $display("BAD SPEED - EXPECTED 17ns - TOOK %-d", ($time - timer));
            $finish();
        end
        else
            $display("TOOK %-d", ($time - timer));

      #50
        `DISPLAY("all enables x");
        Enable1_bar = 'x;
        Enable2_bar = 'x;
        Enable3 = 'x;
        #40
        `Equals(Y, 8'bxxxxxxxx)
        
        `DISPLAY("if E1=disable then this overrides X in other fields - should be disabled");
        Enable1_bar = 1;
        Enable2_bar = 'x;
        Enable3 = 'x;
        #40
        `Equals(Y, 8'b11111111)

        `DISPLAY("if E2=disable then this overrides X in other fields - should be disabled");
        Enable1_bar = 'x;
        Enable2_bar = 1;
        Enable3 = 'x;
        #40
        `Equals(Y, 8'b11111111)

      #50
        `DISPLAY("A as x");
        Enable1_bar = '0;
        Enable2_bar = '0;
        Enable3 = '1;
        A = 3'b10x;
        #40
        `Equals(Y, 8'bxxxxxxxx)
        
        `DISPLAY("done");
        $finish;
    end

endmodule : test

