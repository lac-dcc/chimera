
`timescale 1ns / 1ps
`default_nettype none


module tb_axi_data_last();
    localparam RATE     = 1000.0/200.0;
    localparam CMD_RATE = 1000.0/100.7;
    
    initial begin
        $dumpfile("tb_axi_data_last.vcd");
        $dumpvars(0, tb_axi_data_last);
        
        #10000000;
            $finish;
    end
    
    
    reg     reset = 1'b1;
    initial #(RATE*100)     reset = 1'b0;
    
    reg     clk = 1'b1;
    always #(RATE/2.0)      clk = ~clk;
    
    reg     cmd_clk = 1'b1;
    always #(CMD_RATE/2.0)  cmd_clk = ~cmd_clk;
    
    
    
    parameter   RAND_BUSY      = 1;
    
    
    parameter   BYPASS         = 0;
    parameter   USER_WIDTH     = 0;
    parameter   DATA_WIDTH     = 64;
    parameter   LEN_WIDTH      = 8;
    parameter   FIFO_ASYNC     = 1;
    parameter   FIFO_PTR_WIDTH = 2;
    parameter   FIFO_RAM_TYPE  = "distributed";
    parameter   S_SLAVE_REGS   = 1;
    parameter   S_MASTER_REGS  = 1;
    parameter   M_SLAVE_REGS   = 1;
    parameter   M_MASTER_REGS  = 1;
    
    parameter   USER_BITS      = USER_WIDTH > 0 ? USER_WIDTH : 1;
    
    wire                        aresetn = ~reset;
    wire                        aclk    = clk;
    reg                         aclken  = 1'b1;
    
    wire                        s_cmd_aresetn = ~reset;
    wire                        s_cmd_aclk    = cmd_clk;
    reg                         s_cmd_aclken;
    reg     [LEN_WIDTH-1:0]     s_cmd_len;
    reg                         s_cmd_valid;
    wire                        s_cmd_ready;
    
    reg     [USER_BITS-1:0]     s_user;
    reg     [DATA_WIDTH-1:0]    s_data;
    reg                         s_valid;
    wire                        s_ready;
    
    wire    [USER_BITS-1:0]     m_user;
    wire                        m_last;
    wire    [DATA_WIDTH-1:0]    m_data;
    wire                        m_valid;
    reg                         m_ready = 1'b1;
    
    jelly_axi_data_last
            #(
                .BYPASS             (BYPASS),
                .USER_WIDTH         (USER_WIDTH),
                .DATA_WIDTH         (DATA_WIDTH),
                .LEN_WIDTH          (LEN_WIDTH),
                .FIFO_ASYNC         (FIFO_ASYNC),
                .FIFO_PTR_WIDTH     (FIFO_PTR_WIDTH),
                .FIFO_RAM_TYPE      (FIFO_RAM_TYPE),
                .S_SLAVE_REGS       (S_SLAVE_REGS),
                .S_MASTER_REGS      (S_MASTER_REGS),
                .M_SLAVE_REGS       (M_SLAVE_REGS),
                .M_MASTER_REGS      (M_MASTER_REGS)
            )
        i_axi_data_last
            (
                .aresetn            (aresetn),
                .aclk               (aclk),
                .aclken             (aclken),
                
                .s_cmd_aresetn      (s_cmd_aresetn),
                .s_cmd_aclk         (s_cmd_aclk),
                .s_cmd_aclken       (s_cmd_aclken),
                .s_cmd_len          (s_cmd_valid ? s_cmd_len : {LEN_WIDTH{1'bx}}),
                .s_cmd_valid        (s_cmd_valid),
                .s_cmd_ready        (s_cmd_ready),
                
                .s_user             (s_valid ? s_user : {USER_BITS{1'bx}}),
                .s_last             (1'b1),
                .s_data             (s_valid ? s_data : {DATA_WIDTH{1'bx}}),
                .s_valid            (s_valid),
                .s_ready            (s_ready),
                
                .m_user             (m_user),
                .m_last             (m_last),
                .m_data             (m_data),
                .m_valid            (m_valid),
                .m_ready            (m_ready)
            );
    
    always @(posedge aclk) begin
        aclken <= RAND_BUSY ? {$random()} : 1;
    end

    always @(posedge s_cmd_aclk) begin
        s_cmd_aclken <= RAND_BUSY ? {$random()} : 1;
    end

    
    integer     fp;
    initial fp = $fopen("out.txt", "w");
    
    
    always @(posedge s_cmd_aclk) begin
        if ( ~s_cmd_aresetn ) begin
            s_cmd_len   <= 0;
            s_cmd_valid <= 1'b0;
        end
        else if ( s_cmd_aclken ) begin
            if ( s_cmd_valid & s_cmd_ready ) begin
                s_cmd_len <= s_cmd_len + 1'b1;
            end
            
            if ( !s_cmd_valid || s_cmd_ready ) begin
                s_cmd_valid <= RAND_BUSY ? {$random()} : 1;
            end
        end
    end
    
    
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            s_user  <= 0;
            s_data  <= 0;
            s_valid <= 1'b0;
        end
        else if ( aclken ) begin
            if ( s_valid && s_ready ) begin
                s_user  <= s_user + 1;
                s_data  <= s_data + 1;
            end
            
            if ( !s_valid || s_ready ) begin
                s_valid = RAND_BUSY ? {$random()} : 1;
            end
            
            
            if ( m_valid && m_ready ) begin
                $display("%h %b", m_data, m_last);
                $fdisplay(fp, "%h %b", m_data, m_last);
                if ( m_data == 65536 ) begin
                    $finish;
                end
            end
            
            m_ready <= RAND_BUSY ? {$random()} : 1;
        end
    end
    
    
endmodule


`default_nettype wire


// end of file
