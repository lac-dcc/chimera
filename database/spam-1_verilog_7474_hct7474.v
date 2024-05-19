// This program was cloned from: https://github.com/Johnlon/spam-1
// License: Mozilla Public License 2.0

// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
// verilator lint_off UNOPTFLAT 
`ifndef  V_7474
`define  V_7474

// Dual D flip-flop with set and clear; positive-edge-triggered
// Timings from https://assets.nexperia.com/documents/data-sheet/74HC_HCT74.pdf

// Corrected based on - https://raw.githubusercontent.com/TimRudy/ice-chips-verilog/master/source-7400/7474.v
// 
// TimRudy version doesn't match datasheet
// - the clear/preset should be async (see note below)
// - clear/preset should be not be edge sensitive (see note below)
// - when clear/preset are both set then Q and Qb are both 1

// Tim Rudy's version has these compromises.
//      Note: Note: _SD is synchronous, not asynchronous as specified in datasheet for this device,
//      in order to meet requirements for FPGA circuit design (see IceChips Technical Notes)

`timescale 1ns/1ns
module hct7474 #(parameter BLOCKS = 2, DELAY_RISE = 18, DELAY_FALL = 18, LOG = 0, NAME = "7474FF")
(
  input [BLOCKS-1:0] _SD,
  input [BLOCKS-1:0] _RD,
  input [BLOCKS-1:0] D,
  input [BLOCKS-1:0] CP,
  output [BLOCKS-1:0] Q,
  output [BLOCKS-1:0] _Q
);

//------------------------------------------------//
reg [BLOCKS-1:0] Q_current;
reg [BLOCKS-1:0] Qb_current;
reg [BLOCKS-1:0] _SD_previous;
reg [BLOCKS-1:0] Q_defined = 0;

if (LOG) 
    always @* 
        $display("%9t ", $time, "%m  CP=%1b D=%1b _SD=%1b _RD=%1b  =>  Q=%1b _Q=%1b", CP,D,_SD, _RD, Q, _Q);

//if (LOG) always @* $display("%8d ", $time, "%s CP=%1b D=%1b _SD=%1b  _RD=%1b  Q=%1b  _Q=%1b (Qc=%1b, _Qc=%1b)", NAME, CP,D,_SD, _RD, Q, _Q, Q_current, Qb_current);

generate
  genvar i;
  for (i = 0; i < BLOCKS; i = i + 1)
  begin: gen_blocks
    always @(posedge CP[i])
    begin
      if (_RD[i] && _SD[i])
      begin
        if (LOG>1) $display("%9t", $time, " %s CLOCK IN DATA Q=%1b", NAME, D);
        Q_defined[i] = 1'b1;

        Q_current[i] = D[i];
        Qb_current[i] = !D[i];
      end
        else
        begin
        if (LOG>1) $display("%9t", $time, " %s CLOCK IN DISABLED BY CLEAR or PRESET", NAME);
        end
    end

    always @(_RD[i] or _SD[i])
    begin
      if (!_RD[i] && !_SD[i])
        begin
            if (LOG>1) $display("%9t", $time, " %s FORCE Q=_Q=1", NAME);
            Q_current[i] = 1'b1;
            Qb_current[i] = 1'b1;
        end
      else if (!_RD[i])
        begin
            if (LOG>1) $display("%9t", $time, " %s Q=0", NAME);
            Q_defined[i] = 1'b1;

            Q_current[i] = 1'b0;
            Qb_current[i] = 1'b1;
        end
      else if (!_SD[i])
        begin
            if (LOG>1) $display("%9t", $time, " %s Q=1", NAME);
            Q_defined[i] = 1'b1;

            Q_current[i] = 1'b1;
            Qb_current[i] = 1'b0;
        end
      else //
        begin
            if (!Q_defined[i]) begin
                if (LOG) $display("%9t", $time, " %s Q=X NOT CLEAR AND NOT PRESET", NAME);
                // no value has been defined - realistically a random value would be settled on, we'll use X
                Q_current[i] = 1'bx;
                Qb_current[i] = 1'bx;
            end
            else
                if (LOG>1) $display("%9t", $time, " %s Q=%1b - HOLD", NAME, Q_current);
        end
      end
  end
endgenerate
//------------------------------------------------//

assign #(DELAY_RISE, DELAY_FALL) Q = Q_current;
assign #(DELAY_RISE, DELAY_FALL) _Q = Qb_current;

endmodule


`endif
