// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_axi4_dummy_slave_write
        #(
            // AXI4
            parameter   BYTE_WIDTH      = 8,
            parameter   AXI4_ID_WIDTH   = 6,
            parameter   AXI4_ADDR_WIDTH = 32,
            parameter   AXI4_DATA_SIZE  = 4,
            parameter   AXI4_DATA_WIDTH = (BYTE_WIDTH << AXI4_DATA_SIZE),
            parameter   AXI4_STRB_WIDTH = AXI4_DATA_WIDTH / BYTE_WIDTH,
            parameter   AXI4_LEN_WIDTH  = 8,
            parameter   AXI4_QOS_WIDTH  = 4
        )
        (
            input   wire                            aresetn,
            input   wire                            aclk,
            
            input   wire    [AXI4_ID_WIDTH-1:0]     s_axi4_awid,
            input   wire    [AXI4_ADDR_WIDTH-1:0]   s_axi4_awaddr,
            input   wire    [AXI4_LEN_WIDTH-1:0]    s_axi4_awlen,
            input   wire    [2:0]                   s_axi4_awsize,
            input   wire    [1:0]                   s_axi4_awburst,
            input   wire    [0:0]                   s_axi4_awlock,
            input   wire    [3:0]                   s_axi4_awcache,
            input   wire    [2:0]                   s_axi4_awprot,
            input   wire    [AXI4_QOS_WIDTH-1:0]    s_axi4_awqos,
            input   wire    [3:0]                   s_axi4_awregion,
            input   wire                            s_axi4_awvalid,
            output  wire                            s_axi4_awready,
            input   wire    [AXI4_DATA_WIDTH-1:0]   s_axi4_wdata,
            input   wire    [AXI4_STRB_WIDTH-1:0]   s_axi4_wstrb,
            input   wire                            s_axi4_wlast,
            input   wire                            s_axi4_wvalid,
            output  wire                            s_axi4_wready,
            output  wire    [AXI4_ID_WIDTH-1:0]     s_axi4_bid,
            output  wire    [1:0]                   s_axi4_bresp,
            output  wire                            s_axi4_bvalid,
            input   wire                            s_axi4_bready
        );
    
    
    // dummy
    reg     [AXI4_ID_WIDTH-1:0] reg_id;
    reg                         reg_awready;
    reg                         reg_wready;
    
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            reg_id      <= {AXI4_ID_WIDTH{1'bx}};
            reg_awready <= 1'b1;
            reg_wready  <= 1'b1;
        end
        else begin
            if ( (s_axi4_awvalid & reg_awready) && !(s_axi4_bvalid & s_axi4_bready) ) begin
                reg_id      <= s_axi4_awid;
                reg_awready <= 1'b0;
            end
            else if ( s_axi4_bvalid & s_axi4_bready ) begin
                reg_awready <= 1'b1;
            end
            
            if ( (s_axi4_wvalid & reg_wready & s_axi4_wlast) && !(s_axi4_bvalid & s_axi4_bready) ) begin
                reg_wready <= 1'b0;
            end
            else if ( s_axi4_bvalid & s_axi4_bready ) begin
                reg_wready <= 1'b1;
            end
        end
    end
    
    assign s_axi4_awready = reg_awready;// || (s_axi4_bvalid & s_axi4_bready));
    assign s_axi4_wready  = reg_wready;//  || (s_axi4_bvalid & s_axi4_bready));
    
    assign s_axi4_bid     = reg_awready ? reg_id : s_axi4_awid;
    assign s_axi4_bresp   = 2'b00;
    assign s_axi4_bvalid  = (s_axi4_awvalid || ~reg_awready) && ((s_axi4_wvalid & s_axi4_wlast) || ~reg_wready);
    
    
    
    // debug for sim
    integer     count_aw;
    integer     count_w;
    integer     count_b;
    integer     count_awlen;
    integer     count_wlen;
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            count_aw <= 0;
            count_w  <= 0;
            count_b  <= 0;
            count_awlen <= 0;
            count_wlen  <= 0;
        end
        else begin
            if ( s_axi4_awvalid & s_axi4_awready ) begin
                count_aw    <= count_aw + 1;
                count_awlen <= count_awlen + s_axi4_awlen + 1;
            end
            
            if ( s_axi4_wvalid & s_axi4_wready ) begin
                count_w    <= count_w + s_axi4_wlast;
                count_wlen <= count_wlen + 1;
            end
            
            if ( s_axi4_bvalid & s_axi4_bready ) begin
                count_b  <= count_b + 1;
            end
        end
    end
    
    
endmodule


`default_nettype wire


// end of file
