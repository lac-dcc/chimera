`include "../defs.v"
module wb(/*autoport*/
//output
          reg_we,
          data_o,
//input
          mem_access_op,
          mem_access_sz,
          mem_data_i,
          addr_i,
          data_i,
          reg_addr_i,
          exception_det,
          flag_unsigned);

input wire[1:0] mem_access_op;
input wire[2:0] mem_access_sz;
input wire[31:0] mem_data_i;
input wire[31:0] addr_i;
input wire[31:0] data_i;
input wire[4:0] reg_addr_i;
input wire exception_det;
input wire flag_unsigned;

output wire reg_we;
output reg[31:0] data_o;

reg[7:0] data_i_byte;
reg[15:0] data_i_half;
wire[7:0] sign_byte,sign_half;
wire[4:0] left_shift, right_shift;
wire[31:0] left_mask, right_mask;

assign sign_half = {data_i_half[15],data_i_half[15],data_i_half[15],data_i_half[15],
    data_i_half[15],data_i_half[15],data_i_half[15],data_i_half[15]};
assign sign_byte = {data_i_byte[7],data_i_byte[7],data_i_byte[7],data_i_byte[7],
    data_i_byte[7],data_i_byte[7],data_i_byte[7],data_i_byte[7]};
assign left_shift = ((2'd3 - addr_i[1:0])<<3);
assign right_shift = (addr_i[1:0]<<3);
assign left_mask = {32{1'b1}}<<left_shift;
assign right_mask = {32{1'b1}}>>right_shift;

assign reg_we = ~exception_det && ((mem_access_op==`ACCESS_OP_M2R)||(mem_access_op==`ACCESS_OP_D2R));

always @(*) begin
    data_i_half = addr_i[1] ? mem_data_i[31:16] : mem_data_i[15:0];
    case(addr_i[1:0])
    2'b11: begin data_i_byte = mem_data_i[31:24]; end
    2'b10: begin data_i_byte = mem_data_i[23:16]; end
    2'b01: begin data_i_byte = mem_data_i[15:8]; end
    2'b00: begin data_i_byte = mem_data_i[7:0]; end
    endcase
end

always @(*) begin
    case(mem_access_op)
    `ACCESS_OP_M2R: begin
        if(mem_access_sz==`ACCESS_SZ_WORD)
            data_o = mem_data_i;
        else if(mem_access_sz==`ACCESS_SZ_HALF)
            data_o = flag_unsigned ? {16'b0,data_i_half} : {sign_half,sign_half,data_i_half};
        else if(mem_access_sz==`ACCESS_SZ_LEFT) 
            data_o = (mem_data_i<<left_shift) | data_i & ~left_mask;
        else if(mem_access_sz==`ACCESS_SZ_RIGHT)
            data_o = (mem_data_i>>right_shift) | data_i & ~right_mask;
        else if(mem_access_sz==`ACCESS_SZ_BYTE)
            data_o = flag_unsigned ? {24'b0,data_i_byte} : {sign_byte,sign_byte,sign_byte,data_i_byte};
        else
            data_o = 32'b0;
    end
    default: begin
        data_o = data_i;
    end
    endcase
end

endmodule
