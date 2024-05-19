// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_demosaic_acpi();
    localparam RATE    = 10.0;
    
    initial begin
        $dumpfile("tb_demosaic_acpi.vcd");
        $dumpvars(1, tb_demosaic_acpi);
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
    reg     wb_clk = 1'b1;
    always #(RATE/2.0)  wb_clk = ~wb_clk;
    
    reg     wb_rst = 1'b1;
    always #(RATE*20)   wb_rst = 1'b0;
    
    
//  parameter   DATA_WIDTH = 8;
    parameter   DATA_WIDTH = 10;
    parameter   USER_WIDTH  = 32;
    parameter   TUSER_WIDTH = 33;


//  parameter   X_NUM       = 640;
//  parameter   Y_NUM       = 396;
    parameter   X_NUM       = 1640;
    parameter   Y_NUM       = 1024;
    parameter   X_WIDTH     = 12;
    parameter   Y_WIDTH     = 12;
    parameter   USE_VALID   = 1;
    
    
    
    wire    [TUSER_WIDTH-1:0]           axi4s_in_tuser;
    wire                                axi4s_in_tlast;
    wire    [DATA_WIDTH-1:0]            axi4s_in_tdata;
    wire                                axi4s_in_tvalid;
    wire                                axi4s_in_tready;
    
    wire    [TUSER_WIDTH-1:0]           axi4s_out_tuser;
    wire                                axi4s_out_tlast;
    wire    [4*DATA_WIDTH-1:0]          axi4s_out_tdata;
    wire                                axi4s_out_tvalid;
    reg                                 axi4s_out_tready = 1'b1;
    
    always @(posedge clk) begin
        axi4s_out_tready <= {$random};
    end
    
    wire    [DATA_WIDTH-1:0]    axi4s_out_tdata0 = axi4s_out_tdata[0*DATA_WIDTH +: DATA_WIDTH];
    wire    [DATA_WIDTH-1:0]    axi4s_out_tdata1 = axi4s_out_tdata[1*DATA_WIDTH +: DATA_WIDTH];
    wire    [DATA_WIDTH-1:0]    axi4s_out_tdata2 = axi4s_out_tdata[2*DATA_WIDTH +: DATA_WIDTH];
    wire    [DATA_WIDTH-1:0]    axi4s_out_tdata3 = axi4s_out_tdata[3*DATA_WIDTH +: DATA_WIDTH];
    
    
    wire                                img_cke;
    
    wire                                src_img_line_first;
    wire                                src_img_line_last;
    wire                                src_img_pixel_first;
    wire                                src_img_pixel_last;
    wire                                src_img_de;
    wire    [USER_WIDTH-1:0]            src_img_user;
    wire    [DATA_WIDTH-1:0]            src_img_data;
    wire                                src_img_valid;
    
    wire                                sink_img_line_first;
    wire                                sink_img_line_last;
    wire                                sink_img_pixel_first;
    wire                                sink_img_pixel_last;
    wire                                sink_img_de;
    wire    [USER_WIDTH-1:0]            sink_img_user;
    wire    [4*DATA_WIDTH-1:0]          sink_img_data;
    wire                                sink_img_valid;
    
    
    
    // model
    jelly_axi4s_master_model
            #(
                .AXI4S_DATA_WIDTH       (8),
                .X_NUM                  (X_NUM),
                .Y_NUM                  (Y_NUM),
                .PGM_FILE               ("caputure_img.pgm"),
    //          .PGM_FILE               ("img_20180513.pgm"),
                .BUSY_RATE              (50),
                .RANDOM_SEED            (123)
            )
        i_axi4s_master_model
            (
                .aresetn                (~reset),
                .aclk                   (clk),
                
                .m_axi4s_tuser          (axi4s_in_tuser[0]),
                .m_axi4s_tlast          (axi4s_in_tlast),
//              .m_axi4s_tdata          (axi4s_in_tdata),
                .m_axi4s_tdata          (axi4s_in_tdata[9:2]),
                .m_axi4s_tvalid         (axi4s_in_tvalid),
                .m_axi4s_tready         (axi4s_in_tready)
            );
    assign axi4s_in_tdata[1:0] = 0;
    
    reg     [USER_WIDTH-1:0]            reg_in_user;
    assign axi4s_in_tuser[TUSER_WIDTH-1:1] = reg_in_user;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_in_user <= 0;
        end
        else begin
            if ( axi4s_in_tvalid & axi4s_in_tready ) begin
                reg_in_user <= reg_in_user + 1;
            end
        end
    end
    
    
    // img
    jelly_axi4s_img
            #(
                .TUSER_WIDTH            (TUSER_WIDTH),
                .S_TDATA_WIDTH          (DATA_WIDTH),
                .M_TDATA_WIDTH          (4*DATA_WIDTH),
                .IMG_Y_NUM              (Y_NUM),
                .IMG_Y_WIDTH            (Y_WIDTH),
                .BLANK_Y_WIDTH          (8),
                .IMG_CKE_BUFG           (0)
            )
        jelly_axi4s_img
            (
                .reset                  (reset),
                .clk                    (clk),
                
                .param_blank_num        (8'hff),
                
                .s_axi4s_tdata          (axi4s_in_tdata),
                .s_axi4s_tlast          (axi4s_in_tlast),
                .s_axi4s_tuser          (axi4s_in_tuser),
                .s_axi4s_tvalid         (axi4s_in_tvalid),
                .s_axi4s_tready         (axi4s_in_tready),
                
                .m_axi4s_tdata          (axi4s_out_tdata),
                .m_axi4s_tlast          (axi4s_out_tlast),
                .m_axi4s_tuser          (axi4s_out_tuser),
                .m_axi4s_tvalid         (axi4s_out_tvalid),
                .m_axi4s_tready         (axi4s_out_tready),
                
                
                .img_cke                (img_cke),
                
                .src_img_line_first     (src_img_line_first),
                .src_img_line_last      (src_img_line_last),
                .src_img_pixel_first    (src_img_pixel_first),
                .src_img_pixel_last     (src_img_pixel_last),
                .src_img_de             (src_img_de),
                .src_img_user           (src_img_user),
                .src_img_data           (src_img_data),
                .src_img_valid          (src_img_valid),
                
                .sink_img_line_first    (sink_img_line_first),
                .sink_img_line_last     (sink_img_line_last),
                .sink_img_pixel_first   (sink_img_pixel_first),
                .sink_img_pixel_last    (sink_img_pixel_last),
                .sink_img_user          (sink_img_user),
                .sink_img_de            (sink_img_de),
                .sink_img_data          (sink_img_data),
                .sink_img_valid         (sink_img_valid)
            );
    
    
    
    // demosaic
    wire                                demosaic_img_line_first;
    wire                                demosaic_img_line_last;
    wire                                demosaic_img_pixel_first;
    wire                                demosaic_img_pixel_last;
    wire                                demosaic_img_de;
    wire    [USER_WIDTH-1:0]            demosaic_img_user;
    wire    [DATA_WIDTH-1:0]            demosaic_img_raw;
    wire    [DATA_WIDTH-1:0]            demosaic_img_r;
    wire    [DATA_WIDTH-1:0]            demosaic_img_g;
    wire    [DATA_WIDTH-1:0]            demosaic_img_b;
    wire                                demosaic_img_valid;
    
    jelly_img_demosaic_acpi
            #(
                .USER_WIDTH             (USER_WIDTH),
                .DATA_WIDTH             (DATA_WIDTH),
                .MAX_X_NUM              (4096),
                .RAM_TYPE               ("block"),
                .USE_VALID              (USE_VALID),
                
                .INIT_PARAM_PHASE       (2'b11)
            )
        i_img_demosaic_acpi
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (img_cke),
                
                .s_wb_rst_i             (wb_rst),
                .s_wb_clk_i             (wb_clk),
                .s_wb_adr_i             (0),
                .s_wb_dat_i             (0),
                .s_wb_dat_o             (),
                .s_wb_we_i              (0),
                .s_wb_sel_i             (0),
                .s_wb_stb_i             (0),
                .s_wb_ack_o             (),
                
                .s_img_line_first       (src_img_line_first),
                .s_img_line_last        (src_img_line_last),
                .s_img_pixel_first      (src_img_pixel_first),
                .s_img_pixel_last       (src_img_pixel_last),
                .s_img_de               (src_img_de),
                .s_img_user             (src_img_user),
                .s_img_raw              (src_img_data),
                .s_img_valid            (src_img_valid),
                
                .m_img_line_first       (demosaic_img_line_first),
                .m_img_line_last        (demosaic_img_line_last),
                .m_img_pixel_first      (demosaic_img_pixel_first),
                .m_img_pixel_last       (demosaic_img_pixel_last),
                .m_img_de               (demosaic_img_de),
                .m_img_user             (demosaic_img_user),
                .m_img_raw              (demosaic_img_raw),
                .m_img_r                (demosaic_img_r),
                .m_img_g                (demosaic_img_g),
                .m_img_b                (demosaic_img_b),
                .m_img_valid            (demosaic_img_valid)
            );
    
    
    jelly_img_color_matrix
            #(
                .USER_WIDTH             (USER_WIDTH),
                .DATA_WIDTH             (DATA_WIDTH),
                .INTERNAL_WIDTH         (DATA_WIDTH+2),
                
                .COEFF_INT_WIDTH        (17),
                .COEFF_FRAC_WIDTH       (8),
                .COEFF3_INT_WIDTH       (17),
                .COEFF3_FRAC_WIDTH      (8),
                .STATIC_COEFF           (1),
                .DEVICE                 ("7SERIES"),
                
                .INIT_PARAM_MATRIX00    (25'h200),
                .INIT_PARAM_MATRIX11    (25'h100),
                .INIT_PARAM_MATRIX22    (25'h200)
                
                /*
                .INIT_PARAM_MATRIX00    ((1 << COEFF_FRAC_WIDTH),
                .INIT_PARAM_MATRIX01    (0,
                .INIT_PARAM_MATRIX02    (0,
                .INIT_PARAM_MATRIX03    (0,
                .INIT_PARAM_MATRIX10    (0,
                .INIT_PARAM_MATRIX11    ((1 << COEFF_FRAC_WIDTH),
                .INIT_PARAM_MATRIX12    (0,
                .INIT_PARAM_MATRIX13    (0,
                .INIT_PARAM_MATRIX20    (0,
                .INIT_PARAM_MATRIX21    (0,
                .INIT_PARAM_MATRIX22    ((1 << COEFF_FRAC_WIDTH),
                .INIT_PARAM_MATRIX23    (0,
                .INIT_PARAM_CLIP_MIN0   ({DATA_WIDTH{1'b0}},
                .INIT_PARAM_CLIP_MAX0   ({DATA_WIDTH{1'b1}},
                .INIT_PARAM_CLIP_MIN1   ({DATA_WIDTH{1'b0}},
                .INIT_PARAM_CLIP_MAX1   ({DATA_WIDTH{1'b1}},
                .INIT_PARAM_CLIP_MIN2   ({DATA_WIDTH{1'b0}},
                .INIT_PARAM_CLIP_MAX2   ({DATA_WIDTH{1'b1}},
                */
            )
        i_img_color_matrix
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (img_cke),
                
                .s_wb_rst_i             (wb_rst),
                .s_wb_clk_i             (wb_clk),
                .s_wb_adr_i             (0),
                .s_wb_dat_i             (0),
                .s_wb_dat_o             (),
                .s_wb_we_i              (0),
                .s_wb_sel_i             (0),
                .s_wb_stb_i             (0),
                .s_wb_ack_o             (),
                
                .s_img_line_first       (demosaic_img_line_first),
                .s_img_line_last        (demosaic_img_line_last),
                .s_img_pixel_first      (demosaic_img_pixel_first),
                .s_img_pixel_last       (demosaic_img_pixel_last),
                .s_img_de               (demosaic_img_de),
                .s_img_user             ({demosaic_img_user, demosaic_img_raw}),
                .s_img_color0           (demosaic_img_r),
                .s_img_color1           (demosaic_img_g),
                .s_img_color2           (demosaic_img_b),
                .s_img_valid            (demosaic_img_valid),
                
                .m_img_line_first       (sink_img_line_first),
                .m_img_line_last        (sink_img_line_last),
                .m_img_pixel_first      (sink_img_pixel_first),
                .m_img_pixel_last       (sink_img_pixel_last),
                .m_img_de               (sink_img_de),
                .m_img_user             ({sink_img_user, sink_img_data[DATA_WIDTH*3 +: DATA_WIDTH]}),
                .m_img_color0           (sink_img_data[DATA_WIDTH*2 +: DATA_WIDTH]),
                .m_img_color1           (sink_img_data[DATA_WIDTH*1 +: DATA_WIDTH]),
                .m_img_color2           (sink_img_data[DATA_WIDTH*0 +: DATA_WIDTH]),
                .m_img_valid            (sink_img_valid)
            );
    
    
    
    
    
    // G phase dump
    integer     fp_g;
    initial begin
         fp_g = $fopen("out_g.pgm", "w");
         $fdisplay(fp_g, "P2");
         $fdisplay(fp_g, "%1d %1d", X_NUM, Y_NUM*FRAME_NUM);
         $fdisplay(fp_g, "1023");
    end
    
    always @(posedge clk) begin
        if ( !reset && img_cke && i_img_demosaic_acpi.i_img_demosaic_acpi_core.img_g_de && i_img_demosaic_acpi.i_img_demosaic_acpi_core.img_g_valid ) begin
            $fdisplay(fp_g, "%1d", i_img_demosaic_acpi.i_img_demosaic_acpi_core.img_g_g);
        end
    end
    
    
    
    // image dump
    localparam  FRAME_NUM = 1;
    
    integer     fp_img;
    initial begin
         fp_img = $fopen("out_img.ppm", "w");
         $fdisplay(fp_img, "P3");
         $fdisplay(fp_img, "%1d %1d", X_NUM, Y_NUM*FRAME_NUM);
         $fdisplay(fp_img, "1023");
    end
    
    integer     count_out = 0;
    always @(posedge clk) begin
        if ( !reset && axi4s_out_tvalid && axi4s_out_tready ) begin
            $fdisplay(fp_img, "%1d %1d %1d",
                    axi4s_out_tdata[2*DATA_WIDTH +: DATA_WIDTH],
                    axi4s_out_tdata[1*DATA_WIDTH +: DATA_WIDTH],
                    axi4s_out_tdata[0*DATA_WIDTH +: DATA_WIDTH]);
            count_out <= count_out + 1;
        end
    end
    
    integer frame_count = 0;
    always @(posedge clk) begin
        if ( !reset && axi4s_out_tuser[0] && axi4s_out_tvalid && axi4s_out_tready ) begin
            $display("frame : %d", frame_count);
            frame_count = frame_count + 1;
            if ( frame_count > FRAME_NUM+1 ) begin
                $finish();
            end
        end
    end
    
    
    integer     count_g   = 0;
    integer     count_rb  = 0;
    always @(posedge clk) begin
        if ( img_cke ) begin
            if ( i_img_demosaic_acpi.i_img_demosaic_acpi_core.img_g_de ) begin
                count_g <= count_g + 1;
            end
            
            if ( i_img_demosaic_acpi.i_img_demosaic_acpi_core.m_img_de ) begin
                count_rb <= count_rb + 1;
            end
        end
    end
    
endmodule


`default_nettype wire


// end of file
