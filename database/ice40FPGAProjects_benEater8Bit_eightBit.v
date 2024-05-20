// This program was cloned from: https://github.com/jasonkaufmann/ice40FPGAProjects
// License: MIT License

module eightBit (
    input fastClk,
    input pushButttonClock, 
    input clockChooser,
    input rst //global reset
);

wire clk;
wire hlt, mi, ri, ro, io, ii, ai, ao, sumo, sub, bi, oi, ce, co, j;
wire [7:0] a;
wire [7:0] b;
wire slowClk;
wire pressClk;
wire [7:0] dataBus;

// INSTANTIATE THE CLOCK //
clock mainClock (.fastClk(fastClk), .pushButttonClock(pushButttonClock), .slowClk(slowClk), .pressClk(pressClk));
assign clk = (clockChooser ? slowClk : pressClk) & !hlt;


// MAKE THE PROGRAM COUNTER //
wire [3:0] countOut;
programCounter pc (.clk(clk), .jump(j), .countEnable(ce), .jumpAddr(dataBus[3:0]), .addr(countOut));
assign dataBus = co ? {4'h0, countOut} : 8'hZZ;


// MAKE THE DECODER LOGIC //
wire [7:0] insnOut;
decoder controlLogic(.insn(insnOut), .clk(clk), .rst(rst), .hlt(hlt), .mi(mi),
.ri(ri), .ro(ro), .io(io), .ii(ii), .ai(ai), .ao(ao), .sumo(sumo), .sub(sub), 
.bi(bi), .oi(oi), .ce(ce), .co(co), .j(j));

// MAKE THE A REGISTER //
wire [7:0] aOut;
register #(.n(8)) aRegister (.clk(clk), .data(dataBus), .load(ai), .rst(rst), .dataOut(a));
assign dataBus = ao ? a : 8'hZZ;

// MAKE THE B REGISTER //
register #(.n(8)) bRegister (.clk(clk), .data(dataBus), .load(bi), .rst(rst), .dataOut(b));

// MAKE THE INSTRUCTION REGISTER //

register #(.n(8)) insnRegister (.clk(clk), .data(dataBus), .load(ii), .dataOut(insnOut), .rst(rst));
assign dataBus = io ? insnOut : 8'hZZ;


// MAKE THE MEMORY ADDRESS REGISTER //
wire [3:0] memAddress;
register #(.n(4)) memAddressRegister (.clk(clk), .data(dataBus[3:0]), .load(mi), .dataOut(memAddress), .rst(rst));

// MAKE THE RAM //
wire [7:0] ramOut;
ram ram (.clk(clk), .w_en(ri), .address(memAddress), .w_data(dataBus), .r_data(ramOut));

assign dataBus = ro ? ramOut : 8'hZZ;

// MAKE THE ALU //
wire [7:0] aluOut;
alu alu (.a(a), .b(b), .sub(sub), .out(aluOut));

assign dataBus = sumo ? aluOut : 8'hZZ;

// MAKE THE OUPTUT REGISTER //
// I need to get some seven segment displays first before doing this
// display disp (); 

endmodule