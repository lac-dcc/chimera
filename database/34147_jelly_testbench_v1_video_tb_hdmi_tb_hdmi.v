// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_hdmi();
    localparam RATE = 1000.0/75.0;
//  localparam RATE = 1000.0/25.0;
    
    initial begin
        $dumpfile("tb_hdmi.vcd");
        $dumpvars(1, tb_hdmi);
        $dumpvars(0, tb_hdmi.i_hdmi_rx);
        $dumpvars(2, tb_hdmi.i_dvi_tx);
        
        #10000;
            $finish;
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)      clk = ~clk;
    
    reg     clk_x5 = 1'b1;
    always #(RATE/2.0/5)    clk_x5 = ~clk_x5;
    
    reg     reset = 1'b1;
    initial #(RATE*100) reset = 1'b0;
    


    reg     clk200 = 1'b1;
    always #(2.5)   clk200 = ~clk200;
    
    reg     reset_ref = 1'b1;
    initial #(100)      reset_ref = 1'b0;
    
    wire    rdy;
    IDELAYCTRL
        i_idelayctrl
            (
                .RST        (reset_ref),
                .REFCLK     (clk200),
                .RDY        (rdy)
            );
    
    
    
    
    // sync gen
    parameter   IMAGE_X_NUM = 640;
    parameter   IMAGE_Y_NUM = 480;
    
    
    wire                    vout_vsgen_vsync;
    wire                    vout_vsgen_hsync;
    wire                    vout_vsgen_de;
    
    jelly_vsync_generator
            #(
                .WB_ADR_WIDTH       (8),
                .WB_DAT_WIDTH       (32),
                .INIT_CTL_CONTROL   (1'b1),
                .INIT_HTOTAL        (96 + 16 + IMAGE_X_NUM + 48),
                .INIT_HDISP_START   (96 + 16),
                .INIT_HDISP_END     (96 + 16 + IMAGE_X_NUM),
                .INIT_HSYNC_START   (0),
                .INIT_HSYNC_END     (96),
                .INIT_HSYNC_POL     (0),
                .INIT_VTOTAL        (2 + 10 + IMAGE_Y_NUM + 33),
                .INIT_VDISP_START   (2 + 10),
                .INIT_VDISP_END     (2 + 10 + IMAGE_Y_NUM),
                .INIT_VSYNC_START   (0),
                .INIT_VSYNC_END     (2),
                .INIT_VSYNC_POL     (0)
            )
        i_vsync_generator
            (
                .reset              (reset),
                .clk                (clk),
                
                .out_vsync          (vout_vsgen_vsync),
                .out_hsync          (vout_vsgen_hsync),
                .out_de             (vout_vsgen_de),
                
                .s_wb_rst_i         (reset),
                .s_wb_clk_i         (clk),
                .s_wb_adr_i         (0),
                .s_wb_dat_o         (),
                .s_wb_dat_i         (0),
                .s_wb_we_i          (0),
                .s_wb_sel_i         (0),
                .s_wb_stb_i         (0),
                .s_wb_ack_o         ()
            );
    
    wire            vout_vsync;
    wire            vout_hsync;
    wire            vout_de;
    wire    [23:0]  vout_data;
    wire    [3:0]   vout_ctl;
    
    jelly_vout_axi4s
            #(
                .WIDTH              (24)
            )
        i_vout_axi4s
            (
                .reset              (reset),
                .clk                (clk),
                
                .s_axi4s_tuser      (0),
                .s_axi4s_tlast      (0),
                .s_axi4s_tdata      (0),
                .s_axi4s_tvalid     (0),
                .s_axi4s_tready     (),
                
                .in_vsync           (vout_vsgen_vsync),
                .in_hsync           (vout_vsgen_hsync),
                .in_de              (vout_vsgen_de),
                .in_ctl             (4'd0),
                
                .out_vsync          (vout_vsync),
                .out_hsync          (vout_hsync),
                .out_de             (vout_de),
                .out_data           (vout_data),
                .out_ctl            (vout_ctl)
            );
    
    
    // ----------------------------------------
    //  HDMI-TX
    // ----------------------------------------

    wire            hdmi_clk_p;
    wire            hdmi_clk_n;
    wire    [2:0]   hdmi_data_p;
    wire    [2:0]   hdmi_data_n;
    
    reg     [23:0]  reg_vout_data = 0;
    always @(posedge clk) begin
        if ( reset ) begin
            reg_vout_data <= 0;
        end
        else begin
            if ( vout_de ) begin
                reg_vout_data <= reg_vout_data + 1;
            end
        end
    end
    
    jelly_dvi_tx
        i_dvi_tx
            (
                .reset      (reset),
                .clk        (clk),
                .clk_x5     (clk_x5),
                
                .in_vsync   (vout_vsync),
                .in_hsync   (vout_hsync),
                .in_de      (vout_de),
                .in_data    (reg_vout_data),    //(vout_data),
                .in_ctl     (4'd0),
                
                .out_clk_p  (hdmi_clk_p),
                .out_clk_n  (hdmi_clk_n),
                .out_data_p (hdmi_data_p),
                .out_data_n (hdmi_data_n)
            );


    // ----------------------------------------
    //  HDMI-RX
    // ----------------------------------------
    
    jelly_hdmi_rx
            #(
                .IN_CLK_PERIOD  (RATE),
                .MMCM_MULT_F    (10)        // 40
            )
        i_hdmi_rx
            (
                .in_reset   (reset),
                .in_clk_p   (hdmi_clk_p),
                .in_clk_n   (hdmi_clk_n),
                .in_data_p  (hdmi_data_p),
                .in_data_n  (hdmi_data_n),
                
                .out_clk    (),
                .out_reset  (),
                .out_vsync  (),
                .out_hsync  (),
                .out_de     (),
                .out_data   (),
                .out_ctl    (),
                .out_valid  ()
            );
    
    
endmodule


`default_nettype wire


// end of file
