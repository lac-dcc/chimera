// This program was cloned from: https://github.com/ccattuto/tt07-serial-charmatrix
// License: Apache License 2.0

module config_rom (
    input wire [1:0] sel,
    output wire [2:0] num_chars,
    output wire [8:0] num_leds
);

reg [2:0] num_chars_mem [0:3];
reg [8:0] num_leds_mem [0:3];

integer i;
initial begin
    for (i=0; i<4; i=i+1) begin
        num_chars_mem[i] = 2*(i+1) - 1;
        num_leds_mem[i] = 2*35*(i+1) - 1;
    end
end

assign num_chars = num_chars_mem[sel];
assign num_leds = num_leds_mem[sel];

endmodule
