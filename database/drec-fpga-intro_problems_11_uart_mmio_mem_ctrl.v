// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module mem_ctrl(
    input [31:0]addr,
    input [31:0]data,
    input we,

    output reg mmio_addr,
    output reg [15:0]mmio_data,
    output reg mmio_we
);

/* Problem 1: look here carefully. */

always @(*) begin
    mmio_addr = 1'b0;
    mmio_data = 16'b0;
    mmio_we = 1'b0;

    case (addr)
        32'h20: begin
            mmio_addr = 1'b0;   // Hex display
            mmio_data = data[15:0];
            mmio_we = we;
        end
        /* Problem 2: describe UART transmitter case here. */
        default: begin
        end
    endcase
end

endmodule
