// This program was cloned from: https://github.com/MdOmarFaruque/memristor_with_LA
// License: Apache License 2.0

`default_nettype none

module user_proj_example (
`ifdef USE_POWER_PINS
    inout vdda1,
    inout vssa1,
    inout vccd1,    // User area 1 1.8V supply  
    inout vssd1     // User area 1 digital ground  
`endif  
   //LA pins
    input  wb_clk_i,          // Clock input
    input  wb_rst_i,  
    input  wbs_stb_i,
    input  wbs_cyc_i,
    input   [4:0] la_data_in, 
    output   reg la_data_out,
    input  wire [5:0] la_oenb,

    //Meristor pins
    output wire [8:0] io_oeb,
    input  [4:0] io_in,
    input  SEL2,
    inout analog_io1,
    inout analog_io2,
    inout analog_io3
);

// Meristor
assign io_oeb = 9'b111111111;

// LA 
wire clk;
wire rst;
wire [2:0] NUM_PULSES;   // Number of pulses to generate
reg h_tag;
reg [2:0] pulse_count; 
wire valid;
wire [2:0] la_write;

initial begin
    h_tag = 0;
end

assign NUM_PULSES = la_data_in[2:0];
assign valid = wbs_cyc_i && wbs_stb_i; 
assign la_write = ~la_oenb[2:0] & ~{3{valid}};
assign clk = (~la_oenb[3]) ? la_data_in[3] : wb_clk_i;
assign rst = (~la_oenb[4]) ? la_data_in[4] : wb_rst_i;

always @(posedge clk) begin
    h_tag <= ~h_tag;
    if (rst) begin
        pulse_count <= 3'b000;
        la_data_out <= 1'b0;
        
    end else begin
        if (pulse_count < NUM_PULSES && h_tag == 0) begin
            pulse_count <= pulse_count + 3'b001;
            la_data_out <= 1'b1;
            
        end else begin
            la_data_out <= 1'b0;
            
        end
    end
end


core_flat_v4 core_flat_v4 (
`ifdef USE_POWER_PINS
    .vdda1(vdda1),
    .vssa1(vssa1),
    .vccd1(vccd1),    // User area 1 1.8V power
    .vssd1(vssd1),    // User area 1 digital ground
`endif
    .SEL1(io_in[0]),
    .DIGITALIN1(io_in[1]),
    .SEL3(io_in[2]),
    .DIGITALIN3(io_in[3]),
    .SEL2(SEL2),
    .DIGITALIN2(io_in[4]),
    .AIN1(analog_io1),
    .AIN2(analog_io2),
    .AIN3(analog_io3)
);

endmodule

`default_nettype wire
