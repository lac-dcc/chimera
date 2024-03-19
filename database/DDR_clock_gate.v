// Credits : https://github.com/YosysHQ/yosys-bigsim/blob/master/openmsp430/rtl/omsp_clock_gate.v

module clock_gate (

// OUTPUTs
    gclk,                      // Gated clock

// INPUTs
    clk,                       // Clock
    enable_in                    // Clock enable
);

// OUTPUTs
//=========
output         gclk;           // Gated clock

// INPUTs
//=========
input          clk;            // Clock
input          enable_in;         // Clock enable


//=============================================================================
// CLOCK GATE: LATCH + AND
//=============================================================================

// LATCH the enable signal
reg     enable_latch;
always @(clk or enable_in)
  if (~clk)
    enable_latch <= enable_in;

// AND gate
assign  gclk = (clk & enable_latch);

endmodule