// This program was cloned from: https://github.com/3b3al-MV/SPI-Slave-Interface-with-Single-Port-RAM
// License: MIT License

module RAM(
    input [9:0] din,
    input clk,
    input rst_n,
    input rx_valid,
    output [7:0] dout,
    output tx_valid
);

    parameter MEM_DEPTH = 256;
    parameter ADDR_SIZE = 8;

    localparam WRITE_ADD=2'b00, WRITE_DATA=2'b01, READ_ADD=2'b10, READ_DATA=2'b11; 

    (* RAM_STYLE = "block" *)
    reg [7:0] memory [0:MEM_DEPTH-1];
    reg [ADDR_SIZE-1:0] wr_addr;
    reg [ADDR_SIZE-1:0] rd_addr;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wr_addr <= 0;
            rd_addr <= 0;
        end else if (rx_valid) begin
            case (din[9:8])
                WRITE_ADD: wr_addr <= din[7:0];
                WRITE_DATA: memory[wr_addr] <= din[7:0];
                READ_ADD: rd_addr <= din[7:0];
            endcase
        end
    end

    assign dout = memory[rd_addr];
    assign tx_valid = (din[9:8] == READ_DATA);

endmodule
