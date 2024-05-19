// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_address_generator_step();
    localparam RATE = 1000.0/20.0;
    
    initial begin
        $dumpfile("tb_address_generator_step.vcd");
        $dumpvars(0, tb_address_generator_step);
        
        #10000;
            $finish;
    end
    
    
    parameter   RAND_BUSY = 0;
    
    
    reg     clk = 1'b1;
    always #(RATE/2.0)    clk   = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100)   reset = 1'b0;
    
    reg     cke = 1'b1;
    always @(posedge clk) cke <= RAND_BUSY ? {$random()} : 1'b1;
    
    
    parameter   ADDR_WIDTH = 32;
    parameter   STEP_WIDTH = 32;
    parameter   LEN_WIDTH  = 32;
    parameter   USER_WIDTH = 0;
    parameter   LEN_OFFSET = 1'b1;
    parameter   USER_BITS  = USER_WIDTH > 0 ? USER_WIDTH : 1;
    
    reg     [ADDR_WIDTH-1:0]    s_addr   = 32'h0001000;
    reg     [STEP_WIDTH-1:0]    s_step = 32'h0000100;
    reg     [LEN_WIDTH-1:0]     s_len  = 3;
    reg     [USER_BITS-1:0]     s_user   = 0;
    reg                         s_valid  = 1;
    wire                        s_ready;
    
    wire    [ADDR_WIDTH-1:0]    m_addr;
    wire                        m_first;
    wire                        m_last;
    wire    [USER_BITS-1:0]     m_user;
    wire                        m_valid;
    reg                         m_ready = 1;
    
    jelly_address_generator_step
            #(
                .ADDR_WIDTH     (ADDR_WIDTH),
                .STEP_WIDTH     (STEP_WIDTH),
                .LEN_WIDTH      (LEN_WIDTH),
                .USER_WIDTH     (USER_WIDTH),
                .LEN_OFFSET     (LEN_OFFSET)
            )
        i_address_generator_step
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_addr         (s_addr),
                .s_step         (s_step),
                .s_len          (s_len),
                .s_user         (s_user),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                
                .m_addr         (m_addr),
                .m_first        (m_first),
                .m_last         (m_last),
                .m_user         (m_user),
                .m_valid        (m_valid),
                .m_ready        (m_ready)
            );
    
    
endmodule


`default_nettype wire


// end of file
