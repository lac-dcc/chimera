// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



//  AXI4に対するアドレスコマンド生成
module jelly_axi4_dma_addr
        #(
            parameter   AXI4_ID_WIDTH    = 6,
            parameter   AXI4_ADDR_WIDTH  = 32,
            parameter   AXI4_DATA_SIZE   = 2,   // 0:8bit, 1:16bit, 2:32bit ...
            parameter   AXI4_LEN_WIDTH   = 8,
            parameter   COUNT_WIDTH      = AXI4_ADDR_WIDTH - AXI4_DATA_SIZE
        )
        (
            input   wire                            aresetn,
            input   wire                            aclk,
            
            // control
            input   wire                            enable,
            output  wire                            busy,
            
            // parameter
            input   wire    [AXI4_ADDR_WIDTH-1:0]   param_addr,
            input   wire    [COUNT_WIDTH-1:0]       param_count,
            input   wire    [AXI4_LEN_WIDTH-1:0]    param_maxlen,
            
            // commnad port
            output  wire    [AXI4_LEN_WIDTH-1:0]    m_cmd_len,
            output  wire                            m_cmd_valid,
            input   wire                            m_cmd_ready,
            
            // AXI4 command port
            output  wire    [AXI4_ADDR_WIDTH-1:0]   m_axi4_addr,
            output  wire    [AXI4_LEN_WIDTH-1:0]    m_axi4_len,
            output  wire                            m_axi4_valid,
            input   wire                            m_axi4_ready
        );
    
    wire                                        cke_cmd;
    wire                                        cke_axi4;
    wire                                        cke = (cke_cmd && cke_axi4);
    
    reg                                         reg_busy;
    reg                                         reg_single;
    reg                                         reg_setup;
    reg                                         reg_cmd_valid;
    reg     [AXI4_ADDR_WIDTH-1:AXI4_DATA_SIZE]  reg_axi4_addr;
    reg     [AXI4_LEN_WIDTH-1:0]                reg_axi4_len;
    reg     [COUNT_WIDTH-1:0]                   reg_axi4_count;
    reg     [11:AXI4_DATA_SIZE]                 reg_axi4_len4k;
    reg                                         reg_axi4_valid;
    
    wire    [COUNT_WIDTH-1:0]                   next_axi4_count = reg_axi4_count - reg_axi4_len - 1'b1; // 次の残転送数
    wire    [AXI4_ADDR_WIDTH-1:AXI4_DATA_SIZE]  next_axi4_addr  = reg_axi4_addr  + reg_axi4_len + 1'b1; // 次のアドレス
    wire    [11:AXI4_DATA_SIZE]                 next_axi4_len4k = ~next_axi4_addr[11:AXI4_DATA_SIZE];   // 次の4k境界までのサイズ
    
    
    always @(posedge aclk) begin
        if ( !aresetn ) begin
            reg_busy       <= 1'b0;
            reg_single     <= 1'bx;
            reg_setup      <= 1'bx;
            reg_cmd_valid  <= 1'b0;
            reg_axi4_addr  <= {(AXI4_ADDR_WIDTH-AXI4_DATA_SIZE){1'bx}};
            reg_axi4_len   <= {AXI4_LEN_WIDTH{1'bx}};
            reg_axi4_count <= {COUNT_WIDTH{1'bx}};
            reg_axi4_len4k <= {(12-AXI4_DATA_SIZE){1'bx}};
            reg_axi4_valid <= 1'b0;
        end
        else if ( cke ) begin
            reg_cmd_valid <= 1'b0;
            
            if ( !reg_busy ) begin
                if ( enable ) begin
                    reg_busy       <= 1'b1;
                    reg_single     <= (param_maxlen == 0);
                    reg_setup      <= (param_maxlen != 0);
                    reg_cmd_valid  <= (param_maxlen == 0);
                    reg_axi4_addr  <= (param_addr >> AXI4_DATA_SIZE);
                    reg_axi4_len   <= {AXI4_LEN_WIDTH{1'b0}};
                    reg_axi4_count <= param_count - 1'b1;
                    reg_axi4_len4k <= ~param_addr[11:AXI4_DATA_SIZE] < param_maxlen ? ~param_addr[11:AXI4_DATA_SIZE] : param_maxlen;
                    reg_axi4_valid <= (param_maxlen == 0);
                end
            end
            else begin
                if ( reg_setup ) begin
                    // setup length
                    reg_setup      <= 1'b0;
                    reg_cmd_valid  <= 1'b1;
                    reg_axi4_len   <= reg_axi4_count < reg_axi4_len4k ? reg_axi4_count : reg_axi4_len4k;
                    reg_axi4_valid <= 1'b1;
                end
                else begin
                    if ( reg_axi4_count == reg_axi4_len ) begin
                        // end
                        reg_busy       <= 1'b0;
                        reg_single     <= 1'bx;
                        reg_setup      <= 1'bx;
                        reg_cmd_valid  <= 1'b0;
                        reg_axi4_addr  <= {(AXI4_ADDR_WIDTH-AXI4_DATA_SIZE){1'bx}};
                        reg_axi4_len   <= {AXI4_LEN_WIDTH{1'bx}};
                        reg_axi4_count <= {COUNT_WIDTH{1'bx}};
                        reg_axi4_len4k <= {(12-AXI4_DATA_SIZE){1'bx}};
                        reg_axi4_valid <= 1'b0;
                    end
                    else if ( reg_single ) begin
                        // single access
                        reg_setup      <= 1'b0;
                        reg_cmd_valid  <= 1'b1;
                        reg_axi4_addr  <= next_axi4_addr;
                        reg_axi4_len   <= {AXI4_LEN_WIDTH{1'b0}};
                        reg_axi4_count <= next_axi4_count;
                        reg_axi4_len4k <= {(12-AXI4_DATA_SIZE){1'bx}};
                        reg_axi4_valid <= 1'b1;
                    end
                    else begin
                        reg_setup       <= 1'b1;
                        reg_cmd_valid   <= 1'b0;
                        reg_axi4_addr   <= next_axi4_addr;
                        reg_axi4_len    <= {AXI4_LEN_WIDTH{1'bx}};
                        reg_axi4_count  <= next_axi4_count;
                        reg_axi4_len4k  <= next_axi4_len4k < param_maxlen ? next_axi4_len4k : param_maxlen;
                        reg_axi4_valid  <= 1'b0;
                    end
                end
            end
        end
    end

    assign cke_cmd  = (!reg_cmd_valid  || m_cmd_ready);
    assign cke_axi4 = (!reg_axi4_valid || m_axi4_ready);
        
    assign busy         = reg_busy;
    
    assign m_cmd_len    = reg_axi4_len;
    assign m_cmd_valid  = reg_cmd_valid & cke_axi4;
    
    assign m_axi4_addr  = {reg_axi4_addr, {AXI4_DATA_SIZE{1'b0}}};
    assign m_axi4_len   = reg_axi4_len;
    assign m_axi4_valid = reg_axi4_valid & cke_cmd;
    
endmodule


`default_nettype wire


// end of file
