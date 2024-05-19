// This program was cloned from: https://github.com/metr0jw/Spiking-Neural-Network-on-FPGA
// License: MIT License

module layer_0(
    input           clk,
    input           reset_n,
    input   [7:0]   input_spike,
    output  [7:0]   output_spike
);
    parameter                       NUM_NEURONS = 8;

    reg         [NUM_NEURONS-1:0]   spike_layer_0_potential_reg[NUM_NEURONS-1:0];
    wire        [NUM_NEURONS-1:0]   spike_layer_0_potential[NUM_NEURONS-1:0];



    // Instantiate the neurons
    // Layer 0: 8 neurons
    // neuron0_0
    leaky_integrate_fire uut_leaky_integrate_fire_layer_0_0 (
        .clk(clk), .reset_n(reset_n),
        .spike_in(input_spike[7:0]),
        .weight(64'h77777777),
        .memb_potential_in(spike_layer_0_potential_reg[0]),
        .threshold(8'h9),
        .leak_value(8'h1),
        .tref(4'h2),
        .memb_potential_out(spike_layer_0_potential[0][7:0]),
        .spike_out(output_spike[0])
    );
    // neuron0_1
    leaky_integrate_fire uut_leaky_integrate_fire_layer_0_1 (
        .clk(clk), .reset_n(reset_n),
        .spike_in(input_spike[7:0]),
        .weight(64'h1),
        .memb_potential_in(spike_layer_0_potential_reg[1]),
        .threshold(8'h9),
        .leak_value(8'h1),
        .tref(4'h2),
        .memb_potential_out(spike_layer_0_potential[1]),
        .spike_out(output_spike[1])
    );
    // neuron0_2
    leaky_integrate_fire uut_leaky_integrate_fire_layer_0_2 (
        .clk(clk), .reset_n(reset_n),
        .spike_in(input_spike[7:0]),
        .weight(64'h77777777),
        .memb_potential_in(spike_layer_0_potential_reg[2]),
        .threshold(8'h9),
        .leak_value(8'h1),
        .tref(4'h2),
        .memb_potential_out(spike_layer_0_potential[2]),
        .spike_out(output_spike[2])
    );
    // neuron0_3
    leaky_integrate_fire uut_leaky_integrate_fire_layer_0_3 (
        .clk(clk), .reset_n(reset_n),
        .spike_in(input_spike[7:0]),
        .weight(64'h77777777),
        .memb_potential_in(spike_layer_0_potential_reg[3]),
        .threshold(8'h9),
        .leak_value(8'h1),
        .tref(4'h2),
        .memb_potential_out(spike_layer_0_potential[3]),
        .spike_out(output_spike[3])
    );
    // neuron0_4
    leaky_integrate_fire uut_leaky_integrate_fire_layer_0_4 (
        .clk(clk), .reset_n(reset_n),
        .spike_in(input_spike[7:0]),
        .weight(64'h77777777),
        .memb_potential_in(spike_layer_0_potential_reg[4]),
        .threshold(8'h9),
        .leak_value(8'h1),
        .tref(4'h2),
        .memb_potential_out(spike_layer_0_potential[4]),
        .spike_out(output_spike[4])
    );
    // neuron0_5
    leaky_integrate_fire uut_leaky_integrate_fire_layer_0_5 (
        .clk(clk), .reset_n(reset_n),
        .spike_in(input_spike[7:0]),
        .weight(64'h77777777),
        .memb_potential_in(spike_layer_0_potential_reg[5]),
        .threshold(8'h9),
        .leak_value(8'h1),
        .tref(4'h2),
        .memb_potential_out(spike_layer_0_potential[5]),
        .spike_out(output_spike[5])
    );
    // neuron0_6
    leaky_integrate_fire uut_leaky_integrate_fire_layer_0_6 (
        .clk(clk), .reset_n(reset_n),
        .spike_in(input_spike[7:0]),
        .weight(64'h77777777),
        .memb_potential_in(spike_layer_0_potential_reg[6]),
        .threshold(8'h9),
        .leak_value(8'h1),
        .tref(4'h2),
        .memb_potential_out(spike_layer_0_potential[6]),
        .spike_out(output_spike[6])
    );
    // neuron0_7
    leaky_integrate_fire uut_leaky_integrate_fire_layer_0_7 (
        .clk(clk), .reset_n(reset_n),
        .spike_in(input_spike[7:0]),
        .weight(64'h77777777),
        .memb_potential_in(spike_layer_0_potential_reg[7]),
        .threshold(8'h9),
        .leak_value(8'h1),
        .tref(4'h2),
        .memb_potential_out(spike_layer_0_potential[7]),
        .spike_out(output_spike[7])
    );

    always @(posedge clk or negedge reset_n) begin
        if (reset_n == 1'b0) begin
            {spike_layer_0_potential_reg[7], spike_layer_0_potential_reg[6], spike_layer_0_potential_reg[5], spike_layer_0_potential_reg[4],
            spike_layer_0_potential_reg[3], spike_layer_0_potential_reg[2], spike_layer_0_potential_reg[1], spike_layer_0_potential_reg[0]} <= 64'h0;
        end else begin
            {spike_layer_0_potential_reg[7], spike_layer_0_potential_reg[6], spike_layer_0_potential_reg[5], spike_layer_0_potential_reg[4], 
            spike_layer_0_potential_reg[3], spike_layer_0_potential_reg[2], spike_layer_0_potential_reg[1], spike_layer_0_potential_reg[0]} <= {spike_layer_0_potential[7], spike_layer_0_potential[6], spike_layer_0_potential[5], spike_layer_0_potential[4],
                                                                                                                                                spike_layer_0_potential[3], spike_layer_0_potential[2], spike_layer_0_potential[1], spike_layer_0_potential[0]};
        end
    end

endmodule
