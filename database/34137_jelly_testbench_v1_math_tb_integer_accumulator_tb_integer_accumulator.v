// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_integer_accumulator();
    localparam RATE    = 1000.0/200.0;
    
    initial begin
        $dumpfile("tb_integer_accumulator.vcd");
        $dumpvars(0, tb_integer_accumulator);
        
        #100000;
            $finish;
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100.5)   reset = 1'b0;
    
    reg     cke = 1'b1;
    always @(posedge clk)   cke <= {$random()};
    
    
    parameter                           SIGEND            = 1;
    parameter                           ACCUMULATOR_WIDTH = 64;
    parameter                           DATA_WIDTH        = 32;
    parameter                           UNIT_WIDTH        = 16;
    parameter   [ACCUMULATOR_WIDTH-1:0] INIT_VALUE        = 0;
    
    reg                                 set = 0;
    reg                                 add = 0;
    wire                                busy;
    
    reg     [DATA_WIDTH-1:0]            data;
    
    wire    [ACCUMULATOR_WIDTH-1:0]     accumulator;
    
    reg     [ACCUMULATOR_WIDTH-1:0]     exp_acc;
    
    wire    signed  [DATA_WIDTH-1:0]        s_data = data;
    reg     signed  [ACCUMULATOR_WIDTH-1:0] s_exp_acc;
    
    
    // アキュムレータ
    jelly_integer_accumulator
            #(
                .SIGEND             (SIGEND),
                .ACCUMULATOR_WIDTH  (ACCUMULATOR_WIDTH),
                .DATA_WIDTH         (DATA_WIDTH),
                .UNIT_WIDTH         (UNIT_WIDTH)
            )
        i_integer_accumulator
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .set                (set),
                .add                (add),
                .busy               (busy),
                
                .data               (data),
                
                .accumulator        (accumulator)
            );
    
    always @(posedge clk) begin
        if ( reset ) begin
            set      <= 1;
            add      <= 0;
            data     <= 0;
            exp_acc  <= 0;
        end
        else if ( cke ) begin
            set  <= 0;
            add  <= {$random};
            data <= {$random};
            
            if ( set ) begin
                exp_acc   <= data;
                s_exp_acc <= s_data;
            end
            else if ( add ) begin
                exp_acc   <= exp_acc + data;
                s_exp_acc <= s_exp_acc + s_data;
            end
        end
    end
    
    wire match   = (accumulator == exp_acc);
    wire s_match = (accumulator == s_exp_acc);
    
    wire ok    = match ^ busy;
    wire s_ok  = s_match ^ busy;
    
    
endmodule


`default_nettype wire


// end of file
