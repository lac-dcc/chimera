// This program was cloned from: https://github.com/RockingSNP/Verilog
// License: MIT License

module decoder3to8 (
    input a,b,c,
    output [7:0] y
);
    assign y[0] = ((~a)&(~b)&(~c));
    assign y[1] = ((~a)&(~b)&(c));
    assign y[2] = ((~a)&(b)&(~c));
    assign y[3] = ((~a)&(b)&(c));
    assign y[4] = ((a)&(~b)&(~c));
    assign y[5] = ((a)&(~b)&(c));
    assign y[6] = ((a)&(b)&(~c));
    assign y[7] = ((a)&(b)&(c));

endmodule //decoder

module tb_decoder3to8(
    output reg a,b,c,
    input [7:0] y
);
    initial begin
		$monitor("%t, When a=%b, b=%b c=%b then Result is =%b",$time,a,b,c,y);
           {a,b,c} = 3'b000;
        #10{a,b,c} = 3'b001;
        #10{a,b,c} = 3'b010;
        #10{a,b,c} = 3'b011;
        #10{a,b,c} = 3'b100;
        #10{a,b,c} = 3'b101;
        #10{a,b,c} = 3'b110;
        #10{a,b,c} = 3'b111;
        #10 $finish;
	end

endmodule//testbench

module wb;
    wire a,b,c;
    wire [7:0] y;
    initial begin
        $dumpfile("1bit_3to8_decoder.vcd");
        $dumpvars(0, wb);
    end
    decoder3to8 dut(a,b,c,y);
    tb_decoder3to8 tb(a,b,c,y);
endmodule //workbench