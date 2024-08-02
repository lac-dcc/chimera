// This program was cloned from: https://github.com/Revenantx86/TinyTPU
// License: MIT License

module top #
(
    parameter D_W = 8,
    parameter N = 3,
    parameter WORD = 3
)
(
    input  wire clk,
    input  wire rst,
    input  wire data_in_x,
    input  wire data_in_y,
    input  wire load_en,
    input  wire init,
    output wire data_out_z,
    output reg  tx_ready
);
//
// REG & WIRES
wire [(N*D_W)-1:0]     out_x_flat;
wire [(N*D_W)-1:0]     out_y_flat;
wire [(N*N*2*D_W)-1:0] out_z_flat;
wire out_init;
reg tx_ready_reg;

always @(posedge clk) begin
    tx_ready <= tx_ready_reg;
end 
//wire  [D_W-1:0]   data_core_x  [N-1:0];
//wire  [D_W-1:0]   data_core_y  [N-1:0];
//wire  [2*D_W-1:0] data_core_z   [N-1:0][N-1:0];
//
/*
    Input Control Module
*/
input_control #(.D_W(D_W), .N(N), .WORD(WORD)) 
        input_control_inst (
                        .clk(clk),
                        .rst(rst),
                        .data_in_x(data_in_x),
                        .data_in_y(data_in_y),
                        .load_en(load_en),
                        .init(init),
                        .out_x_flat(out_x_flat),
                        .out_y_flat(out_y_flat),
                        .out_init(out_init)
                     );
/*
    Output Control Module
*/
output_control #(.D_W(D_W), .N(N))
        output_control_inst (
                                .clk(clk),
                                .rst(rst),
                                .core_out_z(out_z_flat),
                                .init(init),
                                .data_out_z(data_out_z),
                                .tx_ready(tx_ready_reg)
                            );
/*
    Systolic Core
*/
systolic #(.D_W(D_W), .N(N)) 
        systolic_inst (
                        .clk(clk),
                        .rst(rst),
                        .init(out_init),
                        .x_flat(out_x_flat),
                        .y_flat(out_y_flat),
                        .z_flat(out_z_flat)
                      );
//
//
//
endmodule