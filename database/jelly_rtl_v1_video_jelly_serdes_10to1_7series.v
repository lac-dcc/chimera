// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



//  10 to 1 serdes for xilinx 7series
module jelly_serdes_10to1_7series
        (
            input   wire            reset,
            input   wire            clk,
            input   wire            clk_x5,
            
            input   wire    [9:0]   in_data,
            
            output  wire            out_data
        );

`ifndef SIMULATION

    wire            shift1;
    wire            shift2;
    
    OSERDESE2
            #(
                .DATA_RATE_OQ   ("DDR"),
                .DATA_RATE_TQ   ("SDR"),
                .DATA_WIDTH     (10),
                .TRISTATE_WIDTH (1),
                .SERDES_MODE    ("MASTER")
            )
        i_oserdese2_master
            (
                .D1             (in_data[0]),
                .D2             (in_data[1]),
                .D3             (in_data[2]),
                .D4             (in_data[3]),
                .D5             (in_data[4]),
                .D6             (in_data[5]),
                .D7             (in_data[6]),
                .D8             (in_data[7]),
                .T1             (1'b0),
                .T2             (1'b0),
                .T3             (1'b0),
                .T4             (1'b0),
                .SHIFTIN1       (shift1),
                .SHIFTIN2       (shift2),
                .SHIFTOUT1      (),
                .SHIFTOUT2      (),
                .OCE            (1'b1),
                .CLK            (clk_x5),
                .CLKDIV         (clk),
                .OQ             (out_data),
                .TQ             (),
                .OFB            (),
                .TFB            (),
                .TBYTEIN        (1'b0),
                .TBYTEOUT       (),
                .TCE            (1'b0),
                .RST            (reset)
                );
    
    OSERDESE2
            #(
                .DATA_RATE_OQ   ("DDR"),
                .DATA_RATE_TQ   ("SDR"),
                .DATA_WIDTH     (10),
                .TRISTATE_WIDTH (1),
                .SERDES_MODE    ("SLAVE")
            )
       i_oserdese2_slave
            (
                .D1             (1'b0), 
                .D2             (1'b0),
                .D3             (in_data[8]),
                .D4             (in_data[9]),
                .D5             (1'b0),
                .D6             (1'b0),
                .D7             (1'b0),
                .D8             (1'b0),
                .T1             (1'b0),
                .T2             (1'b0),
                .T3             (1'b0),
                .T4             (1'b0),
                .SHIFTOUT1      (shift1),
                .SHIFTOUT2      (shift2),
                .SHIFTIN1       (1'b0),
                .SHIFTIN2       (1'b0),
                .OCE            (1'b1),
                .CLK            (clk_x5),
                .CLKDIV         (clk),
                .OQ             (),
                .TQ             (),
                .OFB            (),
                .TFB            (),
                .TBYTEIN        (1'b0),
                .TBYTEOUT       (),
                .TCE            (1'b0),
                .RST            (reset)
            );

`endif

endmodule


`default_nettype wire

// end of file
