`timescale 1ns / 1ps

module Alu_Testbench;

    reg [5:0] alufn;
    reg [31:0] a;
    reg [31:0] b;

    wire [31:0] alu;
    wire z;
    wire v;
    wire n;

    reg [31:0] expected;
    wire [31:0] isCorrect;

    Alu alu_inst_0( .alufn(alufn), .a(a), .b(b), .alu(alu), .z(z), .v(v), .n(n));

    initial begin
        
        // Add
        alufn = 6'b000000;
        
        a = 32'hffffff68; 
        b = 32'hffffff34; 
        expected = 32'hffffff34; 
        #20
        
        a = 32'hffffffff; 
        b = 32'h00000000; 
        expected = 32'hffffffff; 
        #20
        
        a = 32'haaaaaaaa; 
        b = 32'haaaaaaaa; 
        expected = 32'hffffff34; 
        #20
        
        // Subtract
        alufn = 6'b000001;
        
        a = 32'hffffff68; 
        b = 32'hffffff34; 
        expected = 32'h00000034; 
        #20
        
        a = 32'h00000000; 
        b = 32'hffffff34; 
        expected = 32'h000000cc; 
        #20
        
        a = 32'hffffffff; 
        b = 32'hffffff34; 
        expected = 32'h000000cb; 
        #20
        
        // MUL
        alufn = 6'b000010;
        
        a = 32'hffffff68; 
        b = 32'hffffff34; 
        expected = 32'h00000034; 
        #20
        
        a = 32'h00000000; 
        b = 32'hffffff34; 
        expected = 32'h000000cc; 
        #20
        
        a = 32'hffffffff; 
        b = 32'hffffff34; 
        expected = 32'h000000cb; 
        #20
        
        // AND
        alufn = 6'b011000;
        
        a = 32'hffffff68; 
        b = 32'hffffff34; 
        expected = 32'h00000034; 
        #20
        
        a = 32'h00000000; 
        b = 32'hffffff34; 
        expected = 32'h000000cc; 
        #20
        
        a = 32'hffffffff; 
        b = 32'hffffff34; 
        expected = 32'h000000cb; 
        #20
        
        // OR
        alufn = 6'b011110;
        
        a = 32'hffffff68; 
        b = 32'hffffff34; 
        expected = 32'h00000034; 
        #20
        
        a = 32'h00000000; 
        b = 32'hffffff34; 
        expected = 32'h000000cc; 
        #20
        
        a = 32'hffffffff; 
        b = 32'hffffff34; 
        expected = 32'h000000cb; 
        #20
        
        // XOR
        alufn = 6'b010110;
        
        a = 32'hffffff68; 
        b = 32'hffffff34; 
        expected = 32'h00000034; 
        #20
        
        a = 32'h00000000; 
        b = 32'hffffff34; 
        expected = 32'h000000cc; 
        #20
        
        a = 32'hffffffff; 
        b = 32'hffffff34; 
        expected = 32'h000000cb; 
        #20
        
        // LDR
        alufn = 6'b011010;
        
        a = 32'hffffff68; 
        b = 32'hffffff34; 
        expected = 32'h00000034; 
        #20
        
        a = 32'h00000000; 
        b = 32'hffffff34; 
        expected = 32'h000000cc; 
        #20
        
        a = 32'hffffffff; 
        b = 32'hffffff34; 
        expected = 32'h000000cb; 
        #20
        
        // SHL
        alufn = 6'b100000;
        
        a = 32'hffffff68; 
        b = 32'hffffff34; 
        expected = 32'h00000034; 
        #20
        
        a = 32'h00000000; 
        b = 32'hffffff34; 
        expected = 32'h000000cc; 
        #20
        
        a = 32'hffffffff; 
        b = 32'hffffff34; 
        expected = 32'h000000cb; 
        #20

        // SHR
        alufn = 6'b100001;
        
        a = 32'hffffff68; 
        b = 32'hffffff34; 
        expected = 32'h00000034; 
        #20
        
        a = 32'h00000000; 
        b = 32'hffffff34; 
        expected = 32'h000000cc; 
        #20
        
        a = 32'hffffffff; 
        b = 32'hffffff34; 
        expected = 32'h000000cb; 
        #20

        // SHA
        alufn = 6'b100011;
        
        a = 32'hffffff68; 
        b = 32'h00000008; 
        expected = 32'h00000034; 
        #20
        
        a = 32'h00000000; 
        b = 32'hffffff34; 
        expected = 32'h000000cc; 
        #20
        
        a = 32'hffffffff; 
        b = 32'hffffff34; 
        expected = 32'h000000cb; 
        #20


        // CMPEQ
        alufn = 6'b110011;
        
        a = 32'hffffff68; 
        b = 32'hffffff34; 
        expected = 32'h00000034; 
        #20
        
        a = 32'h0a0a0a0a; 
        b = 32'h0a0a0a0a; 
        expected = 32'h000000cc; 
        #20
        
        a = 32'hffffffff; 
        b = 32'hffffff34; 
        expected = 32'h000000cb; 
        #20

        // CMPLT
        alufn = 6'b110101;
        
        a = 32'hff00ffff; 
        b = 32'hffffff34; 
        expected = 32'h00000034; 
        #20
        
        a = 32'h00000000; 
        b = 32'hffffff34; 
        expected = 32'h000000cc; 
        #20
        
        a = 32'hffffffff; 
        b = 32'hffffff34; 
        expected = 32'h000000cb; 
        #20

        // CMPLE
        alufn = 6'b110111;
        
        a = 32'hfff00fff; 
        b = 32'hffffff34; 
        expected = 32'h00000034; 
        #20
        
        a = 32'h00000000; 
        b = 32'hffffff34; 
        expected = 32'h000000cc; 
        #20
        
        a = 32'hffffffff; 
        b = 32'hffffffff; 
        expected = 32'h000000cb; 
    end

    assign isCorrect = (expected == alu);
endmodule
