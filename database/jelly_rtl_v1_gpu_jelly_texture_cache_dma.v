// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_texture_cache_dma
        #(
            parameter   COMPONENT_NUM        = 3,
            parameter   COMPONENT_SEL_WIDTH  = COMPONENT_NUM <= 2  ?  1 :
                                               COMPONENT_NUM <= 4  ?  2 :
                                               COMPONENT_NUM <= 8  ?  3 :
                                               COMPONENT_NUM <= 16 ?  4 :
                                               COMPONENT_NUM <= 32 ?  5 :
                                               COMPONENT_NUM <= 64 ?  6 : 7,
            
            parameter   M_AXI4_ID_WIDTH      = 6,
            parameter   M_AXI4_ADDR_WIDTH    = 32,
            parameter   M_AXI4_DATA_SIZE     = 2,   // 0:8bit, 1:16bit, 2:32bit ...
            parameter   M_AXI4_DATA_WIDTH    = (8 << M_AXI4_DATA_SIZE),
            parameter   M_AXI4_LEN_WIDTH     = 8,
            parameter   M_AXI4_QOS_WIDTH     = 4,
            parameter   M_AXI4_ARSIZE        = M_AXI4_DATA_SIZE,
            parameter   M_AXI4_ARBURST       = 2'b01,
            parameter   M_AXI4_ARLOCK        = 1'b0,
            parameter   M_AXI4_ARCACHE       = 4'b0001,
            parameter   M_AXI4_ARPROT        = 3'b000,
            parameter   M_AXI4_ARQOS         = 0,
            parameter   M_AXI4_ARREGION      = 4'b0000,
            parameter   M_AXI4_REGS          = 1,
            
            parameter   ID_WIDTH             = M_AXI4_ID_WIDTH,
            parameter   ADDR_WIDTH           = 24,
            parameter   STRIDE_C_WIDTH       = 14,
            parameter   DATA_WIDTH           = M_AXI4_DATA_WIDTH,
            
            parameter   QUE_FIFO_PTR_WIDTH   = 6,
            parameter   QUE_FIFO_RAM_TYPE    = "distributed",
            parameter   QUE_FIFO_S_REGS      = 0,
            parameter   QUE_FIFO_M_REGS      = 1,
            
            parameter   S_AR_REGS            = 1,
            parameter   S_R_REGS             = 1
        )
        (
            input   wire                                            reset,
            input   wire                                            clk,
            
            input   wire    [M_AXI4_ADDR_WIDTH-1:0]                 param_addr,
            input   wire    [M_AXI4_LEN_WIDTH-1:0]                  param_arlen,
            input   wire    [STRIDE_C_WIDTH-1:0]                    param_stride_c,
            
            // slave port
            input   wire    [ID_WIDTH-1:0]                          s_arid,
            input   wire    [ADDR_WIDTH-1:0]                        s_araddr,
            input   wire                                            s_arvalid,
            output  wire                                            s_arready,
            output  wire    [ID_WIDTH-1:0]                          s_rid,
            output  wire                                            s_rlast,
            output  wire    [COMPONENT_SEL_WIDTH-1:0]               s_rcomponent,
            output  wire    [DATA_WIDTH-1:0]                        s_rdata,
            output  wire                                            s_rvalid,
            input   wire                                            s_rready,
            
            // AXI4 read (master)
            output  wire    [M_AXI4_ID_WIDTH-1:0]                   m_axi4_arid,
            output  wire    [M_AXI4_ADDR_WIDTH-1:0]                 m_axi4_araddr,
            output  wire    [M_AXI4_LEN_WIDTH-1:0]                  m_axi4_arlen,
            output  wire    [2:0]                                   m_axi4_arsize,
            output  wire    [1:0]                                   m_axi4_arburst,
            output  wire    [0:0]                                   m_axi4_arlock,
            output  wire    [3:0]                                   m_axi4_arcache,
            output  wire    [2:0]                                   m_axi4_arprot,
            output  wire    [M_AXI4_QOS_WIDTH-1:0]                  m_axi4_arqos,
            output  wire    [3:0]                                   m_axi4_arregion,
            output  wire                                            m_axi4_arvalid,
            input   wire                                            m_axi4_arready,
            input   wire    [M_AXI4_ID_WIDTH-1:0]                   m_axi4_rid,
            input   wire    [M_AXI4_DATA_WIDTH-1:0]                 m_axi4_rdata,
            input   wire    [1:0]                                   m_axi4_rresp,
            input   wire                                            m_axi4_rlast,
            input   wire                                            m_axi4_rvalid,
            output  wire                                            m_axi4_rready
        );
    
    
    // -----------------------------
    //  insert FF
    // -----------------------------
    
    // slave port
    wire    [ID_WIDTH-1:0]              slave_arid;
    wire    [ADDR_WIDTH-1:0]            slave_araddr;
    wire                                slave_arvalid;
    wire                                slave_arready;
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH         (ID_WIDTH+ADDR_WIDTH),
                .SLAVE_REGS         (S_AR_REGS),
                .MASTER_REGS        (1)
            )
        i_pipeline_insert_ff_slave_ar
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (1'b1),
                
                .s_data             ({s_arid, s_araddr}),
                .s_valid            (s_arvalid),
                .s_ready            (s_arready),
                
                .m_data             ({slave_arid, slave_araddr}),
                .m_valid            (slave_arvalid),
                .m_ready            (slave_arready),
                
                .buffered           (),
                .s_ready_next       ()
            );
    
    
    // master port
    wire    [ID_WIDTH-1:0]              slave_rid;
    wire                                slave_rlast;
    wire    [COMPONENT_SEL_WIDTH-1:0]   slave_rcomponent;
    wire    [DATA_WIDTH-1:0]            slave_rdata;
    wire                                slave_rvalid;
    wire                                slave_rready;
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH         (ID_WIDTH+1+COMPONENT_SEL_WIDTH+DATA_WIDTH),
                .SLAVE_REGS         (1),
                .MASTER_REGS        (S_R_REGS)
            )
        i_pipeline_insert_ff_slave_r
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (1'b1),
                
                .s_data             ({slave_rid, slave_rlast, slave_rcomponent, slave_rdata}),
                .s_valid            (slave_rvalid),
                .s_ready            (slave_rready),
                
                .m_data             ({s_rid, s_rlast, s_rcomponent, s_rdata}),
                .m_valid            (s_rvalid),
                .m_ready            (s_rready),
                
                .buffered           (),
                .s_ready_next       ()
            );
    
    
    // AXI4 ar
    wire    [M_AXI4_ID_WIDTH-1:0]   axi4_arid;
    wire    [M_AXI4_ADDR_WIDTH-1:0] axi4_araddr;
    wire                            axi4_arvalid;
    wire                            axi4_arready;
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH         (M_AXI4_ID_WIDTH+M_AXI4_ADDR_WIDTH),
                .SLAVE_REGS         (1),
                .MASTER_REGS        (M_AXI4_REGS)
            )
        i_pipeline_insert_ff_axi4_ar
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (1'b1),
                
                .s_data             ({axi4_arid, axi4_araddr}),
                .s_valid            (axi4_arvalid),
                .s_ready            (axi4_arready),
                
                .m_data             ({m_axi4_arid, m_axi4_araddr}),
                .m_valid            (m_axi4_arvalid),
                .m_ready            (m_axi4_arready),
                
                .buffered           (),
                .s_ready_next       ()
            );
    
    assign m_axi4_arlen    = param_arlen;
    
    assign m_axi4_arsize   = M_AXI4_ARSIZE;
    assign m_axi4_arburst  = M_AXI4_ARBURST;
    assign m_axi4_arcache  = M_AXI4_ARCACHE;
    assign m_axi4_arlock   = M_AXI4_ARLOCK;
    assign m_axi4_arprot   = M_AXI4_ARPROT;
    assign m_axi4_arqos    = M_AXI4_ARQOS;
    assign m_axi4_arregion = M_AXI4_ARREGION;
    
    
    
    // -----------------------------
    //  Queueing
    // -----------------------------

    wire    [ID_WIDTH-1:0]          que_arid;
    wire    [ADDR_WIDTH-1:0]        que_araddr;
    wire                            que_arvalid;
    wire                            que_arready;
    
    jelly_fifo_fwtf
            #(
                .DATA_WIDTH         (ID_WIDTH+ADDR_WIDTH),
                .PTR_WIDTH          (QUE_FIFO_PTR_WIDTH),
                .RAM_TYPE           (QUE_FIFO_RAM_TYPE),
                .SLAVE_REGS         (QUE_FIFO_S_REGS),
                .MASTER_REGS        (QUE_FIFO_M_REGS)
            )
        i_fifo_fwtf
            (
                .reset              (reset),
                .clk                (clk),
                
                .s_data             ({slave_arid, slave_araddr}),
                .s_valid            (slave_arvalid),
                .s_ready            (slave_arready),
                .s_free_count       (),
                
                .m_data             ({que_arid, que_araddr}),
                .m_valid            (que_arvalid),
                .m_ready            (que_arready),
                .m_data_count       ()
            );
    
    
    // -----------------------------
    //  core
    // -----------------------------
    
    // address
    reg     [M_AXI4_ID_WIDTH-1:0]       reg_arid;
    reg     [COMPONENT_SEL_WIDTH-1:0]   reg_arcomponent;
//  reg     [ADDR_WIDTH-1:0]            reg_addr;
    reg     [M_AXI4_ADDR_WIDTH-1:0]     reg_araddr;
    reg                                 reg_arvalid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_arid        <= {M_AXI4_ID_WIDTH{1'bx}};
            reg_arcomponent <= {COMPONENT_SEL_WIDTH{1'bx}};
//          reg_addr        <= {ADDR_WIDTH{1'bx}};
            reg_araddr      <= {M_AXI4_ADDR_WIDTH{1'bx}};
            reg_arvalid     <= 1'b0;
        end
        else begin
            if ( que_arvalid && que_arready ) begin
                reg_arid        <= que_arid;
                reg_arcomponent <= {COMPONENT_SEL_WIDTH{1'b0}};
//              reg_addr        <= que_araddr;
                reg_araddr      <= que_araddr + param_addr;
                reg_arvalid     <= 1'b1;
            end
            else if ( axi4_arvalid && axi4_arready ) begin
                if ( reg_arcomponent == (COMPONENT_NUM-1) ) begin
                    reg_arid        <= {M_AXI4_ID_WIDTH{1'bx}};
                    reg_arcomponent <= {COMPONENT_SEL_WIDTH{1'bx}};
                    reg_araddr      <= {M_AXI4_ADDR_WIDTH{1'bx}};
                    reg_arvalid     <= 1'b0;
                end
                else begin
                    reg_arid        <= reg_arid;
                    reg_arcomponent <= reg_arcomponent + 1;
//                  reg_araddr      <= reg_addr + (param_addr >> ((reg_arcomponent + 1)*M_AXI4_ADDR_WIDTH));
                    reg_araddr      <= reg_araddr + param_stride_c;
                    reg_arvalid     <= 1'b1;
                end
            end
        end
    end
    
    assign que_arready   = (!reg_arvalid || ((reg_arcomponent == (COMPONENT_NUM-1)) && axi4_arready));
    
    assign axi4_arid     = reg_arid;
    assign axi4_araddr   = reg_araddr;
    assign axi4_arvalid  = reg_arvalid;
    
    
    // data
    reg     [COMPONENT_SEL_WIDTH-1:0]   reg_rcomponent;
    always @(posedge clk) begin
        if ( reset ) begin
            reg_rcomponent <= {COMPONENT_SEL_WIDTH{1'b0}};
        end
        else begin
            if ( m_axi4_rvalid && m_axi4_rready && m_axi4_rlast ) begin
                if ( reg_rcomponent == (COMPONENT_NUM-1) ) begin
                    reg_rcomponent <= {COMPONENT_SEL_WIDTH{1'b0}};
                end
                else begin
                    reg_rcomponent <= reg_rcomponent + 1'b1;
                end
            end
        end
    end
    
    assign m_axi4_rready = slave_rready;
    
    assign slave_rid        = m_axi4_rid;
    assign slave_rlast      = (m_axi4_rlast && (reg_rcomponent == (COMPONENT_NUM-1)));
    assign slave_rcomponent = reg_rcomponent;
    assign slave_rdata      = m_axi4_rdata;
    assign slave_rvalid     = m_axi4_rvalid;
    
endmodule


`default_nettype wire


// end of file
