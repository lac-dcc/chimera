`include "../defs.v"
module reg_val_mux(/*autoport*/
//output
         value_o,
//input
         reg_addr,
         value_from_regs,
         addr_from_ex,
         value_from_ex,
         access_op_from_ex,
         addr_from_mm,
         value_from_mm,
         access_op_from_mm,
         addr_from_wb,
         value_from_wb,
         write_enable_from_wb);

input wire[4:0] reg_addr;

input wire[31:0] value_from_regs;

input wire[4:0] addr_from_ex;
input wire[31:0] value_from_ex;
input wire[1:0] access_op_from_ex;

input wire[4:0] addr_from_mm;
input wire[31:0] value_from_mm;
input wire[1:0] access_op_from_mm;

input wire[4:0] addr_from_wb;
input wire[31:0] value_from_wb;
input wire write_enable_from_wb;

output reg[31:0] value_o;

always @(*) begin
    if(reg_addr == 5'b0)
        value_o <= 32'b0;
    else if(reg_addr == addr_from_ex && access_op_from_ex == `ACCESS_OP_D2R)
        value_o <= value_from_ex;
    else if(reg_addr == addr_from_mm && (access_op_from_mm == `ACCESS_OP_D2R || access_op_from_mm == `ACCESS_OP_M2R))
        value_o <= value_from_mm;
    else if(reg_addr == addr_from_wb && write_enable_from_wb)
        value_o <= value_from_wb;
    else
        value_o <= value_from_regs;
end

endmodule