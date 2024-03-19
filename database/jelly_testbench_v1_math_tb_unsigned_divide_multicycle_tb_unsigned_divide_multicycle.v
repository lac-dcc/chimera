
`timescale 1ns / 1ps
`default_nettype none


module tb_unsigned_divide_multicycle();
    localparam RATE    = 1000.0/200.0;
    
    initial begin
        $dumpfile("tb_unsigned_divide_multicycle.vcd");
        $dumpvars(0, tb_unsigned_divide_multicycle);
        
        #100000;
            $finish;
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100.5)   reset = 1'b0;
    
    parameter   DATA_WIDTH = 32;
    
    reg                          cke = 1'b1;
    
    reg     [DATA_WIDTH-1:0]    s_data0 = 7;
    reg     [DATA_WIDTH-1:0]    s_data1 = 2;
    reg                         s_valid = 1;
    wire                        s_ready;
    
    wire    [DATA_WIDTH-1:0]    m_quotient;
    wire    [DATA_WIDTH-1:0]    m_remainder;
    wire                        m_valid;
    wire                        m_ready = 1'b1;
    
    wire    [DATA_WIDTH-1:0]    exp_quotient;
    wire    [DATA_WIDTH-1:0]    exp_remainder;
    
    always @(posedge clk) begin
        if ( s_valid & s_ready ) begin
            s_data0 <= {$random()};
            s_data1 <= {$random()} + 1;
        end
        
        if ( m_valid & m_ready ) begin
//            $display("%d %d", exp_quotient, exp_remainder);
//            $display("%d %d", m_quotient, m_remainder);
        end
    end
    
    jelly_unsigned_divide_multicycle
            #(
                .DATA_WIDTH     (DATA_WIDTH)
            )
        i_unsigned_divide_multicycle
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .s_data0        (s_data0),
                .s_data1        (s_data1),
                .s_valid        (s_valid),
                .s_ready        (s_ready),
                
                .m_quotient     (m_quotient),
                .m_remainder    (m_remainder),
                .m_valid        (m_valid),
                .m_ready        (m_ready)
            );
    
    
    jelly_cpu_divider
            #(
                .DATA_WIDTH     (DATA_WIDTH)
            )
        i_cpu_divider
            (
                .reset              (reset),
                .clk                (clk),
                
                .op_div             (s_valid & s_ready),
                .op_signed          (1'b0),
                .op_set_remainder   (1'b0),
                .op_set_quotient    (1'b0),
                
                .in_data0           (s_data0),
                .in_data1           (s_data1),
                
                .out_en             (),
                .out_quotient       (exp_quotient),
                .out_remainder      (exp_remainder),
                
                .busy               ()
            );
    
    wire quotient_ng  = m_valid & (exp_quotient != m_quotient);
    wire remainder_ng = m_valid & (exp_remainder != m_remainder);
    
endmodule


`default_nettype wire


// end of file
