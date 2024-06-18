// This program was cloned from: https://github.com/yrrapt/caravel_amsat_txrx_ic
// License: Apache License 2.0

module mprj2_logic_high (
`ifdef USE_POWER_PINS
    inout	   vccd2,
    inout	   vssd2,
`endif
    output         HI
);
sky130_fd_sc_hd__conb_1 inst (
`ifdef USE_POWER_PINS
                .VPWR(vccd2),
                .VGND(vssd2),
                .VPB(vccd2),
                .VNB(vssd2),
`endif
                .HI(HI),
                .LO()
        );
endmodule
