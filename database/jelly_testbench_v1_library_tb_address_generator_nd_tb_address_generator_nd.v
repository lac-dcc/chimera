// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_address_generator_nd();
    localparam RATE = 1000.0/20.0;
    
    initial begin
        $dumpfile("tb_address_generator_nd.vcd");
        $dumpvars(0, tb_address_generator_nd);
        
        #1000000;
            $finish;
    end
    
    
    parameter   RAND_BUSY = 1;
    
    
    reg     clk = 1'b1;
    always #(RATE/2.0)    clk   = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100)   reset = 1'b0;
    
    reg     cke = 1'b1;
    always @(posedge clk) cke <= RAND_BUSY ? {$random()} : 1'b1;
    
    parameter   N          = 4;
    parameter   ADDR_WIDTH = 32;
    parameter   STEP_WIDTH = 32;
    parameter   LEN_WIDTH  = 32;
    parameter   LEN_OFFSET = 1'b1;
    parameter   USER_WIDTH = 0;
    parameter   USER_BITS  = USER_WIDTH > 0 ? USER_WIDTH : 1;
    
    reg     [ADDR_WIDTH-1:0]    s_addr;
    reg     [N*STEP_WIDTH-1:0]  s_step;
    reg     [N*LEN_WIDTH-1:0]   s_len;
    reg     [USER_BITS-1:0]     s_user;
    reg                         s_valid;
    wire                        s_ready;
    
    wire    [ADDR_WIDTH-1:0]    m_addr;
    wire    [N-1:0]             m_first;
    wire    [N-1:0]             m_last;
    wire    [USER_BITS-1:0]     m_user;
    wire                        m_valid;
    reg                         m_ready = 1;
    
    jelly_address_generator_nd
            #(
                .N              (N),
                .ADDR_WIDTH     (ADDR_WIDTH),
                .STEP_WIDTH     (STEP_WIDTH),
                .LEN_WIDTH      (LEN_WIDTH),
                .LEN_OFFSET     (LEN_OFFSET),
                .USER_WIDTH     (USER_WIDTH)
            )
        i_address_generator_nd
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
    
    always @(posedge clk) begin
        m_ready <= RAND_BUSY ? {$random()} : 1'b1;
    end
    
    
    integer fp;
    initial begin
        fp = $fopen("out.txt", "w");
    end
    
    always @(posedge clk) begin
        if ( reset ) begin
        end
        else if ( cke ) begin
            if ( m_valid && m_ready ) begin
                $fdisplay(fp, "%h %b %b", m_addr, m_first, m_last);
            end
        end
    end
    
    
    
    initial begin
        #0
        #5000;

        @(posedge clk);
            s_addr  = 32'h0100_0000;
            s_step[0*STEP_WIDTH +: STEP_WIDTH] <= 32'h00000100;
            s_step[1*STEP_WIDTH +: STEP_WIDTH] <= 32'h00001000;
            s_step[2*STEP_WIDTH +: STEP_WIDTH] <= 32'h00010000;
            s_step[3*STEP_WIDTH +: STEP_WIDTH] <= 32'h00100000;
            s_len [0*LEN_WIDTH  +: LEN_WIDTH ] <= 4;
            s_len [1*LEN_WIDTH  +: LEN_WIDTH ] <= 3;
            s_len [2*LEN_WIDTH  +: LEN_WIDTH ] <= 2;
            s_len [3*LEN_WIDTH  +: LEN_WIDTH ] <= 1;
            s_user  <= 0;
            s_valid <= 0;
            s_valid <= 1;
            while ( !(cke && s_valid & s_ready) )
                @(posedge clk);
            @(posedge clk);
            
            
            s_addr  = 32'h0100_0000;
            s_step[0*STEP_WIDTH +: STEP_WIDTH] <= 32'h00000100;
            s_step[1*STEP_WIDTH +: STEP_WIDTH] <= 32'h00001000;
            s_step[2*STEP_WIDTH +: STEP_WIDTH] <= 32'h00010000;
            s_step[3*STEP_WIDTH +: STEP_WIDTH] <= 32'h00100000;
            s_len [0*LEN_WIDTH  +: LEN_WIDTH ] <= 1;
            s_len [1*LEN_WIDTH  +: LEN_WIDTH ] <= 0;
            s_len [2*LEN_WIDTH  +: LEN_WIDTH ] <= 2;
            s_len [3*LEN_WIDTH  +: LEN_WIDTH ] <= 0;
            s_user  <= 0;
            s_valid <= 1;
            while ( !(cke && s_valid & s_ready) )
                @(posedge clk);
            s_valid <= 0;
            
            s_addr  = 32'h0100_0000;
            s_step[0*STEP_WIDTH +: STEP_WIDTH] <= 32'h00000100;
            s_step[1*STEP_WIDTH +: STEP_WIDTH] <= 32'h00001000;
            s_step[2*STEP_WIDTH +: STEP_WIDTH] <= 32'h00010000;
            s_step[3*STEP_WIDTH +: STEP_WIDTH] <= 32'h00100000;
            s_len [0*LEN_WIDTH  +: LEN_WIDTH ] <= 0;
            s_len [1*LEN_WIDTH  +: LEN_WIDTH ] <= 0;
            s_len [2*LEN_WIDTH  +: LEN_WIDTH ] <= 0;
            s_len [3*LEN_WIDTH  +: LEN_WIDTH ] <= 0;
            s_user  <= 0;
            s_valid <= 1;
            while ( !(cke && s_valid & s_ready) )
                @(posedge clk);
            s_valid <= 0;
        
            s_addr  = 32'h0100_0000;
            s_step[0*STEP_WIDTH +: STEP_WIDTH] <= 32'h00000100;
            s_step[1*STEP_WIDTH +: STEP_WIDTH] <= 32'h00001000;
            s_step[2*STEP_WIDTH +: STEP_WIDTH] <= 32'h00010000;
            s_step[3*STEP_WIDTH +: STEP_WIDTH] <= 32'h00100000;
            s_len [0*LEN_WIDTH  +: LEN_WIDTH ] <= 1;
            s_len [1*LEN_WIDTH  +: LEN_WIDTH ] <= 0;
            s_len [2*LEN_WIDTH  +: LEN_WIDTH ] <= 0;
            s_len [3*LEN_WIDTH  +: LEN_WIDTH ] <= 1;
            s_user  <= 0;
            s_valid <= 1;
            while ( !(cke && s_valid & s_ready) )
                @(posedge clk);
            s_valid <= 0;
        
        #100000;
            $finish;
    end
    
    
endmodule


`default_nettype wire


// end of file
