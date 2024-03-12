module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
	
	wire [7:0] min_temp1;
	wire [7:0] min_temp2;
    // assign intermediate_result1 = compare? true: false;
    assign min_temp1 = (a <= b) ? a : b;
    assign min_temp2 = (c <= d) ? c : d;
    assign min = (min_temp1 <= min_temp2) ? min_temp1 : min_temp2;
endmodule
