// This program was cloned from: https://github.com/namberino/nam80
// License: BSD 2-Clause "Simplified" License

module regfile(
    input clk,
    input rst,
    input write_en,
    input[15:0] data_in,
    input[4:0] write_sel,
    input[4:0] read_sel,
    input[1:0] ext_op,
    output[15:0] out
);

    localparam EXT_INC = 2'b01;
    localparam EXT_DCR = 2'b10;
    localparam EXT_INC2 = 2'b11;

    reg[7:0] register[0:11]; // 12 registers
    reg[15:0] data_out;

    wire[3:0] write_reg = write_sel[3:0];
    wire[3:0] read_reg = read_sel[3:0];

    wire write_ext = write_sel[4];
    wire read_ext = read_sel[4];

    // read operations
    always @ (*)
    begin
        if (read_ext)
            data_out <= {register[read_reg], register[read_reg + 1]};
        else
            data_out <= {8'b0, register[read_reg]};
    end

    // write operations
    always @ (posedge clk, posedge rst)
    begin
        if (rst)
        begin
            register[0] <= 8'b0;
            register[1] <= 8'b0;
            register[2] <= 8'b0;
            register[3] <= 8'b0;
            register[4] <= 8'b0;
            register[5] <= 8'b0;
            register[6] <= 8'b0;
            register[7] <= 8'b0;
            register[8] <= 8'b0;
            register[9] <= 8'b0;
            register[10] <= 8'b0;
            register[11] <= 8'b0;
        end else
        begin
            if (ext_op == EXT_INC)
                {register[write_reg], register[write_reg + 1]} <= {register[write_reg], register[write_reg + 1]} + 1;
            else if (ext_op == EXT_INC2)
                {register[write_reg], register[write_reg + 1]} <= {register[write_reg], register[write_reg + 1]} + 2;
            else if (ext_op == EXT_DCR)
                {register[write_reg], register[write_reg + 1]} <= {register[write_reg], register[write_reg + 1]} - 1;
            else if (write_en)
            begin
                if (write_ext)
                    {register[write_reg], register[write_reg + 1]} <= data_in;
                else 
                    register[write_reg] <= data_in[7:0];
            end
        end
    end

    assign out = data_out;

endmodule
