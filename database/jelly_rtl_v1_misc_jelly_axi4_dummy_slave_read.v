// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_axi4_dummy_slave_read
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
            
            input   wire    [AXI4_ID_WIDTH-1:0]     s_axi4_arid,
            input   wire    [AXI4_ADDR_WIDTH-1:0]   s_axi4_araddr,
            input   wire    [AXI4_LEN_WIDTH-1:0]    s_axi4_arlen,
            input   wire    [2:0]                   s_axi4_arsize,
            input   wire    [1:0]                   s_axi4_arburst,
            input   wire    [0:0]                   s_axi4_arlock,
            input   wire    [3:0]                   s_axi4_arcache,
            input   wire    [2:0]                   s_axi4_arprot,
            input   wire    [AXI4_QOS_WIDTH-1:0]    s_axi4_arqos,
            input   wire    [3:0]                   s_axi4_arregion,
            input   wire                            s_axi4_arvalid,
            output  wire                            s_axi4_arready,
            output  wire    [AXI4_ID_WIDTH-1:0]     s_axi4_rid,
            output  wire    [AXI4_DATA_WIDTH-1:0]   s_axi4_rdata,
            output  wire    [1:0]                   s_axi4_rresp,
            output  wire                            s_axi4_rlast,
            output  wire                            s_axi4_rvalid,
            input   wire                            s_axi4_rready
        );
    
    
    // dummy
    reg     [31:0]                  reg_counter;
    reg     [AXI4_ID_WIDTH-1:0]     reg_id;
    reg                             reg_rlast;
    reg     [AXI4_LEN_WIDTH-1:0]    reg_rlen;
    reg                             reg_rvalid;
    
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            reg_counter <= 0;
            reg_id      <= {AXI4_ID_WIDTH{1'bx}};
            reg_rlast   <= 1'bx;
            reg_rlen    <= {AXI4_LEN_WIDTH{1'bx}};
            reg_rvalid  <= 1'b0;
        end
        else begin
            reg_counter <= reg_counter + 1;
            
            if ( s_axi4_rvalid & s_axi4_rready ) begin
                if ( s_axi4_rlast ) begin
                    reg_id     <= 
                    reg_rlast  <= 1'bx;
                    reg_rvalid <= 1'b0;
                end
                else begin
                    reg_rlen   <= reg_rlen - 1;
                    reg_rlast  <= (reg_rlen - 1) == 0;
                    reg_rvalid <= 1'b1;
                end
            end
            
            if ( s_axi4_arvalid & s_axi4_arready ) begin
                reg_id     <= s_axi4_arid;
                reg_rlen   <= s_axi4_arlen;
                reg_rlast  <= (s_axi4_arlen == 0);
                reg_rvalid <= 1'b1;
            end
        end
    end
    
    assign s_axi4_arready = !reg_rvalid || (s_axi4_rvalid & s_axi4_rready & s_axi4_rlast);
    
    assign s_axi4_rid     = reg_id;
    assign s_axi4_rdata   = {4{reg_counter}};
    assign s_axi4_rresp   = 2'b00;
    assign s_axi4_rlast   = reg_rlast;
    assign s_axi4_rvalid  = reg_rvalid;
    
    
    
    // debug for sim
    integer     count_ar;
    integer     count_r;
    integer     count_arlen;
    integer     count_rlen;
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            count_ar <= 0;
            count_r  <= 0;
            count_arlen <= 0;
            count_rlen  <= 0;
        end
        else begin
            if ( s_axi4_arvalid & s_axi4_arready ) begin
                count_ar    <= count_ar + 1;
                count_arlen <= count_arlen + s_axi4_arlen + 1;
            end
            
            if ( s_axi4_rvalid & s_axi4_rready ) begin
                count_r    <= count_r + s_axi4_rlast;
                count_rlen <= count_rlen + 1;
            end
        end
    end
    
    
endmodule


`default_nettype wire


// end of file
