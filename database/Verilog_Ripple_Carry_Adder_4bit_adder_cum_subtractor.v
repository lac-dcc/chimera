// This program was cloned from: https://github.com/RockingSNP/Verilog
// License: MIT License

//1bitFull Adder Unit for Constructing adder
module full_adder1b(
    input x, y, z,
    output sum, carry);  
    assign sum = x ^ y ^ z;
    assign carry = ((x & y) | (z & x) | (z & y));
endmodule


module adder4b(
    input [3:0] bin1, bin2,
    input cin,
    output [3:0] sum,
    output carry
);  
    
    wire cout1, cout2, cout3;

    full_adder1b adder1(bin1[0], bin2[0]^cin, cin, sum[0], cout1);
    full_adder1b adder2(bin1[1], bin2[1]^cin, cout1, sum[1], cout2);
    full_adder1b adder3(bin1[2], bin2[2]^cin, cout2, sum[2], cout3);
    full_adder1b adder4(bin1[3], bin2[3]^cin, cout3, sum[3], carry);
     
endmodule

module tb_adder4b(
	output reg [3:0] bin1, bin2,
    output reg cin,
	input [3:0]sum,
    input carry
);
	initial begin
		$monitor("%t, When bin1=%b, bin2=%b cin=%b then Result is =%b , Carry =%b",$time,bin1,bin2,cin,sum,carry);
            
		    {bin1,bin2,cin} = 9'b010110100;
		#10 {bin1,bin2,cin} = 9'b001111101;
		#10 {bin1,bin2,cin} = 9'b111100110;
		#10 {bin1,bin2,cin} = 9'b011100011;
		#10 {bin1,bin2,cin} = 9'b000000011;
		#10 {bin1,bin2,cin} = 9'b111100000;
		#10 {bin1,bin2,cin} = 9'b011100011;
		#10 {bin1,bin2,cin} = 9'b011100010;
        #10 $finish;
	end
endmodule

module wb;
    wire [3:0] bin1, bin2, sum ;
    wire cin, carry;
    initial begin
        $dumpfile("4bit_adder_cum_subtractor.vcd");
        $dumpvars(0, wb);
    end
    adder4b dut (bin1,bin2,cin,sum,carry);
    tb_adder4b tb (bin1,bin2,cin,sum,carry);
endmodule