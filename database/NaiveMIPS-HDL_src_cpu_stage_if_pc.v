module pc(/*autoport*/
//output
      pc_reg,
//input
      rst_n,
      clk,
      enable,
      branch_address,
      is_branch,
      is_exception,
      exception_new_pc,
      is_debug,
      debug_new_pc,
      debug_reset);

parameter PC_INITIAL = 32'hbfc00000;

input wire rst_n;
input wire clk;
input wire enable;

input wire[31:0] branch_address;
input wire is_branch;
input wire is_exception;
input wire[31:0] exception_new_pc;
input wire is_debug;
input wire[31:0] debug_new_pc;
input wire debug_reset;

reg[31:0] pc_next;
output reg[31:0] pc_reg;

always @(*) begin
    if (!rst_n || debug_reset) begin
        pc_next <= PC_INITIAL;
    end
    else if(enable) begin
        if(is_debug) begin
            pc_next <= debug_new_pc;
        end
        else if(is_exception) begin
            pc_next <= exception_new_pc;
        end
        else if(is_branch) begin
            pc_next <= branch_address;
        end
        else begin
            pc_next <= pc_reg+32'd4;
        end
    end else begin 
        pc_next <= pc_reg;
    end
end

always @(posedge clk) 
    pc_reg <= pc_next;

// always @(posedge clk) $display("PC=%x",pc_reg);

endmodule
