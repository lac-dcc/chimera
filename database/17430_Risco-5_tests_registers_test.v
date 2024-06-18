// This program was cloned from: https://github.com/JN513/Risco-5
// License: CERN Open Hardware Licence Version 2 - Permissive

module registers_tb ();
    
wire [31:0] read_data_1, read_data_2;
reg [31:0] write_data;
reg [4:0] read_reg_1, read_reg_2, write_reg;
reg clk, reg_write;
integer i;

always #1 clk = ~clk;

Registers Registers(
    .clk(clk),
    .regWrite(reg_write),
    .writeData(write_data),
    .readData1(read_data_1),
    .readData2(read_data_2),
    .writeRegister(write_reg),
    .readRegister1(read_reg_1),
    .readRegister2(read_reg_2)
);

initial begin
    $dumpfile("build/registers.vcd");
    $dumpvars;
    
    clk = 0;
    read_reg_1 = 0;
    read_reg_2 = 32'h1;

    #2

    $display("lendo estado inicial de dois registradores");

    if(read_data_1 == 32'h00000000) begin
        $display("reg 1 correto");
    end

    if(read_data_2 == 32'h00000000) begin
        $display("reg 2 correto");
    end

    $display("Escrevendo nos registradores");

    for(i = 0; i < 32; i = i + 1) begin
        write_reg = i;
        write_data = i;

        #1

        reg_write = 1'b1;

        #1

        reg_write = 1'b0;
    end

    $display("Lendo registradores");

    for(i = 0; i < 32; i = i + 1) begin
        read_reg_1 = i;

        #1

        if(read_data_1 == i) begin
            $display("Resultado %d correto", i);
        end else begin
            $display("Resultado %d incorreto", i);
        end
    end

    $finish;
end

endmodule
