// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_ram_async_singleport
        #(
            parameter   ADDR_WIDTH   = 6,
            parameter   DATA_WIDTH   = 8,
            parameter   MEM_SIZE     = (1 << ADDR_WIDTH),
            
            parameter   FILLMEM      = 0,
            parameter   FILLMEM_DATA = 0,
            parameter   READMEMB     = 0,
            parameter   READMEMH     = 0,
            parameter   READMEM_FIlE = ""
        )
        (
            input   wire                        clk,
            
            input   wire                        we,
            input   wire    [ADDR_WIDTH-1:0]    addr,
            input   wire    [DATA_WIDTH-1:0]    din,
            output  wire    [DATA_WIDTH-1:0]    dout
        );
    
    // memory
    (* ram_style = "distributed" *)
    reg     [DATA_WIDTH-1:0]    mem [0:MEM_SIZE-1];
    
    always @(posedge clk) begin
        if ( we ) begin
            mem[addr] <= din;
        end
    end
    
    assign dout = mem[addr];
    
    
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


// end of file
