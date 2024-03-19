module alu_testbench;

// input and output test signals
reg [31:0] rs, rt; 
reg [4:0] shamt;
reg [5:0] funct;

wire [31:0] rd;

// creating the instance of the module we want to test
alu alu(rs, rt, shamt, funct, rd);

initial
begin
rs = 32'b00000000000000000000000000000000;
rt = 32'b00000000000000000000000000000001;
funct = 6'b100000; //add
#5; // pause (5 units of delay)
rs = 32'b00000000000000000000000000000111;
rt = 32'b00000000000000000000000000000011;
funct = 6'b100010; //subtract
#5;
rt = 32'b00000000000000000000000000001000;
shamt = 5'b00010; // shift amount
funct = 6'b000010; //shift right logical
#5
rs = 32'b00000000000000000000000000001011;
rt = 32'b00000000000000000000000000000001;
funct = 6'b100000; //add
#5
rs = 32'b00000000000000000000000000000000;
rt = 32'b00000000000000000000000000000001;
funct = 6'b100010; //subtract
#5;
rt = 32'b00000000000000000000000000001101;
shamt = 5'b00001; // shift amount
funct = 6'b000010; //shift right logical
end

// print signal values on every change
initial
$monitor("rs = %b rt = %b shamt = %b funct = %b rd = %b", rs, rt, shamt, funct, rd);

initial
$dumpvars;

endmodule
