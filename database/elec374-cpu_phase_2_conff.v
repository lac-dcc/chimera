// This program was cloned from: https://github.com/conboy/elec374-cpu
// License: MIT License

module conff(input [31:0] bus, input [3:0] c2, input con_enable, output reg condition);

    wire norGate, equals0, not0, greatereq0, less0, orGate;
    wire [3:0] c2Decoded;

    initial begin
        condition = 1'b0;
    end

    assign norGate =  ~|bus;

	decoder2to4 decoder1(c2[1:0], c2Decoded);


	assign equals0 = norGate & c2Decoded[0];
	assign not0 = !norGate & c2Decoded[1];
	assign greatereq0 = !bus[31] & c2Decoded[2];
	assign less0 = bus[31] & c2Decoded[3];

	assign orGate = equals0 | not0 | greatereq0 | less0;
	
    //d flip flop
    always @(con_enable) begin
        condition <= orGate;
    end
endmodule
	


module decoder2to4(input [1:0] bitsIn, output reg [3:0] bitsOut);

always @(*) begin
    
    bitsOut = 4'b0;

    

    case (bitsIn)
        2'b00: bitsOut[0] = 1'b1;
        2'b01: bitsOut[1] = 1'b1;
        2'b10: bitsOut[2] = 1'b1;
        2'b11: bitsOut[3] = 1'b1;
    endcase
end

endmodule

