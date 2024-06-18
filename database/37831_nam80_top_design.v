// This program was cloned from: https://github.com/namberino/nam80
// License: BSD 2-Clause "Simplified" License

module top_design(
    input clk
);

    wire rst; // reset signal

    // display alu result
    reg[7:0] data_out;
    always @ (posedge clk_out, posedge rst)
    begin
        if (rst)
            data_out <= 8'b0;
        else if (display)
            data_out <= alu_out;
    end

    // bus multiplexing
    reg[15:0] bus;
    always @ (*)
    begin
        bus = 16'b0;

        if (reg_out_en)
            bus = reg_out;
        else if (alu_out_en)
            bus = {8'b0, alu_out};
        else if (alu_flags_out_en)
            bus = {8'b0, alu_flags_out};
        else if (mem_out_en)
            bus = {8'b0, mem_out};
    end

    // clock module
    wire hlt;
    wire clk_out;
    clock clock(
        .clk_in(clk),
        .hlt(hlt),
        .clk_out(clk_out)
    );

    // ir module
    wire ir_write_en;
    wire[7:0] ir_out;
    ir ir(
        .clk(clk_out),
        .rst(rst),
        .write_en(ir_write_en),
        .data_in(bus[7:0]),
        .out(ir_out)
    );

    // alu module
    wire alu_out_en; // bus out enable
    wire alu_flags_out_en; // bus out enable
    wire alu_ctrl_sig;
    wire alu_acc_write_en;
    wire alu_act_store;
    wire alu_act_restore;
    wire alu_tmp_write_en;
    wire alu_flags_write_en;
    wire[4:0] alu_opcode;
    wire[7:0] alu_flags_out;
    wire[7:0] alu_out;
    alu alu(
        .clk(clk_out),
        .rst(rst),
        .opcode(alu_opcode),
        .data_in(bus[7:0]),
        .ctrl_sig(alu_ctrl_sig),
        .acc_write_en(alu_acc_write_en),
        .act_store(alu_act_store),
        .act_restore(alu_act_restore),
        .tmp_write_en(alu_tmp_write_en),
        .flags_write_en(alu_flags_write_en),
        .flags_out(alu_flags_out),
        .out(alu_out)
    );

    // regfile module
    wire reg_out_en; // bus out enable
    wire reg_write_en;
    wire[4:0] reg_write_sel;
    wire[4:0] reg_read_sel;
    wire[1:0] reg_ext_op;
    wire[15:0] reg_out;
    regfile regfile(
        .clk(clk_out),
        .rst(rst),
        .write_en(reg_write_en),
        .data_in(bus),
        .write_sel(reg_write_sel),
        .read_sel(reg_read_sel),
        .ext_op(reg_ext_op),
        .out(reg_out)
    );

    // memory module
    wire mem_out_en; // bus out enable
    wire mem_mar_write_en;
    wire mem_write_en;
    wire[7:0] mem_out;
    memory memory(
        .clk(clk_out),
        .rst(rst),
        .data_in(bus),
        .mar_write_en(mem_mar_write_en),
        .mem_write_en(mem_write_en),
        .out(mem_out)
    );

    controller controller(
        .clk(clk_out),
        .rst(rst),
        .opcode(ir_out),
        .flags(alu_flags_out),
        .out({
            display,
            alu_act_restore,
            alu_act_store,
            alu_tmp_write_en,
            alu_acc_write_en,
            alu_ctrl_sig,
            alu_flags_out_en,
            alu_flags_write_en,
            alu_out_en,
            alu_opcode,
            reg_ext_op,
            reg_write_sel,
            reg_read_sel,
            reg_out_en,
            reg_write_en,
            mem_out_en,
            mem_write_en,
            mem_mar_write_en,
            ir_write_en,
            hlt
        })
    );

endmodule
