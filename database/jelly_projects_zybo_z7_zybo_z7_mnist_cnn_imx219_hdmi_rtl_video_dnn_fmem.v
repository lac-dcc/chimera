// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the soft-core processor system
//   math
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module video_dnn_fmem
        #(
            parameter   TUSER_WIDTH       = 1,
            parameter   TDATA_WIDTH       = 24,
            parameter   STORE_TDATA_WIDTH = 8,
            
            parameter   DIV_X             = 2,
            parameter   DIV_Y             = 2,
            
            parameter   X_WIDTH           = 10,
            parameter   Y_WIDTH           = 9,
            parameter   MAX_X_NUM         = (1 << X_WIDTH),
            parameter   MAX_Y_NUM         = (1 << Y_WIDTH),
            parameter   RAM_TYPE          = "block"
        )
        (
            input   wire                            aresetn,
            input   wire                            aclk,
            
            input   wire    [TUSER_WIDTH-1:0]       s_axi4s_tuser,
            input   wire                            s_axi4s_tlast,
            input   wire    [TDATA_WIDTH-1:0]       s_axi4s_tdata,
            input   wire                            s_axi4s_tvalid,
            output  wire                            s_axi4s_tready,
            
            output  wire    [TUSER_WIDTH-1:0]       m_axi4s_tuser,
            output  wire                            m_axi4s_tlast,
            output  wire    [TDATA_WIDTH-1:0]       m_axi4s_tdata,
            output  wire    [STORE_TDATA_WIDTH-1:0] m_axi4s_tdata_store,
            output  wire                            m_axi4s_tvalid,
            input   wire                            m_axi4s_tready,
            
            
            input   wire                            s_axi4s_store_aresetn,
            input   wire                            s_axi4s_store_aclk,
            input   wire    [TUSER_WIDTH-1:0]       s_axi4s_store_tuser,
            input   wire                            s_axi4s_store_tlast,
            input   wire    [STORE_TDATA_WIDTH-1:0] s_axi4s_store_tdata,
            input   wire                            s_axi4s_store_tvalid
        );
    
    localparam  STORE_X_WIDTH = X_WIDTH - DIV_X;
    localparam  STORE_Y_WIDTH = Y_WIDTH - DIV_Y;
    localparam  STORE_X_NUM   = (MAX_X_NUM >> DIV_X);
    localparam  STORE_Y_NUM   = (MAX_Y_NUM >> DIV_Y);
    
    
    // memory
    wire                            wr_en;
    wire    [STORE_X_WIDTH-1:0]     wr_addr_x;
    wire    [STORE_Y_WIDTH-1:0]     wr_addr_y;
    wire    [STORE_TDATA_WIDTH-1:0] wr_din;
    
    wire                            rd_en;
    wire                            rd_regcke;
    wire    [STORE_X_WIDTH-1:0]     rd_addr_x;
    wire    [STORE_Y_WIDTH-1:0]     rd_addr_y;
    wire    [STORE_TDATA_WIDTH-1:0] rd_dout;
    
    jelly_ram_simple_dualport
            #(
                .ADDR_WIDTH     (STORE_Y_WIDTH + STORE_X_WIDTH),
                .DATA_WIDTH     (STORE_TDATA_WIDTH),
                .MEM_SIZE       (STORE_Y_NUM * (1 << STORE_X_WIDTH)),
                .RAM_TYPE       (RAM_TYPE),
                .DOUT_REGS      (1)
            )
        i_ram_simple_dualport
            (
                .wr_clk         (s_axi4s_store_aclk),
                .wr_en          (wr_en),
                .wr_addr        ({wr_addr_y, wr_addr_x}),
                .wr_din         (wr_din),
                
                .rd_clk         (aclk),
                .rd_en          (rd_en),
                .rd_regcke      (rd_regcke),
                .rd_addr        ({rd_addr_y, rd_addr_x}),
                .rd_dout        (rd_dout)
            );
    
    
    // write
    reg                             reg_wr_en;
    reg                             reg_wr_last;
    reg     [STORE_X_WIDTH-1:0]     reg_wr_addr_x;
    reg     [STORE_Y_WIDTH-1:0]     reg_wr_addr_y;
    reg     [STORE_TDATA_WIDTH-1:0] reg_wr_din;
    always @(posedge s_axi4s_store_aclk) begin
        if ( ~s_axi4s_store_aresetn ) begin
            reg_wr_en     <= 1'b0;
            reg_wr_addr_x <= {STORE_X_WIDTH{1'bx}};
            reg_wr_addr_y <= {STORE_Y_WIDTH{1'bx}};
            reg_wr_din    <= {STORE_TDATA_WIDTH{1'bx}};
        end
        else begin
            reg_wr_en     <= s_axi4s_store_tvalid;
            reg_wr_last   <= s_axi4s_store_tlast;
            reg_wr_din    <= s_axi4s_store_tdata;
            if ( s_axi4s_store_tvalid && s_axi4s_store_tuser[0] ) begin
                reg_wr_addr_x <= {STORE_X_WIDTH{1'b0}};
                reg_wr_addr_y <= {STORE_Y_WIDTH{1'b0}};
            end
            else if ( reg_wr_en ) begin
                reg_wr_addr_x <= reg_wr_addr_x + 1'b1;
                if ( reg_wr_last ) begin
                    reg_wr_addr_x <= {STORE_X_WIDTH{1'b0}};
                    reg_wr_addr_y <= reg_wr_addr_y + 1'b1;
                end
            end
        end
    end
    
    assign wr_en     = reg_wr_en;
    assign wr_addr_x = reg_wr_addr_x;
    assign wr_addr_y = reg_wr_addr_y;
    assign wr_din    = reg_wr_din;
    
    
    
    // read
    wire                            cke;
    
    reg     [X_WIDTH-1:0]           st0_rd_addr_x;
    reg     [Y_WIDTH-1:0]           st0_rd_addr_y;
    reg     [TUSER_WIDTH-1:0]       st0_tuser;
    reg                             st0_tlast;
    reg     [TDATA_WIDTH-1:0]       st0_tdata;
    reg                             st0_tvalid;
    
    reg     [TUSER_WIDTH-1:0]       st1_tuser;
    reg                             st1_tlast;
    reg     [TDATA_WIDTH-1:0]       st1_tdata;
    reg                             st1_tvalid;
    
    reg     [TUSER_WIDTH-1:0]       st2_tuser;
    reg                             st2_tlast;
    reg     [TDATA_WIDTH-1:0]       st2_tdata;
    reg                             st2_tvalid;
    
    reg     [TUSER_WIDTH-1:0]       st3_tuser;
    reg                             st3_tlast;
    reg     [TDATA_WIDTH-1:0]       st3_tdata;
    reg     [STORE_TDATA_WIDTH-1:0] st3_dout;
    reg                             st3_tvalid;
    
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            st0_rd_addr_x <= {X_WIDTH{1'bx}};
            st0_rd_addr_y <= {Y_WIDTH{1'bx}};
            st0_tuser     <= {TUSER_WIDTH{1'bx}};
            st0_tlast     <= 1'bx;
            st0_tdata     <= {TDATA_WIDTH{1'bx}};
            st0_tvalid    <= 1'b0;
            
            st1_tuser     <= {TUSER_WIDTH{1'bx}};
            st1_tlast     <= 1'bx;
            st1_tdata     <= {TDATA_WIDTH{1'bx}};
            st1_tvalid    <= 1'b0;
            
            st2_tuser     <= {TUSER_WIDTH{1'bx}};
            st2_tlast     <= 1'bx;
            st2_tdata     <= {TDATA_WIDTH{1'bx}};
            st2_tvalid    <= 1'b0;
            
            st3_tuser     <= {TUSER_WIDTH{1'bx}};
            st3_tlast     <= 1'bx;
            st3_tdata     <= {TDATA_WIDTH{1'bx}};
            st3_dout      <= {STORE_TDATA_WIDTH{1'bx}};
            st3_tvalid    <= 1'b0;
        end
        else if ( cke ) begin
            // stage 0
            if ( s_axi4s_tvalid && s_axi4s_tuser[0] ) begin
                st0_rd_addr_x <= {STORE_X_WIDTH{1'b0}};
                st0_rd_addr_y <= {STORE_X_WIDTH{1'b0}};
            end
            else if ( st0_tvalid ) begin
                st0_rd_addr_x <= st0_rd_addr_x + 1'b1;
                if ( st0_tlast ) begin
                    st0_rd_addr_x <= {STORE_X_WIDTH{1'b0}};
                    st0_rd_addr_y <= st0_rd_addr_y + 1'b1;
                end
            end
            
            st0_tuser  <= s_axi4s_tuser;
            st0_tlast  <= s_axi4s_tlast;
            st0_tdata  <= s_axi4s_tdata;
            st0_tvalid <= s_axi4s_tvalid;
            
            
            // stage 1
            st1_tuser  <= st0_tuser;
            st1_tlast  <= st0_tlast;
            st1_tdata  <= st0_tdata;
            st1_tvalid <= st0_tvalid;
            
            
            // stage 2
            st2_tuser  <= st1_tuser;
            st2_tlast  <= st1_tlast;
            st2_tdata  <= st1_tdata;
            st2_tvalid <= st1_tvalid;
            
            
            // stage 3
            st3_tuser   <= st2_tuser;
            st3_tlast   <= st2_tlast;
            st3_tdata   <= st2_tdata;
            st3_dout    <= rd_dout;
            st3_tvalid  <= st2_tvalid;
        end
    end
    
    assign cke = !m_axi4s_tvalid || m_axi4s_tready;
    
    assign rd_en     = cke;
    assign rd_regcke = cke;
    assign rd_addr_x = (st0_rd_addr_x >> DIV_X);
    assign rd_addr_y = (st0_rd_addr_y >> DIV_Y);
    
    
    assign s_axi4s_tready = cke;
    
    assign m_axi4s_tuser       = st3_tuser;
    assign m_axi4s_tlast       = st3_tlast;
    assign m_axi4s_tdata       = st3_tdata;
    assign m_axi4s_tdata_store = st3_dout;
    assign m_axi4s_tvalid      = st3_tvalid;
    
endmodule



`default_nettype wire



// end of file
