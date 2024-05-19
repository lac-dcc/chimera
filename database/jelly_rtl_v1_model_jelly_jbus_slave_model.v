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


module jelly_s_jbus_model
        #(
            parameter   ADDR_WIDTH = 12,
            parameter   DATA_SIZE  = 2,     // 2^n (0:8bit, 1:16bit, 2:32bit ...)
            parameter   DATA_WIDTH = (8 << DATA_SIZE),
            parameter   BLS_WIDTH  = (1 << DATA_SIZE),
            parameter   MEM_WIDTH  = (1 << ADDR_WIDTH)
        )
        (
            // system
            input   wire                        clk,
            input   wire                        reset,
            
            // slave port
            input   wire                        s_jbus_en,
            input   wire                        s_jbus_we,
            input   wire    [ADDR_WIDTH-1:0]    s_jbus_addr,
            input   wire    [BLS_WIDTH-1:0]     s_jbus_bls,
            input   wire    [DATA_WIDTH-1:0]    s_jbus_wdata,
            output  reg     [DATA_WIDTH-1:0]    s_jbus_rdata,
            output  wire                        s_jbus_ready
        );
    
    generate
    genvar  i;
    for ( i = 0; i < BLS_WIDTH; i = i + 1 ) begin : bls
        reg     [7:0]   mem     [0:MEM_WIDTH-1];
        always @( posedge clk ) begin
            if ( s_jbus_en & s_jbus_ready ) begin
                if ( s_jbus_we ) begin
                    if ( s_jbus_bls[i] ) begin
                        mem[s_jbus_addr] <= s_jbus_wdata[i*8 +: 8];
                    end
                    s_jbus_rdata[i*8 +: 8] <= 8'hxx;
                end
                else begin
                    s_jbus_rdata[i*8 +: 8] <= mem[s_jbus_addr];
                end
            end
        end
    end
    endgenerate

    wire    rand;
    jelly_rand_gen
        i_rand_gen
            (
                .clk        (clk),
                .reset      (reset),
                .seed       (16'h1234),
                .out        (rand)
            );
//  assign s_jbus_ready = rand;
    assign s_jbus_ready = 1'b1;
    
    
endmodule



`default_nettype    wire


// end of file
