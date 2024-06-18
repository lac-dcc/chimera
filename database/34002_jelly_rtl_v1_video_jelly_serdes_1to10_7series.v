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



//  1 to 10 serdes for xilinx 7series
module jelly_serdes_1to10_7series
        (
            input   wire            reset,
            input   wire            clk,
            input   wire            clk_x5,
            
            input   wire            bitslip,
            
            input   wire            in_data,
            
            output  wire    [9:0]   out_data
        );

`ifndef SIMULATION
    
    wire            shift1;
    wire            shift2;
    
    ISERDESE2
            #(
                .DATA_RATE          ("DDR"),
                .DATA_WIDTH         (10),
                .INTERFACE_TYPE     ("NETWORKING"), 
                .DYN_CLKDIV_INV_EN  ("FALSE"),
                .DYN_CLK_INV_EN     ("FALSE"),
                .NUM_CE             (2),
                .OFB_USED           ("FALSE"),
                .IOBDELAY           ("NONE"),
                .SERDES_MODE        ("MASTER")
            )
        i_iserdese2_master
            (
                .Q1                 (out_data[9]),
                .Q2                 (out_data[8]),
                .Q3                 (out_data[7]),
                .Q4                 (out_data[6]),
                .Q5                 (out_data[5]),
                .Q6                 (out_data[4]),
                .Q7                 (out_data[3]),
                .Q8                 (out_data[2]),
                .SHIFTOUT1          (shift1),
                .SHIFTOUT2          (shift2),
                .BITSLIP            (bitslip),
                
                .CE1                (1'b1),
                .CE2                (1'b1),
                .CLK                (clk_x5),
                .CLKB               (~clk_x5),
                .CLKDIV             (clk),
                .CLKDIVP            (1'b0),
                .D                  (in_data),
                .DDLY               (1'b0),
                .RST                (reset),
                .SHIFTIN1           (1'b0),
                .SHIFTIN2           (1'b0),
                
                .DYNCLKDIVSEL       (1'b0),
                .DYNCLKSEL          (1'b0),
                .OFB                (1'b0),
                .OCLK               (1'b0),
                .OCLKB              (1'b0),
                .O                  ()
            );
    
    ISERDESE2
            #(
                .DATA_RATE          ("DDR"),
                .DATA_WIDTH         (10),
                .INTERFACE_TYPE     ("NETWORKING"),
                .DYN_CLKDIV_INV_EN  ("FALSE"),
                .DYN_CLK_INV_EN     ("FALSE"),
                .NUM_CE             (2),
                .OFB_USED           ("FALSE"),
                .IOBDELAY           ("NONE"),
                .SERDES_MODE        ("SLAVE")
            )
        i_iserdese2_slave
            (
                .Q1                 (),
                .Q2                 (),
                .Q3                 (out_data[1]),
                .Q4                 (out_data[0]),
                .Q5                 (),
                .Q6                 (),
                .Q7                 (),
                .Q8                 (),
                .SHIFTOUT1          (),
                .SHIFTOUT2          (),
                .SHIFTIN1           (shift1),
                .SHIFTIN2           (shift2),
                .BITSLIP            (bitslip),
                
                .CE1                (1'b1),
                .CE2                (1'b1),
                .CLK                (clk_x5),
                .CLKB               (~clk_x5),
                .CLKDIV             (clk),
                .CLKDIVP            (1'b0),
                .D                  (1'b0),
                .DDLY               (1'b0),
                .RST                (reset),
                
                .DYNCLKDIVSEL       (1'b0),
                .DYNCLKSEL          (1'b0),
                .OFB                (1'b0),
                .OCLK               (1'b0),
                .OCLKB              (1'b0),
                .O                  ()
            );
    
`endif

endmodule


`default_nettype wire

// end of file
