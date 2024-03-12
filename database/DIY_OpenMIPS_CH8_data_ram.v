`include "defines.v"

module data_ram(
    input  wire                  clock,
    input  wire                  chip_enable,
    input  wire                  write_enable,
    input  wire[`DataAddressBus] address,
    input  wire[3:0]             sel,
    input  wire[`DataBus]        data_input,

    output reg[`DataBus]         data_output
);

    reg[`ByteWidth] data_mem0[0:`DataMemoryNumber - 1];
    reg[`ByteWidth] data_mem1[0:`DataMemoryNumber - 1];
    reg[`ByteWidth] data_mem2[0:`DataMemoryNumber - 1];
    reg[`ByteWidth] data_mem3[0:`DataMemoryNumber - 1];

    always @ (posedge clock) begin
        if (chip_enable == `ChipDisable) begin
            // data_output <= `ZeroWord;
        end else if (write_enable == `WriteEnable) begin
            if (sel[3] == 1'b1) begin
                data_mem3[address[`DataMemoryNumLog2 + 1:2]] <= data_input[31:24];
            end
            if (sel[2] == 1'b1) begin
                data_mem2[address[`DataMemoryNumLog2 + 1:2]] <= data_input[23:16];
            end
            if (sel[1] == 1'b1) begin
                data_mem1[address[`DataMemoryNumLog2 + 1:2]] <= data_input[15:8];
            end
            if (sel[0] == 1'b1) begin
                data_mem0[address[`DataMemoryNumLog2 + 1:2]] <= data_input[7:0];
            end
        end
    end

    always @ (*) begin
        if (chip_enable == `ChipDisable) begin
            data_output <= `ZeroWord;
        end else if (write_enable == `WriteDisable) begin
            data_output <= {data_mem3[address[`DataMemoryNumLog2 + 1:2]], data_mem2[address[`DataMemoryNumLog2 + 1:2]],
                            data_mem1[address[`DataMemoryNumLog2 + 1:2]], data_mem0[address[`DataMemoryNumLog2 + 1:2]]};
        end else begin
            data_output <= `ZeroWord;
        end
    end

endmodule