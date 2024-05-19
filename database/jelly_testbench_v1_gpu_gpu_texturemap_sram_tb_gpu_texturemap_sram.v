// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_gpu_texturemap_sram();
    localparam RATE    = 10.0;
    localparam WB_RATE = 33.3;
    
    
    initial begin
        $dumpfile("tb_gpu_texturemap_sram.vcd");
        $dumpvars(0, tb_gpu_texturemap_sram);
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     wb_clk = 1'b1;
    always #(WB_RATE/2.0)   wb_clk = ~wb_clk;
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
    parameter X_NUM = 640 / 10;
    parameter Y_NUM = 480 / 10;
    parameter U_NUM = 640;
    parameter V_NUM = 480;
    
    
    
    
    // core
    parameter   COMPONENT_NUM                 = 3;
    parameter   DATA_WIDTH                    = 8;
    
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
    parameter   SHADER_PARAM_NUM              = 1 + 2;      // Z + UV
    
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
    
    parameter   U_WIDTH                       = 12; // SHADER_PARAM_Q;
    parameter   U_INT_WIDTH                   = 8;
    parameter   U_FRAC_WIDTH                  = U_WIDTH - U_INT_WIDTH;
    
    parameter   V_WIDTH                       = 12; // SHADER_PARAM_Q;
    parameter   V_INT_WIDTH                   = 8;
    parameter   V_FRAC_WIDTH                  = U_WIDTH - U_INT_WIDTH;
    
    parameter   DEVICE                        = "RTL";
    
    parameter   TEXMEM_READMEMB               = 0;
    parameter   TEXMEM_READMEMH               = 1;
    parameter   TEXMEM_READMEM_FILE0          = "image0.hex";
    parameter   TEXMEM_READMEM_FILE1          = "image1.hex";
    parameter   TEXMEM_READMEM_FILE2          = "image2.hex";
    parameter   TEXMEM_READMEM_FILE3          = "image3.hex";
    
    
    parameter   RASTERIZER_INIT_CTL_ENABLE    = 1'b0;
    parameter   RASTERIZER_INIT_CTL_UPDATE    = 1'b0;
    parameter   RASTERIZER_INIT_PARAM_WIDTH   = X_NUM-1;
    parameter   RASTERIZER_INIT_PARAM_HEIGHT  = Y_NUM-1;
    parameter   RASTERIZER_INIT_PARAM_CULLING = 2'b01;
    parameter   RASTERIZER_INIT_PARAM_BANK    = 0;
    
    parameter   SHADER_INIT_PARAM_BGC         = 32'h0000_0000;
    
    
    wire                                    mem_reset = reset;
    wire                                    mem_clk   = clk;
    wire                                    mem_we    = 0;
    wire    [U_INT_WIDTH-1:0]               mem_addrx = 0;
    wire    [V_INT_WIDTH-1:0]               mem_addry = 0;
    wire    [COMPONENT_NUM*DATA_WIDTH-1:0]  mem_wdata = 0;
    
    wire                                    s_wb_rst_i = reset;
    wire                                    s_wb_clk_i = wb_clk;
    wire    [WB_ADR_WIDTH-1:0]              s_wb_adr_i;
    wire    [WB_DAT_WIDTH-1:0]              s_wb_dat_o;
    wire    [WB_DAT_WIDTH-1:0]              s_wb_dat_i;
    wire                                    s_wb_we_i;
    wire    [WB_SEL_WIDTH-1:0]              s_wb_sel_i;
    wire                                    s_wb_stb_i;
    wire                                    s_wb_ack_o;
    
    wire    [AXI4S_TUSER_WIDTH-1:0]         m_axi4s_tuser;
    wire                                    m_axi4s_tlast;
    wire    [AXI4S_TDATA_WIDTH-1:0]         m_axi4s_tdata;
    wire                                    m_axi4s_tstrb;
    wire                                    m_axi4s_tvalid;
    wire                                    m_axi4s_tready;
    
    jelly_gpu_texturemap_sram
            #(
                .COMPONENT_NUM                  (COMPONENT_NUM),
                .DATA_WIDTH                     (DATA_WIDTH),
                .WB_ADR_WIDTH                   (WB_ADR_WIDTH),
                .WB_DAT_WIDTH                   (WB_DAT_WIDTH),
                .WB_SEL_WIDTH                   (WB_SEL_WIDTH),
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
                .U_WIDTH                        (U_WIDTH),
                .U_INT_WIDTH                    (U_INT_WIDTH),
                .U_FRAC_WIDTH                   (U_FRAC_WIDTH),
                .V_WIDTH                        (V_WIDTH),
                .V_INT_WIDTH                    (V_INT_WIDTH),
                .V_FRAC_WIDTH                   (V_FRAC_WIDTH),
                .DEVICE                         (DEVICE),
                .TEXMEM_READMEMB                (TEXMEM_READMEMB),
                .TEXMEM_READMEMH                (TEXMEM_READMEMH),
                .TEXMEM_READMEM_FILE0           (TEXMEM_READMEM_FILE0),
                .TEXMEM_READMEM_FILE1           (TEXMEM_READMEM_FILE1),
                .TEXMEM_READMEM_FILE2           (TEXMEM_READMEM_FILE2),
                .TEXMEM_READMEM_FILE3           (TEXMEM_READMEM_FILE3),
                .RASTERIZER_INIT_CTL_ENABLE     (RASTERIZER_INIT_CTL_ENABLE),
                .RASTERIZER_INIT_CTL_UPDATE     (RASTERIZER_INIT_CTL_UPDATE),
                .RASTERIZER_INIT_PARAM_WIDTH    (RASTERIZER_INIT_PARAM_WIDTH),
                .RASTERIZER_INIT_PARAM_HEIGHT   (RASTERIZER_INIT_PARAM_HEIGHT),
                .RASTERIZER_INIT_PARAM_CULLING  (RASTERIZER_INIT_PARAM_CULLING),
                .RASTERIZER_INIT_PARAM_BANK     (RASTERIZER_INIT_PARAM_BANK),
                .SHADER_INIT_PARAM_BGC          (SHADER_INIT_PARAM_BGC)
            )
        i_gpu_texturemap_sram
            (
                .reset                          (reset),
                .clk                            (clk),
                
                .mem_reset                      (mem_reset),
                .mem_clk                        (mem_clk),
                .mem_we                         (mem_we),
                .mem_addrx                      (mem_addrx),
                .mem_addry                      (mem_addry),
                .mem_wdata                      (mem_wdata),
                
                .s_wb_rst_i                     (s_wb_rst_i),
                .s_wb_clk_i                     (s_wb_clk_i),
                .s_wb_adr_i                     (s_wb_adr_i),
                .s_wb_dat_o                     (s_wb_dat_o),
                .s_wb_dat_i                     (s_wb_dat_i),
                .s_wb_we_i                      (s_wb_we_i),
                .s_wb_sel_i                     (s_wb_sel_i),
                .s_wb_stb_i                     (s_wb_stb_i),
                .s_wb_ack_o                     (s_wb_ack_o),
                
                .m_axi4s_tuser                  (m_axi4s_tuser),
                .m_axi4s_tlast                  (m_axi4s_tlast),
                .m_axi4s_tdata                  (m_axi4s_tdata),
                .m_axi4s_tstrb                  (m_axi4s_tstrb),
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
