module fulladder_32bit( output[31:0] sum, output cout, input [31:0] num1, input [31:0] num2, input cin );

    assign {cout,sum} = num1+num2+cin;

endmodule