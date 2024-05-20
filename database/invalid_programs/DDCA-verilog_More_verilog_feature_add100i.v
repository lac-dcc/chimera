// This program was cloned from: https://github.com/BriceLucifer/DDCA-verilog
// License: MIT License

module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );

    assign sum[0] = a[0]^b[0]^cin;
    assign cout[0] = a[0]&b[0] | a[0]&cin | b[0]&cin;
    // 不断移动位置
    always @(*)begin
        for(integer i = 1;i<100;i++)begin
            sum[i] = a[i]^b[i]^cout[i-1];
            cout[i] = a[i]&b[i] | a[i]&cout[i-1] | b[i]&cout[i-1]; 
        end
    end

endmodule