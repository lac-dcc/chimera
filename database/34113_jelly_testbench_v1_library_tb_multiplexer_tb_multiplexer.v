// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_multiplexer();
    localparam RATE    = 1000.0/200.0;
    
    initial begin
        $dumpfile("tb_multiplexer.vcd");
        $dumpvars(0, tb_multiplexer);
        
        #100000;
            $finish;
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    initial #(RATE*100.5)   reset = 1'b0;
    
    parameter   SEL_WIDTH  = 4;
    parameter   DATA_WIDTH = 16;
    
    reg     [SEL_WIDTH-1:0]     sel;
    reg     [DATA_WIDTH-1:0]    data;
    
    always @(posedge clk) begin
        if ( reset ) begin
            sel  <= 0;
            data <= 0;
        end
        else begin
            sel  <= {$random()};
            data <= {$random()};
        end
    end
    
    wire    result0;
    wire    result1;
    
    wire    result_ok = (result0 == result1);
    
    jelly_multiplexer16
            #(
                .DEVICE ("RTL")
            )
        i_multiplexer16_rtl
            (
                .o      (result0),
                .i      (data),
                .s      (sel)
            );
    
    jelly_multiplexer16
            #(
                .DEVICE ("7SERIES")
            )
        i_multiplexer16_lut
            (
                .o      (result1),
                .i      (data),
                .s      (sel)
            );
    
    
endmodule


`default_nettype wire


// end of file
