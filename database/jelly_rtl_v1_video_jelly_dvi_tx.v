// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_dvi_tx
        (
            input   wire            reset,
            input   wire            clk,
            input   wire            clk_x5,
            
            // input
            input   wire            in_vsync,
            input   wire            in_hsync,
            input   wire            in_de,
            input   wire    [23:0]  in_data,
            input   wire    [3:0]   in_ctl,
            
            // output
            output  wire            out_clk_p,
            output  wire            out_clk_n,
            output  wire    [2:0]   out_data_p,
            output  wire    [2:0]   out_data_n
        );
    
    
    // -----------------------------
    //  encode
    // -----------------------------
    
    wire    [9:0]   enc_data0;
    wire    [9:0]   enc_data1;
    wire    [9:0]   enc_data2;
    
    jelly_dvi_tx_encode
        i_dvi_tx_encode_0
            (
                .reset      (reset),
                .clk        (clk),
                
                .in_de      (in_de),
                .in_d       (in_data[7:0]),
                .in_c0      (in_hsync),
                .in_c1      (in_vsync),
                
                .out_d      (enc_data0)
            );
    
    jelly_dvi_tx_encode
        i_dvi_tx_encode_1
            (
                .reset      (reset),
                .clk        (clk),
                
                .in_de      (in_de),
                .in_d       (in_data[15:8]),
                .in_c0      (in_ctl[0]),
                .in_c1      (in_ctl[1]),
                
                .out_d      (enc_data1)
            );
    
    jelly_dvi_tx_encode
        i_dvi_tx_encode_2
            (
                .reset      (reset),
                .clk        (clk),
                
                .in_de      (in_de),
                .in_d       (in_data[23:16]),
                .in_c0      (in_ctl[2]),
                .in_c1      (in_ctl[3]),
                
                .out_d      (enc_data2)
            );
    
    
    // -----------------------------
    //  serdes
    // -----------------------------
    
    wire    serdes_clk;
    wire    serdes_data0;
    wire    serdes_data1;
    wire    serdes_data2;

    jelly_serdes_10to1_7series
        i_serdes_10to1_clk
            (
                .reset      (reset),
                .clk        (clk),
                .clk_x5     (clk_x5),
                
                .in_data    (10'b00000_11111),
                
                .out_data   (serdes_clk)
            );
    
    jelly_serdes_10to1_7series
        i_serdes_10to1_0
            (
                .reset      (reset),
                .clk        (clk),
                .clk_x5     (clk_x5),
                
                .in_data    (enc_data0),
                
                .out_data   (serdes_data0)
            );
    
    jelly_serdes_10to1_7series
        i_serdes_10to1_1
            (
                .reset      (reset),
                .clk        (clk),
                .clk_x5     (clk_x5),
                
                .in_data    (enc_data1),
                
                .out_data   (serdes_data1)
            );

    jelly_serdes_10to1_7series
        i_serdes_10to1_2
            (
                .reset      (reset),
                .clk        (clk),
                .clk_x5     (clk_x5),
                
                .in_data    (enc_data2),
                
                .out_data   (serdes_data2)
            );
    
    
    // -----------------------------
    //  T.M.D.S output
    // -----------------------------
    
    OBUFDS
            #(
                .IOSTANDARD ("TMDS_33")
            )
        i_obufds_clk
            (
                .I          (serdes_clk),
                .O          (out_clk_p),
                .OB         (out_clk_n)
            );
    
    OBUFDS
            #(
                .IOSTANDARD ("TMDS_33")
            )
        i_obufds_0
            (
                .I          (serdes_data0),
                .O          (out_data_p[0]),
                .OB         (out_data_n[0])
            );
    
    OBUFDS
            #(
                .IOSTANDARD ("TMDS_33")
            )
        i_obufds_1
            (
                .I          (serdes_data1),
                .O          (out_data_p[1]),
                .OB         (out_data_n[1])
            );
    
    OBUFDS
            #(
                .IOSTANDARD ("TMDS_33")
            )
        i_obufds_2
            (
                .I          (serdes_data2),
                .O          (out_data_p[2]),
                .OB         (out_data_n[2])
            );
    
endmodule


`default_nettype wire


// end of file
