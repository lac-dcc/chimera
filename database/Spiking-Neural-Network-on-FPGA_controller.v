// This program was cloned from: https://github.com/metr0jw/Spiking-Neural-Network-on-FPGA
// License: MIT License

module controller(
    input           clk,
    input           reset_n,
    input   [7:0]   input_spike,
    output  [7:0]   output_spike
);
    

    wire    [7:0]   output_spike_layer_0;


    layer_0 uut_layer_0 (
        .clk(clk), .reset_n(reset_n),
        .input_spike(input_spike),
        .output_spike(output_spike_layer_0)
    );
    layer_1 uut_layer_1 (
        .clk(clk), .reset_n(reset_n),
        .input_spike(output_spike_layer_0),
        .output_spike(output_spike)
    );

endmodule
