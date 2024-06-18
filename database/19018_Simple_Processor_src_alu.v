// This program was cloned from: https://github.com/Shiva9361/Simple_Processor
// License: MIT License

module ALU(control,input1,input2,out);
input [6:0] control;
input [31:0] input1;
input [31:0] input2;
output [31:0] out;

wire [31:0] mux_input1,mux_input2,mux_input3,mux_input4,mux_input5,mux_input6,mux_input7,mux_input8,mux_input9,mux_input10,mux_input11,mux_input12,mux_input13,mux_input14,mux_input15,mux_input16;

nbitadder adder(input1,input2,mux_input1);
nbitsubtractor subtrator(input1,input2,mux_input2);
nbitxor xorgate(input1,input2,mux_input3);
nbitor orgate(input1,input2,mux_input4);
nbitand andgate(input1,input2,mux_input5);
left_shifter leftshifter(input1,input2,mux_input6);
right_shifter rightshifter(input1,input2,mux_input7);
right_shifter_arith rightshifterarith(input1,input2,mux_input8);
set_less_than setlessthan(input1,input2,mux_input9);
set_less_than_u setlessthanu(input1,input2,mux_input10);

assign mux_input11 =0;
assign mux_input12 =0;
assign mux_input13 =0;
assign mux_input14 =0;
assign mux_input15 =0;
assign mux_input16 =0;

MUX16_1_32 mux(mux_input1,mux_input2,mux_input3,mux_input4,mux_input5,mux_input6,mux_input7,mux_input8,mux_input9,mux_input10,mux_input11,mux_input12,mux_input13,mux_input14,mux_input15,mux_input16,out,control[3:0]);

endmodule

// module ALU_tb();
//     reg [31:0]a,b;
//     reg [6:0] sel;
//     wire [31:0]c;
//     ALU alu(sel,a,b,c);
    
//     initial 
//         begin
//             $monitor("a=%b,b=%b,sel=%b,c=%b",a,b,sel,c);
//             a=32'b0100;b=32'b0100;sel=7'b01;
//         #100    a=32'b0100;b=32'b0100;sel=7'b00;
//         #100    a=32'b0100;b=32'b0100;sel=7'b10;
//         #100    a=32'b1000;b=32'b0100;sel=7'b11;
//          #100    a=32'b10000000000000000000000000000001;b=32'b010;sel=7'b1000;

//         end
// endmodule

module alu_control(instruction,control);
input [31:0] instruction;
output [6:0] control;
// reg control_state;
// always @(instruction) begin
// control_state <= (instruction[6:0] == 7'b0110011) ? (instruction[14:12] == 3'b000) ?(instruction[31:25] == 7'b0000000) ? 7'b0 : 7'b1 : (instruction[14:12] == 3'b100) ? 7'b10 : (instruction[14:12] == 3'b110) ? 7'b11 : (instruction[14:12] == 3'b111) ? 7'b100 :(instruction[14:12] == 3'b001) ? 7'b101 : (instruction[14:12] == 3'b101) ? (instruction[31:25] == 7'b0000000) ? 7'b110 :7'b111: (instruction[14:12] == 3'b010) ? 7'b1000 :7'b1001: 7'b1;
// end
assign control= (instruction[6:0] == 7'b0110011) ? (instruction[14:12] == 3'b000) ?(instruction[31:25] == 7'b0000000) ? 7'b0 : 7'b1 : (instruction[14:12] == 3'b100) ? 7'b10 : (instruction[14:12] == 3'b110) ? 7'b11 : (instruction[14:12] == 3'b111) ? 7'b100 :(instruction[14:12] == 3'b001) ? 7'b101 : (instruction[14:12] == 3'b101) ? (instruction[31:25] == 7'b0000000) ? 7'b110 :7'b111: (instruction[14:12] == 3'b010) ? 7'b1000 :7'b1001: 7'b0;
endmodule