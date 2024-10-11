// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2017 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



//  AXI データに last 信号を付与
module jelly_axi_data_last
        #(
            parameter   BYPASS         = 0,
            parameter   USER_WIDTH     = 0,
            parameter   DATA_WIDTH     = 64,
            parameter   LEN_WIDTH      = 8,
            parameter   FIFO_ASYNC     = 1,
            parameter   FIFO_PTR_WIDTH = 8,
            parameter   FIFO_RAM_TYPE  = "distributed",
            parameter   S_SLAVE_REGS   = 1,
            parameter   S_MASTER_REGS  = 1,
            parameter   M_SLAVE_REGS   = 1,
            parameter   M_MASTER_REGS  = 1,
            
            
            // local
            parameter   USER_BITS      = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                        aresetn,
            input   wire                        aclk,
            input   wire                        aclken,
            
            input   wire                        s_cmd_aresetn,
            input   wire                        s_cmd_aclk,
            input   wire                        s_cmd_aclken,
            input   wire    [LEN_WIDTH-1:0]     s_cmd_len,
            input   wire                        s_cmd_valid,
            output  wire                        s_cmd_ready,
            
            input   wire    [USER_BITS-1:0]     s_user,
            input   wire                        s_last,
            input   wire    [DATA_WIDTH-1:0]    s_data,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            output  wire    [USER_BITS-1:0]     m_user,
            output  wire                        m_last,
            output  wire    [DATA_WIDTH-1:0]    m_data,
            output  wire                        m_valid,
            input   wire                        m_ready
        );
    
    
    generate
    if ( BYPASS ) begin : blk_bypass
        assign  m_user     = s_user;
        assign  m_last     = s_last;
        assign  m_data     = s_data;
        assign  m_valid    = s_valid;
        
        assign  s_ready    = m_ready;
        
        assign s_cmd_ready = 1'b1;
    end
    else begin : blk_split
        
        // ---------------------------------
        //  Insert FF
        // ---------------------------------
        
        wire    [USER_BITS-1:0]     ff_s_user;
        wire    [DATA_WIDTH-1:0]    ff_s_data;
        wire                        ff_s_valid;
        wire                        ff_s_ready;
        
        wire    [USER_BITS-1:0]     ff_m_user;
        wire                        ff_m_last;
        wire    [DATA_WIDTH-1:0]    ff_m_data;
        wire                        ff_m_valid;
        wire                        ff_m_ready;
        
        jelly_pipeline_insert_ff
                #(
                    .DATA_WIDTH         (USER_BITS+DATA_WIDTH),
                    .SLAVE_REGS         (S_SLAVE_REGS),
                    .MASTER_REGS        (S_MASTER_REGS)
                )
            i_pipeline_insert_ff_s
                (
                    .reset              (~aresetn),
                    .clk                (aclk),
                    .cke                (aclken),
                    
                    .s_data             ({s_user, s_data}),
                    .s_valid            (s_valid),
                    .s_ready            (s_ready),
                    
                    .m_data             ({ff_s_user, ff_s_data}),
                    .m_valid            (ff_s_valid),
                    .m_ready            (ff_s_ready),
                    
                    .buffered           (),
                    .s_ready_next       ()
                );
        
        jelly_pipeline_insert_ff
                #(
                    .DATA_WIDTH         (USER_BITS+1+DATA_WIDTH),
                    .SLAVE_REGS         (M_SLAVE_REGS),
                    .MASTER_REGS        (M_MASTER_REGS)
                )
            i_pipeline_insert_ff_m
                (
                    .reset              (~aresetn),
                    .clk                (aclk),
                    .cke                (aclken),
                    
                    .s_data             ({ff_m_user, ff_m_last, ff_m_data}),
                    .s_valid            (ff_m_valid),
                    .s_ready            (ff_m_ready),
                    
                    .m_data             ({m_user, m_last, m_data}),
                    .m_valid            (m_valid),
                    .m_ready            (m_ready),
                    
                    .buffered           (),
                    .s_ready_next       ()
                );
        
        // ---------------------------------
        //  FIFO
        // ---------------------------------
        
        wire    [LEN_WIDTH-1:0]     cmd_len;
        wire                        cmd_valid;
        wire                        cmd_ready;
        
        jelly_fifo_generic_fwtf
                #(
                    .ASYNC          (FIFO_ASYNC),
                    .DATA_WIDTH     (LEN_WIDTH),
                    .PTR_WIDTH      (FIFO_PTR_WIDTH),
                    .DOUT_REGS      (0),
                    .RAM_TYPE       (FIFO_RAM_TYPE),
                    .LOW_DEALY      (0),
                    .SLAVE_REGS     (0),
                    .MASTER_REGS    (1)
                )
            i_fifo_generic_fwtf
                (
                    .s_reset        (~s_cmd_aresetn),
                    .s_clk          (s_cmd_aclk),
                    .s_data         (s_cmd_len),
                    .s_valid        (s_cmd_valid & s_cmd_aclken),
                    .s_ready        (s_cmd_ready),
                    .s_free_count   (),
                    
                    .m_reset        (~aresetn),
                    .m_clk          (aclk),
                    .m_data         (cmd_len),
                    .m_valid        (cmd_valid),
                    .m_ready        (cmd_ready),
                    .m_data_count   ()
                );
        
        
        
        // ---------------------------------
        //  Core
        // ---------------------------------
        
        reg     [LEN_WIDTH-1:0]     reg_len;
        reg                         reg_last;
        reg                         reg_valid;
        
        always @(posedge aclk) begin
            if ( ~aresetn ) begin
                reg_len   <= {LEN_WIDTH{1'bx}};
                reg_last  <= 1'bx;
                reg_valid <= 1'b0;
            end
            else if ( aclken ) begin
                if ( cmd_ready ) begin
                    reg_len   <= cmd_len;
                    reg_last  <= (cmd_len == 0);
                    reg_valid <= cmd_valid;
                end
                else begin
                    if ( ff_m_valid && ff_m_ready ) begin
                        reg_len  <= reg_len - 1'b1;
                        reg_last <= ((reg_len - 1'b1) == 0);
                    end
                end
            end
        end
        
        assign ff_m_user  = ff_s_user;
        assign ff_m_last  = reg_last;
        assign ff_m_data  = ff_s_data;
        assign ff_m_valid = (ff_s_valid & reg_valid);
        
        assign ff_s_ready = (ff_m_ready & reg_valid);
        
        assign cmd_ready  = aclken && (!reg_valid || (ff_m_last && ff_m_valid && ff_m_ready));
    end
    endgenerate
    
    
endmodule


`default_nettype wire


// end of file
