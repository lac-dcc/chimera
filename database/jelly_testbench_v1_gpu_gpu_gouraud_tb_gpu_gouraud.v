// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_gpu_gouraud();
    localparam RATE    = 10.0;
    localparam WB_RATE = 33.3;
    
    
    initial begin
        $dumpfile("tb_gpu_gouraud.vcd");
        $dumpvars(0, tb_gpu_gouraud);
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     wb_clk = 1'b1;
    always #(WB_RATE/2.0)   wb_clk = ~wb_clk;
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
//  parameter X_NUM = 96;
//  parameter Y_NUM = 64;
    parameter X_NUM = 128;
    parameter Y_NUM = 128;
    
    
    // core
    parameter   COMPONENT_NUM                 = 3;
    parameter   DATA_WIDTH                    = 8;
    
    parameter   USE_S_AX4S                    = 1;
    
    parameter   WB_ADR_WIDTH                  = 16;
    parameter   WB_DAT_WIDTH                  = 32;
    parameter   WB_SEL_WIDTH                  = (WB_DAT_WIDTH / 8);
    
    parameter   AXI4S_TUSER_WIDTH             = 1;
    parameter   AXI4S_TDATA_WIDTH             = COMPONENT_NUM*DATA_WIDTH;
    
    parameter   CORE_ADDR_WIDTH               = 14;
    parameter   PARAMS_ADDR_WIDTH             = 12;
    parameter   BANK_ADDR_WIDTH               = 10;
    
    parameter   BANK_NUM                      = 1;
    parameter   EDGE_NUM                      = 12;
    parameter   POLYGON_NUM                   = 6;
    parameter   SHADER_PARAM_NUM              = 1 + COMPONENT_NUM;  // Z + RGB
    
    parameter   EDGE_PARAM_WIDTH              = 32;
    parameter   EDGE_RAM_TYPE                 = "distributed";
    
    parameter   SHADER_PARAM_WIDTH            = 32;
    parameter   SHADER_PARAM_Q                = 24;
    parameter   SHADER_RAM_TYPE               = "distributed";
    
    parameter   REGION_PARAM_WIDTH            = EDGE_NUM;
    parameter   REGION_RAM_TYPE               = "distributed";
    
    parameter   CULLING_ONLY                  = 0;
    parameter   Z_SORT_MIN                    = 0;  // 1で小さい値優先(Z軸奥向き)
    
    parameter   X_WIDTH                       = 12;
    parameter   Y_WIDTH                       = 12;
    
    parameter   RASTERIZER_INIT_CTL_ENABLE    = 1'b0;
    parameter   RASTERIZER_INIT_CTL_UPDATE    = 1'b0;
    parameter   RASTERIZER_INIT_PARAM_WIDTH   = X_NUM-1;
    parameter   RASTERIZER_INIT_PARAM_HEIGHT  = Y_NUM-1;
    parameter   RASTERIZER_INIT_PARAM_CULLING = 2'b01;
    parameter   RASTERIZER_INIT_PARAM_BANK    = 0;
    
    parameter   SHADER_INIT_PARAM_BG_MODE     = 0;
    parameter   SHADER_INIT_PARAM_BG_COLOR    = 24'hff_00_00;
    
    
    
    wire                                    s_wb_rst_i = reset;
    wire                                    s_wb_clk_i = wb_clk;
    wire    [WB_ADR_WIDTH-1:0]              s_wb_adr_i;
    wire    [WB_DAT_WIDTH-1:0]              s_wb_dat_o;
    wire    [WB_DAT_WIDTH-1:0]              s_wb_dat_i;
    wire                                    s_wb_we_i;
    wire    [WB_SEL_WIDTH-1:0]              s_wb_sel_i;
    wire                                    s_wb_stb_i;
    wire                                    s_wb_ack_o;
    
    wire    [AXI4S_TUSER_WIDTH-1:0]         s_axi4s_tuser;
    wire                                    s_axi4s_tlast;
    wire    [AXI4S_TDATA_WIDTH-1:0]         s_axi4s_tdata;
    wire                                    s_axi4s_tvalid;
    wire                                    s_axi4s_tready;
    
    wire    [AXI4S_TUSER_WIDTH-1:0]         m_axi4s_tuser;
    wire                                    m_axi4s_tlast;
    wire    [AXI4S_TDATA_WIDTH-1:0]         m_axi4s_tdata;
    wire                                    m_axi4s_tstrb;
    wire                                    m_axi4s_tvalid;
    wire                                    m_axi4s_tready;
    
    
    // model
    jelly_axi4s_master_model
            #(
                .AXI4S_DATA_WIDTH               (AXI4S_TDATA_WIDTH),
                .X_NUM                          (X_NUM),
                .Y_NUM                          (Y_NUM),
                .PPM_FILE                       ("lena_128x128.ppm"),
                .BUSY_RATE                      (0),
                .RANDOM_SEED                    (7),
                .INTERVAL                       (0)
            )
        i_axi4s_master_model
            (
                .aresetn                        (~reset),
                .aclk                           (clk),
                
                .m_axi4s_tuser                  (s_axi4s_tuser),
                .m_axi4s_tlast                  (s_axi4s_tlast),
                .m_axi4s_tdata                  (s_axi4s_tdata),
                .m_axi4s_tvalid                 (s_axi4s_tvalid),
                .m_axi4s_tready                 (s_axi4s_tready)
            );
    
    
    // GPU
    jelly_gpu_gouraud
            #(
                .COMPONENT_NUM                  (COMPONENT_NUM),
                .DATA_WIDTH                     (DATA_WIDTH),
                .WB_ADR_WIDTH                   (WB_ADR_WIDTH),
                .WB_DAT_WIDTH                   (WB_DAT_WIDTH),
                .WB_SEL_WIDTH                   (WB_SEL_WIDTH),
                .USE_S_AX4S                     (USE_S_AX4S),
                .AXI4S_TUSER_WIDTH              (AXI4S_TUSER_WIDTH),
                .AXI4S_TDATA_WIDTH              (AXI4S_TDATA_WIDTH),
                .CORE_ADDR_WIDTH                (CORE_ADDR_WIDTH),
                .PARAMS_ADDR_WIDTH              (PARAMS_ADDR_WIDTH),
                .BANK_ADDR_WIDTH                (BANK_ADDR_WIDTH),
                .BANK_NUM                       (BANK_NUM),
                .EDGE_NUM                       (EDGE_NUM),
                .POLYGON_NUM                    (POLYGON_NUM),
                .SHADER_PARAM_NUM               (SHADER_PARAM_NUM),
                .EDGE_PARAM_WIDTH               (EDGE_PARAM_WIDTH),
                .EDGE_RAM_TYPE                  (EDGE_RAM_TYPE),
                .SHADER_PARAM_WIDTH             (SHADER_PARAM_WIDTH),
                .SHADER_PARAM_Q                 (SHADER_PARAM_Q),
                .SHADER_RAM_TYPE                (SHADER_RAM_TYPE),
                .REGION_PARAM_WIDTH             (REGION_PARAM_WIDTH),
                .REGION_RAM_TYPE                (REGION_RAM_TYPE),
                .CULLING_ONLY                   (CULLING_ONLY),
                .Z_SORT_MIN                     (Z_SORT_MIN),
                .X_WIDTH                        (X_WIDTH),
                .Y_WIDTH                        (Y_WIDTH),
                .RASTERIZER_INIT_CTL_ENABLE     (RASTERIZER_INIT_CTL_ENABLE),
                .RASTERIZER_INIT_CTL_UPDATE     (RASTERIZER_INIT_CTL_UPDATE),
                .RASTERIZER_INIT_PARAM_WIDTH    (RASTERIZER_INIT_PARAM_WIDTH),
                .RASTERIZER_INIT_PARAM_HEIGHT   (RASTERIZER_INIT_PARAM_HEIGHT),
                .RASTERIZER_INIT_PARAM_CULLING  (RASTERIZER_INIT_PARAM_CULLING),
                .RASTERIZER_INIT_PARAM_BANK     (RASTERIZER_INIT_PARAM_BANK),
                .SHADER_INIT_PARAM_BG_MODE      (SHADER_INIT_PARAM_BG_MODE),
                .SHADER_INIT_PARAM_BG_COLOR     (SHADER_INIT_PARAM_BG_COLOR)
            )
        i_gpu_gouraud
            (
                .reset                          (reset),
                .clk                            (clk),
                
                .s_wb_rst_i                     (s_wb_rst_i),
                .s_wb_clk_i                     (s_wb_clk_i),
                .s_wb_adr_i                     (s_wb_adr_i),
                .s_wb_dat_o                     (s_wb_dat_o),
                .s_wb_dat_i                     (s_wb_dat_i),
                .s_wb_we_i                      (s_wb_we_i),
                .s_wb_sel_i                     (s_wb_sel_i),
                .s_wb_stb_i                     (s_wb_stb_i),
                .s_wb_ack_o                     (s_wb_ack_o),
                
                .s_axi4s_tuser                  (s_axi4s_tuser),
                .s_axi4s_tlast                  (s_axi4s_tlast),
                .s_axi4s_tdata                  (s_axi4s_tdata),
                .s_axi4s_tvalid                 (s_axi4s_tvalid),
                .s_axi4s_tready                 (s_axi4s_tready),
                
                .m_axi4s_tuser                  (m_axi4s_tuser),
                .m_axi4s_tlast                  (m_axi4s_tlast),
                .m_axi4s_tdata                  (m_axi4s_tdata),
    //          .m_axi4s_tstrb                  (m_axi4s_tstrb),
                .m_axi4s_tvalid                 (m_axi4s_tvalid),
                .m_axi4s_tready                 (m_axi4s_tready)
            );
    
    
    // image output
    integer     fp;
    initial begin
         fp = $fopen("out_img.ppm", "w");
         $fdisplay(fp, "P3");
         $fdisplay(fp, "%d %d", X_NUM, Y_NUM);
         $fdisplay(fp, "255");
    end
    
    always @(posedge clk) begin
        if ( !reset && m_axi4s_tvalid && m_axi4s_tready ) begin
             $fdisplay(fp, "%d %d %d", m_axi4s_tdata[7:0], m_axi4s_tdata[15:8], m_axi4s_tdata[23:16]);
        end
    end
    
    
    jelly_axi4s_slave_model
            #(
                .COMPONENT_NUM      (3),
                .DATA_WIDTH         (8),
                .INIT_FRAME_NUM     (0),
                .FILE_NAME          ("out_img/out_%0d.ppm"),
                .BUSY_RATE          (0),
                .RANDOM_SEED        (1234)
            )
        i_axi4s_slave_model
            (
                .aresetn            (~reset),
                .aclk               (clk),
                .aclken             (1'b1),
                
                .param_width        (X_NUM),
                .param_height       (Y_NUM),
                
                .s_axi4s_tuser      (m_axi4s_tuser),
                .s_axi4s_tlast      (m_axi4s_tlast),
                .s_axi4s_tdata      (m_axi4s_tdata),
                .s_axi4s_tvalid     (m_axi4s_tvalid),
                .s_axi4s_tready     (m_axi4s_tready)
            );
    
    
    
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
                input [WB_ADR_WIDTH-1:0]    adr,
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
                input [WB_ADR_WIDTH-1:0]    adr
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

//128x128
wb_write(32'h40104000, 32'hfffffd8f, 4'hf);
wb_write(32'h40104004, 32'h00013629, 4'hf);
wb_write(32'h40104008, 32'h00005645, 4'hf);
wb_write(32'h4010400c, 32'h00000070, 4'hf);
wb_write(32'h40104010, 32'hffffca84, 4'hf);
wb_write(32'h40104014, 32'hffff4ac4, 4'hf);
wb_write(32'h40104018, 32'hfffffdb4, 4'hf);
wb_write(32'h4010401c, 32'h000123ac, 4'hf);
wb_write(32'h40104020, 32'h0000a8cb, 4'hf);
wb_write(32'h40104024, 32'h0000004b, 4'hf);
wb_write(32'h40104028, 32'hffffdd01, 4'hf);
wb_write(32'h4010402c, 32'hffff9cb9, 4'hf);
wb_write(32'h40104030, 32'h00000096, 4'hf);
wb_write(32'h40104034, 32'hffffb7e9, 4'hf);
wb_write(32'h40104038, 32'hfffefee9, 4'hf);
wb_write(32'h4010403c, 32'hfffffd37, 4'hf);
wb_write(32'h40104040, 32'h000161c3, 4'hf);
wb_write(32'h40104044, 32'h00009121, 4'hf);
wb_write(32'h40104048, 32'h00000068, 4'hf);
wb_write(32'h4010404c, 32'hffffcee6, 4'hf);
wb_write(32'h40104050, 32'hffff6662, 4'hf);
wb_write(32'h40104054, 32'hfffffd65, 4'hf);
wb_write(32'h40104058, 32'h00014ac6, 4'hf);
wb_write(32'h4010405c, 32'h0000f7e0, 4'hf);
wb_write(32'h40104060, 32'hffffff58, 4'hf);
wb_write(32'h40104064, 32'h0000549e, 4'hf);
wb_write(32'h40104068, 32'h00000210, 4'hf);
wb_write(32'h4010406c, 32'hffffff3b, 4'hf);
wb_write(32'h40104070, 32'h000062b9, 4'hf);
wb_write(32'h40104074, 32'hfffff4c9, 4'hf);
wb_write(32'h40104078, 32'hffffff09, 4'hf);
wb_write(32'h4010407c, 32'h00007bb8, 4'hf);
wb_write(32'h40104080, 32'hfffff040, 4'hf);
wb_write(32'h40104084, 32'hfffffee3, 4'hf);
wb_write(32'h40104088, 32'h00008e53, 4'hf);
wb_write(32'h4010408c, 32'hffffe15b, 4'hf);
wb_write(32'h40108000, 32'hfffff9ba, 4'hf);
wb_write(32'h40108004, 32'h00031862, 4'hf);
wb_write(32'h40108008, 32'h000d1aba, 4'hf);
wb_write(32'h4010800c, 32'h00000000, 4'hf);
wb_write(32'h40108010, 32'h00000000, 4'hf);
wb_write(32'h40108014, 32'h00800000, 4'hf);
wb_write(32'h40108018, 32'h0007a2c4, 4'hf);
wb_write(32'h4010801c, 32'hfc35eeed, 4'hf);
wb_write(32'h40108020, 32'hfef08bfc, 4'hf);
wb_write(32'h40108024, 32'h00015d08, 4'hf);
wb_write(32'h40108028, 32'hff5959a0, 4'hf);
wb_write(32'h4010802c, 32'hfec68530, 4'hf);
wb_write(32'h40108030, 32'hfffff836, 4'hf);
wb_write(32'h40108034, 32'h0003d7d1, 4'hf);
wb_write(32'h40108038, 32'h00104647, 4'hf);
wb_write(32'h4010803c, 32'h00000000, 4'hf);
wb_write(32'h40108040, 32'h00000000, 4'hf);
wb_write(32'h40108044, 32'h00800000, 4'hf);
wb_write(32'h40108048, 32'hfffe8fd9, 4'hf);
wb_write(32'h4010804c, 32'h00b0ebe9, 4'hf);
wb_write(32'h40108050, 32'h02796f3c, 4'hf);
wb_write(32'h40108054, 32'hfff92561, 4'hf);
wb_write(32'h40108058, 32'h0366934e, 4'hf);
wb_write(32'h4010805c, 32'h0265e39c, 4'hf);
wb_write(32'h40108060, 32'h00000000, 4'hf);
wb_write(32'h40108064, 32'h00002aa1, 4'hf);
wb_write(32'h40108068, 32'h0004c709, 4'hf);
wb_write(32'h4010806c, 32'h00000000, 4'hf);
wb_write(32'h40108070, 32'h00000000, 4'hf);
wb_write(32'h40108074, 32'h00800000, 4'hf);
wb_write(32'h40108078, 32'h00029552, 4'hf);
wb_write(32'h4010807c, 32'hfecb4390, 4'hf);
wb_write(32'h40108080, 32'hfc926564, 4'hf);
wb_write(32'h40108084, 32'h0005bfe2, 4'hf);
wb_write(32'h40108088, 32'hfd1aa68a, 4'hf);
wb_write(32'h4010808c, 32'h00eca98f, 4'hf);
wb_write(32'h40108090, 32'h000017ff, 4'hf);
wb_write(32'h40108094, 32'hfff4148e, 4'hf);
wb_write(32'h40108098, 32'h00047651, 4'hf);
wb_write(32'h4010809c, 32'h00000000, 4'hf);
wb_write(32'h401080a0, 32'h00000000, 4'hf);
wb_write(32'h401080a4, 32'h00800000, 4'hf);
wb_write(32'h401080a8, 32'h000d57a7, 4'hf);
wb_write(32'h401080ac, 32'hf961b1c9, 4'hf);
wb_write(32'h401080b0, 32'hfc30f640, 4'hf);
wb_write(32'h401080b4, 32'hfffa6712, 4'hf);
wb_write(32'h401080b8, 32'h02cdc0a8, 4'hf);
wb_write(32'h401080bc, 32'h00a0ba4d, 4'hf);
wb_write(32'h401080c0, 32'h00000000, 4'hf);
wb_write(32'h401080c4, 32'h00001994, 4'hf);
wb_write(32'h401080c8, 32'h0002ddd2, 4'hf);
wb_write(32'h401080cc, 32'h00000000, 4'hf);
wb_write(32'h401080d0, 32'h00000000, 4'hf);
wb_write(32'h401080d4, 32'h00800000, 4'hf);
wb_write(32'h401080d8, 32'h00028f59, 4'hf);
wb_write(32'h401080dc, 32'hfec7184f, 4'hf);
wb_write(32'h401080e0, 32'hfbd2bd28, 4'hf);
wb_write(32'h401080e4, 32'hfff97464, 4'hf);
wb_write(32'h401080e8, 32'h0344c792, 4'hf);
wb_write(32'h401080ec, 32'h0047fc48, 4'hf);
wb_write(32'h401080f0, 32'h000025aa, 4'hf);
wb_write(32'h401080f4, 32'hffed4a7b, 4'hf);
wb_write(32'h401080f8, 32'h000700b3, 4'hf);
wb_write(32'h401080fc, 32'h00000000, 4'hf);
wb_write(32'h40108100, 32'h00000000, 4'hf);
wb_write(32'h40108104, 32'h00800000, 4'hf);
wb_write(32'h40108108, 32'h0010a69e, 4'hf);
wb_write(32'h4010810c, 32'hf7bca526, 4'hf);
wb_write(32'h40108110, 32'hfdb00ff8, 4'hf);
wb_write(32'h40108114, 32'h00053ac8, 4'hf);
wb_write(32'h40108118, 32'hfd610f85, 4'hf);
wb_write(32'h4010811c, 32'h014f18e0, 4'hf);
wb_write(32'h4010c000, 32'h0000000f, 4'hf);
wb_write(32'h4010c004, 32'h0000000c, 4'hf);
wb_write(32'h4010c008, 32'h000000f0, 4'hf);
wb_write(32'h4010c00c, 32'h00000030, 4'hf);
wb_write(32'h4010c010, 32'h00000348, 4'hf);
wb_write(32'h4010c014, 32'h00000240, 4'hf);
wb_write(32'h4010c018, 32'h00000584, 4'hf);
wb_write(32'h4010c01c, 32'h00000180, 4'hf);
wb_write(32'h4010c020, 32'h00000c12, 4'hf);
wb_write(32'h4010c024, 32'h00000402, 4'hf);
wb_write(32'h4010c028, 32'h00000a21, 4'hf);
wb_write(32'h4010c02c, 32'h00000801, 4'hf);


/*
// 96x64
wb_write(32'h40104000, 32'hfffffd22, 4'hf);
wb_write(32'h40104004, 32'h00011080, 4'hf);
wb_write(32'h40104008, 32'h00003046, 4'hf);
wb_write(32'h4010400c, 32'h00000083, 4'hf);
wb_write(32'h40104010, 32'hffffd1d5, 4'hf);
wb_write(32'h40104014, 32'hffff7c86, 4'hf);
wb_write(32'h40104018, 32'hfffffd4c, 4'hf);
wb_write(32'h4010401c, 32'h000100c3, 4'hf);
wb_write(32'h40104020, 32'h00009cbe, 4'hf);
wb_write(32'h40104024, 32'h00000059, 4'hf);
wb_write(32'h40104028, 32'hffffe192, 4'hf);
wb_write(32'h4010402c, 32'hffffefb3, 4'hf);
wb_write(32'h40104030, 32'h000000b1, 4'hf);
wb_write(32'h40104034, 32'hffffc10d, 4'hf);
wb_write(32'h40104038, 32'hffff24f8, 4'hf);
wb_write(32'h4010403c, 32'hfffffcb9, 4'hf);
wb_write(32'h40104040, 32'h00013768, 4'hf);
wb_write(32'h40104044, 32'h00007198, 4'hf);
wb_write(32'h40104048, 32'h0000007a, 4'hf);
wb_write(32'h4010404c, 32'hffffd5a9, 4'hf);
wb_write(32'h40104050, 32'hffffb795, 4'hf);
wb_write(32'h40104054, 32'hfffffcf0, 4'hf);
wb_write(32'h40104058, 32'h000122cc, 4'hf);
wb_write(32'h4010405c, 32'h0000fcab, 4'hf);
wb_write(32'h40104060, 32'hffffff3a, 4'hf);
wb_write(32'h40104064, 32'h00004afa, 4'hf);
wb_write(32'h40104068, 32'h00002e5c, 4'hf);
wb_write(32'h4010406c, 32'hffffff19, 4'hf);
wb_write(32'h40104070, 32'h000056e3, 4'hf);
wb_write(32'h40104074, 32'h00000aaf, 4'hf);
wb_write(32'h40104078, 32'hfffffede, 4'hf);
wb_write(32'h4010407c, 32'h00006d03, 4'hf);
wb_write(32'h40104080, 32'h00000722, 4'hf);
wb_write(32'h40104084, 32'hfffffeb0, 4'hf);
wb_write(32'h40104088, 32'h00007dcb, 4'hf);
wb_write(32'h4010408c, 32'hffffe05a, 4'hf);
wb_write(32'h40108000, 32'hfffffaaa, 4'hf);
wb_write(32'h40108004, 32'h0001f738, 4'hf);
wb_write(32'h40108008, 32'h000be968, 4'hf);
wb_write(32'h4010800c, 32'h00000000, 4'hf);
wb_write(32'h40108010, 32'h00000000, 4'hf);
wb_write(32'h40108014, 32'h00800000, 4'hf);
wb_write(32'h40108018, 32'h00067e63, 4'hf);
wb_write(32'h4010801c, 32'hfd96d3a9, 4'hf);
wb_write(32'h40108020, 32'hff95c7d6, 4'hf);
wb_write(32'h40108024, 32'h000128d3, 4'hf);
wb_write(32'h40108028, 32'hff976151, 4'hf);
wb_write(32'h4010802c, 32'hffd55208, 4'hf);
wb_write(32'h40108030, 32'hfffff960, 4'hf);
wb_write(32'h40108034, 32'h000270c9, 4'hf);
wb_write(32'h40108038, 32'h000ecb19, 4'hf);
wb_write(32'h4010803c, 32'h00000000, 4'hf);
wb_write(32'h40108040, 32'h00000000, 4'hf);
wb_write(32'h40108044, 32'h00800000, 4'hf);
wb_write(32'h40108048, 32'hfffec6ea, 4'hf);
wb_write(32'h4010804c, 32'h006f529f, 4'hf);
wb_write(32'h40108050, 32'h0185cf1e, 4'hf);
wb_write(32'h40108054, 32'hfffa2bd3, 4'hf);
wb_write(32'h40108058, 32'h0229d693, 4'hf);
wb_write(32'h4010805c, 32'h01cb63b0, 4'hf);
wb_write(32'h40108060, 32'h00000000, 4'hf);
wb_write(32'h40108064, 32'h00002441, 4'hf);
wb_write(32'h40108068, 32'h000ae755, 4'hf);
wb_write(32'h4010806c, 32'h00000000, 4'hf);
wb_write(32'h40108070, 32'h00000000, 4'hf);
wb_write(32'h40108074, 32'h00800000, 4'hf);
wb_write(32'h40108078, 32'h00023268, 4'hf);
wb_write(32'h4010807c, 32'hff3fbe13, 4'hf);
wb_write(32'h40108080, 32'hff95c0b1, 4'hf);
wb_write(32'h40108084, 32'h0004e3ba, 4'hf);
wb_write(32'h40108088, 32'hfe2600dd, 4'hf);
wb_write(32'h4010808c, 32'hffd77c8f, 4'hf);
wb_write(32'h40108090, 32'h00001468, 4'hf);
wb_write(32'h40108094, 32'hfff86a0e, 4'hf);
wb_write(32'h40108098, 32'h000611a0, 4'hf);
wb_write(32'h4010809c, 32'h00000000, 4'hf);
wb_write(32'h401080a0, 32'h00000000, 4'hf);
wb_write(32'h401080a4, 32'h00800000, 4'hf);
wb_write(32'h401080a8, 32'h000b58c4, 4'hf);
wb_write(32'h401080ac, 32'hfbca3612, 4'hf);
wb_write(32'h401080b0, 32'hfd6cca14, 4'hf);
wb_write(32'h401080b4, 32'hfffb3d66, 4'hf);
wb_write(32'h401080b8, 32'h01ca1219, 4'hf);
wb_write(32'h401080bc, 32'h011c42cc, 4'hf);
wb_write(32'h401080c0, 32'h00000000, 4'hf);
wb_write(32'h401080c4, 32'h000015c0, 4'hf);
wb_write(32'h401080c8, 32'h00068acc, 4'hf);
wb_write(32'h401080cc, 32'h00000000, 4'hf);
wb_write(32'h401080d0, 32'h00000000, 4'hf);
wb_write(32'h401080d4, 32'h00800000, 4'hf);
wb_write(32'h401080d8, 32'h00022d53, 4'hf);
wb_write(32'h401080dc, 32'hff3b902d, 4'hf);
wb_write(32'h401080e0, 32'hfdcf3234, 4'hf);
wb_write(32'h401080e4, 32'hfffa6f04, 4'hf);
wb_write(32'h401080e8, 32'h02157f52, 4'hf);
wb_write(32'h401080ec, 32'h007b5634, 4'hf);
wb_write(32'h401080f0, 32'h00002007, 4'hf);
wb_write(32'h401080f4, 32'hfff41825, 4'hf);
wb_write(32'h401080f8, 32'h0009862f, 4'hf);
wb_write(32'h401080fc, 32'h00000000, 4'hf);
wb_write(32'h40108100, 32'h00000000, 4'hf);
wb_write(32'h40108104, 32'h00800000, 4'hf);
wb_write(32'h40108108, 32'h000e290b, 4'hf);
wb_write(32'h4010810c, 32'hfabe2d25, 4'hf);
wb_write(32'h40108110, 32'hff18600e, 4'hf);
wb_write(32'h40108114, 32'h00047289, 4'hf);
wb_write(32'h40108118, 32'hfe53bb73, 4'hf);
wb_write(32'h4010811c, 32'h00cef743, 4'hf);
wb_write(32'h4010c000, 32'h0000000f, 4'hf);
wb_write(32'h4010c004, 32'h0000000c, 4'hf);
wb_write(32'h4010c008, 32'h000000f0, 4'hf);
wb_write(32'h4010c00c, 32'h00000030, 4'hf);
wb_write(32'h4010c010, 32'h00000348, 4'hf);
wb_write(32'h4010c014, 32'h00000240, 4'hf);
wb_write(32'h4010c018, 32'h00000584, 4'hf);
wb_write(32'h4010c01c, 32'h00000180, 4'hf);
wb_write(32'h4010c020, 32'h00000c12, 4'hf);
wb_write(32'h4010c024, 32'h00000402, 4'hf);
wb_write(32'h4010c028, 32'h00000a21, 4'hf);
wb_write(32'h4010c02c, 32'h00000801, 4'hf);
*/

        $display("start");
        wb_write(32'h0000_0084, 32'h0000_0001, 4'b1111);    // UPDATE
        wb_write(32'h0000_0080, 32'h0000_0001, 4'b1111);    // ENABLE
        
    #10000
        wb_write(32'h0000_00a4, 32'h0000_0001, 4'b1111);    // SELECT
        wb_write(32'h0000_0084, 32'h0000_0001, 4'b1111);    // UPDATE
        
    #100000000
        $finish();
    end
    
    
    
endmodule



`default_nettype wire


// end of file
