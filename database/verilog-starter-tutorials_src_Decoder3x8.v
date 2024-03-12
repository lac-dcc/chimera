module dec(in,ou);
    input [2:0]in;
    output [7:0]ou;
    reg [7:0]ou;
    
    always@(*)
    begin
    case(in)
        3'b000:
	        ou = 8'b00000001;
    
        3'b001:
            ou = 8'b00000010;
    
        3'b010:
            ou = 8'b00000100;
    
        3'b011:
            ou = 8'b00001000;

        3'b100:
            ou = 8'b00010000;
	
        3'b101:
            ou = 8'b00100000;
	
        3'b110:
            ou = 8'b01000000;

        3'b111:
            ou = 8'b10000000;
    endcase
end 
endmodule

module test;
    reg [2:0] inl;
    wire [7:0] ol;

    dec d(inl,ol);

    initial begin
    $display("decoder show");
    $monitor("%b,%b,%b,\t %b,%b,%b,%b,%b,%b,%b,%b",inl[2],inl[1],inl[0],ol[7],ol[6],ol[5],ol[4],ol[3],ol[2],ol[1],ol[0]);
    $dumpfile("vcd/Decoder.vcd");
    $dumpvars(1,test);

        inl = 3'b000;
        #10
        inl = 3'b001;
        #10
        inl = 3'b010;
        #10
        inl = 3'b011;
        #10
        inl = 3'b100;
        #10
        inl = 3'b101;
        #10
        inl = 3'b110;
        #10
        inl = 3'b111;
        #10
    $finish;
    end 
endmodule


