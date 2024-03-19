// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



//  1 to 5 serdes with DPA(dynamic phase alignment) for xilinx 7series
module jelly_serdes_1to5_dpa_7series
        #(
            parameter   HIGH_PERFORMANCE_MODE = "FALSE",
            parameter   PIN_SWAP              = 0,
            parameter   IDELAY_VALUE_MASTE    = 0,
            parameter   IDELAY_VALUE_SLAVE    = IDELAY_VALUE_MASTE+1,
            parameter   IDELAYCTRL_GROUP      = "IDELAYCTRL_GROUP",
            parameter   IOSTANDARD            = "LVDS25"
        )
        (
            input   wire            reset,
            input   wire            clk,
            input   wire            clk_x5,
            
            input   wire            idelay_master_ce,
            input   wire            idelay_master_inc,
            input   wire            idelay_slave_ce,
            input   wire            idelay_slave_inc,
            
            input   wire            bitslip,
            
            input   wire            in_d_p,
            input   wire            in_d_n,
            
            output  wire            out_d,
            output  wire    [4:0]   out_data_master,
            output  wire    [4:0]   out_data_slave
        );
    
    
    wire        in_data_p;
    wire        in_data_n;
    IBUFDS_DIFF_OUT
            #(
                .IOSTANDARD             (IOSTANDARD)
            )
        ibufds_diff_out
            (
                .I                      (in_d_p),
                .IB                     (in_d_n),
                .O                      (in_data_p),
                .OB                     (in_data_n)
            );
    
    wire    in_data_master = in_data_p ^ PIN_SWAP;
    wire    in_data_slave  = in_data_n ^ PIN_SWAP;
    
    wire    dly_data_master;
    
    (* IODELAY_GROUP=IDELAYCTRL_GROUP *)
    IDELAYE2
            #(
                .HIGH_PERFORMANCE_MODE  (HIGH_PERFORMANCE_MODE),
                .IDELAY_VALUE           (IDELAY_VALUE_MASTE),
                .DELAY_SRC              ("IDATAIN"),
                .IDELAY_TYPE            ("VARIABLE")
            )
        i_idelay_master
            (
                .DATAOUT                (dly_data_master),
                .C                      (clk),
                .CE                     (idelay_master_ce),
                .INC                    (idelay_master_inc),
                .DATAIN                 (1'b0),
                .IDATAIN                (in_data_master),
                .LD                     (reset),
                .LDPIPEEN               (1'b0),
                .REGRST                 (1'b0),
                .CINVCTRL               (1'b0),
                .CNTVALUEIN             (5'd0),
                .CNTVALUEOUT            ()
            );
    
    ISERDESE2
            #(
                .DATA_WIDTH             (5),
                .DATA_RATE              ("SDR"),
                .SERDES_MODE            ("MASTER"),
                .IOBDELAY               ("IFD"),
                .INTERFACE_TYPE         ("NETWORKING")
            )
        i_iserdes2_master
            (
                .D                      (1'b0),
                .DDLY                   (dly_data_master),
                .CE1                    (1'b1),
                .CE2                    (1'b1),
                .CLK                    (clk_x5),
                .CLKB                   (~clk_x5),
                .RST                    (reset),
                .CLKDIV                 (clk),
                .CLKDIVP                (1'b0),
                .OCLK                   (1'b0),
                .OCLKB                  (1'b0),
                .DYNCLKSEL              (1'b0),
                .DYNCLKDIVSEL           (1'b0),
                .SHIFTIN1               (1'b0),
                .SHIFTIN2               (1'b0),
                .BITSLIP                (bitslip),
                .O                      (out_d),
                .Q8                     (),
                .Q7                     (),
                .Q6                     (),
                .Q5                     (out_data_master[0]),
                .Q4                     (out_data_master[1]),
                .Q3                     (out_data_master[2]),
                .Q2                     (out_data_master[3]),
                .Q1                     (out_data_master[4]),
                .OFB                    (),
                .SHIFTOUT1              (),
                .SHIFTOUT2              ()
            );
    
    
    wire    dly_data_slave;
    (* IODELAY_GROUP=IDELAYCTRL_GROUP *)
    IDELAYE2
            #(
                .HIGH_PERFORMANCE_MODE  (HIGH_PERFORMANCE_MODE),
                .IDELAY_VALUE           (IDELAY_VALUE_SLAVE),
                .DELAY_SRC              ("IDATAIN"),
                .IDELAY_TYPE            ("VARIABLE")
            )
        idelay_s
            (
                .DATAOUT                (dly_data_slave),
                .C                      (clk),
                .CE                     (idelay_slave_ce),
                .INC                    (idelay_slave_inc),
                .DATAIN                 (1'b0),
                .IDATAIN                (in_data_slave),
                .LD                     (reset),
                .LDPIPEEN               (1'b0),
                .REGRST                 (1'b0),
                .CINVCTRL               (1'b0),
                .CNTVALUEIN             (5'd0),
                .CNTVALUEOUT            ()
            );
    
    wire    [4:0]   tmp_data_slave;
    ISERDESE2
            #(
                .DATA_WIDTH             (5),
                .DATA_RATE              ("SDR"),
                .SERDES_MODE            ("MASTER"),
                .IOBDELAY               ("IFD"),
                .INTERFACE_TYPE         ("NETWORKING")
            )
        i_iserdes2_slave
            (
                .D                      (1'b0),
                .DDLY                   (dly_data_slave),
                .CE1                    (1'b1),
                .CE2                    (1'b1),
                .CLK                    (clk_x5),
                .CLKB                   (~clk_x5),
                .RST                    (reset),
                .CLKDIV                 (clk),
                .CLKDIVP                (1'b0),
                .OCLK                   (1'b0),
                .OCLKB                  (1'b0),
                .DYNCLKSEL              (1'b0),
                .DYNCLKDIVSEL           (1'b0),
                .SHIFTIN1               (1'b0),
                .SHIFTIN2               (1'b0),
                .BITSLIP                (bitslip),
                .O                      (),
                .Q8                     (),
                .Q7                     (),
                .Q6                     (),
                .Q5                     (tmp_data_slave[0]),
                .Q4                     (tmp_data_slave[1]),
                .Q3                     (tmp_data_slave[2]),
                .Q2                     (tmp_data_slave[3]),
                .Q1                     (tmp_data_slave[4]),
                .OFB                    (),
                .SHIFTOUT1              (),
                .SHIFTOUT2              ()
            );
    assign out_data_slave = ~tmp_data_slave;
    
endmodule


`default_nettype wire

// end of file
