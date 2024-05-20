// This program was cloned from: https://github.com/Lena-2023/15-05-2024
// License: MIT License

module top (
input wire CLK,
input wire [7:0] NOTE,  
input wire RESET,  
input wire [2:0] form,  
input wire [6:0] pulse_width,
output wire [31:0] DDSout
);


wire [31:0] ADDER;
wire [31:0] DDS;

note2dds_1st_gen n2d(.CLK(CLK), .NOTE(NOTE), .ADDER(ADDER));
DDS dds2(.CLK(CLK), .RESET(RESET), .ADDER(ADDER), .DDS(DDS));
form_wave f_w(.CLK(CLK), .RESET(RESET), .DDS(DDS), .DDSout(DDSout), .form(form), .pulse_width(pulse_width));

endmodule