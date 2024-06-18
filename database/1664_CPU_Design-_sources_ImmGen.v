// This program was cloned from: https://github.com/mmohamedkhaled/CPU_Design-
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps

module ImmGen(input [31:0] instructions, output reg [31:0] immediate);
wire [6:0] opcode;
assign opcode=instructions[6:0];
always @ (*) begin
case(opcode)
3:  immediate={20'd0,instructions[31:20]};
19: begin 
    if(instructions [14:12]==3'b001 ||instructions [14:12]==3'b101)   
        immediate={27'd0,instructions[24:20]};
    else
    immediate={20'd0,instructions[31:20]};

end
23: immediate={12'd0,instructions[31:12]};
35: immediate={20'd0,instructions[31:25],instructions[11:7]};
55: immediate ={12'd0,instructions[31:12]};
99: immediate={20'd0,instructions[31],instructions[7],instructions[30:25],instructions[11:8]};
103: immediate={20'd0,instructions[31:20]};
111: immediate={12'd0,instructions[31],instructions[19:12],instructions[20],instructions[30:21]};


endcase
end
endmodule
