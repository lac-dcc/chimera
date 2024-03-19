// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// クワッド読み出しメモリ(主にバイリニア補間とか画像処理用)
module jelly_ram_quad_read
        #(
            parameter   USER_WIDTH    = 0,
            parameter   ADDR_X_WIDTH  = 8,
            parameter   ADDR_Y_WIDTH  = 8,
            parameter   DATA_WIDTH    = 8,
            parameter   RAM_TYPE      = "block",
            parameter   DOUT_REGS     = 0,
            
            parameter   READMEMB      = 0,
            parameter   READMEMH      = 0,
            parameter   READMEM_FILE0 = "",
            parameter   READMEM_FILE1 = "",
            parameter   READMEM_FILE2 = "",
            parameter   READMEM_FILE3 = "",
            
            
            // local
            parameter   USER_BITS     = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            // write port
            input   wire                        write_reset,
            input   wire                        write_clk,
            input   wire                        write_we,
            input   wire    [ADDR_X_WIDTH-1:0]  write_addrx,
            input   wire    [ADDR_Y_WIDTH-1:0]  write_addry,
            input   wire    [DATA_WIDTH-1:0]    write_data,
            
            // quad read port
            input   wire                        read_reset,
            input   wire                        read_clk,
            input   wire                        read_cke,
            input   wire    [USER_BITS-1:0]     s_read_user,
            input   wire    [ADDR_X_WIDTH-1:0]  s_read_addrx,
            input   wire    [ADDR_Y_WIDTH-1:0]  s_read_addry,
            input   wire                        s_read_valid,
            output  wire    [USER_BITS-1:0]     m_read_user,
            output  wire    [DATA_WIDTH-1:0]    m_read_data0,
            output  wire    [DATA_WIDTH-1:0]    m_read_data1,
            output  wire    [DATA_WIDTH-1:0]    m_read_data2,
            output  wire    [DATA_WIDTH-1:0]    m_read_data3,
            output  wire                        m_read_valid
        );
    
    
    
    // -----------------------------------------
    //  Memory
    // -----------------------------------------
    
    localparam  ADDR_WIDTH = ADDR_X_WIDTH + ADDR_Y_WIDTH - 2;
    
    // memory 0
    wire                        mem0_wr_en;
    wire    [ADDR_WIDTH-1:0]    mem0_wr_addr;
    wire    [DATA_WIDTH-1:0]    mem0_wr_din;
    
    wire                        mem0_rd_en;
    wire                        mem0_rd_regcke;
    wire    [ADDR_WIDTH-1:0]    mem0_rd_addr;
    wire    [DATA_WIDTH-1:0]    mem0_rd_dout;
    
    jelly_ram_simple_dualport
            #(
                .ADDR_WIDTH     (ADDR_WIDTH),
                .DATA_WIDTH     (DATA_WIDTH),
                .RAM_TYPE       (RAM_TYPE),
                .DOUT_REGS      (1),
                
                .READMEMB       (READMEMB),
                .READMEMH       (READMEMH),
                .READMEM_FIlE   (READMEM_FILE0)
            )
        i_ram_simple_dualport_0
            (
                .wr_clk         (write_clk),
                .wr_en          (mem0_wr_en),
                .wr_addr        (mem0_wr_addr),
                .wr_din         (mem0_wr_din),
                
                .rd_clk         (read_clk),
                .rd_en          (mem0_rd_en),
                .rd_regcke      (mem0_rd_regcke),
                .rd_addr        (mem0_rd_addr),
                .rd_dout        (mem0_rd_dout)
            );
    
    
    // memory 1
    wire                        mem1_wr_en;
    wire    [ADDR_WIDTH-1:0]    mem1_wr_addr;
    wire    [DATA_WIDTH-1:0]    mem1_wr_din;
    
    wire                        mem1_rd_en;
    wire                        mem1_rd_regcke;
    wire    [ADDR_WIDTH-1:0]    mem1_rd_addr;
    wire    [DATA_WIDTH-1:0]    mem1_rd_dout;
    
    jelly_ram_simple_dualport
            #(
                .ADDR_WIDTH     (ADDR_WIDTH),
                .DATA_WIDTH     (DATA_WIDTH),
                .RAM_TYPE       (RAM_TYPE),
                .DOUT_REGS      (1),
                
                .READMEMB       (READMEMB),
                .READMEMH       (READMEMH),
                .READMEM_FIlE   (READMEM_FILE1)
            )
        i_ram_simple_dualport_1
            (
                .wr_clk         (write_clk),
                .wr_en          (mem1_wr_en),
                .wr_addr        (mem1_wr_addr),
                .wr_din         (mem1_wr_din),
                
                .rd_clk         (read_clk),
                .rd_en          (mem1_rd_en),
                .rd_regcke      (mem1_rd_regcke),
                .rd_addr        (mem1_rd_addr),
                .rd_dout        (mem1_rd_dout)
            );
    
    
    // memory 2
    wire                        mem2_wr_en;
    wire    [ADDR_WIDTH-1:0]    mem2_wr_addr;
    wire    [DATA_WIDTH-1:0]    mem2_wr_din;
    
    wire                        mem2_rd_en;
    wire                        mem2_rd_regcke;
    wire    [ADDR_WIDTH-1:0]    mem2_rd_addr;
    wire    [DATA_WIDTH-1:0]    mem2_rd_dout;
    
    jelly_ram_simple_dualport
            #(
                .ADDR_WIDTH     (ADDR_WIDTH),
                .DATA_WIDTH     (DATA_WIDTH),
                .RAM_TYPE       (RAM_TYPE),
                .DOUT_REGS      (1),
                
                .READMEMB       (READMEMB),
                .READMEMH       (READMEMH),
                .READMEM_FIlE   (READMEM_FILE2)
            )
        i_ram_simple_dualport_2
            (
                .wr_clk         (write_clk),
                .wr_en          (mem2_wr_en),
                .wr_addr        (mem2_wr_addr),
                .wr_din         (mem2_wr_din),
                
                .rd_clk         (read_clk),
                .rd_en          (mem2_rd_en),
                .rd_regcke      (mem2_rd_regcke),
                .rd_addr        (mem2_rd_addr),
                .rd_dout        (mem2_rd_dout)
            );
    
    
    // memory 3
    wire                        mem3_wr_en;
    wire    [ADDR_WIDTH-1:0]    mem3_wr_addr;
    wire    [DATA_WIDTH-1:0]    mem3_wr_din;
    
    wire                        mem3_rd_en;
    wire                        mem3_rd_regcke;
    wire    [ADDR_WIDTH-1:0]    mem3_rd_addr;
    wire    [DATA_WIDTH-1:0]    mem3_rd_dout;
    
    jelly_ram_simple_dualport
            #(
                .ADDR_WIDTH     (ADDR_WIDTH),
                .DATA_WIDTH     (DATA_WIDTH),
                .RAM_TYPE       (RAM_TYPE),
                .DOUT_REGS      (1),
                
                .READMEMB       (READMEMB),
                .READMEMH       (READMEMH),
                .READMEM_FIlE   (READMEM_FILE3)
            )
        i_ram_simple_dualport_3
            (
                .wr_clk         (write_clk),
                .wr_en          (mem3_wr_en),
                .wr_addr        (mem3_wr_addr),
                .wr_din         (mem3_wr_din),
                
                .rd_clk         (read_clk),
                .rd_en          (mem3_rd_en),
                .rd_regcke      (mem3_rd_regcke),
                .rd_addr        (mem3_rd_addr),
                .rd_dout        (mem3_rd_dout)
            );
    
    
    
    // -----------------------------------------
    //  Write
    // -----------------------------------------
    
    reg                         wr_en0;
    reg                         wr_en1;
    reg                         wr_en2;
    reg                         wr_en3;
    reg     [ADDR_X_WIDTH-2:0]  wr_addrx;
    reg     [ADDR_Y_WIDTH-2:0]  wr_addry;
    reg     [DATA_WIDTH-1:0]    wr_din;
    
    always @(posedge write_clk) begin
        if ( write_reset ) begin
            wr_en0   <= 1'b0;
            wr_en1   <= 1'b0;
            wr_en2   <= 1'b0;
            wr_en3   <= 1'b0;
            wr_addrx <= {ADDR_X_WIDTH{1'bx}};
            wr_addry <= {ADDR_Y_WIDTH{1'bx}};
            wr_din   <= {DATA_WIDTH{1'bx}};
        end
        else begin
            wr_en0   <= (write_we & ({write_addry[0], write_addrx[0]} == 2'b00));
            wr_en1   <= (write_we & ({write_addry[0], write_addrx[0]} == 2'b01));
            wr_en2   <= (write_we & ({write_addry[0], write_addrx[0]} == 2'b10));
            wr_en3   <= (write_we & ({write_addry[0], write_addrx[0]} == 2'b11));
            wr_addrx <= (write_addrx >> 1);
            wr_addry <= (write_addry >> 1);
            wr_din   <= write_data;
        end
    end
    
    assign  mem0_wr_en   = wr_en0;
    assign  mem1_wr_en   = wr_en1;
    assign  mem2_wr_en   = wr_en2;
    assign  mem3_wr_en   = wr_en3;
    
    assign  mem0_wr_addr = {wr_addry, wr_addrx};
    assign  mem1_wr_addr = {wr_addry, wr_addrx};
    assign  mem2_wr_addr = {wr_addry, wr_addrx};
    assign  mem3_wr_addr = {wr_addry, wr_addrx};
    
    assign  mem0_wr_din  = wr_din;
    assign  mem1_wr_din  = wr_din;
    assign  mem2_wr_din  = wr_din;
    assign  mem3_wr_din  = wr_din;
    
    
    
    // -----------------------------------------
    //  Read
    // -----------------------------------------
    
    reg     [USER_BITS-1:0]     rd0_user;
    reg                         rd0_addrx;
    reg                         rd0_addry;
    reg     [ADDR_X_WIDTH-2:0]  rd0_addrx0;
    reg     [ADDR_Y_WIDTH-2:0]  rd0_addry0;
    reg     [ADDR_X_WIDTH-2:0]  rd0_addrx1;
    reg     [ADDR_Y_WIDTH-2:0]  rd0_addry1;
    reg                         rd0_valid;
    
    reg     [USER_BITS-1:0]     rd1_user;
    reg                         rd1_addrx;
    reg                         rd1_addry;
    reg                         rd1_valid;
    
    reg     [USER_BITS-1:0]     rd2_user;
    reg                         rd2_addrx;
    reg                         rd2_addry;
    reg                         rd2_valid;
    
    reg     [USER_BITS-1:0]     rd3_user;
    reg     [DATA_WIDTH-1:0]    rd3_dout0;
    reg     [DATA_WIDTH-1:0]    rd3_dout1;
    reg     [DATA_WIDTH-1:0]    rd3_dout2;
    reg     [DATA_WIDTH-1:0]    rd3_dout3;
    reg                         rd3_valid;
    
    always @(posedge read_clk) begin
        if ( read_cke ) begin
            // stage 0
            rd0_user   <= s_read_user;
            rd0_addrx  <= s_read_addrx[0];
            rd0_addry  <= s_read_addry[0];
            rd0_addrx0 <= (s_read_addrx >> 1) + s_read_addrx[0];
            rd0_addry0 <= (s_read_addry >> 1) + s_read_addry[0];
            rd0_addrx1 <= (s_read_addrx >> 1);
            rd0_addry1 <= (s_read_addry >> 1);
            
            // stage 1
            rd1_user   <= rd0_user;
            rd1_addrx  <= rd0_addrx;
            rd1_addry  <= rd0_addry;
            
            // stage 2
            rd2_user   <= rd1_user;
            rd2_addrx  <= rd1_addrx;
            rd2_addry  <= rd1_addry;
            
            // stage 2
            rd3_user   <= rd2_user;
            case ({rd2_addry, rd2_addrx})
            2'b00:
                begin
                    rd3_dout0 <= mem0_rd_dout;
                    rd3_dout1 <= mem1_rd_dout;
                    rd3_dout2 <= mem2_rd_dout;
                    rd3_dout3 <= mem3_rd_dout;
                end
            
            2'b01:
                begin
                    rd3_dout0 <= mem1_rd_dout;
                    rd3_dout1 <= mem0_rd_dout;
                    rd3_dout2 <= mem3_rd_dout;
                    rd3_dout3 <= mem2_rd_dout;
                end
                
            2'b10:
                begin
                    rd3_dout0 <= mem2_rd_dout;
                    rd3_dout1 <= mem3_rd_dout;
                    rd3_dout2 <= mem0_rd_dout;
                    rd3_dout3 <= mem1_rd_dout;
                end
            
            2'b11:
                begin
                    rd3_dout0 <= mem3_rd_dout;
                    rd3_dout1 <= mem2_rd_dout;
                    rd3_dout2 <= mem1_rd_dout;
                    rd3_dout3 <= mem0_rd_dout;
                end
            endcase
        end
    end
    
    always @(posedge read_clk) begin
        if ( read_reset ) begin
            rd0_valid <= 1'b0;
            rd1_valid <= 1'b0;
            rd2_valid <= 1'b0;
            rd3_valid <= 1'b0;
        end
        else if ( read_cke ) begin
            rd0_valid <= s_read_valid;
            rd1_valid <= rd0_valid;
            rd2_valid <= rd1_valid;
            rd3_valid <= rd2_valid;
        end
    end
    
    assign  mem0_rd_en     = rd0_valid;
    assign  mem1_rd_en     = rd0_valid;
    assign  mem2_rd_en     = rd0_valid;
    assign  mem3_rd_en     = rd0_valid;
    
    assign  mem0_rd_regcke = rd1_valid;
    assign  mem1_rd_regcke = rd1_valid;
    assign  mem2_rd_regcke = rd1_valid;
    assign  mem3_rd_regcke = rd1_valid;
    
    assign  mem0_rd_addr   = {rd0_addry0, rd0_addrx0};
    assign  mem1_rd_addr   = {rd0_addry0, rd0_addrx1};
    assign  mem2_rd_addr   = {rd0_addry1, rd0_addrx0};
    assign  mem3_rd_addr   = {rd0_addry1, rd0_addrx1};
    
    
    assign  m_read_user  = rd3_user;
    assign  m_read_data0 = rd3_dout0;
    assign  m_read_data1 = rd3_dout1;
    assign  m_read_data2 = rd3_dout2;
    assign  m_read_data3 = rd3_dout3;
    assign  m_read_valid = rd3_valid;
    
    
endmodule



`default_nettype wire


// end of file
