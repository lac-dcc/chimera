// This program was cloned from: https://github.com/Shiva9361/Simple_Processor
// License: MIT License

module datapath(clk);
input clk;
wire [31:0] pc_wire, instruction,write_data,read_data1,read_data2,alu_output,memory_out,alu_2_input,immediate;
wire mem_read,mem_to_reg,reg_write,mem_write,alu_src;
wire [6:0] alu_control_s;
program_counter pc(pc_wire,clk);

instruction_memory instructionMemory(pc_wire,instruction,clk);
data_memory dataMemory(mem_write,alu_output,memory_out,read_data2,clk);

alu_control alucontrol(instruction,alu_control_s);
ALU alu(alu_control_s,read_data1,alu_2_input,alu_output);

assign immediate = (instruction[6:0] == 7'b0000011) ? instruction[31:20] : {instruction[31:25],instruction[11:7]}; 
control_path control(instruction[6:0],mem_read,mem_to_reg,reg_write,mem_write,alu_src,clk);  

assign alu_2_input = alu_src ? immediate : read_data2;
assign write_data = mem_to_reg ? memory_out : alu_output;
register_file reg_file(write_data,instruction[19:15],instruction[24:20],instruction[11:7],reg_write,read_data1,read_data2,clk); 

endmodule

module datapath_tb();
reg clk;
datapath dp(clk);

initial begin
    
    #100 clk = 0;
    #100 clk = 1;
    #100 clk = 0;
    #100 clk = 1;
    #100 clk = 0;
    #100 clk = 1;
    #100 clk = 0;
    #100 clk = 1;
    #100 clk = 0;
    #100 clk = 1;
    #100 clk = 0;
    #100 clk = 1;
    #100 clk = 0;
    #100 clk = 1;
    #100 clk = 0;
    #100 clk = 1;
end

endmodule