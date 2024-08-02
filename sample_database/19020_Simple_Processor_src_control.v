// This program was cloned from: https://github.com/Shiva9361/Simple_Processor
// License: MIT License

module control_path(opcode,mem_read,mem_to_reg,reg_write,mem_write,alu_src,clk);
input [6:0] opcode;
input clk;
output mem_read,mem_to_reg,reg_write,mem_write,alu_src;
reg mem_read_state,mem_to_reg_state,reg_write_state,mem_write_state,alu_src_state;
initial begin
    mem_read_state = 0;
    mem_to_reg_state = 0;
    reg_write_state = 0;
    mem_write_state = 0;
    alu_src_state = 0;
end

// lw 0000011
// sw 0100011
always @(*) begin
    case(opcode)
        7'b0000011: begin  //load
            mem_read_state = 1;
            mem_to_reg_state = 1;
            reg_write_state = 1;
            mem_write_state = 0;
            alu_src_state = 1;
        end
        7'b0100011: begin //store
            mem_read_state = 0;
            mem_to_reg_state = 0;
            reg_write_state = 0;
            mem_write_state = 1;
            alu_src_state = 1;
        end
        7'b0110011: begin // add sub or and etc..
            mem_read_state = 0;
            mem_to_reg_state = 0;
            reg_write_state = 1;
            mem_write_state = 0;
            alu_src_state = 0;
        end
    endcase
end

assign mem_read = mem_read_state;
assign mem_to_reg = mem_to_reg_state;
assign mem_write = mem_write_state;
assign reg_write = reg_write_state;
assign alu_src = alu_src_state;
endmodule