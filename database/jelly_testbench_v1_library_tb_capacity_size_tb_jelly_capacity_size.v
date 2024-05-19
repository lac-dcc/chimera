// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_jelly_capacity_size();
    localparam RATE = 1000.0/20.0;
    
    initial begin
        $dumpfile("tb_jelly_capacity_size.vcd");
        $dumpvars(0, tb_jelly_capacity_size);
        
        #50000;
        $finish;
    end
    
    parameter   RAND_BUSY   = 1;
    
//    parameter   CHARGE_SIZE  = 16;
//    parameter   CHARGE_TIMES = 10;
//    parameter   CMD_SIZE     = 10;
//    parameter   CMD_TIMES    = 16;
    
    parameter   CHARGE_SIZE  = 10;
    parameter   CHARGE_TIMES = 160;
    parameter   CMD_SIZE     = 160;
    parameter   CMD_TIMES    = 10;
    
    
    reg     clk = 1'b1;
    always #(RATE/2.0)      clk = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100)     reset = 1'b0;
    
    reg     cke = 1'b1;
    always @(posedge clk)   cke <= RAND_BUSY ? {$random} : 1'b1;
    
    
    
    parameter   CAPACITY_WIDTH     = 32;
    parameter   CMD_USER_WIDTH     = 0;
    parameter   CMD_SIZE_WIDTH     = 8;
    parameter   CMD_SIZE_OFFSET    = 1'b0;
    parameter   CHARGE_WIDTH       = CAPACITY_WIDTH;
    parameter   CHARGE_SIZE_OFFSET = 1'b0;
    parameter   S_REGS             = 1;
    
    parameter   CMD_USER_BITS      = CMD_USER_WIDTH > 0 ? CMD_USER_WIDTH : 1;
    
    
    reg     [CAPACITY_WIDTH-1:0]    initial_capacity = 0;
    
    wire    [CAPACITY_WIDTH-1:0]    current_capacity;
    
    reg     [CHARGE_WIDTH-1:0]      s_charge_size;
    reg                             s_charge_valid;
    
    reg     [CMD_USER_BITS-1:0]     s_cmd_user;
    reg     [CMD_SIZE_WIDTH-1:0]    s_cmd_size;
    reg                             s_cmd_valid;
    wire                            s_cmd_ready;
    
    wire    [CMD_USER_BITS-1:0]     m_cmd_user;
    wire    [CMD_SIZE_WIDTH-1:0]    m_cmd_size;
    wire                            m_cmd_valid;
    reg                             m_cmd_ready;
    
    jelly_capacity_size
            #(
                .CAPACITY_WIDTH         (CAPACITY_WIDTH),
                .CMD_USER_WIDTH         (CMD_USER_WIDTH),
                .CMD_SIZE_WIDTH         (CMD_SIZE_WIDTH),
                .CMD_SIZE_OFFSET        (CMD_SIZE_OFFSET),
                .CHARGE_WIDTH           (CHARGE_WIDTH),
                .CHARGE_SIZE_OFFSET     (CHARGE_SIZE_OFFSET),
                .S_REGS                 (S_REGS)
            )
        i_capacity_size
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .initial_capacity       (initial_capacity),
                
                .current_capacity       (current_capacity),
                
                .s_charge_size          (s_charge_size),
                .s_charge_valid         (s_charge_valid),
                
                .s_cmd_user             (s_cmd_user),
                .s_cmd_size             (s_cmd_size),
                .s_cmd_valid            (s_cmd_valid),
                .s_cmd_ready            (s_cmd_ready),
                
                .m_cmd_user             (m_cmd_user),
                .m_cmd_size             (m_cmd_size),
                .m_cmd_valid            (m_cmd_valid),
                .m_cmd_ready            (m_cmd_ready)
            );
    
    integer     counter_charge = 0;
    integer     counter_s_cmd  = 0;
    integer     counter_m_cmd  = 0;
    
    always @(posedge clk) begin
        if ( reset ) begin
            m_cmd_ready <= 0;
        end
        else if ( cke ) begin
            m_cmd_ready <= RAND_BUSY ? {$random()} : 1;
            
            if ( s_charge_valid ) begin
                counter_charge = counter_charge + s_charge_size + CHARGE_SIZE_OFFSET;
            end
            
            if ( s_cmd_valid & s_cmd_ready ) begin
                counter_s_cmd = counter_s_cmd + s_cmd_size + CMD_SIZE_OFFSET;
            end
            
            if ( m_cmd_valid & m_cmd_ready ) begin
                counter_m_cmd = counter_m_cmd + m_cmd_size + CMD_SIZE_OFFSET;
            end
        end
    end
    
    
    integer     charge_i;
    always @(posedge clk) begin
        if ( reset ) begin
            s_charge_size  <= CHARGE_SIZE - CHARGE_SIZE_OFFSET;
            s_charge_valid <= 0;
            charge_i     = 0;
        end
        else if ( cke ) begin
            if ( s_charge_valid ) begin
                charge_i = charge_i + 1;
            end
            
            if ( charge_i < CHARGE_TIMES ) begin
                s_charge_valid <= RAND_BUSY ? {$random()} : 1;
            end
            else begin
                s_charge_valid <= 0;
            end
        end
    end
    
    integer     cmd_i;
    always @(posedge clk) begin
        if ( reset ) begin
            s_cmd_size  <= CMD_SIZE - CMD_SIZE_OFFSET;
            s_cmd_valid <= 0;
            cmd_i     = 0;
        end
        else if ( cke ) begin
            if ( s_cmd_valid && s_cmd_ready ) begin
                cmd_i = cmd_i + 1;
            end
            
            if ( cmd_i < CMD_TIMES ) begin
                s_cmd_valid <= RAND_BUSY ? {$random()} : 1;
            end
            else begin
                s_cmd_valid <= 0;
            end
        end
    end
    
    
endmodule


`default_nettype wire


// end of file
