// This program was cloned from: https://github.com/anishathalye/notary
// License: MIT License

module gpio #(
    parameter [31:0] ADDR = 32'hffff_ffff
) (
    input clk,
    input resetn,
    input mem_valid,
    input [31:0] mem_addr,
    input [31:0] mem_wdata,
    input [3:0] mem_wstrb,
    output gpio_ready,
    output gpio_sel,
    output [31:0] gpio_rdata,
    input [7:0] gpio_pin_in,
    output [7:0] gpio_pin_out
);

// layout:
// ADDR -- GPIO write register
//   +4 -- GPIO read register

wire reg_write_sel = mem_valid && (mem_addr == ADDR);
wire reg_read_sel = mem_valid && (mem_addr == (ADDR + 4));
assign gpio_sel = reg_read_sel || reg_write_sel;
// always ready, because we handle everything in a single cycle
assign gpio_ready = 1;

// read logic
assign gpio_rdata = {24'h0000_00, gpio_pin_in};

// write logic
reg [7:0] gpio_out;
always @(posedge clk) begin
    if (!resetn) begin
        gpio_out <= 8'h0;
    end else if (reg_write_sel && mem_wstrb[0]) begin
        gpio_out <= mem_wdata[7:0];
    end
end
assign gpio_pin_out = gpio_out;

endmodule
