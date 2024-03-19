
`timescale 1ns / 1ps
`default_nettype none


module tb_img_mass_center();
    localparam RATE    = 10.0;
    
    initial begin
        $dumpfile("tb_img_mass_center.vcd");
        $dumpvars(0, tb_img_mass_center);
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
    parameter   USER_WIDTH = 1;
    parameter   DATA_WIDTH = 8;
    
    parameter   X_NUM      = 320;
    parameter   Y_NUM      = 132;
    parameter   PGM_FILE   = "test.pgm";
    
    parameter   X_WIDTH    = 10;
    parameter   Y_WIDTH    = 9;
    
    
    wire                        axi4s_ptn_tlast;
    wire    [0:0]               axi4s_ptn_tuser;
    wire    [DATA_WIDTH-1:0]    axi4s_ptn_tdata;
    wire                        axi4s_ptn_tvalid;
    wire                        axi4s_ptn_tready;
    
    // master model
    jelly_axi4s_master_model
            #(
                .AXI4S_DATA_WIDTH   (DATA_WIDTH),
                .X_NUM              (X_NUM),
                .Y_NUM              (Y_NUM),
                .PGM_FILE           (PGM_FILE),
                .BUSY_RATE          (0),
                .RANDOM_SEED        (0)
            )
        i_axi4s_master_model
            (
                .aresetn            (~reset),
                .aclk               (clk),
                
                .m_axi4s_tdata      (axi4s_ptn_tdata),
                .m_axi4s_tlast      (axi4s_ptn_tlast),
                .m_axi4s_tuser      (axi4s_ptn_tuser),
                .m_axi4s_tvalid     (axi4s_ptn_tvalid),
                .m_axi4s_tready     (axi4s_ptn_tready)
            );
    
    jelly_axi4s_slave_model
            #(
                .COMPONENT_NUM      (1),
                .DATA_WIDTH         (8),
                .FILE_NAME          ("src_%04d.pgm"),
                .BUSY_RATE          (0)
            )
        i_axi4s_slave_model_src
            (
                .aresetn            (~reset),
                .aclk               (clk),
                .aclken             (1'b1),
                
                .param_width        (X_NUM),
                .param_height       (Y_NUM),
                
                .s_axi4s_tuser      (axi4s_ptn_tuser),
                .s_axi4s_tlast      (axi4s_ptn_tlast),
                .s_axi4s_tdata      (axi4s_ptn_tdata),
                .s_axi4s_tvalid     (axi4s_ptn_tvalid & axi4s_ptn_tready),
                .s_axi4s_tready     ()
            );
    
    
    // AXI4 to img
    wire                                axi4s_out_tlast;
    wire    [0:0]                       axi4s_out_tuser;
    wire    [DATA_WIDTH*3-1:0]          axi4s_out_tdata;
    wire                                axi4s_out_tvalid;
    wire                                axi4s_out_tready;
    
    
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
    wire    [DATA_WIDTH*3-1:0]          sink_img_data;
    wire                                sink_img_valid;
    
    jelly_axi4s_img
            #(
                .S_TDATA_WIDTH          (DATA_WIDTH),
                .M_TDATA_WIDTH          (DATA_WIDTH*3),
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
                
                .s_axi4s_tdata          (axi4s_ptn_tdata),
                .s_axi4s_tlast          (axi4s_ptn_tlast),
                .s_axi4s_tuser          (axi4s_ptn_tuser),
                .s_axi4s_tvalid         (axi4s_ptn_tvalid),     //(axi4s_ptn_tvalid & !ptn_busy),
                .s_axi4s_tready         (axi4s_ptn_tready),
                
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
                .sink_img_de            (sink_img_de),
                .sink_img_user          (sink_img_user),
                .sink_img_data          (sink_img_data),
                .sink_img_valid         (sink_img_valid)
            );
    
    assign axi4s_out_tready = 1'b1;
    
    
    parameter   Q_WIDTH = 0;
    jelly_img_mass_center
            #(
                .DATA_WIDTH             (8),
                .Q_WIDTH                (Q_WIDTH),
                .X_WIDTH                (X_WIDTH + Q_WIDTH),
                .Y_WIDTH                (Y_WIDTH + Q_WIDTH),
                .X_COUNT_WIDTH          (32),
                .Y_COUNT_WIDTH          (32),
                .N_COUNT_WIDTH          (32),
                .INIT_X                 ((X_NUM / 2) << Q_WIDTH),
                .INIT_Y                 ((Y_NUM / 2) << Q_WIDTH)
            )
        i_img_mass_center
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (img_cke),
                
                .s_img_line_first       (src_img_line_first),
                .s_img_line_last        (src_img_line_last),
                .s_img_pixel_first      (src_img_pixel_first),
                .s_img_pixel_last       (src_img_pixel_last),
                .s_img_de               (src_img_de),
                .s_img_data             (src_img_data),
                .s_img_valid            (src_img_valid),
                
                .out_x                  (),
                .out_y                  (),
                .out_valid              ()
            );
    
    assign sink_img_line_first  = src_img_line_first;
    assign sink_img_line_last   = src_img_line_last;
    assign sink_img_pixel_first = src_img_pixel_first;
    assign sink_img_pixel_last  = src_img_pixel_last;
    assign sink_img_de          = src_img_de;
    assign sink_img_data        = src_img_data;
    assign sink_img_valid       = src_img_valid;
    
    
    
endmodule


`default_nettype wire


// end of file
