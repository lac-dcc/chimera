// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// Simple Dualport-RAM
module jelly_ram_simple_dualport
        #(
            parameter   ADDR_WIDTH   = 6,
            parameter   DATA_WIDTH   = 8,
            parameter   MEM_SIZE     = (1 << ADDR_WIDTH),
            parameter   RAM_TYPE     = "distributed",
            parameter   DOUT_REGS    = 0,
            
            parameter   FILLMEM      = 0,
            parameter   FILLMEM_DATA = 0,
            parameter   READMEMB     = 0,
            parameter   READMEMH     = 0,
            parameter   READMEM_FIlE = ""
        )
        (
            // write port
            input   wire                        wr_clk,
            input   wire                        wr_en,
            input   wire    [ADDR_WIDTH-1:0]    wr_addr,
            input   wire    [DATA_WIDTH-1:0]    wr_din,
            
            // read port
            input   wire                        rd_clk,
            input   wire                        rd_en,
            input   wire                        rd_regcke,
            input   wire    [ADDR_WIDTH-1:0]    rd_addr,
            output  wire    [DATA_WIDTH-1:0]    rd_dout
        );
    
    // memory
    (* ram_style = RAM_TYPE *)
    reg     [DATA_WIDTH-1:0]    mem [0:MEM_SIZE-1];
    
    integer iMEM_SIZE = MEM_SIZE;
    
    // write port
    always @ ( posedge wr_clk ) begin
        if ( wr_en ) begin
            mem[wr_addr] <= wr_din;
        end
    end
    
    
    
    // read port
    reg     [DATA_WIDTH-1:0]    tmp_dout;
    always @(posedge rd_clk ) begin
        if ( rd_en ) begin
            tmp_dout <= mem[rd_addr];
        end
    end
    
    
    // DOUT FF insert
    generate
    if ( DOUT_REGS ) begin : blk_reg
        reg     [DATA_WIDTH-1:0]    reg_dout;
        always @(posedge rd_clk) begin
            if ( rd_regcke ) begin
                reg_dout <= tmp_dout;
            end
        end
        assign rd_dout = reg_dout;
    end
    else begin : blk_no_reg
        assign rd_dout = tmp_dout;
    end
    endgenerate
    
    
    
    // initialize
`ifndef ALTERA
    integer i;
    initial begin
        if ( FILLMEM ) begin
            for ( i = 0; i < MEM_SIZE; i = i + 1 ) begin
                mem[i] = FILLMEM_DATA;
            end
        end
        
        if ( READMEMB ) begin
            $readmemb(READMEM_FIlE, mem);
        end
        if ( READMEMH ) begin
            $readmemh(READMEM_FIlE, mem);
        end
    end
`endif
    
endmodule


`default_nettype wire


// End of file
