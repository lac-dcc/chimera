
`timescale 1ns / 1ps
`default_nettype none


module tb_data_spliter();
    localparam RATE    = 10.0;
    
    initial begin
        $dumpfile("tb_data_spliter.vcd");
        $dumpvars(0, tb_data_spliter);
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
    
    parameter   NUM        = 4;
    parameter   DATA_WIDTH = 32;
    parameter   S_REGS     = 1;
    parameter   M_REGS     = 1;
    
    reg                             cke = 1;
    
    reg     [NUM*DATA_WIDTH-1:0]    s_data;
    reg                             s_valid;
    wire                            s_ready;
    
    wire    [NUM*DATA_WIDTH-1:0]    m_data;
    wire    [NUM-1:0]               m_valid;
    reg     [NUM-1:0]               m_ready = {NUM{1'b1}};
    
    integer     i;
    always @(posedge clk) begin
        if ( reset ) begin
            for ( i = 0; i < NUM; i = i+1 ) begin
                s_data[i*DATA_WIDTH +: DATA_WIDTH] <= (i << (DATA_WIDTH/2));
                s_valid <= 1'b0;
            end
        end
        else begin
            if ( s_valid && s_ready ) begin
                for ( i = 0; i < NUM; i = i+1 ) begin
                    s_data[i*DATA_WIDTH +: DATA_WIDTH] <= s_data[i*DATA_WIDTH +: DATA_WIDTH] + 1;
                end
            end
            
            if ( !s_valid || s_ready ) begin
                s_valid <= {$random()};
            end
        end
    end
    
    always @(posedge clk) begin
        for ( i = 0; i < NUM; i = i+1 ) begin
            m_ready[i] <= {$random()};
        end
    end
    
    integer     fp  [0:NUM-1];
    initial begin
        fp[0] = $fopen("out0.txt", "w");
        fp[1] = $fopen("out1.txt", "w");
        fp[2] = $fopen("out2.txt", "w");
        fp[3] = $fopen("out3.txt", "w");
    end
    
    always @(posedge clk) begin
        for ( i = 0; i < NUM; i = i+1 ) begin
            if ( m_valid[i] && m_ready[i] ) begin
                $fdisplay(fp[i], "%h", m_data[i*DATA_WIDTH +: DATA_WIDTH]);
            end
        end
    end
    
    
    jelly_data_spliter
            #(
                .NUM            (NUM),
                .DATA_WIDTH     (DATA_WIDTH),
                .S_REGS         (S_REGS),
                .M_REGS         (M_REGS)
            )
        i_data_spliter
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data         (s_data),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                
                .m_data         (m_data),
                .m_valid        (m_valid),
                .m_ready        (m_ready)
            );
    
    
endmodule


`default_nettype wire


// end of file
