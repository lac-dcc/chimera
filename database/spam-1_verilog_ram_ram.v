// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
`ifndef RAM_V
`define RAM_V
// Consistent with AS6C1008, 6116 and 62256 RAM 
// Chip enable lines not included in the interface - AS6C1008 has +ve and -ve CE lines, wherea 62256 for example has only one CE line

`timescale 1ns/1ns

// verilator lint_off UNOPTFLAT
module ram(_OE, _WE, A, D);

    input _OE, _WE;
    input [AWIDTH-1:0] A;
    inout tri [DWIDTH-1:0] D;

    // sadly verilator barfs with the other values so just for linting set them lower
    // depth is # elements
    parameter DWIDTH=8,AWIDTH=16, DEPTH= 1 << AWIDTH;
    parameter LOG=0;
    parameter UNDEFINED_VALUE=4'bxzzx;

    parameter [DWIDTH-1:0] UNDEF = {(DWIDTH/$bits(UNDEFINED_VALUE)){UNDEFINED_VALUE}}; // repeat xzzx as many times as needed to fill up DWIDTH
    parameter [DWIDTH-1:0] HIZ = {DWIDTH{1'bz}};

    reg [DWIDTH-1:0] Mem [0:DEPTH-1];
    wire [DWIDTH-1:0] delayedMemRead;

    // I'm using AS6C1008-55PIN - https://www.alliancememory.com/wp-content/uploads/pdf/AS6C1008feb2007.pdf
    localparam tAA = 55; // names from AS6C1008
    localparam tOW = 5;
    localparam tWHZ = 20;  
    localparam tOHZ = 20;
    localparam tOLZ = 5;

    // (rise time, fall time)
    wire #(tOW, tWHZ) _delayedWE = _WE;
    wire #(tOHZ, tOLZ) _delayedOE = _OE;
    wire [AWIDTH-1:0] delayedA;
    assign #(tAA) delayedA = A;

    assign delayedMemRead = Mem[delayedA];

    //assign D=!_delayedWE? HIZ: _delayedOE ? HIZ: Mem[delayedA];
    assign D=!_delayedWE? HIZ: _delayedOE ? HIZ: delayedMemRead;

    //assign D=!_WE? HIZ: _OE? HIZ: Mem[A];

  if (LOG) begin
    always @(negedge _WE) begin
        //if (!_OE) $display("%9t ", $time, "RAM : END READ _OE=%1b _WE=%1b A=%04x D=%8b m0=%8b m1=%8b m2=%8b", _OE, _WE, A, D, Mem[0], Mem[1], Mem[2]);
        $display("%9t ", $time, "RAM : BEGIN WRITE _OE=%1b _WE=%1b A=%04x D=%8b m0=%8b m1=%8b m2=%8b", _OE, _WE, A, D, Mem[0], Mem[1], Mem[2]);
    end
    always @(posedge _WE) begin
        $display("%9t ", $time, "RAM : END WRITE   _OE=%1b _WE=%1b A=%04x D=%8b m0=%8b m1=%8b m2=%8b", _OE, _WE, A, D, Mem[0], Mem[1], Mem[2]);
        //if (!_OE) $display("%9t ", $time, "RAM : BEGIN READ _OE=%1b _WE=%1b A=%04x D=%8b m0=%8b m1=%8b m2=%8b", _OE, _WE, A, D, Mem[0], Mem[1], Mem[2]);
    end

    always @(negedge _OE) begin
        if (_WE) $display("%9t ", $time, "RAM : BEGIN READ _OE=%1b _WE=%1b A=%04x D=%8b m0=%8b m1=%8b m2=%8b", _OE, _WE, A, D, Mem[0], Mem[1], Mem[2]);
    end

    always @(posedge _OE) begin
        if (_WE) $display("%9t ", $time, "RAM : END READ   _OE=%1b _WE=%1b A=%04x D=%8b m0=%8b m1=%8b m2=%8b", _OE, _WE, A, D, Mem[0], Mem[1], Mem[2]);
    end
end

  if (LOG) begin
    always @(*) begin
        // NOTE: AS6C1008, 6116 and 62256 RAM datasheet says _WE overrides _OE but I want to detect this unexpected situation
        if (!_WE && !_OE) begin
           $display("%9t", $time, " ALERT - RAM _OE and _WE simultaneously - WRITE WINS - RAM[0x%04x]=%08b", A, D );
        end
    end
  end

  if (LOG)
    always @(Mem[A]) begin
        if (!_WE) $display("%9t ", $time, "RAM : UPDATED - RAM[0x%04x]=%08b(%1d)     Mem[A] is %02h", A, D, D , Mem[A]);
    end

  if (LOG) 
  always @(delayedA) begin
     //$display("%9t ", $time, "RAM : DETAIL _OE=%1b _delayedOE=%1b _WE=%1b _delayedWE=%1b A=%04x delayedA=%04h D=%8b m0=%8b m1=%8b m2=%8b", 
     //               _OE, _delayedOE, _WE, _delayedWE, A, delayedA, D, Mem[0], Mem[1], Mem[2]);
     $display("%9t ", $time, "RAM : DETAIL _OE=%1b _delayedOE=%1b _WE=%1b _delayedWE=%1b A=%04x delayedA=%04h D=%8b",
                    _OE, _delayedOE, _WE, _delayedWE, A, delayedA, D);
  end

  always @(_WE or _OE or D or A or delayedA)
  begin
     if (!_WE) begin
        Mem[A] = D;
        if (LOG) $display("%9t ", $time, "RAM : WRITE   - RAM[0x%04x]=%08b     Mem[A] is %02h", A, D , Mem[A]);
     end
     else if (!_OE) begin
        if (LOG) $display("%9t ", $time, "RAM : READ - D=%08b  A=%04h  delayed : %08d=RAM[0x%04x]", D, A, delayedMemRead, delayedA);

        //if (LOG && (Mem[delayedA] === UNDEF)) begin
        if (LOG && $isunknown(delayedMemRead)) begin
           $display("%9t", $time, " RAM ALERT - READING UNINITIALISED VALUE AT RAM[delayed 0x%04x]=%08b A=%04h", delayedA, delayedMemRead, A );
        end
     end
  end

  integer i;
  initial begin
`ifndef verilator
    for(i=0;i<DEPTH;i=i+1) begin
       Mem[i]=UNDEF;
    end
`endif
  end

endmodule

`endif
