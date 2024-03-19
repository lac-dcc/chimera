module testbench_alu;

// input and output test signals
reg [4:0] rs, rt, rd, shamt;
reg [5:0] funct;

glob glob(); //Initialize 32 32-bit registers to zeros
alu alu(rs, rt, rd, shamt, funct);

initial
begin
glob.r[0] = 32'b00000000000000000000000000000001;
glob.r[1] = 32'b00000000000000000000000000000010;
rs = 5'b00000;
rt = 5'b00001;
rd = 5'b00010;
funct = 6'b100000; //add
#5;
rs = 5'b00000;
rt = 5'b00010;
rd = 5'b00001;
#5;
rt = 5'b00001;
rd = 5'b00010;
shamt = 5'b00010;
funct = 6'b000010; //srl
#5;
rs = 5'b00001;
rt = 5'b00010;
rd = 5'b00000;
funct = 6'b100010; //sub
#5;
rs = 5'b00000;
rt = 5'b00010;
rd = 5'b00001;
funct = 6'b100100; //and
#5;
rs = 5'b00000;
rt = 5'b00001;
rd = 5'b00010;
funct = 6'b100101; //or
#5;
rs = 5'b00001;
rt = 5'b00000;
rd = 5'b00010;
funct = 6'b101010; //slt
#5;
rs = 5'b00000;
rt = 5'b00001;
rd = 5'b00010;
funct = 6'b101010; //slt
end

initial
$monitor("rs = %b rt = %b rd = %b r0 = %b r1 = %b r2 = %b funct = %b shamt = %b", rs, rt, rd, glob.r[0], glob.r[1], glob.r[2], funct, shamt);

initial
$dumpvars;

endmodule
