// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_axi_addr_align();
    localparam RATE = 1000.0/200.0;
    
    initial begin
        $dumpfile("tb_axi_addr_align.vcd");
        $dumpvars(0, tb_axi_addr_align);
        
        #1000000;
            $finish;
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)      clk = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100)     reset = 1'b0;
    
    
    parameter   RAND_BUSY     = 1;
    
    
    parameter   BYPASS        = 0;
    parameter   USER_WIDTH    = 32;
    parameter   ADDR_WIDTH    = 32;
    parameter   DATA_SIZE     = 3;      // 0:8bit, 1:16bit, 2:32bit, 3:64bit, ...
    parameter   LEN_WIDTH     = 8;
    parameter   ALIGN         = 12;     // 2^n (4kbyte)
    parameter   S_SLAVE_REGS  = 1;
    parameter   S_MASTER_REGS = 1;
    parameter   M_SLAVE_REGS  = 1;
    parameter   M_MASTER_REGS = 1;
    
    parameter   USER_BITS     = USER_WIDTH > 0 ? USER_WIDTH : 1;
    
    wire                        aresetn = ~reset;
    wire                        aclk    = clk;
    reg                         aclken  = 1'b1;
    
    reg     [USER_BITS-1:0]     s_user;
    reg     [ADDR_WIDTH-1:0]    s_addr;
    reg     [LEN_WIDTH-1:0]     s_len;
    reg                         s_valid;
    wire                        s_ready;
    
    wire    [USER_BITS-1:0]     m_user;
    wire    [ADDR_WIDTH-1:0]    m_addr;
    wire    [LEN_WIDTH-1:0]     m_len;
    wire                        m_valid;
    reg                         m_ready = 1'b1;
    
    jelly_axi_addr_align
            #(
                .BYPASS             (BYPASS),
                .USER_WIDTH         (USER_WIDTH),
                .ADDR_WIDTH         (ADDR_WIDTH),
                .DATA_SIZE          (DATA_SIZE),
                .LEN_WIDTH          (LEN_WIDTH),
                .ALIGN              (ALIGN),
                .S_SLAVE_REGS       (S_SLAVE_REGS),
                .S_MASTER_REGS      (S_MASTER_REGS),
                .M_SLAVE_REGS       (M_SLAVE_REGS),
                .M_MASTER_REGS      (M_MASTER_REGS)
            )
        i_axi_addr_align
            (
                .aresetn            (aresetn),
                .aclk               (aclk),
                .aclken             (aclken),
                                     
                .s_user             (s_valid ? s_user : {USER_WIDTH{1'bx}}),
                .s_addr             (s_valid ? s_addr : {ADDR_WIDTH{1'bx}}),
                .s_len              (s_valid ? s_len  : {LEN_WIDTH{1'bx}}),
                .s_valid            (s_valid),
                .s_ready            (s_ready),
                                     
                .m_user             (m_user),
                .m_addr             (m_addr),
                .m_len              (m_len),
                .m_valid            (m_valid),
                .m_ready            (m_ready)
            );
    
    always @(posedge aclk) begin
        aclken <= RAND_BUSY ? {$random()} : 1;
    end
    
    integer     fp;
    initial fp = $fopen("out.txt", "w");
    
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            s_user  <= 0;
            s_addr  <= 0;
//          s_addr  <= (1 << DATA_SIZE);
//          s_addr  <= (1 << ALIGN) - (1 << DATA_SIZE);
            
            s_len   <= 8'hff;
            s_valid <= 1'b0;
        end
        else if ( aclken ) begin
            if ( s_valid && s_ready ) begin
                s_user  <= s_user + 1;
                s_addr  <= s_addr + ((s_len+1) << DATA_SIZE);
                if ( s_user == 1024 ) begin
                    s_addr <= (1 << DATA_SIZE);
                end
                if ( s_user == 2048 ) begin
                    s_addr  <= (1 << ALIGN) - (1 << DATA_SIZE);
                end
            end
            
            if ( !s_valid || s_ready ) begin
                s_valid = RAND_BUSY ? {$random()} : 1;
            end
            
            
            if ( m_valid && m_ready ) begin
                $display("%d %h %h", m_user, m_addr, m_len);
                $fdisplay(fp, "%d %h %h", m_user, m_addr, m_len);
                if ( m_user == 4096 ) begin
                    $finish;
                end
            end
            
            m_ready <= RAND_BUSY ? {$random()} : 1;
        end
    end
    

    
    
endmodule


`default_nettype wire


// end of file
