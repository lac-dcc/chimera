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



// FIFO
module jelly_texture_writer_axi4
        #(
            parameter   M_AXI4_ID_WIDTH      = 6,
            parameter   M_AXI4_ADDR_WIDTH    = 32,
            parameter   M_AXI4_DATA_SIZE     = 3,   // 0:8bit, 1:16bit, 2:32bit, 3:64bit, ... ...
            parameter   M_AXI4_DATA_WIDTH    = (8 << M_AXI4_DATA_SIZE),
            parameter   M_AXI4_STRB_WIDTH    = (1 << M_AXI4_DATA_SIZE),
            parameter   M_AXI4_LEN_WIDTH     = 8,
            parameter   M_AXI4_QOS_WIDTH     = 4,
            parameter   M_AXI4_AWID          = {M_AXI4_ID_WIDTH{1'b0}},
            parameter   M_AXI4_AWSIZE        = M_AXI4_DATA_SIZE,
            parameter   M_AXI4_AWBURST       = 2'b01,
            parameter   M_AXI4_AWLOCK        = 1'b0,
            parameter   M_AXI4_AWCACHE       = 4'b0001,
            parameter   M_AXI4_AWPROT        = 3'b000,
            parameter   M_AXI4_AWQOS         = 0,
            parameter   M_AXI4_AWREGION      = 4'b0000,
            parameter   M_AXI4_WSTRB         = {M_AXI4_STRB_WIDTH{1'b1}},
            
            parameter   M_REGS               = 1,
            parameter   S_REGS               = 1
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            
            input   wire    [M_AXI4_LEN_WIDTH-1:0]      param_awlen,
            
            input   wire    [M_AXI4_ADDR_WIDTH-1:0]     s_addr,
            input   wire    [M_AXI4_DATA_WIDTH-1:0]     s_data,
            input   wire                                s_valid,
            output  wire                                s_ready,
            
            output  wire    [M_AXI4_ID_WIDTH-1:0]       m_axi4_awid,
            output  wire    [M_AXI4_ADDR_WIDTH-1:0]     m_axi4_awaddr,
            output  wire    [M_AXI4_LEN_WIDTH-1:0]      m_axi4_awlen,
            output  wire    [2:0]                       m_axi4_awsize,
            output  wire    [1:0]                       m_axi4_awburst,
            output  wire    [0:0]                       m_axi4_awlock,
            output  wire    [3:0]                       m_axi4_awcache,
            output  wire    [2:0]                       m_axi4_awprot,
            output  wire    [M_AXI4_QOS_WIDTH-1:0]      m_axi4_awqos,
            output  wire    [3:0]                       m_axi4_awregion,
            output  wire                                m_axi4_awvalid,
            input   wire                                m_axi4_awready,
            output  wire    [M_AXI4_DATA_WIDTH-1:0]     m_axi4_wdata,
            output  wire    [M_AXI4_STRB_WIDTH-1:0]     m_axi4_wstrb,
            output  wire                                m_axi4_wlast,
            output  wire                                m_axi4_wvalid,
            input   wire                                m_axi4_wready,
            input   wire    [M_AXI4_ID_WIDTH-1:0]       m_axi4_bid,
            input   wire    [1:0]                       m_axi4_bresp,
            input   wire                                m_axi4_bvalid,
            output  wire                                m_axi4_bready
        );
    
    // Slave FF
    wire    [M_AXI4_ADDR_WIDTH-1:0]     slave_addr;
    wire    [M_AXI4_DATA_WIDTH-1:0]     slave_data;
    wire                                slave_valid;
    wire                                slave_ready;
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH     (M_AXI4_ADDR_WIDTH + M_AXI4_DATA_WIDTH),
                .SLAVE_REGS     (S_REGS),
                .MASTER_REGS    (0)
            )
        i_pipeline_insert_ff_slave
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (1'b1),
                
                .s_data         ({s_addr, s_data}),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                
                .m_data         ({slave_addr, slave_data}),
                .m_valid        (slave_valid),
                .m_ready        (slave_ready),
                
                .buffered       (),
                .s_ready_next   ()
            );
    
    
    // Master FF
    wire    [M_AXI4_ADDR_WIDTH-1:0]     master_awaddr;
    wire                                master_awvalid;
    wire                                master_awready;
    
    wire                                master_wlast;
    wire    [M_AXI4_DATA_WIDTH-1:0]     master_wdata;
    wire                                master_wvalid;
    wire                                master_wready;
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH     (M_AXI4_ADDR_WIDTH),
                .SLAVE_REGS     (1),
                .MASTER_REGS    (M_REGS)
            )
        i_pipeline_insert_ff_aw
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (1'b1),
                
                .s_data         (master_awaddr),
                .s_valid        (master_awvalid),
                .s_ready        (master_awready),
                
                .m_data         (m_axi4_awaddr),
                .m_valid        (m_axi4_awvalid),
                .m_ready        (m_axi4_awready),
                
                .buffered       (),
                .s_ready_next   ()
            );
    
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH     (1 + M_AXI4_DATA_WIDTH),
                .SLAVE_REGS     (1),
                .MASTER_REGS    (M_REGS)
            )
        i_pipeline_insert_ff_w
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (1'b1),
                
                .s_data         ({master_wlast, master_wdata}),
                .s_valid        (master_wvalid),
                .s_ready        (master_wready),
                
                .m_data         ({m_axi4_wlast, m_axi4_wdata}),
                .m_valid        (m_axi4_wvalid),
                .m_ready        (m_axi4_wready),
                
                .buffered       (),
                .s_ready_next   ()
            );
    
    assign m_axi4_awid     = M_AXI4_AWID;
    assign m_axi4_awlen    = param_awlen;
    assign m_axi4_awsize   = M_AXI4_AWSIZE;
    assign m_axi4_awburst  = M_AXI4_AWBURST;
    assign m_axi4_awlock   = M_AXI4_AWLOCK;
    assign m_axi4_awcache  = M_AXI4_AWCACHE;
    assign m_axi4_awprot   = M_AXI4_AWPROT;
    assign m_axi4_awqos    = M_AXI4_AWQOS;
    assign m_axi4_awregion = M_AXI4_AWREGION;
    
    assign m_axi4_wstrb    = M_AXI4_WSTRB;
    
    assign m_axi4_bready   = 1'b1;
    
    
    
    
    // core
    reg     [M_AXI4_LEN_WIDTH-1:0]      reg_counter;
    
    reg     [M_AXI4_ADDR_WIDTH-1:0]     reg_awaddr;
    reg                                 reg_awvalid;
    
    reg     [M_AXI4_DATA_WIDTH-1:0]     reg_wdata;
    reg                                 reg_wlast;
    reg                                 reg_wvalid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_counter <= {M_AXI4_LEN_WIDTH{1'b0}};
            
            reg_awaddr  <= {M_AXI4_ADDR_WIDTH{1'bx}};
            reg_awvalid <= 1'b0;
            
            reg_wdata   <= {M_AXI4_DATA_WIDTH{1'bx}};
            reg_wlast   <= 1'b1;
            reg_wvalid  <= 1'b0;
        end
        else begin
            if ( master_awready ) begin
                reg_awvalid  <= 1'b0;
            end
            
            if ( master_wready ) begin
                reg_wvalid  <= 1'b0;
            end
            
            if ( slave_ready && slave_valid ) begin
                reg_counter <= reg_counter + 1'b1;
                if ( reg_counter == param_awlen ) begin
                    reg_counter <= {M_AXI4_LEN_WIDTH{1'b0}};
                end
                
                if ( reg_counter == 0 ) begin
                    reg_awaddr  <= slave_addr;
                    reg_awvalid <= 1'b1;
                end
                
                reg_wlast   <= (reg_counter == param_awlen);
                reg_wdata   <= slave_data;
                reg_wvalid  <= 1'b1;
            end
        end
    end
    
    assign slave_ready    = !(master_wvalid && !master_wready) && !(reg_wlast && master_awvalid && !master_awready);
    
    assign master_awaddr  = reg_awaddr;
    assign master_awvalid = reg_awvalid;
    
    assign master_wlast   = reg_wlast;
    assign master_wdata   = reg_wdata;
    assign master_wvalid  = reg_wvalid;
    
endmodule


`default_nettype wire


// end of file
