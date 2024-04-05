// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
/* verilator lint_off ASSIGNDLY */
/* verilator lint_off STMTDLY */

`include "portController.v"
`include "../lib/assertion.v"
`timescale 1ns/1ns

module test();

    initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars(0, test);

        $display("[%9t] TEST: START", $time);
    end

    logic  [7:0] data;
    logic  _portsel_in;
    logic  _port_wr;
    logic  _port_rd;
    wire  [15:0] _port_sel_wr;
    wire  [15:0] _port_sel_rd;

    portController ctrl(
        .data, 
        ._portsel_in, 
        ._port_wr, 
        ._port_rd,
        ._port_sel_wr, 
        ._port_sel_rd 
    );


    always @(*)
        $display("[%9t] TEST: ", $time, " WR=%16b", _port_sel_wr, " RD=%16b", _port_sel_rd );

    initial begin

        $display("Mux can be disabled");
        _portsel_in=1;
        _port_wr=1;
        _port_rd=1;

        #100
        `Equals(_port_sel_wr , 16'b1111111111111111)
        `Equals(_port_sel_rd , 16'b1111111111111111)

        $display("Clocked in value is not visible is mux is disabled");
        data=0;
        #100
        _portsel_in=0;
        #100
        _portsel_in=1;

        #100
        `Equals(_port_sel_wr , 16'b1111111111111111)
        `Equals(_port_sel_rd , 16'b1111111111111111)

        $display("Can select which mux to display latched value on");
        _portsel_in=0;
        _port_wr=0;
        _port_rd=1;

        #100
        `Equals(_port_sel_wr , 16'b1111111111111110)
        `Equals(_port_sel_rd , 16'b1111111111111111)

        #100
        _port_wr=1;
        _port_rd=0;

        #100
        `Equals(_port_sel_wr , 16'b1111111111111111)
        `Equals(_port_sel_rd , 16'b1111111111111110)

        #100
        _port_wr=0;
        _port_rd=0;

        #100
        `Equals(_port_sel_wr , 16'b1111111111111110)
        `Equals(_port_sel_rd , 16'b1111111111111110)

        $display("New address isn't exposed until clocked in");
        #100
        data=2;

        #100
        `Equals(_port_sel_wr , 16'b1111111111111110)
        `Equals(_port_sel_rd , 16'b1111111111111110)

        #100
        _portsel_in=0;
        #100
        _portsel_in=1;

        #100
        `Equals(_port_sel_wr , 16'b1111111111111011)
        `Equals(_port_sel_rd , 16'b1111111111111011)

    end

endmodule

