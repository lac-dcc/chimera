// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps



module jelly_cache_unified
        #(
            parameter   LINE_SIZE         = 2,      // 2^n (0:1words, 1:2words, 2:4words ...)
            parameter   ARRAY_SIZE        = 8,      // 2^n (1:2lines, 2:4lines 3:8lines ...)
            parameter   LINE_WORDS        = (1 << LINE_SIZE),
            
            parameter   RESET_INIT_RAM    = 1,
            
            parameter   SLAVE_ADDR_WIDTH  = 24,
            parameter   SLAVE_DATA_SIZE   = 2,      // 2^n (0:8bit, 1:16bit, 2:32bit ...)
            parameter   SLAVE_DATA_WIDTH  = (8 << SLAVE_DATA_SIZE),
            parameter   SLAVE_SEL_WIDTH   = (1 << SLAVE_DATA_SIZE),
            
            parameter   MASTER_ADR_WIDTH  = SLAVE_ADDR_WIDTH - LINE_SIZE,
            parameter   MASTER_DAT_SIZE   = SLAVE_DATA_SIZE + LINE_SIZE,
            parameter   MASTER_DAT_WIDTH  = (8 << MASTER_DAT_SIZE),
            parameter   MASTER_SEL_WIDTH  = (1 << MASTER_DAT_SIZE),
                        
            parameter   CACHE_OFFSET_WIDTH = LINE_SIZE,
            parameter   CACHE_INDEX_WIDTH  = ARRAY_SIZE,
            parameter   CACHE_TAGADR_WIDTH = SLAVE_ADDR_WIDTH - (CACHE_INDEX_WIDTH + CACHE_OFFSET_WIDTH),
            parameter   CACHE_DATA_WIDTH   = MASTER_DAT_WIDTH,

            parameter   RAM_ADDR_WIDTH     = CACHE_INDEX_WIDTH,
            parameter   RAM_DATA_WIDTH     = 1 + CACHE_TAGADR_WIDTH + CACHE_DATA_WIDTH
        )
        (
            // system
            input   wire                            reset,
            input   wire                            clk,
            
            // endian
            input   wire                            endian,
            
            // slave port0
            input   wire                            s_jbus0_en,
            input   wire    [SLAVE_ADDR_WIDTH-1:0]  s_jbus0_addr,
            input   wire    [SLAVE_DATA_WIDTH-1:0]  s_jbus0_wdata,
            output  wire    [SLAVE_DATA_WIDTH-1:0]  s_jbus0_rdata,
            input   wire                            s_jbus0_we,
            input   wire    [SLAVE_SEL_WIDTH-1:0]   s_jbus0_sel,
            input   wire                            s_jbus0_valid,
            output  wire                            s_jbus0_ready,
            
            // slave port1
            input   wire                            s_jbus1_en,
            input   wire    [SLAVE_ADDR_WIDTH-1:0]  s_jbus1_addr,
            input   wire    [SLAVE_DATA_WIDTH-1:0]  s_jbus1_wdata,
            output  wire    [SLAVE_DATA_WIDTH-1:0]  s_jbus1_rdata,
            input   wire                            s_jbus1_we,
            input   wire    [SLAVE_SEL_WIDTH-1:0]   s_jbus1_sel,
            input   wire                            s_jbus1_valid,
            output  wire                            s_jbus1_ready,
            
            // master port0
            output  wire    [MASTER_ADR_WIDTH-1:0]  m_wb_adr_o,
            input   wire    [MASTER_DAT_WIDTH-1:0]  m_wb_dat_i,
            output  wire    [MASTER_DAT_WIDTH-1:0]  m_wb_dat_o,
            output  wire                            m_wb_we_o,
            output  wire    [MASTER_SEL_WIDTH-1:0]  m_wb_sel_o,
            output  wire                            m_wb_stb_o,
            input   wire                            m_wb_ack_i
        );
    
    wire    [MASTER_ADR_WIDTH-1:0]  m_wb0_adr_o;
    wire    [MASTER_DAT_WIDTH-1:0]  m_wb0_dat_i;
    wire    [MASTER_DAT_WIDTH-1:0]  m_wb0_dat_o;
    wire                            m_wb0_we_o;
    wire    [MASTER_SEL_WIDTH-1:0]  m_wb0_sel_o;
    wire                            m_wb0_stb_o;
    wire                            m_wb0_ack_i;

    wire    [MASTER_ADR_WIDTH-1:0]  m_wb1_adr_o;
    wire    [MASTER_DAT_WIDTH-1:0]  m_wb1_dat_i;
    wire    [MASTER_DAT_WIDTH-1:0]  m_wb1_dat_o;
    wire                            m_wb1_we_o;
    wire    [MASTER_SEL_WIDTH-1:0]  m_wb1_sel_o;
    wire                            m_wb1_stb_o;
    wire                            m_wb1_ack_i;
    
    wire                            ram0_en;
    wire                            ram0_we;
    wire    [RAM_ADDR_WIDTH-1:0]    ram0_addr;
    wire    [RAM_DATA_WIDTH-1:0]    ram0_wdata;
    wire    [RAM_DATA_WIDTH-1:0]    ram0_rdata;

    wire                            ram1_en;
    wire                            ram1_we;
    wire    [RAM_ADDR_WIDTH-1:0]    ram1_addr;
    wire    [RAM_DATA_WIDTH-1:0]    ram1_wdata;
    wire    [RAM_DATA_WIDTH-1:0]    ram1_rdata;
    
    
    // RAM initialize
    wire                            ram_init_busy;
    wire    [RAM_ADDR_WIDTH-1:0]    ram_init_addr;
    
    generate
    if ( RESET_INIT_RAM ) begin
        reg                         reg_init_busy;
        reg [RAM_ADDR_WIDTH-1:0]    reg_init_addr;
        always @( posedge clk ) begin
            if ( reset ) begin
                reg_init_busy <= 1'b1;
                reg_init_addr <= {RAM_ADDR_WIDTH{1'b0}};
            end
            else begin
                if ( reg_init_busy ) begin
                    reg_init_addr <= reg_init_addr + 1;
                    if ( reg_init_addr == {RAM_ADDR_WIDTH{1'b1}} ) begin
                        reg_init_busy <= 1'b0;
                    end
                end
            end
        end
        assign ram_init_busy = reg_init_busy;
        assign ram_init_addr = reg_init_addr;
    end
    else begin
        assign ram_init_busy = 1'b0;
        assign ram_init_addr = {RAM_ADDR_WIDTH{1'b0}};
    end
    endgenerate
    
    
    // cache0
    wire        s_jbus0_ready_tmp;
    jelly_cache_core
            #(
                .LINE_SIZE          (LINE_SIZE),
                .ARRAY_SIZE         (ARRAY_SIZE),
                .SLAVE_ADDR_WIDTH   (SLAVE_ADDR_WIDTH),
                .SLAVE_DATA_SIZE    (SLAVE_DATA_SIZE)
            )
        i_cache_core_0
            (
                .clk                (clk),
                .reset              (reset | ram_init_busy),
                .endian             (endian),
                
                .s_jbus_en          (s_jbus0_en),
                .s_jbus_addr        (s_jbus0_addr),
                .s_jbus_wdata       (s_jbus0_wdata),
                .s_jbus_rdata       (s_jbus0_rdata),
                .s_jbus_we          (s_jbus0_we),
                .s_jbus_sel         (s_jbus0_sel),
                .s_jbus_valid       (s_jbus0_valid),
                .s_jbus_ready       (s_jbus0_ready_tmp),
                
                .m_wb_adr_o         (m_wb0_adr_o),
                .m_wb_dat_o         (m_wb0_dat_o),
                .m_wb_dat_i         (m_wb0_dat_i),
                .m_wb_we_o          (m_wb0_we_o),
                .m_wb_sel_o         (m_wb0_sel_o),
                .m_wb_stb_o         (m_wb0_stb_o),
                .m_wb_ack_i         (m_wb0_ack_i),
                
                .m_ram_en           (ram0_en),
                .m_ram_we           (ram0_we),
                .m_ram_addr         (ram0_addr),
                .m_ram_wdata        (ram0_wdata),
                .m_ram_rdata        (ram0_rdata)
            );
    assign s_jbus0_ready = s_jbus0_ready_tmp & !ram_init_busy;
    
    // cache1
    wire        s_jbus1_ready_tmp;
    jelly_cache_core
            #(
                .LINE_SIZE          (LINE_SIZE),
                .ARRAY_SIZE         (ARRAY_SIZE),
                .SLAVE_ADDR_WIDTH   (SLAVE_ADDR_WIDTH),
                .SLAVE_DATA_SIZE    (SLAVE_DATA_SIZE)
            )
        i_cache_core_1
            (
                .clk                (clk),
                .reset              (reset | ram_init_busy),
                .endian             (endian),
                
                .s_jbus_en          (s_jbus1_en),
                .s_jbus_addr        (s_jbus1_addr),
                .s_jbus_wdata       (s_jbus1_wdata),
                .s_jbus_rdata       (s_jbus1_rdata),
                .s_jbus_we          (s_jbus1_we),
                .s_jbus_sel         (s_jbus1_sel),
                .s_jbus_valid       (s_jbus1_valid),
                .s_jbus_ready       (s_jbus1_ready_tmp),
                
                .m_wb_adr_o         (m_wb1_adr_o),
                .m_wb_dat_o         (m_wb1_dat_o),
                .m_wb_dat_i         (m_wb1_dat_i),
                .m_wb_we_o          (m_wb1_we_o),
                .m_wb_sel_o         (m_wb1_sel_o),
                .m_wb_stb_o         (m_wb1_stb_o),
                .m_wb_ack_i         (m_wb1_ack_i),
                
                .m_ram_en           (ram1_en),
                .m_ram_we           (ram1_we),
                .m_ram_addr         (ram1_addr),
                .m_ram_wdata        (ram1_wdata),
                .m_ram_rdata        (ram1_rdata)
            );
    assign s_jbus1_ready = s_jbus1_ready_tmp & !ram_init_busy;
    
    // ram
    jelly_ram_dualport
            #(
                .ADDR_WIDTH         (RAM_ADDR_WIDTH),
                .DATA_WIDTH         (RAM_DATA_WIDTH),
                .MODE0              ("WRITE_FIRST"),
                .MODE1              ("WRITE_FIRST"),
                .FILLMEM            (1),
                .FILLMEM_DATA       ({RAM_DATA_WIDTH{1'b0}})
            )
        i_ram_dualport
            (
                .clk0               (clk),
                .en0                (ram_init_busy ? 1'b1                   : ram0_en),
                .regcke0            (1'b0),
                .we0                (ram_init_busy ? 1'b1                   : ram0_we),
                .addr0              (ram_init_busy ? ram_init_addr          : ram0_addr),
                .din0               (ram_init_busy ? {RAM_DATA_WIDTH{1'b0}} : ram0_wdata),
                .dout0              (ram0_rdata),
                
                .clk1               (clk),
                .en1                (ram1_en & !ram_init_busy),
                .regcke1            (1'b0),
                .we1                (ram1_we),
                .addr1              (ram1_addr),
                .din1               (ram1_wdata),
                .dout1              (ram1_rdata)
            );
    
    
    // arbiter
    jelly_wishbone_arbiter
            #(
                .WB_ADR_WIDTH       (MASTER_ADR_WIDTH),
                .WB_DAT_WIDTH       (MASTER_DAT_WIDTH)
            )
        i_wishbone_arbiter
            (
                .reset              (reset),
                .clk                (clk),
                
                .s_wb0_adr_i        (m_wb0_adr_o),
                .s_wb0_dat_i        (m_wb0_dat_o),
                .s_wb0_dat_o        (m_wb0_dat_i),
                .s_wb0_we_i         (m_wb0_we_o),
                .s_wb0_sel_i        (m_wb0_sel_o),
                .s_wb0_stb_i        (m_wb0_stb_o & !ram_init_busy),
                .s_wb0_ack_o        (m_wb0_ack_i),
                
                .s_wb1_adr_i        (m_wb1_adr_o),
                .s_wb1_dat_i        (m_wb1_dat_o),
                .s_wb1_dat_o        (m_wb1_dat_i),
                .s_wb1_we_i         (m_wb1_we_o),
                .s_wb1_sel_i        (m_wb1_sel_o),
                .s_wb1_stb_i        (m_wb1_stb_o & !ram_init_busy),
                .s_wb1_ack_o        (m_wb1_ack_i),
                
                .m_wb_adr_o         (m_wb_adr_o),
                .m_wb_dat_i         (m_wb_dat_i),
                .m_wb_dat_o         (m_wb_dat_o),
                .m_wb_we_o          (m_wb_we_o),
                .m_wb_sel_o         (m_wb_sel_o),
                .m_wb_stb_o         (m_wb_stb_o),
                .m_wb_ack_i         (m_wb_ack_i)
            );
    
endmodule


// end of file
