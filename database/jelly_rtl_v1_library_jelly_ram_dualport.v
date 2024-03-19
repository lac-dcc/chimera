// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// Dualport-RAM
module jelly_ram_dualport
        #(
            parameter   ADDR_WIDTH   = 8,
            parameter   DATA_WIDTH   = 8,
            parameter   MEM_SIZE     = (1 << ADDR_WIDTH),
            parameter   RAM_TYPE     = "block",
            parameter   DOUT_REGS0   = 0,
            parameter   DOUT_REGS1   = 0,
            parameter   MODE0        = "WRITE_FIRST",
            parameter   MODE1        = "WRITE_FIRST",
            
            parameter   FILLMEM      = 0,
            parameter   FILLMEM_DATA = 0,
            parameter   READMEMB     = 0,
            parameter   READMEMH     = 0,
            parameter   READMEM_FIlE = ""
        )
        (
            // port0
            input   wire                        clk0,
            input   wire                        en0,
            input   wire                        regcke0,
            input   wire                        we0,
            input   wire    [ADDR_WIDTH-1:0]    addr0,
            input   wire    [DATA_WIDTH-1:0]    din0,
            output  wire    [DATA_WIDTH-1:0]    dout0,
            
            // port1
            input   wire                        clk1,
            input   wire                        en1,
            input   wire                        regcke1,
            input   wire                        we1,
            input   wire    [ADDR_WIDTH-1:0]    addr1,
            input   wire    [DATA_WIDTH-1:0]    din1,
            output  wire    [DATA_WIDTH-1:0]    dout1
        );
    
    // memory
    (* ram_style = RAM_TYPE *)
    reg     [DATA_WIDTH-1:0]    mem [0:MEM_SIZE-1];
    
    // dout
    reg     [DATA_WIDTH-1:0]    tmp_dout0;
    reg     [DATA_WIDTH-1:0]    tmp_dout1;
    
    // port0
    generate
    if ( MODE0 == "WRITE_FIRST" ) begin
        // write first
        always @ ( posedge clk0 ) begin
            if ( en0 ) begin
                if ( we0 ) begin
                    mem[addr0] <= din0;
                end
                
                if ( we0 ) begin
                    tmp_dout0 <= din0;
                end
                else begin
                    tmp_dout0 <= mem[addr0];
                end
            end
        end
    end
    else begin
        // read first
        always @ ( posedge clk0 ) begin
            if ( en0 ) begin
                if ( we0 ) begin
                    mem[addr0] <= din0;
                end
                tmp_dout0 <= mem[addr0];
            end
        end
    end
    
    // DOUT FF insert
    if ( DOUT_REGS0 ) begin
        reg     [DATA_WIDTH-1:0]    reg_dout0;
        always @(posedge clk0) begin
            if ( regcke0 ) begin
                reg_dout0 <= tmp_dout0;
            end
        end
        assign dout0 = reg_dout0;
    end
    else begin
        assign dout0 = tmp_dout0;
    end
    
    endgenerate
    
    
    
    // port1
    generate
    if ( MODE1 == "WRITE_FIRST" ) begin
        // write first
        always @ ( posedge clk1 ) begin
            if ( en1 ) begin
                if ( we1 ) begin
                    mem[addr1] <= din1;
                end
                
                if ( we1 ) begin
                    tmp_dout1 <= din1;
                end
                else begin
                    tmp_dout1 <= mem[addr1];
                end
            end
        end
    end
    else begin
        // read first
        always @ ( posedge clk1 ) begin
            if ( en1 ) begin
                if ( we1 ) begin
                    mem[addr1] <= din1;
                end
                tmp_dout1 <= mem[addr1];
            end
        end
    end
    
    // DOUT FF insert
    if ( DOUT_REGS1 ) begin
        reg     [DATA_WIDTH-1:0]    reg_dout1;
        always @(posedge clk1) begin
            if ( regcke1 ) begin
                reg_dout1 <= tmp_dout1;
            end
        end
        assign dout1 = reg_dout1;
    end
    else begin
        assign dout1 = tmp_dout1;
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
