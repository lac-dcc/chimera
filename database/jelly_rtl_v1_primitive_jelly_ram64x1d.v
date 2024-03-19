// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2017 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// XILINX RAM64X1D
module jelly_ram64x1d
        #(
            parameter   INIT   = 64'h0000000000000000,
            parameter   DEVICE = "RTL" // "7SERIES"
        )
        (
            output  wire                dpo,
            output  wire                spo,
            input   wire    [5:0]       a,
            input   wire                d,
            input   wire    [5:0]       dpra,
            input   wire                wclk,
            input   wire                we
            
        );
    
    generate
    if ( DEVICE == "VIRTEX6" || DEVICE == "SPARTAN6" || DEVICE == "7SERIES" ) begin : blk_ram64x1d
        RAM64X1D
                #(
                    .INIT(INIT)
                )
            i_ram64x1d
                (
                    .DPO        (dpo),
                    .SPO        (spo),
                    .A0         (a[0]),
                    .A1         (a[1]),
                    .A2         (a[2]),
                    .A3         (a[3]),
                    .A4         (a[4]),
                    .A5         (a[5]),
                    .D          (d),
                    .DPRA0      (dpra[0]),
                    .DPRA1      (dpra[1]),
                    .DPRA2      (dpra[2]),
                    .DPRA3      (dpra[3]),
                    .DPRA4      (dpra[4]),
                    .DPRA5      (dpra[5]),
                    .WCLK       (wclk),
                    .WE         (we)
                );
    end
    else  begin : blk_rtl
        (* ram_style = "distributed" *)
        reg     [0:0]   mem     [0:63];
        
        always @(posedge wclk) begin
            if ( we ) begin
                mem[a] <= d;
            end
        end
        
        assign spo = mem[a];
        assign dpo = mem[dpra];
    end
    endgenerate
    
endmodule


`default_nettype wire


// end of file
