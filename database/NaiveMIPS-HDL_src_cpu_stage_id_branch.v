module branch(/*autoport*/
//output
          is_branch,
          branch_taken,
          branch_address,
          return_address,
//input
          inst,
          pc_value,
          reg_s_value,
          reg_t_value);

input wire[31:0] inst;
input wire[31:0] pc_value;
input wire[31:0] reg_s_value;
input wire[31:0] reg_t_value;
output reg is_branch;
output reg branch_taken;
output reg[31:0] branch_address;
output reg[31:0] return_address;

wire[31:0] temp_ds_addr, temp_offset_ext;
wire sign;
assign sign = inst[15];
assign temp_ds_addr = pc_value+32'd4;
assign temp_offset_ext = {
    sign,sign,sign,sign,sign,sign,sign,
    sign,sign,sign,sign,sign,sign,sign,
    inst[15:0],2'b00
    } + temp_ds_addr;

always @(*) begin
    branch_address <= 32'b0;
    is_branch <= 1'b0;
    branch_taken <= 1'b0;
    return_address <= pc_value+32'd8;
    case(inst[31:26])
    6'h0: begin
        case(inst[5:0])
        6'h8, 6'h9: begin //JR, JALR
            branch_address <= reg_s_value;
            is_branch <= 1'b1;
            branch_taken <= 1'b1;
        end
        endcase
    end
    6'h1: begin //REGIMM
        case(inst[20:16])
        5'h0, 5'h10: begin //BLTZ, BLTZAL
            is_branch <= 1'b1;
            if(reg_s_value[31]) begin
                branch_address <= temp_offset_ext;
                branch_taken <= 1'b1;
            end
        end
        5'h1, 5'h11: begin //BGEZ, BGEZAL
            is_branch <= 1'b1;
            if(!reg_s_value[31]) begin
                branch_address <= temp_offset_ext;
                branch_taken <= 1'b1;
            end
        end
        endcase
    end
    6'h2, 6'h3: begin //J, JAL
        is_branch <= 1'b1;
        branch_address <= {temp_ds_addr[31:28], inst[25:0], 2'b00};
        branch_taken <= 1'b1;
    end
    6'h4: begin //BEQ
        is_branch <= 1'b1;
        if(reg_s_value == reg_t_value) begin
            branch_address <= temp_offset_ext;
            branch_taken <= 1'b1;
        end
    end
    6'h5: begin //BNE
        is_branch <= 1'b1;
        if(reg_s_value != reg_t_value) begin
            branch_address <= temp_offset_ext;
            branch_taken <= 1'b1;
        end
    end
    6'h6: begin //BLEZ
        is_branch <= 1'b1;
        if(reg_s_value[31] || reg_s_value==32'b0) begin
            branch_address <= temp_offset_ext;
            branch_taken <= 1'b1;
        end
    end
    6'h7: begin //BGTZ
        is_branch <= 1'b1;
        if(!reg_s_value[31] && reg_s_value!=32'b0) begin
            branch_address <= temp_offset_ext;
            branch_taken <= 1'b1;
        end
    end
    endcase
end

endmodule