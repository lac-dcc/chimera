`include "../defs.v"
`default_nettype none
module mm(/*autoport*/
//output
          data_o,
          mem_address,
          mem_data_o,
          mem_rd,
          mem_wr,
          mem_byte_en,
          alignment_err,
//input
          mem_access_op,
          mem_access_sz,
          data_i,
          reg_addr_i,
          addr_i,
          flag_unsigned,
          exception_flush);

input wire[1:0] mem_access_op;
input wire[2:0] mem_access_sz;
input wire[31:0] data_i;
input wire[4:0] reg_addr_i;
input wire[31:0] addr_i;
input wire flag_unsigned;
input wire exception_flush;

output wire[31:0] data_o;

output wire[31:0] mem_address;
output reg[31:0] mem_data_o;
output reg mem_rd;
output reg mem_wr;
output reg[3:0] mem_byte_en;
output wire alignment_err;

wire[4:0] left_shift, right_shift;

assign alignment_err = (mem_access_op==`ACCESS_OP_M2R || mem_access_op==`ACCESS_OP_R2M) &&
                        ((mem_access_sz == `ACCESS_SZ_HALF && addr_i[0]!=1'b0) ||
                            (mem_access_sz == `ACCESS_SZ_WORD && addr_i[1:0]!=2'b0));

assign mem_address = addr_i;
assign left_shift = ((2'd3 - addr_i[1:0])<<3);
assign right_shift = (addr_i[1:0]<<3);
assign data_o = data_i;

always @(*) begin
    if(mem_access_sz == `ACCESS_SZ_HALF) begin
        mem_byte_en <= {addr_i[1],addr_i[1],~addr_i[1],~addr_i[1]};
    end else if(mem_access_sz == `ACCESS_SZ_BYTE) begin
        case(addr_i[1:0])
        2'b11: begin mem_byte_en <= 4'b1000; end
        2'b10: begin mem_byte_en <= 4'b0100; end
        2'b01: begin mem_byte_en <= 4'b0010; end
        2'b00: begin mem_byte_en <= 4'b0001; end
        endcase
    end else if(mem_access_sz == `ACCESS_SZ_LEFT) begin
        mem_byte_en <= {addr_i[1]&addr_i[0], addr_i[1], addr_i[1]|addr_i[0], 1'b1};
    end else if(mem_access_sz == `ACCESS_SZ_RIGHT) begin
        mem_byte_en <= {1'b1, ~(addr_i[1]&addr_i[0]), ~addr_i[1], ~(addr_i[1]|addr_i[0])};
    end else begin
        mem_byte_en <= 4'b1111;
    end
end

always @(*) begin
    case(mem_access_op)
    `ACCESS_OP_M2R: begin
        mem_rd <= 1'b1;
        mem_wr <= 1'b0;
        mem_data_o <= 32'b0;
    end
    `ACCESS_OP_R2M: begin
        mem_rd <= 1'b0;
        mem_wr <= 1'b1;
        if(mem_access_sz==`ACCESS_SZ_WORD)
            mem_data_o <= data_i;
        else if(mem_access_sz==`ACCESS_SZ_HALF)
            mem_data_o <= {data_i[15:0], data_i[15:0]};
        else if(mem_access_sz==`ACCESS_SZ_LEFT) 
            mem_data_o <= data_i>>left_shift;
        else if(mem_access_sz==`ACCESS_SZ_RIGHT)
            mem_data_o <= data_i<<right_shift;
        else if(mem_access_sz==`ACCESS_SZ_BYTE)
            mem_data_o <= {data_i[7:0], data_i[7:0], data_i[7:0], data_i[7:0]};
        else
            mem_data_o <= 32'b0;
    end
    //`ACCESS_OP_D2R,
    default: begin
        mem_rd <= 1'b0;
        mem_wr <= 1'b0;
        mem_data_o <= 32'b0;
    end
    endcase
end

endmodule
