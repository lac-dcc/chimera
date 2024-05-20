// This program was cloned from: https://github.com/siliconcompiler/lambdalib
// License: MIT License

/*****************************************************************************
 * Function: IO padring side
 * Copyright: Lambda Project Authors. All rights Reserved.
 * License:  MIT (see LICENSE file in Lambda repository)
 *
 * Doc:
 *
 * See repo ./README.md and ./la_iopadring.v
 *
 ****************************************************************************/

module la_ioside #(  // per side parameters
    parameter SIDE      = "NO",  // "NO", "SO", "EA", "WE"
    parameter NPINS     = 1,     // total pins per side (<256)
    parameter NCELLS    = 1,     // total cells per side (<256)
    parameter NSECTIONS = 1,     // total secti0ns per side (<256)
    parameter CELLMAP   = 0,     // {SECTION#, PIN#, CELLMAP}
    parameter RINGW     = 1,     // width of io ring
    parameter CFGW      = 1      // config width
) (  // io pad signals
    inout [NPINS-1:0]   pad, // pad
    //core facing signals
    inout [NPINS*3-1:0]  aio, // analog inout
    output [NPINS-1:0]   z, // output to core
    input [NPINS-1:0]   a, // input from core
    input [NPINS-1:0]   ie, // input enable, 1 = active
    input [NPINS-1:0]   oe, // output enable, 1 = active
    input [NPINS*CFGW-1:0]  cfg, // generic config interface
    // supplies/ring (per cell)
    inout    vss, // common ground
    inout [NSECTIONS-1:0]  vdd, // core supply
    inout [NSECTIONS-1:0]  vddio, // io supply
    inout [NSECTIONS-1:0]  vssio, // io ground
    inout [NSECTIONS*RINGW-1:0] ioring // generic io-ring
);

    //##########################################
    //# BIT FIELD DEFINITIONS
    //##########################################

    `include "la_iopadring.vh"

    //##########################################
    //# PER CELL SELECTION
    //##########################################

    genvar i, j;

    for (i = 0; i < NCELLS; i = i + 1) begin : ipadcell
        // BIDIR
        // initial
        // $display("cell=%d, pin=%d",i, CELLMAP[(i*24+8)+:8]);
        if (CELLMAP[i*24+:4] == LA_BIDIR[3:0]) begin : ila_iobidir
            la_iobidir #(
                .SIDE (SIDE),
                .TYPE (CELLMAP[(i*24+4)+:4]),
                .CFGW (CFGW),
                .RINGW(RINGW)
            ) i0 (  // pad
                .pad(pad[CELLMAP[(i*24+8)+:8]]),
                // core signalas
                .z(z[CELLMAP[(i*24+8)+:8]]),
                .a(a[CELLMAP[(i*24+8)+:8]]),
                .ie(ie[CELLMAP[(i*24+8)+:8]]),
                .oe(oe[CELLMAP[(i*24+8)+:8]]),
                .cfg(cfg[CELLMAP[(i*24+8)+:8]*CFGW+:CFGW]),
                // supplies
                .vss(vss),
                .vdd(vdd[CELLMAP[(i*24+16)+:8]]),
                .vddio(vddio[CELLMAP[(i*24+16)+:8]]),
                .vssio(vssio[CELLMAP[(i*24+16)+:8]]),
                // ring
                .ioring(ioring[CELLMAP[(i*24+16)+:8]*RINGW+:RINGW])
            );
        end  // INPUT
        else if (CELLMAP[i*24+:4] == LA_INPUT[3:0]) begin : ila_ioinput
            la_ioinput #(
                .SIDE (SIDE),
                .TYPE (CELLMAP[(i*24+4)+:4]),
                .CFGW (CFGW),
                .RINGW(RINGW)
            ) i0 (  // pad
                .pad(pad[CELLMAP[(i*24+8)+:8]]),
                // core signalas
                .z(z[CELLMAP[(i*24+8)+:8]]),
                .ie(ie[CELLMAP[(i*24+8)+:8]]),
                .cfg(cfg[CELLMAP[(i*24+8)+:8]*CFGW+:CFGW]),
                // supplies
                .vss(vss),
                .vdd(vdd[CELLMAP[(i*24+16)+:8]]),
                .vddio(vddio[CELLMAP[(i*24+16)+:8]]),
                .vssio(vssio[CELLMAP[(i*24+16)+:8]]),
                // ring
                .ioring(ioring[CELLMAP[(i*24+16)+:8]*RINGW+:RINGW])
            );
        end  // ANALOG
        else if (CELLMAP[i*24+:4] == LA_ANALOG[3:0]) begin : ila_ioanalog
            la_ioanalog #(
                .SIDE (SIDE),
                .TYPE (CELLMAP[(i*24+4)+:4]),
                .RINGW(RINGW)
            ) i0 (  // pad
                .pad(pad[CELLMAP[(i*24+8)+:8]]),
                // core signalas
                .aio(aio[CELLMAP[(i*24+8)+:8]*3+:3]),
                // supplies
                .vss(vss),
                .vdd(vdd[CELLMAP[(i*24+16)+:8]]),
                .vddio(vddio[CELLMAP[(i*24+16)+:8]]),
                .vssio(vssio[CELLMAP[(i*24+16)+:8]]),
                // ring
                .ioring(ioring[CELLMAP[(i*24+16)+:8]*RINGW+:RINGW])
            );
        end  // XTAL
        else if (CELLMAP[i*24+:4] == LA_XTAL[3:0]) begin : ila_ioxtal
            la_ioxtal #(
                .SIDE (SIDE),
                .TYPE (CELLMAP[(i*24+4)+:4]),
                .RINGW(RINGW)
            ) i0 (  // pad
                .padi(pad[CELLMAP[(i*24+8)+:8]]),
                .pado(pad[i+1]),  //TODO: fix!
                // core
                .z(z[CELLMAP[(i*24+8)+:8]]),
                .cfg(cfg[CELLMAP[(i*24+8)+:8]*CFGW+:CFGW]),
                // supplies
                .vss(vss),
                .vdd(vdd[CELLMAP[(i*24+16)+:8]]),
                .vddio(vddio[CELLMAP[(i*24+16)+:8]]),
                .vssio(vssio[CELLMAP[(i*24+16)+:8]]),
                // ring
                .ioring(ioring[CELLMAP[(i*24+16)+:8]*RINGW+:RINGW])
            );
        end  // POC
        else if (CELLMAP[i*24+:4] == LA_POC[3:0]) begin : ila_iopoc
            la_iopoc #(
                .SIDE (SIDE),
                .TYPE (CELLMAP[(i*24+4)+:4]),
                .RINGW(RINGW)
            ) i0 (  // supplies
                .vss(vss),
                .vdd(vdd[CELLMAP[(i*24+16)+:8]]),
                .vddio(vddio[CELLMAP[(i*24+16)+:8]]),
                .vssio(vssio[CELLMAP[(i*24+16)+:8]]),
                // ring
                .ioring(ioring[CELLMAP[(i*24+16)+:8]*RINGW+:RINGW])
            );
        end  // CUT
        else if (CELLMAP[i*24+:4] == LA_CUT[3:0]) begin : ila_iocut
            la_iocut #(
                .SIDE (SIDE),
                .TYPE (CELLMAP[(i*24+4)+:4]),
                .RINGW(RINGW)
            ) i0 (
                .vss(vss)
            );
        end else if (CELLMAP[i*24+:4] == LA_VDDIO[3:0]) begin : ila_iovddio
            la_iovddio #(
                .SIDE (SIDE),
                .TYPE (CELLMAP[((i*24+8)+4)+:4]),
                .RINGW(RINGW)
            ) i0 (  // supplies
                .vss(vss),
                .vdd(vdd[CELLMAP[(i*24+16)+:8]]),
                .vddio(vddio[CELLMAP[(i*24+16)+:8]]),
                .vssio(vssio[CELLMAP[(i*24+16)+:8]]),
                // ring
                .ioring(ioring[CELLMAP[(i*24+16)+:8]*RINGW+:RINGW])
            );
        end  // VSSIO
        else if (CELLMAP[i*24+:4] == LA_VSSIO[3:0]) begin : ila_iovssio
            la_iovssio #(
                .SIDE (SIDE),
                .TYPE (CELLMAP[(i*24+4)+:4]),
                .RINGW(RINGW)
            ) i0 (  // supplies
                .vss(vss),
                .vdd(vdd[CELLMAP[(i*24+16)+:8]]),
                .vddio(vddio[CELLMAP[(i*24+16)+:8]]),
                .vssio(vssio[CELLMAP[(i*24+16)+:8]]),
                // ring
                .ioring(ioring[CELLMAP[(i*24+16)+:8]*RINGW+:RINGW])
            );
        end  // VDD
        else if (CELLMAP[i*24+:4] == LA_VDD[3:0]) begin : ila_iovdd
            la_iovdd #(
                .SIDE (SIDE),
                .TYPE (CELLMAP[(i*24+4)+:4]),
                .RINGW(RINGW)
            ) i0 (  // supplies
                .vss(vss),
                .vdd(vdd[CELLMAP[(i*24+16)+:8]]),
                .vddio(vddio[CELLMAP[(i*24+16)+:8]]),
                .vssio(vssio[CELLMAP[(i*24+16)+:8]]),
                // ring
                .ioring(ioring[CELLMAP[(i*24+16)+:8]*RINGW+:RINGW])
            );
        end  // VSS
        else if (CELLMAP[i*24+:4] == LA_VSS[3:0]) begin : ila_iovss
            la_iovss #(
                .SIDE (SIDE),
                .TYPE (CELLMAP[(i*24+4)+:4]),
                .RINGW(RINGW)
            ) i0 (  // supplies
                .vss(vss),
                .vdd(vdd[CELLMAP[(i*24+16)+:8]]),
                .vddio(vddio[CELLMAP[(i*24+16)+:8]]),
                .vssio(vssio[CELLMAP[(i*24+16)+:8]]),
                // ring
                .ioring(ioring[CELLMAP[(i*24+16)+:8]*RINGW+:RINGW])
            );
        end  // VDDA
        else if (CELLMAP[i*24+:4] == LA_VDDA[3:0]) begin : ila_iovdda
            la_iovdda #(
                .SIDE (SIDE),
                .TYPE (CELLMAP[(i*24+4)+:4]),
                .RINGW(RINGW)
            ) i0 (  // supplies
                .vss(vss),
                .vdd(vdd[CELLMAP[(i*24+16)+:8]]),
                .vddio(vddio[CELLMAP[(i*24+16)+:8]]),
                .vssio(vssio[CELLMAP[(i*24+16)+:8]]),
                // ring
                .ioring(ioring[CELLMAP[(i*24+16)+:8]*RINGW+:RINGW])
            );
        end  // VSSA
        else if (CELLMAP[i*24+:4] == LA_VSSA[3:0]) begin : ila_iovssa
            la_iovssa #(
                .SIDE (SIDE),
                .TYPE (CELLMAP[(i*24+4)+:4]),
                .RINGW(RINGW)
            ) i0 (  // supplies
                .vss(vss),
                .vdd(vdd[CELLMAP[(i*24+16)+:8]]),
                .vddio(vddio[CELLMAP[(i*24+16)+:8]]),
                .vssio(vssio[CELLMAP[(i*24+16)+:8]]),
                // ring
                .ioring(ioring[CELLMAP[(i*24+16)+:8]*RINGW+:RINGW])
            );
        end  // block: ila_iovssa
    end

endmodule
// Local Variables:
// verilog-library-directories:("." "../stub")
// End:
