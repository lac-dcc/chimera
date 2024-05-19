// This program was cloned from: https://github.com/Nitcloud/Digital-IDE
// License: GNU General Public License v3.0

// After performing sequential synthesis, map the synchronous flops back to
// standard MISTRAL_FF flops.

module $__MISTRAL_FF_SYNCONLY (
    input DATAIN, CLK, ENA, SCLR, SLOAD, SDATA,
    output reg Q
);

MISTRAL_FF _TECHMAP_REPLACE_ (.DATAIN(DATAIN), .CLK(CLK), .ACLR(1'b1), .ENA(ENA), .SCLR(SCLR), .SLOAD(SLOAD), .SDATA(SDATA), .Q(Q));

endmodule
