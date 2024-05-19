// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
/* verilator lint_off ASSIGNDLY */
/* verilator lint_off STMTDLY */

`include "um245r.v"
`include "../lib/assertion.v"
`timescale 1ns/1ns

module test();

    localparam verbose = 0;

    // 33 exclamation mark
    tri [7:0] BUS;
    logic [7:0] Dtx;
    logic WR;
    logic _RD;
    wire _TXE;
    wire _RXF;
    reg [7:0] RECEIVED;

`include "timings.v"

    assign BUS=Dtx;

    reg [12*8:0] expected;
    integer countTx=0;
    integer countRx=0;
    integer MAX_RX=-1;

    reg[7:0] charA = "a";
    reg[7:0] charB = "b";
    reg[7:0] charC = "c";
    reg[7:0] charD = "d";

    initial begin
        $dumpfile("dumpfile.vcd");
        $dumpvars(0, test);

        $display("init value %8b", BUS);
        if (BUS !== 8'bxxxxxxxx) begin
            $error("wrong init value %8b", BUS);
            $finish();
        end

        Dtx=8'bzzzzzzzz;
        $display("[%9t] START", $time);

        WR=1; 
        _RD=1;

        #100
        $display("[%9t] ======= ENABLE READ", $time);
        `Equals(BUS, 8'bzzzzzzzz); 

        _RD=0;
        #11000
        $display("[%9t] ======= CHECK BUS FOR A", $time);
        `Equals(BUS, charA); 
        $display("BUS hex:%x   chr=%c    dec:%d    bin:%b", BUS, uart.printable(BUS), BUS, BUS);


        $display("[%9t] ======= DISABLE READ", $time);
        _RD=1;
        #100
        $display("[%9t] ======= ENABLE READ", $time);
        _RD=0;
        #100
        $display("[%9t] ======= CHECK BUS FOR B", $time);
        $display("BUS hex:%x   chr=%c    dec:%d    bin:%b", BUS, uart.printable(BUS), BUS, BUS);
        `Equals(BUS, charB); 
        $display("BUS=", BUS);


        $display("[%9t] ======= DISABLE READ", $time);
        _RD=1;
        #100
        $display("[%9t] ======= ENABLE READ", $time);
        _RD=0;
        #100
        $display("[%9t] ======= CHECK BUS FOR C", $time);
        $display("BUS hex:%x   chr=%c    dec:%d    bin:%b", BUS, uart.printable(BUS), BUS, BUS);
        `Equals(BUS, charC); 
        $display("BUS=", BUS);


        #50000
        $display("[%9t] ======= CHECK BUS FOR C AGAIN - NEW DATA OUGHT TO HAVE ARRIVED BY NOW", $time);
        $display("BUS hex:%x   chr=%c    dec:%d    bin:%b", BUS, uart.printable(BUS), BUS, BUS);
        `Equals(BUS, charC); 
        $display("BUS=", BUS);


        $display("[%9t] ======= DISABLE READ", $time);
        _RD=1;
        #100
        $display("[%9t] ======= ENABLE READ", $time);
        _RD=0;
        #100
        $display("[%9t] ======= CHECK BUS FOR D", $time);
        $display("BUS hex:%x   chr=%c    dec:%d    bin:%b", BUS, uart.printable(BUS), BUS, BUS);
        `Equals(BUS, charD); 
        $display("BUS=", BUS);


        #10000
        $display("DONE");

    end

    um245r #(.LOG(2), .CONTROL_FILE("test_read.control"))  uart (
        .D(BUS),	                // Input data
        .WR,		// Writes data on -ve edge
        ._RD,		// When goes from high to low then the FIFO data is placed onto D (equates to _OE)
        ._TXE,		// When high do NOT write data using WR, when low write data by strobing WR
        ._RXF		// When high to NOT read from D, when low then data is available to read by strobing RD low
      );


    always @(*)
        if (verbose)
        $display("[%9t] TEST: ", $time, 
            "BUS=%8b", BUS, 
            "RECEIVED=%8b", RECEIVED, 
            ", WR=%1b", WR, 
            ",_RD=%1b", _RD, 
            " _RXF=%1b", _RXF, 
            " _TXE=%1b", _TXE, 
            " Dtx=%8b", Dtx
            );

endmodule

