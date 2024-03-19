`include "shift_reg_4bit.v"     //shift_reg_4bit(d, clk, rst, q);

module test_shift_reg_4bit();

    reg clk, d, rst;
    reg [0:15] sequence;
    wire [3:0] outp;
    integer i;

    shift_reg_4bit shr( d, clk, rst, outp );

    initial 
        begin

            d = 0;
            rst = 0;
            sequence = 16'b0101_0001_1111_1011;

            for (i = 0; i <= 15 ; i = i + 1 ) begin
                 d = sequence[i];
                 #2 clk = 1;
                 #2 clk = 0;
            end
        end

    always @(posedge clk  or negedge rst) begin
        $display( "d = ",d," clk =  ", clk, " outp = %b ",outp , " time = ", $time);
    end
endmodule