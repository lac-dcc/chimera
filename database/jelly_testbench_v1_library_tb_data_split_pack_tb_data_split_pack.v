
`timescale 1ns / 1ps
`default_nettype none


module tb_data_split_pack();
    localparam RATE    = 10.0;
    
    initial begin
        $dumpfile("tb_data_split_pack.vcd");
        $dumpvars(0, tb_data_split_pack);
        
    #10000
        $finish();
    end
    
    parameter RAND_BUSY = 1;
    
    reg     reset = 1'b1;
    always #(RATE*100)      reset = 1'b0;
    
    reg     clk = 1'b1;
    always #(RATE/2.0)      clk = ~clk;
    
    reg     cke = 1'b1;
    always @(posedge clk)   cke <= 1; // RAND_BUSY ? {$random} : 1'b1;
    
    
    
    parameter NUM         = 3;
    parameter DATA0_WIDTH = 8;
    parameter DATA1_WIDTH = 16;
    parameter DATA2_WIDTH = 24;
    parameter S_REGS      = 0;
    parameter M_REGS      = 0;
    
    reg     [DATA0_WIDTH-1:0]   s_data0;
    reg     [DATA1_WIDTH-1:0]   s_data1;
    reg     [DATA2_WIDTH-1:0]   s_data2;
    reg                         s_valid;
    wire                        s_ready;
    
    wire    [DATA0_WIDTH-1:0]   m0_data;
    wire                        m0_valid;
    reg                         m0_ready;
    
    wire    [DATA1_WIDTH-1:0]   m1_data;
    wire                        m1_valid;
    reg                         m1_ready;
    
    wire    [DATA2_WIDTH-1:0]   m2_data;
    wire                        m2_valid;
    reg                         m2_ready;
    
    
    integer     i;
    always @(posedge clk) begin
        if ( reset ) begin
            s_data0 <= 1;
            s_data1 <= 2;
            s_data2 <= 3;
            s_valid <= 1'b0;
        end
        else if ( cke ) begin
            if ( !s_valid || s_ready ) begin
                s_valid <= RAND_BUSY ? {$random()} : 1'b1;
            end
            
            if ( s_valid && s_ready ) begin
                s_data0 <= s_data0 + 1;
                s_data1 <= s_data1 + 1;
                s_data2 <= s_data2 + 1;
            end
        end
        
        m0_ready <= RAND_BUSY ? {$random()} : 1'b1;
        m1_ready <= RAND_BUSY ? {$random()} : 1'b1;
        m2_ready <= RAND_BUSY ? {$random()} : 1'b1;
    end
    
    integer     fp0, fp1, fp2;
    initial begin
        fp0 = $fopen("out0.txt", "w");
        fp1 = $fopen("out1.txt", "w");
        fp2 = $fopen("out2.txt", "w");
    end
    
    always @(posedge clk) begin
        if ( cke ) begin
            if ( m0_valid && m0_ready ) $fdisplay(fp0, "%h", m0_data);
            if ( m1_valid && m1_ready ) $fdisplay(fp1, "%h", m1_data);
            if ( m2_valid && m2_ready ) $fdisplay(fp2, "%h", m2_data);
        end
    end
    
    jelly_data_split_pack
            #(
                .NUM            (NUM),
                .DATA0_WIDTH    (DATA0_WIDTH),
                .DATA1_WIDTH    (DATA1_WIDTH),
                .DATA2_WIDTH    (DATA2_WIDTH),
                .S_REGS         (S_REGS),
                .M_REGS         (M_REGS)
            )
        i_data_split_pack
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data0        (s_data0),
                .s_data1        (s_data1),
                .s_data2        (s_data2),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                
                .m0_data        (m0_data),
                .m0_valid       (m0_valid),
                .m0_ready       (m0_ready),
                
                .m1_data        (m1_data),
                .m1_valid       (m1_valid),
                .m1_ready       (m1_ready),
                
                .m2_data        (m2_data),
                .m2_valid       (m2_valid),
                .m2_ready       (m2_ready)
            );
    
    
endmodule


`default_nettype wire


// end of file
