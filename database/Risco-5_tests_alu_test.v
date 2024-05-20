// This program was cloned from: https://github.com/JN513/Risco-5
// License: CERN Open Hardware Licence Version 2 - Permissive

module alu_tb();

reg [31:0] input_A, input_B;
wire [31:0] res;
reg [3:0] operation;
reg clk;
wire zr;


ALU u1(
    .operation(operation),
    .ALU_in_X(input_A),
    .ALU_in_Y(input_B),
    .ALU_out_S(res),
    .ZR(zr)
);

initial begin
    $dumpfile("build/alu.vcd");
    $dumpvars;
    clk = 0;
    operation = 4'b0000;

    #10

    $display("Teste soma: \n");

    input_A = 32'd2565;
    input_B = 32'd1560;
    operation = 4'b0010;

    #1

    $display("resultado %d", res);
    if(res == 32'd4125) begin
        $display("Correto");
    end else begin
        $display("Incorreto");
    end

    #1

    $display("\nTeste AND: \n");

    input_A = 32'd2565;
    input_B = 32'd1560;
    operation = 4'b0000;

    #1

    $display("primeiro: %b", input_A);
    $display("segundo:  %b", input_B);
    $display("resultado %b", res);

    if(res == 32'b00000000000000000000001000000000) begin
        $display("Correto");
    end else begin
        $display("Incorreto");
    end

    #1

    $display("Teste subtração: \n");

    input_A = 32'd2565;
    input_B = 32'd1560;
    operation = 4'b0110;

    #1

    $display("resultado %d", res);
    if(res == 32'd1005) begin
        $display("Correto");
    end else begin
        $display("Incorreto");
    end

    #1

    $display("Teste subtração 2: \n");

    input_A = 32'd2565;
    input_B = -3560;
    operation = 4'b0110;

    #1

    $display("resultado %d", res);
    if(res == 32'd6125) begin
        $display("Correto");
    end else begin
        $display("Incorreto");
    end

    #1

    $display("Teste subtração 3: \n");

    input_A = 32'd2565;
    input_B = 32'd3560;
    operation = 4'b0110;

    #1

    $display("resultado %d", res);
    if(res == 32'd4294966301) begin
        $display("Correto");
    end else begin
        $display("Incorreto");
    end

    #1

    $display("\nTeste OR: \n");

    input_A = 32'd2565;
    input_B = 32'd1560;
    operation = 4'b0001;

    #1

    $display("primeiro: %b", input_A);
    $display("segundo:  %b", input_B);
    $display("resultado %b", res);

    if(res == 32'b00000000000000000000111000011101) begin
        $display("Correto");
    end else begin
        $display("Incorreto");
    end

    #1

    $display("\nTeste NOR: \n");

    input_A = 32'd2565;
    input_B = 32'd1560;
    operation = 4'b1100;

    #1

    $display("primeiro: %b", input_A);
    $display("segundo:  %b", input_B);
    $display("resultado %b", res);

    if(res == 32'b11111111111111111111000111100010) begin
        $display("Correto");
    end else begin
        $display("Incorreto");
    end

    #1

    $display("\nTeste SLT: \n");

    input_A = 32'd2565;
    input_B = 32'd1560;
    operation = 4'b0111;

    #1

    $display("primeiro: %b", input_A);
    $display("segundo:  %b", input_B);
    $display("resultado %b", res);

    if(res == 32'h0) begin
        $display("Correto");
    end else begin
        $display("Incorreto");
    end

end
    
endmodule
