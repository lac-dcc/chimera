// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_img_blk_buffer();
    localparam RATE    = 10.0;
    
    initial begin
        $dumpfile("tb_img_blk_buffer.vcd");
        $dumpvars(0, tb_img_blk_buffer);
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
    parameter   USER_WIDTH = 1;
    parameter   DATA_WIDTH = 8;
    
    parameter   X_NUM      = 16;
    parameter   Y_NUM      = 8;
    
    parameter   X_WIDTH    = 4;
    parameter   Y_WIDTH    = 3;
    
    parameter   PGM_FILE   = "";
    
    parameter   LINE_NUM   = 5;
    parameter   PIXEL_NUM  = 7;
    
    
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
                .M_TDATA_WIDTH          (DATA_WIDTH),
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
    
    
    // blok
    wire                                        img_blk_line_first;
    wire                                        img_blk_line_last;
    wire                                        img_blk_pixel_first;
    wire                                        img_blk_pixel_last;
    wire                                        img_blk_de;
    wire    [LINE_NUM*PIXEL_NUM*DATA_WIDTH-1:0] img_blk_data;
    wire                                        img_blk_user;
    wire                                        img_blk_valid;
    
    wire    [PIXEL_NUM*DATA_WIDTH-1:0]          img_blk_data0 = img_blk_data[0*PIXEL_NUM*DATA_WIDTH +: PIXEL_NUM*DATA_WIDTH];
    wire    [PIXEL_NUM*DATA_WIDTH-1:0]          img_blk_data1 = img_blk_data[1*PIXEL_NUM*DATA_WIDTH +: PIXEL_NUM*DATA_WIDTH];
    wire    [PIXEL_NUM*DATA_WIDTH-1:0]          img_blk_data2 = img_blk_data[2*PIXEL_NUM*DATA_WIDTH +: PIXEL_NUM*DATA_WIDTH];
    wire    [PIXEL_NUM*DATA_WIDTH-1:0]          img_blk_data3 = img_blk_data[3*PIXEL_NUM*DATA_WIDTH +: PIXEL_NUM*DATA_WIDTH];
    wire    [PIXEL_NUM*DATA_WIDTH-1:0]          img_blk_data4 = img_blk_data[4*PIXEL_NUM*DATA_WIDTH +: PIXEL_NUM*DATA_WIDTH];
    
    jelly_img_blk_buffer
            #(
                .DATA_WIDTH             (DATA_WIDTH),
                .LINE_NUM               (LINE_NUM),
                .PIXEL_NUM              (PIXEL_NUM),
                .MAX_X_NUM              (1024),
                .RAM_TYPE               ("block"),
//              .BORDER_MODE            ("CONSTANT")    // NONE, CONSTANT, REPLICATE, REFLECT, REFLECT_101
//              .BORDER_MODE            ("CONSTANT")
//              .BORDER_MODE            ("REPLICATE")
//              .BORDER_MODE            ("REFLECT")
                .BORDER_MODE            ("REFLECT_101")
            )
        i_img_blk_buffer
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (img_cke),
                
                .s_img_line_first       (src_img_line_first),
                .s_img_line_last        (src_img_line_last),
                .s_img_pixel_first      (src_img_pixel_first),
                .s_img_pixel_last       (src_img_pixel_last),
                .s_img_de               (src_img_de),
                .s_img_user             (src_img_user),
                .s_img_data             (src_img_data),
                .s_img_valid            (src_img_valid),
                
                .m_img_line_first       (img_blk_line_first),
                .m_img_line_last        (img_blk_line_last),
                .m_img_pixel_first      (img_blk_pixel_first),
                .m_img_pixel_last       (img_blk_pixel_last),
                .m_img_de               (img_blk_de),
                .m_img_user             (img_blk_user),
                .m_img_data             (img_blk_data),
                .m_img_valid            (img_blk_valid)
            );
    
    
    assign sink_img_line_first  = img_blk_line_first;
    assign sink_img_line_last   = img_blk_line_last;
    assign sink_img_pixel_first = img_blk_pixel_first;
    assign sink_img_pixel_last  = img_blk_pixel_last;
    assign sink_img_de          = img_blk_de;
    assign sink_img_data        = 0;//img_blk_data2[3*DATA_WIDTH +: DATA_WIDTH];
    assign sink_img_valid       = img_blk_valid;
    
    jelly_axi4s_slave_model
            #(
                .COMPONENT_NUM      (1),
                .DATA_WIDTH         (8),
                .FILE_NAME          ("img_%04d.pgm"),
                .BUSY_RATE          (0),
                .RANDOM_SEED        (23456)
            )
        i_axi4s_slave_model_data
            (
                .aresetn            (~reset),
                .aclk               (clk),
                .aclken             (1'b1),
                
                .param_width        (X_NUM),
                .param_height       (Y_NUM),
                
                .s_axi4s_tuser      (axi4s_out_tuser),
                .s_axi4s_tlast      (axi4s_out_tlast),
                .s_axi4s_tdata      (axi4s_out_tdata[7:0]),
                .s_axi4s_tvalid     (axi4s_out_tvalid),
                .s_axi4s_tready     (axi4s_out_tready)
            );
    
    jelly_axi4s_slave_model
            #(
                .COMPONENT_NUM      (1),
                .DATA_WIDTH         (8),
                .FILE_NAME          ("grad_x_%04d.pgm"),
                .BUSY_RATE          (0),
                .RANDOM_SEED        (0)
            )
        i_axi4s_slave_model_grad_x
            (
                .aresetn            (~reset),
                .aclk               (clk),
                .aclken             (1'b1),
                
                .param_width        (X_NUM),
                .param_height       (Y_NUM),
                
                .s_axi4s_tuser      (axi4s_out_tuser),
                .s_axi4s_tlast      (axi4s_out_tlast),
                .s_axi4s_tdata      (axi4s_out_tdata[15:8]),
                .s_axi4s_tvalid     (axi4s_out_tvalid & axi4s_out_tready),
                .s_axi4s_tready     ()
            );
    
    jelly_axi4s_slave_model
            #(
                .COMPONENT_NUM      (1),
                .DATA_WIDTH         (8),
                .FILE_NAME          ("grad_y_%04d.pgm"),
                .BUSY_RATE          (0),
                .RANDOM_SEED        (23456)
            )
        i_axi4s_slave_model_grad_y
            (
                .aresetn            (~reset),
                .aclk               (clk),
                .aclken             (1'b1),
                
                .param_width        (X_NUM),
                .param_height       (Y_NUM),
                
                .s_axi4s_tuser      (axi4s_out_tuser),
                .s_axi4s_tlast      (axi4s_out_tlast),
                .s_axi4s_tdata      (axi4s_out_tdata[23:16]),
                .s_axi4s_tvalid     (axi4s_out_tvalid & axi4s_out_tready),
                .s_axi4s_tready     ()
            );
    
    
    
    
    integer fp;
    initial fp = $fopen("out.txt", "w");
    
    integer frame = 0;
    
    always @(posedge clk) begin
        if ( !reset & axi4s_out_tvalid & axi4s_out_tready ) begin
            if ( axi4s_out_tuser ) begin
                frame = frame + 1;
                if ( frame > 3 ) begin
                    $fclose(fp);
                    $finish;
                end
            end
            
            $fdisplay(fp, "%h %b %b", axi4s_out_tdata, axi4s_out_tlast, axi4s_out_tuser);
        end
    end
    
    
    
    
    
/*
    reg     [7:0]       s_img_data;
    
    always @(posedge clk) begin
        if ( reset ) begin
            s_img_data <= 0;
        end
        else begin
            s_img_data <= s_img_data + 1;
        end
    end
    
    wire    s_img_line_first  = 0;
    wire    s_img_line_last   = 0;
    wire    s_img_pixel_first = (s_img_data == 0);
    wire    s_img_pixel_last  = (s_img_data == 255);
    wire    s_img_de          = 1;
    
    jelly_img_pixel_buffer
            #(
                .USER_WIDTH         (0),
                .DATA_WIDTH         (8),
                .PIXEL_NUM          (31),
                .PIXEL_CENTER       (15),
                .BORDER_MODE        ("NONE")    //  = "REPLICATE",          // NONE, CONSTANT, REPLICATE, REFLECT, REFLECT_101
            )
        i_img_pixel_buffer_none
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (1),
                
                .s_img_line_first   (s_img_line_first),
                .s_img_line_last    (s_img_line_last),
                .s_img_pixel_first  (s_img_pixel_first),
                .s_img_pixel_last   (s_img_pixel_last),
                .s_img_de           (s_img_de),
                .s_img_user         (),
                .s_img_data         (s_img_data),
                
                .m_img_line_first   (),
                .m_img_line_last    (),
                .m_img_pixel_first  (),
                .m_img_pixel_last   (),
                .m_img_de           (),
                .m_img_user         (),
                .m_img_data         ()
            );
    
    
    jelly_img_pixel_buffer
            #(
                .USER_WIDTH         (0),
                .DATA_WIDTH         (8),
                .PIXEL_NUM          (31),
                .PIXEL_CENTER       (15),
                .BORDER_MODE        ("REPLICATE")   //  = "REPLICATE",          // NONE, CONSTANT, REPLICATE, REFLECT, REFLECT_101
            )
        i_img_pixel_buffer_replicate
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (1),
                
                .s_img_line_first   (s_img_line_first),
                .s_img_line_last    (s_img_line_last),
                .s_img_pixel_first  (s_img_pixel_first),
                .s_img_pixel_last   (s_img_pixel_last),
                .s_img_de           (s_img_de),
                .s_img_user         (),
                .s_img_data         (s_img_data),
                
                .m_img_line_first   (),
                .m_img_line_last    (),
                .m_img_pixel_first  (),
                .m_img_pixel_last   (),
                .m_img_de           (),
                .m_img_user         (),
                .m_img_data         ()
            );
    
    jelly_img_pixel_buffer
            #(
                .USER_WIDTH         (0),
                .DATA_WIDTH         (8),
                .PIXEL_NUM          (31),
                .PIXEL_CENTER       (15),
                .BORDER_MODE        ("CONSTANT")    //  = "REPLICATE",          // NONE, CONSTANT, REPLICATE, REFLECT, REFLECT_101
            )
        i_img_pixel_buffer_constant
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (1),
                
                .s_img_line_first   (s_img_line_first),
                .s_img_line_last    (s_img_line_last),
                .s_img_pixel_first  (s_img_pixel_first),
                .s_img_pixel_last   (s_img_pixel_last),
                .s_img_de           (s_img_de),
                .s_img_user         (),
                .s_img_data         (s_img_data),
                
                .m_img_line_first   (),
                .m_img_line_last    (),
                .m_img_pixel_first  (),
                .m_img_pixel_last   (),
                .m_img_de           (),
                .m_img_user         (),
                .m_img_data         ()
            );
    
    jelly_img_pixel_buffer
            #(
                .USER_WIDTH         (0),
                .DATA_WIDTH         (8),
                .PIXEL_NUM          (31),
                .PIXEL_CENTER       (15),
                .BORDER_MODE        ("REFLECT") //  = "REPLICATE",          // NONE, CONSTANT, REPLICATE, REFLECT, REFLECT_101
            )
        i_img_pixel_buffer_reflect
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (1),
                
                .s_img_line_first   (s_img_line_first),
                .s_img_line_last    (s_img_line_last),
                .s_img_pixel_first  (s_img_pixel_first),
                .s_img_pixel_last   (s_img_pixel_last),
                .s_img_de           (s_img_de),
                .s_img_user         (),
                .s_img_data         (s_img_data),
                
                .m_img_line_first   (),
                .m_img_line_last    (),
                .m_img_pixel_first  (),
                .m_img_pixel_last   (),
                .m_img_de           (),
                .m_img_user         (),
                .m_img_data         ()
            );
        jelly_img_pixel_buffer
            #(
                .USER_WIDTH         (0),
                .DATA_WIDTH         (8),
                .PIXEL_NUM          (31),
                .PIXEL_CENTER       (15),
                .BORDER_MODE        ("REFLECT_101") //  = "REPLICATE",          // NONE, CONSTANT, REPLICATE, REFLECT, REFLECT_101
            )
        i_img_pixel_buffer_reflect101
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (1),
                
                .s_img_line_first   (s_img_line_first),
                .s_img_line_last    (s_img_line_last),
                .s_img_pixel_first  (s_img_pixel_first),
                .s_img_pixel_last   (s_img_pixel_last),
                .s_img_de           (s_img_de),
                .s_img_user         (),
                .s_img_data         (s_img_data),
                
                .m_img_line_first   (),
                .m_img_line_last    (),
                .m_img_pixel_first  (),
                .m_img_pixel_last   (),
                .m_img_de           (),
                .m_img_user         (),
                .m_img_data         ()
            );
*/  
    
endmodule


`default_nettype wire


// end of file
