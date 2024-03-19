// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_axi4_slave_model
        #(
            parameter   AXI_ID_WIDTH          = 4,
            parameter   AXI_ADDR_WIDTH        = 32,
            parameter   AXI_QOS_WIDTH         = 4,
            parameter   AXI_LEN_WIDTH         = 8,
            parameter   AXI_DATA_SIZE         = 2,      // 0:8bit, 1:16bit, 2:32bit, 4:64bit...
            parameter   AXI_DATA_WIDTH        = (8 << AXI_DATA_SIZE),
            parameter   AXI_STRB_WIDTH        = (1 << AXI_DATA_SIZE),
            parameter   MEM_WIDTH             = 16,
            parameter   MEM_SIZE              = (1 << MEM_WIDTH),
            
            parameter   READ_DATA_ADDR        = 0,      // リード結果をアドレスとする
            
            parameter   WRITE_LOG_FILE        = "",
            parameter   READ_LOG_FILE         = "",
            
            parameter   AW_DELAY              = 0,
            parameter   AR_DELAY              = 0,
            
            parameter   AW_FIFO_PTR_WIDTH     = 0,
            parameter   W_FIFO_PTR_WIDTH      = 0,
            parameter   B_FIFO_PTR_WIDTH      = 0,
            parameter   AR_FIFO_PTR_WIDTH     = 0,
            parameter   R_FIFO_PTR_WIDTH      = 0,
            
            parameter   AW_BUSY_RATE          = 0,
            parameter   W_BUSY_RATE           = 0,
            parameter   B_BUSY_RATE           = 0,
            parameter   AR_BUSY_RATE          = 0,
            parameter   R_BUSY_RATE           = 0,
            
            parameter   AW_BUSY_RAND          = 0,
            parameter   W_BUSY_RAND           = 1,
            parameter   B_BUSY_RAND           = 2,
            parameter   AR_BUSY_RAND          = 3,
            parameter   R_BUSY_RAND           = 4
        )
        (
            input   wire                            aresetn,
            input   wire                            aclk,
            
            input   wire    [AXI_ID_WIDTH-1:0]      s_axi4_awid,
            input   wire    [AXI_ADDR_WIDTH-1:0]    s_axi4_awaddr,
            input   wire    [AXI_LEN_WIDTH-1:0]     s_axi4_awlen,
            input   wire    [2:0]                   s_axi4_awsize,
            input   wire    [1:0]                   s_axi4_awburst,
            input   wire    [0:0]                   s_axi4_awlock,
            input   wire    [3:0]                   s_axi4_awcache,
            input   wire    [2:0]                   s_axi4_awprot,
            input   wire    [AXI_QOS_WIDTH-1:0]     s_axi4_awqos,
            input   wire                            s_axi4_awvalid,
            output  wire                            s_axi4_awready,
            
            input   wire    [AXI_DATA_WIDTH-1:0]    s_axi4_wdata,
            input   wire    [AXI_STRB_WIDTH-1:0]    s_axi4_wstrb,
            input   wire                            s_axi4_wlast,
            input   wire                            s_axi4_wvalid,
            output  wire                            s_axi4_wready,
            
            output  wire    [AXI_ID_WIDTH-1:0]      s_axi4_bid,
            output  wire    [1:0]                   s_axi4_bresp,
            output  wire                            s_axi4_bvalid,
            input   wire                            s_axi4_bready,
            
            input   wire    [AXI_ID_WIDTH-1:0]      s_axi4_arid,
            input   wire    [AXI_ADDR_WIDTH-1:0]    s_axi4_araddr,
            input   wire    [AXI_LEN_WIDTH-1:0]     s_axi4_arlen,
            input   wire    [2:0]                   s_axi4_arsize,
            input   wire    [1:0]                   s_axi4_arburst,
            input   wire    [0:0]                   s_axi4_arlock,
            input   wire    [3:0]                   s_axi4_arcache,
            input   wire    [2:0]                   s_axi4_arprot,
            input   wire    [AXI_QOS_WIDTH-1:0]     s_axi4_arqos,
            input   wire                            s_axi4_arvalid,
            output  wire                            s_axi4_arready,
            
            output  wire    [AXI_ID_WIDTH-1:0]      s_axi4_rid,
            output  wire    [AXI_DATA_WIDTH-1:0]    s_axi4_rdata,
            output  wire    [1:0]                   s_axi4_rresp,
            output  wire                            s_axi4_rlast,
            output  wire                            s_axi4_rvalid,
            input   wire                            s_axi4_rready
        );
    
    // -------------------------------------
    //  generate busy
    // -------------------------------------
    
    reg                             reg_busy_aw = 1'b0;
    reg                             reg_busy_w  = 1'b0;
    reg                             reg_busy_b  = 1'b0;
    reg                             reg_busy_ar = 1'b0;
    reg                             reg_busy_r  = 1'b0;
    reg     [31:0]                  reg_rand_aw = AW_BUSY_RAND;
    reg     [31:0]                  reg_rand_w  = W_BUSY_RAND;
    reg     [31:0]                  reg_rand_b  = B_BUSY_RAND;
    reg     [31:0]                  reg_rand_ar = AR_BUSY_RAND;
    reg     [31:0]                  reg_rand_r  = R_BUSY_RAND;
    always @(posedge aclk) begin
//      reg_busy_aw <= 1'b0;
        if ( reg_busy_aw || !s_axi4_awvalid || s_axi4_awready ) begin
            reg_busy_aw <= (({$random(reg_rand_aw)} % 100) < AW_BUSY_RATE);
        end
        
//      reg_busy_w <= 1'b0;
        if ( reg_busy_w || !s_axi4_wvalid || s_axi4_wready ) begin
            reg_busy_w  <= (({$random(reg_rand_w)} % 100)  < W_BUSY_RATE);
        end
        
        reg_busy_b <= 1'b0;
        if ( !s_axi4_bvalid || s_axi4_bready ) begin
            reg_busy_b  <= (({$random(reg_rand_b)} % 100)  < B_BUSY_RATE);
        end
        
        reg_busy_ar <= 1'b0;
        if ( !s_axi4_arvalid || s_axi4_arready ) begin
            reg_busy_ar <= (({$random(reg_rand_ar)} % 100) < AR_BUSY_RATE);
        end
        
        reg_busy_r <= 1'b0;
        if ( !s_axi4_rvalid || s_axi4_rready ) begin
            reg_busy_r  <= (({$random(reg_rand_r)} % 100)  < R_BUSY_RATE);
        end
    end
    
    
    // -------------------------------------
    //  insert fifo
    // -------------------------------------
    
    wire    [AXI_ID_WIDTH-1:0]      axi4_fifo_awid;
    wire    [AXI_ADDR_WIDTH-1:0]    axi4_fifo_awaddr;
    wire    [AXI_LEN_WIDTH-1:0]     axi4_fifo_awlen;
    wire    [2:0]                   axi4_fifo_awsize;
//  wire    [1:0]                   axi4_fifo_awburst;
//  wire    [0:0]                   axi4_fifo_awlock;
//  wire    [3:0]                   axi4_fifo_awcache;
//  wire    [2:0]                   axi4_fifo_awprot;
//  wire    [AXI_QOS_WIDTH-1:0]     axi4_fifo_awqos;
    wire                            axi4_fifo_awvalid;
    wire                            axi4_fifo_awready;
    
    wire    [AXI_DATA_WIDTH-1:0]    axi4_wdata;
    wire    [AXI_STRB_WIDTH-1:0]    axi4_wstrb;
    wire                            axi4_wlast;
    wire                            axi4_wvalid;
    wire                            axi4_wready;
    
    wire    [AXI_ID_WIDTH-1:0]      axi4_bid;
//  wire    [1:0]                   axi4_bresp;
    wire                            axi4_bvalid;
    wire                            axi4_bready;
    
    wire    [AXI_ID_WIDTH-1:0]      axi4_fifo_arid;
    wire    [AXI_ADDR_WIDTH-1:0]    axi4_fifo_araddr;
    wire    [AXI_LEN_WIDTH-1:0]     axi4_fifo_arlen;
    wire    [2:0]                   axi4_fifo_arsize;
//  wire    [1:0]                   axi4_fifo_arburst;
//  wire    [0:0]                   axi4_fifo_arlock;
//  wire    [3:0]                   axi4_fifo_arcache;
//  wire    [2:0]                   axi4_fifo_arprot;
//  wire    [AXI_QOS_WIDTH-1:0]     axi4_fifo_arqos;
    wire                            axi4_fifo_arvalid;
    wire                            axi4_fifo_arready;
    
    wire    [AXI_ID_WIDTH-1:0]      axi4_rid;
    wire    [AXI_DATA_WIDTH-1:0]    axi4_rdata;
//  wire    [1:0]                   axi4_rresp;
    wire                            axi4_rlast;
    wire                            axi4_rvalid;
    wire                            axi4_rready;
    
    // aw
    wire                            s_axi4_awready_tmp;
    jelly_fifo_fwtf
            #(
                .DATA_WIDTH         (AXI_ID_WIDTH+AXI_ADDR_WIDTH+AXI_LEN_WIDTH+3),
                .PTR_WIDTH          (AW_FIFO_PTR_WIDTH)
            )
        i_fifo_fwtf_aw
            (
                .reset              (~aresetn),
                .clk                (aclk),
                
                .s_data             ({s_axi4_awid, s_axi4_awaddr, s_axi4_awlen, s_axi4_awsize}),
                .s_valid            (s_axi4_awvalid & !reg_busy_aw),
                .s_ready            (s_axi4_awready_tmp),
                .s_free_count       (),
                
                .m_data             ({axi4_fifo_awid, axi4_fifo_awaddr, axi4_fifo_awlen, axi4_fifo_awsize}),
                .m_valid            (axi4_fifo_awvalid),
                .m_ready            (axi4_fifo_awready),
                .m_data_count       ()
            );
    assign s_axi4_awready = (s_axi4_awready_tmp & !reg_busy_aw);
    
    
    // w
    wire                            s_axi4_wready_tmp;
    jelly_fifo_fwtf
            #(
                .DATA_WIDTH         (AXI_DATA_WIDTH+AXI_STRB_WIDTH+1),
                .PTR_WIDTH          (W_FIFO_PTR_WIDTH)
            )
        i_fifo_fwtf_w
            (
                .reset              (~aresetn),
                .clk                (aclk),
                
                .s_data             ({s_axi4_wdata, s_axi4_wstrb, s_axi4_wlast}),
                .s_valid            (s_axi4_wvalid & !reg_busy_w),
                .s_ready            (s_axi4_wready_tmp),
                .s_free_count       (),
                
                .m_data             ({axi4_wdata, axi4_wstrb, axi4_wlast}),
                .m_valid            (axi4_wvalid),
                .m_ready            (axi4_wready),
                .m_data_count       ()
            );
    assign s_axi4_wready = (s_axi4_wready_tmp & !reg_busy_w);
    
    
    // b
    wire                            s_axi4_bvalid_tmp;
    jelly_fifo_fwtf
            #(
                .DATA_WIDTH         (AXI_ID_WIDTH),
                .PTR_WIDTH          (B_FIFO_PTR_WIDTH)
            )
        i_fifo_fwtf_b
            (
                .reset              (~aresetn),
                .clk                (aclk),
                
                .s_data             (axi4_bid),
                .s_valid            (axi4_bvalid),
                .s_ready            (axi4_bready),
                .s_free_count       (),
                
                .m_data             (s_axi4_bid),
                .m_valid            (s_axi4_bvalid_tmp),
                .m_ready            (s_axi4_bready & !reg_busy_b),
                .m_data_count       ()
            );
    assign s_axi4_bresp  = s_axi4_bvalid ? 2'b00 : 2'bxx;
    assign s_axi4_bvalid = s_axi4_bvalid_tmp & !reg_busy_b;
    
    
    // ar
    wire                            s_axi4_arready_tmp;
    jelly_fifo_fwtf
            #(
                .DATA_WIDTH         (AXI_ID_WIDTH+AXI_ADDR_WIDTH+AXI_LEN_WIDTH+3),
                .PTR_WIDTH          (AR_FIFO_PTR_WIDTH)
            )
        i_fifo_fwtf_ar
            (
                .reset              (~aresetn),
                .clk                (aclk),
                
                .s_data             ({s_axi4_arid, s_axi4_araddr, s_axi4_arlen, s_axi4_arsize}),
                .s_valid            (s_axi4_arvalid & !reg_busy_ar),
                .s_ready            (s_axi4_arready_tmp),
                .s_free_count       (),
                
                .m_data             ({axi4_fifo_arid, axi4_fifo_araddr, axi4_fifo_arlen, axi4_fifo_arsize}),
                .m_valid            (axi4_fifo_arvalid),
                .m_ready            (axi4_fifo_arready),
                .m_data_count       ()
            );
    assign s_axi4_arready = (s_axi4_arready_tmp & !reg_busy_ar);
    
    
    // r
    wire                            s_axi4_rvalid_tmp;
    jelly_fifo_fwtf
            #(
                .DATA_WIDTH         (AXI_ID_WIDTH+AXI_DATA_WIDTH+1),
                .PTR_WIDTH          (R_FIFO_PTR_WIDTH)
            )
        i_fifo_fwtf_r
            (
                .reset              (~aresetn),
                .clk                (aclk),
                
                .s_data             ({axi4_rid, axi4_rdata, axi4_rlast}),
                .s_valid            (axi4_rvalid),
                .s_ready            (axi4_rready),
                .s_free_count       (),
                
                .m_data             ({s_axi4_rid, s_axi4_rdata, s_axi4_rlast}),
                .m_valid            (s_axi4_rvalid_tmp),
                .m_ready            (s_axi4_rready & !reg_busy_r),
                .m_data_count       ()
            );
    assign s_axi4_rresp  = s_axi4_rvalid ? 2'b00 : 2'bxx;
    assign s_axi4_rvalid = s_axi4_rvalid_tmp & !reg_busy_r;
    
    
    // -------------------------------------
    //  insert deleay
    // -------------------------------------
    
    wire    [AXI_ID_WIDTH-1:0]      axi4_awid;
    wire    [AXI_ADDR_WIDTH-1:0]    axi4_awaddr;
    wire    [AXI_LEN_WIDTH-1:0]     axi4_awlen;
    wire    [2:0]                   axi4_awsize;
//  wire    [1:0]                   axi4_awburst;
//  wire    [0:0]                   axi4_awlock;
//  wire    [3:0]                   axi4_awcache;
//  wire    [2:0]                   axi4_awprot;
//  wire    [AXI_QOS_WIDTH-1:0]     axi4_awqos;
    wire                            axi4_awvalid;
    wire                            axi4_awready;
    
    wire    [AXI_ID_WIDTH-1:0]      axi4_arid;
    wire    [AXI_ADDR_WIDTH-1:0]    axi4_araddr;
    wire    [AXI_LEN_WIDTH-1:0]     axi4_arlen;
    wire    [2:0]                   axi4_arsize;
//  wire    [1:0]                   axi4_arburst;
//  wire    [0:0]                   axi4_arlock;
//  wire    [3:0]                   axi4_arcache;
//  wire    [2:0]                   axi4_arprot;
//  wire    [AXI_QOS_WIDTH-1:0]     axi4_arqos;
    wire                            axi4_arvalid;
    wire                            axi4_arready;
    
    // aw
    jelly_data_delay
            #(
                .LATENCY            (AW_DELAY),
                .DATA_WIDTH         (AXI_ID_WIDTH+AXI_ADDR_WIDTH+AXI_LEN_WIDTH+3+1),
                .DATA_INIT          (1'b0)
            )
        i_data_delay_aw
            (
                .reset              (~aresetn),
                .clk                (aclk),
                .cke                (axi4_awready),
                
                .in_data            ({axi4_fifo_awid, axi4_fifo_awaddr, axi4_fifo_awlen, axi4_fifo_awsize, axi4_fifo_awvalid}),
                
                .out_data           ({axi4_awid, axi4_awaddr, axi4_awlen, axi4_awsize, axi4_awvalid})
            );
    assign axi4_fifo_awready = axi4_awready;
    
    
    // ar
    jelly_data_delay
            #(
                .LATENCY            (AR_DELAY),
                .DATA_WIDTH         (AXI_ID_WIDTH+AXI_ADDR_WIDTH+AXI_LEN_WIDTH+3+1),
                .DATA_INIT          (1'b0)
            )
        i_data_delay_ar
            (
                .reset              (~aresetn),
                .clk                (aclk),
                .cke                (axi4_arready),
                
                .in_data            ({axi4_fifo_arid, axi4_fifo_araddr, axi4_fifo_arlen, axi4_fifo_arsize, axi4_fifo_arvalid}),
                
                .out_data           ({axi4_arid, axi4_araddr, axi4_arlen, axi4_arsize, axi4_arvalid})
            );
    assign axi4_fifo_arready = axi4_arready;
    
    
    
    // -------------------------------------
    //  AXI access
    // -------------------------------------
    
    integer w_fp = 0;
    integer r_fp = 0;
    
    initial begin
        if ( WRITE_LOG_FILE != "" ) begin
            w_fp = $fopen(WRITE_LOG_FILE, "w");
        end
        
        if ( READ_LOG_FILE != "" ) begin
            r_fp = $fopen(READ_LOG_FILE, "w");
        end
    end
    
    
    // memory
    localparam  MEM_ADDR_MASK = ((1 << MEM_WIDTH) - 1);
    reg     [AXI_DATA_WIDTH-1:0]    mem     [MEM_SIZE-1:0];
        
    // write
    reg                             reg_awbusy;
    reg     [AXI_ID_WIDTH-1:0]      reg_awid;
    reg     [AXI_ADDR_WIDTH-1:0]    reg_awaddr;
    reg     [AXI_LEN_WIDTH-1:0]     reg_awlen;
    reg     [2:0]                   reg_awsize;
    reg                             reg_bvalid;
    
    always @( posedge aclk ) begin
        if ( !aresetn ) begin
            reg_awbusy <= 1'b0;
            reg_awid   <= 0;
            reg_awaddr <= 0;
            reg_awlen  <= 0;
            reg_awsize <= 0;
            reg_bvalid <= 1'b0;
        end
        else begin
            if ( axi4_bready ) begin
                reg_bvalid <= 1'b0;
            end
            
            if ( axi4_awready && axi4_wready ) begin
                reg_awbusy <= 1'b1;
                reg_awid   <= axi4_awid;
                reg_awaddr <= axi4_awaddr;
                reg_awlen  <= axi4_awlen;
                reg_awsize <= axi4_awsize;
                if ( axi4_wvalid && axi4_wready ) begin
                    if ( axi4_awlen == 0 ) begin
                        reg_bvalid <= 1'b1;
                        reg_awbusy <= 1'b0;
                    end
                    else begin
                        reg_awlen  <= axi4_awlen - 1;
                        reg_awaddr <= axi4_awaddr + (1 << axi4_awsize);
                    end
                end
            end
            else if ( axi4_wvalid && axi4_wready ) begin
                if ( reg_awlen == 0 ) begin
                    reg_bvalid <= 1'b1;
                    reg_awbusy <= 1'b0;
                end
                else begin
                    reg_awlen  <= reg_awlen - 1;
                    reg_awaddr <= reg_awaddr + (1 << reg_awsize);
                end
            end
            
            // wlast check
            if ( axi4_wvalid && axi4_wready ) begin
                if ( ((axi4_awvalid && axi4_awready) && (axi4_wlast != (axi4_awlen == 0)))
                    || (!(axi4_awvalid && axi4_awready) && (axi4_wlast != (reg_awlen == 0))) ) begin
                    $display("[%m(%t)] wlast error!", $time);
                end
            end
        end
    end
    
    
    // memory write
    wire    [AXI_ADDR_WIDTH-1:0]    sig_awaddr = reg_awbusy ? reg_awaddr : axi4_awaddr;
    integer                         i;
    always @( posedge aclk ) begin
        if ( aresetn && axi4_wvalid && axi4_wready ) begin
            if ( (sig_awaddr >> AXI_DATA_SIZE) < MEM_SIZE ) begin
                for ( i = 0; i < AXI_STRB_WIDTH; i = i + 1 ) begin
                    if ( axi4_wstrb[i] ) begin
                        mem[sig_awaddr >> AXI_DATA_SIZE][i*8 +: 8] <= axi4_wdata[i*8 +: 8];
                    end
                end
            end
            
            if ( w_fp != 0 ) begin
                $fdisplay(w_fp, "%h %h %h", sig_awaddr, axi4_wdata, axi4_wstrb);
            end
        end
    end
    
    
    // write assign
    assign axi4_awready = !reg_awbusy && !(axi4_bvalid && !axi4_bready);
    assign axi4_wready  = (reg_awbusy || axi4_awvalid) && !(axi4_bvalid && !axi4_bready);
    
    assign axi4_bid     = axi4_bvalid ? reg_awid : {AXI_ID_WIDTH{1'bx}};
    assign axi4_bvalid  = reg_bvalid;
    
    
    
    // read
    reg                             reg_arbusy;
    reg     [AXI_ID_WIDTH-1:0]      reg_arid;
    reg     [AXI_ADDR_WIDTH-1:0]    reg_araddr;
    reg     [AXI_LEN_WIDTH-1:0]     reg_arlen;
    reg     [2:0]                   reg_arsize;
    reg                             reg_rlast;
    reg     [AXI_DATA_WIDTH-1:0]    reg_rdata;
    reg                             reg_rvalid;
    
    always @( posedge aclk ) begin
        if ( !aresetn ) begin
            reg_arbusy <= 0;
            reg_arid   <= 0; 
            reg_araddr <= 0;
            reg_arlen  <= 0;
            reg_arsize <= 0;
            reg_rlast  <= 0;
            reg_rdata  <= 0;
            reg_rvalid <= 0;
        end
        else begin
            if ( axi4_rvalid & axi4_rready ) begin
                reg_araddr <= reg_araddr + (1 << reg_arsize);
                reg_arlen  <= reg_arlen - 1'b1;
                reg_rlast  <= ((reg_arlen - 1'b1) == 0);
                if ( reg_rlast ) begin
                    reg_arbusy <= 1'b0;
                    reg_rvalid <= 1'b0;
                end
            end
            
            if ( axi4_arvalid & axi4_arready ) begin
                reg_arbusy <= (axi4_arlen != 0);
                reg_arid   <= axi4_arid;
                reg_araddr <= axi4_araddr;
                reg_arlen  <= axi4_arlen;
                reg_arsize <= axi4_arsize;
                
                reg_rlast  <= (axi4_arlen == 0);
                reg_rvalid <= 1'b1;
            end
            
            if ( axi4_rvalid && axi4_rready ) begin
                if ( r_fp != 0 ) begin
                    $fdisplay(r_fp, "%h %h", reg_araddr, axi4_rdata);
                end
            end
        end
    end
    
    
    assign axi4_arready = (!reg_arbusy && !(axi4_rvalid & !axi4_rready)) || (reg_rlast && axi4_rvalid && axi4_rready);
    
    assign axi4_rid     = axi4_rvalid ? reg_arid : {AXI_ID_WIDTH{1'bx}};
//  assign axi4_rdata   = (axi4_rvalid && ((reg_araddr >> AXI_DATA_SIZE) < MEM_SIZE)) ? mem[reg_araddr >> AXI_DATA_SIZE] : {AXI_DATA_WIDTH{1'bx}};

//  assign axi4_rdata   = mem[MEM_ADDR_MASK & (reg_araddr >> AXI_DATA_SIZE)];
    assign axi4_rdata   = READ_DATA_ADDR                                              ? reg_araddr :
                          (axi4_rvalid && ((reg_araddr >> AXI_DATA_SIZE) < MEM_SIZE)) ? mem[reg_araddr >> AXI_DATA_SIZE] : {AXI_DATA_WIDTH{1'bx}};
    
    assign axi4_rlast   = axi4_rvalid ? reg_rlast : 1'bx;
    assign axi4_rvalid  = reg_rvalid;
    
    
    
    // debug
    task write_memh
            (
                input       [255:0]     filename
            );
    integer     fp;
    begin
        fp = $fopen(filename, "w");
        if ( fp != 0 ) begin
            for ( i = 0; i < MEM_SIZE; i = i+1 ) begin
                $fdisplay(fp, "%h", mem[i]);
            end
            $fclose(fp);
        end
        else begin
            $display("file oppen error : %s", filename);
        end
    end
    endtask
    
    task read_memh
            (
                input       [255:0]     filename
            );
    begin
        $readmemh(filename, mem);
    end
    endtask
    
    
endmodule


`default_nettype wire


// end of file
