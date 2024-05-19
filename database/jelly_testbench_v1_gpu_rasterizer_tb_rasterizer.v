// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_rasterizer();
    localparam RATE    = 10.0;
    localparam WB_RATE = 33.3;
    
    
    initial begin
        $dumpfile("tb_rasterizer.vcd");
        $dumpvars(0, tb_rasterizer);
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     wb_clk = 1'b1;
    always #(WB_RATE/2.0)   wb_clk = ~wb_clk;
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
    
    parameter   X_NUM               = 640;
    parameter   Y_NUM               = 480;
    
    parameter   X_WIDTH             = 12;
    parameter   Y_WIDTH             = 12;
    
    parameter   WB_ADR_WIDTH        = 14;
    parameter   WB_DAT_WIDTH        = 32;
    parameter   WB_SEL_WIDTH        = (WB_DAT_WIDTH / 8);
    
    parameter   BANK_NUM            = 2;
    parameter   PARAMS_ADDR_WIDTH   = 12;
    parameter   BANK_ADDR_WIDTH     = 10;
    
    parameter   EDGE_NUM            = 12*1;
    parameter   POLYGON_NUM         = 6*1;
    parameter   SHADER_PARAM_NUM    = 3;
    
    parameter   EDGE_PARAM_WIDTH    = 32;
    parameter   EDGE_RAM_TYPE       = "distributed";
    
    parameter   SHADER_PARAM_WIDTH  = 32;
    parameter   SHADER_PARAM_Q      = 24;
    parameter   SHADER_RAM_TYPE     = "distributed";
    
    parameter   REGION_PARAM_WIDTH  = EDGE_NUM;
    parameter   REGION_RAM_TYPE     = "distributed";
    
    parameter   CULLING_ONLY        = 0;
    parameter   Z_SORT_MIN          = 0;    // 1で小さい値優先(Z軸奥向き)
    
    parameter   INIT_CTL_ENABLE     = 1'b0;
    parameter   INIT_CTL_UPDATE     = 1'b0;
    parameter   INIT_PARAM_WIDTH    = X_NUM-1;
    parameter   INIT_PARAM_HEIGHT   = Y_NUM-1;
    parameter   INIT_PARAM_CULLING  = 2'b01;
    parameter   INIT_PARAM_BANK     = 0;
    
    
    parameter   PARAMS_EDGE_SIZE    = EDGE_NUM*3;
    parameter   PARAMS_SHADER_SIZE  = POLYGON_NUM*SHADER_PARAM_WIDTH*3;
    parameter   PARAMS_REGION_SIZE  = POLYGON_NUM*2;
    
    
    parameter   INDEX_WIDTH         = POLYGON_NUM <=     2 ?  1 :
                                      POLYGON_NUM <=     4 ?  2 :
                                      POLYGON_NUM <=     8 ?  3 :
                                      POLYGON_NUM <=    16 ?  4 :
                                      POLYGON_NUM <=    32 ?  5 :
                                      POLYGON_NUM <=    64 ?  6 :
                                      POLYGON_NUM <=   128 ?  7 :
                                      POLYGON_NUM <=   256 ?  8 :
                                      POLYGON_NUM <=   512 ?  9 :
                                      POLYGON_NUM <=  1024 ? 10 :
                                      POLYGON_NUM <=  2048 ? 11 :
                                      POLYGON_NUM <=  4096 ? 12 :
                                      POLYGON_NUM <=  8192 ? 13 :
                                      POLYGON_NUM <= 16384 ? 14 :
                                      POLYGON_NUM <= 32768 ? 15 : 16;
    
    
    
    reg                                             cke = 1'b1;
//  always @(posedge clk) begin
//      cke <= {$random()};
//  end
    
//  wire                                                start;
//  wire                                                busy = 1;
    
//  wire    [X_WIDTH-1:0]                               param_width;
//  wire    [Y_WIDTH-1:0]                               param_height;
//  wire    [PARAMS_EDGE_SIZE*EDGE_PARAM_WIDTH-1:0]     params_edge;
//  wire    [PARAMS_SHADER_SIZE*SHADER_PARAM_WIDTH-1:0] params_polygon;
//  wire    [PARAMS_REGION_SIZE*REGION_PARAM_WIDTH-1:0] params_region;
    
    wire                                                m_frame_start;
    wire                                                m_line_end;
    wire                                                m_polygon_enable;
    wire    [INDEX_WIDTH-1:0]                           m_polygon_index;
    wire    [SHADER_PARAM_NUM*SHADER_PARAM_WIDTH-1:0]   m_shader_params;
    wire                                                m_valid;
    
    wire                                                s_wb_rst_i = reset;
    wire                                                s_wb_clk_i = wb_clk;
    wire    [WB_ADR_WIDTH-1:0]                          s_wb_adr_i;
    wire    [WB_DAT_WIDTH-1:0]                          s_wb_dat_o;
    wire    [WB_DAT_WIDTH-1:0]                          s_wb_dat_i;
    wire                                                s_wb_we_i;
    wire    [WB_SEL_WIDTH-1:0]                          s_wb_sel_i;
    wire                                                s_wb_stb_i;
    wire                                                s_wb_ack_o;
    
    
    jelly_rasterizer
            #(
                .X_WIDTH            (X_WIDTH),
                .Y_WIDTH            (Y_WIDTH),
                
                .WB_ADR_WIDTH       (WB_ADR_WIDTH),
                .WB_DAT_WIDTH       (WB_DAT_WIDTH),
                .WB_SEL_WIDTH       (WB_SEL_WIDTH),
                
                .BANK_NUM           (BANK_NUM),
                .BANK_ADDR_WIDTH    (BANK_ADDR_WIDTH),
                .PARAMS_ADDR_WIDTH  (PARAMS_ADDR_WIDTH),
                
                .EDGE_NUM           (EDGE_NUM),
                .POLYGON_NUM        (POLYGON_NUM),
                .SHADER_PARAM_NUM   (SHADER_PARAM_NUM),
                
                .EDGE_PARAM_WIDTH   (EDGE_PARAM_WIDTH),
                .EDGE_RAM_TYPE      (EDGE_RAM_TYPE),
                
                .SHADER_PARAM_WIDTH (SHADER_PARAM_WIDTH),
                .SHADER_RAM_TYPE    (SHADER_RAM_TYPE),
                
                .REGION_PARAM_WIDTH (REGION_PARAM_WIDTH),
                .REGION_RAM_TYPE    (REGION_RAM_TYPE),
                
                .CULLING_ONLY       (CULLING_ONLY),
                .Z_SORT_MIN         (Z_SORT_MIN),
                
                .INIT_CTL_ENABLE    (INIT_CTL_ENABLE),
                .INIT_CTL_UPDATE    (INIT_CTL_UPDATE),
                .INIT_PARAM_WIDTH   (INIT_PARAM_WIDTH),
                .INIT_PARAM_HEIGHT  (INIT_PARAM_HEIGHT),
                .INIT_PARAM_CULLING (INIT_PARAM_CULLING),
                .INIT_PARAM_BANK    (INIT_PARAM_BANK)
            )
        i_rasterizer
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .m_frame_start      (m_frame_start),
                .m_line_end         (m_line_end),
                .m_polygon_enable   (m_polygon_enable),
                .m_polygon_index    (m_polygon_index),
                .m_shader_params    (m_shader_params),
                .m_valid            (m_valid),
                
                .s_wb_rst_i         (s_wb_rst_i),
                .s_wb_clk_i         (s_wb_clk_i),
                .s_wb_adr_i         (s_wb_adr_i),
                .s_wb_dat_o         (s_wb_dat_o),
                .s_wb_dat_i         (s_wb_dat_i),
                .s_wb_we_i          (s_wb_we_i),
                .s_wb_sel_i         (s_wb_sel_i),
                .s_wb_stb_i         (s_wb_stb_i),
                .s_wb_ack_o         (s_wb_ack_o)
            );
    
    integer     fp;
    initial begin
         fp = $fopen("out_img.ppm", "w");
         $fdisplay(fp, "P3");
         $fdisplay(fp, "%d %d", X_NUM, Y_NUM);
         $fdisplay(fp, "255");
    end
    
    wire    signed  [31:0]      m_shader_p0 = m_shader_params[32*0 +: 32];
    wire    signed  [31:0]      m_shader_p1 = m_shader_params[32*1 +: 32];
    wire    signed  [31:0]      m_shader_p2 = m_shader_params[32*2 +: 32];
//  wire    signed  [31:0]      m_shader_p3 = SHADER_PARAM_NUM > 0 ? m_shader_params[32*3 +: 32] : 0;
    real                        rel_p0, rel_p1, rel_p2;
    reg             [7:0]       int_u, int_v, int_t;
    reg             [7:0]       int_r, int_g, int_b;
    always @* begin
        rel_p0 = m_shader_p0;
        rel_p1 = m_shader_p1;
        rel_p2 = m_shader_p2;
        rel_p0 = rel_p0 / (1 << SHADER_PARAM_Q);
        rel_p1 = rel_p1 / (1 << SHADER_PARAM_Q);
        rel_p2 = rel_p2 / (1 << SHADER_PARAM_Q);
        
        if ( rel_p0 > 1.0 ) rel_p0 = 1.0;
        if ( rel_p0 < 0.0 ) rel_p0 = 0.0;
        if ( rel_p1 > 1.0 ) rel_p1 = 1.0;
        if ( rel_p1 < 0.0 ) rel_p1 = 0.0;
        if ( rel_p2 > 1.0 ) rel_p2 = 1.0;
        if ( rel_p2 < 0.0 ) rel_p2 = 0.0;
        
        int_r = rel_p0 * 255.0;
        int_g = rel_p1 * 255.0;
        int_b = rel_p2 * 255.0;
        
        if ( rel_p0 == 0 ) rel_p0 = 0.00000001;
        rel_p0 = 1.0 / rel_p0;
        rel_p1 = rel_p1 * rel_p0;
        rel_p2 = rel_p2 * rel_p0;
        
        int_t = rel_p0 * 255.0;
        int_u = rel_p1 * 255.0;
        int_v = rel_p2 * 255.0;
    end
    
    
    always @(posedge clk) begin
        if ( !reset && cke && m_valid ) begin
            if ( &m_polygon_enable ) begin
                 $fdisplay(fp, "%d %d %d", int_u, int_v, 255);
//               $fdisplay(fp, "%d %d %d", int_r, int_g, int_b);
//               $fdisplay(fp, "%d %d %d", 255, 255, 255);
            end
            else begin
                 $fdisplay(fp, "0 0 0");
            end
        end
    end
    
    
    
    
    /*
    ////////////
    wire    [0:0]           axi4s_gpu_tuser;
    wire                    axi4s_gpu_tlast;
    wire    [23:0]          axi4s_gpu_tdata;
    wire                    axi4s_gpu_tvalid;
    wire                    axi4s_gpu_tready = 1;
    
    jelly_gpu_gouraud
            #(
                .WB_ADR_WIDTH       (14),
                .WB_DAT_WIDTH       (32),
                
                .COMPONENT_NUM      (3),
                .DATA_WIDTH         (8),
                
                .AXI4S_TUSER_WIDTH  (1),
                .AXI4S_TDATA_WIDTH  (24),
                
                .X_WIDTH            (12),
                .Y_WIDTH            (12),
                
                .BANK_NUM           (2),
                .BANK_ADDR_WIDTH    (12),
                .PARAMS_ADDR_WIDTH  (10),
                
                .EDGE_NUM           (12*2),
                .POLYGON_NUM        (6*2),
                .SHADER_PARAM_NUM   (4),
                
                .EDGE_PARAM_WIDTH   (32),
                .EDGE_RAM_TYPE      ("distributed"),
                
                .SHADER_PARAM_WIDTH (32),
                .SHADER_PARAM_Q     (24),
                .SHADER_RAM_TYPE    ("distributed"),
                
                .REGION_RAM_TYPE    ("distributed"),
                
                .CULLING_ONLY       (0),
                .Z_SORT_MIN         (0),
                
                .INIT_CTL_ENABLE    (1'b0),
                .INIT_CTL_BANK      (0),
                .INIT_PARAM_WIDTH   (X_NUM-1),
                .INIT_PARAM_HEIGHT  (Y_NUM-1),
                .INIT_PARAM_CULLING (2'b01)
            )
        i_gpu_gouraud
            (
                .reset              (reset),
                .clk                (clk),
                
                .s_wb_rst_i         (s_wb_rst_i),
                .s_wb_clk_i         (s_wb_clk_i),
                .s_wb_adr_i         (s_wb_adr_i[0 +: 14]),
                .s_wb_dat_o         (),
                .s_wb_dat_i         (s_wb_dat_i),
                .s_wb_we_i          (s_wb_we_i),
                .s_wb_sel_i         (s_wb_sel_i),
                .s_wb_stb_i         (s_wb_stb_i),
                .s_wb_ack_o         (),
                
                .m_axi4s_tuser      (axi4s_gpu_tuser),
                .m_axi4s_tlast      (axi4s_gpu_tlast),
                .m_axi4s_tdata      (axi4s_gpu_tdata),
                .m_axi4s_tvalid     (axi4s_gpu_tvalid),
                .m_axi4s_tready     (axi4s_gpu_tready)
            );
    
    integer     fp_gpu;
    initial begin
         fp_gpu = $fopen("gpu_img.ppm", "w");
         $fdisplay(fp_gpu, "P3");
         $fdisplay(fp_gpu, "%d %d", X_NUM, Y_NUM);
         $fdisplay(fp_gpu, "255");
    end
    
    always @(posedge clk) begin
        if ( !reset && axi4s_gpu_tvalid && axi4s_gpu_tready ) begin
             $fdisplay(fp_gpu, "%d %d %d",
                axi4s_gpu_tdata[8*0 +: 8],
                axi4s_gpu_tdata[8*1 +: 8],
                axi4s_gpu_tdata[8*2 +: 8]);
        end
    end
    
    */
    
    
    
    
    
    
    
    
    // WISHBONE master
    wire                            wb_rst_i = s_wb_rst_i;
    wire                            wb_clk_i = s_wb_clk_i;
    reg     [WB_ADR_WIDTH-1:0]      wb_adr_o;
    wire    [WB_DAT_WIDTH-1:0]      wb_dat_i;
    reg     [WB_DAT_WIDTH-1:0]      wb_dat_o;
    reg                             wb_we_o;
    reg     [WB_SEL_WIDTH-1:0]      wb_sel_o;
    reg                             wb_stb_o = 0;
    wire                            wb_ack_i;
    
    assign s_wb_adr_i = wb_adr_o;
    assign s_wb_dat_i = wb_dat_o;
    assign s_wb_we_i  = wb_we_o;
    assign s_wb_sel_i = wb_sel_o;
    assign s_wb_stb_i = wb_stb_o;
    assign wb_dat_i   = s_wb_dat_o;
    assign wb_ack_i   = s_wb_ack_o;
    
    
    
    reg     [WB_DAT_WIDTH-1:0]      reg_wb_dat;
    reg                             reg_wb_ack;
    always @(posedge wb_clk_i) begin
        if ( ~wb_we_o & wb_stb_o & wb_stb_o ) begin
            reg_wb_dat <= wb_dat_i;
        end
        reg_wb_ack <= wb_ack_i;
    end
    
    task wb_write(
                input [WB_ADR_WIDTH+2-1:0]  adr,
                input [WB_DAT_WIDTH-1:0]    dat,
                input [WB_SEL_WIDTH-1:0]    sel
            );
    begin
        $display("WISHBONE_WRITE(adr:%h dat:%h sel:%b)", adr, dat, sel);
        @(negedge wb_clk_i);
            wb_adr_o = (adr >> 2);
            wb_dat_o = dat;
            wb_sel_o = sel;
            wb_we_o  = 1'b1;
            wb_stb_o = 1'b1;
        @(negedge wb_clk_i);
            while ( reg_wb_ack == 1'b0 ) begin
                @(negedge wb_clk_i);
            end
            wb_adr_o = {WB_ADR_WIDTH{1'bx}};
            wb_dat_o = {WB_DAT_WIDTH{1'bx}};
            wb_sel_o = {WB_SEL_WIDTH{1'bx}};
            wb_we_o  = 1'bx;
            wb_stb_o = 1'b0;
    end
    endtask
    
    
    task wb_read(
                input [WB_ADR_WIDTH+2-1:0]  adr
            );
    begin
        @(negedge wb_clk_i);
            wb_adr_o = (adr >> 2);
            wb_dat_o = {WB_DAT_WIDTH{1'bx}};
            wb_sel_o = {WB_SEL_WIDTH{1'b1}};
            wb_we_o  = 1'b0;
            wb_stb_o = 1'b1;
        @(negedge wb_clk_i);
            while ( reg_wb_ack == 1'b0 ) begin
                @(negedge wb_clk_i);
            end
            wb_adr_o = {WB_ADR_WIDTH{1'bx}};
            wb_dat_o = {WB_DAT_WIDTH{1'bx}};
            wb_sel_o = {WB_SEL_WIDTH{1'bx}};
            wb_we_o  = 1'bx;
            wb_stb_o = 1'b0;
            $display("WISHBONE_READ(adr:%h dat:%h)", adr, reg_wb_dat);
    end
    endtask
    
    
    initial begin
    @(negedge wb_rst_i);
    #100
wb_write(32'h40004000, 32'hffffea7d, 4'hf);
wb_write(32'h40004004, 32'h0035b2e4, 4'hf);
wb_write(32'h40004008, 32'h0006f21c, 4'hf);
wb_write(32'h4000400c, 32'h000003d7, 4'hf);
wb_write(32'h40004010, 32'hfff67ca8, 4'hf);
wb_write(32'h40004014, 32'hffe3a0ba, 4'hf);
wb_write(32'h40004018, 32'hffffebba, 4'hf);
wb_write(32'h4000401c, 32'h00329a74, 4'hf);
wb_write(32'h40004020, 32'h001f598b, 4'hf);
wb_write(32'h40004024, 32'h0000029a, 4'hf);
wb_write(32'h40004028, 32'hfff99518, 4'hf);
wb_write(32'h4000402c, 32'hfffcb5b8, 4'hf);
wb_write(32'h40004030, 32'h00000528, 4'hf);
wb_write(32'h40004034, 32'hfff335a8, 4'hf);
wb_write(32'h40004038, 32'hffd0aa68, 4'hf);
wb_write(32'h4000403c, 32'hffffe76d, 4'hf);
wb_write(32'h40004040, 32'h003d575a, 4'hf);
wb_write(32'h40004044, 32'h00154504, 4'hf);
wb_write(32'h40004048, 32'h00000391, 4'hf);
wb_write(32'h4000404c, 32'hfff72f0b, 4'hf);
wb_write(32'h40004050, 32'hfff0dc68, 4'hf);
wb_write(32'h40004054, 32'hffffe904, 4'hf);
wb_write(32'h40004058, 32'h00395df7, 4'hf);
wb_write(32'h4000405c, 32'h00340e36, 4'hf);
wb_write(32'h40004060, 32'hfffffa35, 4'hf);
wb_write(32'h40004064, 32'h000e80f3, 4'hf);
wb_write(32'h40004068, 32'h00096670, 4'hf);
wb_write(32'h4000406c, 32'hfffff93e, 4'hf);
wb_write(32'h40004070, 32'h0010e700, 4'hf);
wb_write(32'h40004074, 32'h00011f68, 4'hf);
wb_write(32'h40004078, 32'hfffff77f, 4'hf);
wb_write(32'h4000407c, 32'h00154476, 4'hf);
wb_write(32'h40004080, 32'h0000251b, 4'hf);
wb_write(32'h40004084, 32'hfffff62e, 4'hf);
wb_write(32'h40004088, 32'h00188b76, 4'hf);
wb_write(32'h4000408c, 32'hfff798a4, 4'hf);
wb_write(32'h40008000, 32'hffffff4a, 4'hf);
wb_write(32'h40008004, 32'h0001c5cc, 4'hf);
wb_write(32'h40008008, 32'h000bccf2, 4'hf);
wb_write(32'h4000800c, 32'h00000111, 4'hf);
wb_write(32'h40008010, 32'hfffd5e8e, 4'hf);
wb_write(32'h40008014, 32'hfffea795, 4'hf);
wb_write(32'h40008018, 32'h000008c0, 4'hf);
wb_write(32'h4000801c, 32'hffea2863, 4'hf);
wb_write(32'h40008020, 32'hfffd2c7f, 4'hf);
wb_write(32'h40008024, 32'hffffff1e, 4'hf);
wb_write(32'h40008028, 32'h00023382, 4'hf);
wb_write(32'h4000802c, 32'h000ea7c1, 4'hf);
wb_write(32'h40008030, 32'hfffff611, 4'hf);
wb_write(32'h40008034, 32'h0018cb1d, 4'hf);
wb_write(32'h40008038, 32'h00167ed7, 4'hf);
wb_write(32'h4000803c, 32'hfffffdcb, 4'hf);
wb_write(32'h40008040, 32'h00057984, 4'hf);
wb_write(32'h40008044, 32'h00144863, 4'hf);
wb_write(32'h40008048, 32'h00000000, 4'hf);
wb_write(32'h4000804c, 32'h000004d5, 4'hf);
wb_write(32'h40008050, 32'h000ae755, 4'hf);
wb_write(32'h40008054, 32'h00000780, 4'hf);
wb_write(32'h40008058, 32'hffed3dc8, 4'hf);
wb_write(32'h4000805c, 32'hfffebfc9, 4'hf);
wb_write(32'h40008060, 32'h000003a7, 4'hf);
wb_write(32'h40008064, 32'hfff6fd7f, 4'hf);
wb_write(32'h40008068, 32'hfffb653c, 4'hf);
wb_write(32'h4000806c, 32'h000002b8, 4'hf);
wb_write(32'h40008070, 32'hfff93646, 4'hf);
wb_write(32'h40008074, 32'h00067e7a, 4'hf);
wb_write(32'h40008078, 32'hfffffbec, 4'hf);
wb_write(32'h4000807c, 32'h000a35d7, 4'hf);
wb_write(32'h40008080, 32'h00069d47, 4'hf);
wb_write(32'h40008084, 32'h0000119f, 4'hf);
wb_write(32'h40008088, 32'hffd4045b, 4'hf);
wb_write(32'h4000808c, 32'hffe4c208, 4'hf);
wb_write(32'h40008090, 32'h00000000, 4'hf);
wb_write(32'h40008094, 32'h000002e6, 4'hf);
wb_write(32'h40008098, 32'h00068acc, 4'hf);
wb_write(32'h4000809c, 32'hfffff880, 4'hf);
wb_write(32'h400080a0, 32'h0012c1ba, 4'hf);
wb_write(32'h400080a4, 32'h000021f5, 4'hf);
wb_write(32'h400080a8, 32'h000003a7, 4'hf);
wb_write(32'h400080ac, 32'hfff6f392, 4'hf);
wb_write(32'h400080b0, 32'hffe50148, 4'hf);
wb_write(32'h400080b4, 32'h00000445, 4'hf);
wb_write(32'h400080b8, 32'hfff55712, 4'hf);
wb_write(32'h400080bc, 32'h000a3104, 4'hf);
wb_write(32'h400080c0, 32'h00000aad, 4'hf);
wb_write(32'h400080c4, 32'hffe5512c, 4'hf);
wb_write(32'h400080c8, 32'h00091f8a, 4'hf);
wb_write(32'h400080cc, 32'h00001993, 4'hf);
wb_write(32'h400080d0, 32'hffc02901, 4'hf);
wb_write(32'h400080d4, 32'hfff7bd46, 4'hf);
wb_write(32'h4000c000, 32'h0000000f, 4'hf);
wb_write(32'h4000c004, 32'h0000000c, 4'hf);
wb_write(32'h4000c008, 32'h000000f0, 4'hf);
wb_write(32'h4000c00c, 32'h00000030, 4'hf);
wb_write(32'h4000c010, 32'h00000348, 4'hf);
wb_write(32'h4000c014, 32'h00000240, 4'hf);
wb_write(32'h4000c018, 32'h00000584, 4'hf);
wb_write(32'h4000c01c, 32'h00000180, 4'hf);
wb_write(32'h4000c020, 32'h00000c12, 4'hf);
wb_write(32'h4000c024, 32'h00000402, 4'hf);
wb_write(32'h4000c028, 32'h00000a21, 4'hf);
wb_write(32'h4000c02c, 32'h00000801, 4'hf); 


        $display("start");
        wb_write(32'h0000_0004, 32'h0000_0001, 4'b1111);
        wb_write(32'h0000_0000, 32'h0000_0001, 4'b1111);
        
        $display("read");
        wb_read(32'h00*4);      // REG_ADDR_CTL_ENABLE             
        wb_read(32'h01*4);      // REG_ADDR_CTL_BANK 
        wb_read(32'h02*4);      // REG_ADDR_PARAM_WIDTH            
        wb_read(32'h03*4);      // REG_ADDR_PARAM_HEIGHT           
        wb_read(32'h04*4);      // REG_ADDR_PARAM_CULLING          
        wb_read(32'h11*4);      // REG_ADDR_PARAMS_BANK            
        
        wb_read(32'h20*4);      // REG_ADDR_CFG_SHADER_TYPE
        wb_read(32'h21*4);      // REG_ADDR_CFG_VERSION            
        wb_read(32'h22*4);      // REG_ADDR_CFG_BANK_ADDR_WIDTH    
        wb_read(32'h23*4);      // REG_ADDR_CFG_PARAMS_ADDR_WIDTH  
        wb_read(32'h24*4);      // REG_ADDR_CFG_BANK_NUM           
        wb_read(32'h25*4);      // REG_ADDR_CFG_EDGE_NUM           
        wb_read(32'h26*4);      // REG_ADDR_CFG_POLYGON_NUM        
        wb_read(32'h27*4);      // REG_ADDR_CFG_SHADER_PARAM_NUM   
        wb_read(32'h28*4);      // REG_ADDR_CFG_EDGE_PARAM_WIDTH   
        wb_read(32'h29*4);      // REG_ADDR_CFG_SHADER_PARAM_WIDTH 
        wb_read(32'h2a*4);      // REG_ADDR_CFG_REGION_PARAM_WIDTH 
    
    #10000000
        $finish();
    end
    
    
    
endmodule



`default_nettype wire


// end of file
