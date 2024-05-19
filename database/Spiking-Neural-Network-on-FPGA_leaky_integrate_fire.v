// This program was cloned from: https://github.com/metr0jw/Spiking-Neural-Network-on-FPGA
// License: MIT License

// Simulate the LIF neuron model
// tau_m * dV/dt = -(V-E_L) + I/g_L
// Referenced Neuro-inspired ArchitectureS in Hardware(NASH)

/*
    INPUT
    clk: clock
    reset_n: reset negated
    spike_in: input spike, 8 inputs
    weight: synaptic weight, int8, 8 inputs
    threshold: threshold potential [mV], int8
    leak_value: leak value [mV], uint8
    tref: refractory period [ms], uint4

    OUTPUT
    V_out: membrane potential, int8
    spike_out: output spike
*/

module leaky_integrate_fire(
    input               clk,
    input               reset_n,
    input       [7:0]   spike_in,
    input       [63:0]   weight_0,
    input       [63:0]   weight_1,
    input       [63:0]   weight_2,
    input       [63:0]   weight_3,
    input       [63:0]   weight_4,
    input       [63:0]   weight_5,
    input       [63:0]   weight_6,
    input       [63:0]   weight_7,
    input       [7:0]   memb_potential_in,
    input       [7:0]   threshold,
    input       [7:0]   leak_value,
    input       [3:0]   tref,
    output      [7:0]   memb_potential_out,
    output reg          spike_out
);
    reg         [3:0]   tr = 0;
    reg         [7:0]   voltage;

    wire        [15:0]  memb_potential_integrate;   // integrate membrane potential
    wire        [15:0]  synaptic_integration;       // integrate synaptic current
    wire        [15:0]  leak_and_int_potential;     // leaked current and integrated potential
    wire                underflow;
    wire        [7:0]   spike_and_weight[0:7];

    // AND gate for spike and weight
    assign spike_and_weight[0] = spike_in[0] * (weight_0[7:0] + weight_1[7:0] + weight_2[7:0] + weight_3[7:0] + weight_4[7:0] + weight_5[7:0] + weight_6[7:0] + weight_7[7:0]);
    assign spike_and_weight[1] = spike_in[1] * (weight_0[15:8] + weight_1[15:8] + weight_2[15:8] + weight_3[15:8] + weight_4[15:8] + weight_5[15:8] + weight_6[15:8] + weight_7[15:8]);
    assign spike_and_weight[2] = spike_in[2] * (weight_0[23:16] + weight_1[23:16] + weight_2[23:16] + weight_3[23:16] + weight_4[23:16] + weight_5[23:16] + weight_6[23:16] + weight_7[23:16]);
    assign spike_and_weight[3] = spike_in[3] * (weight_0[31:24] + weight_1[31:24] + weight_2[31:24] + weight_3[31:24] + weight_4[31:24] + weight_5[31:24] + weight_6[31:24] + weight_7[31:24]);
    assign spike_and_weight[4] = spike_in[4] * (weight_0[39:32] + weight_1[39:32] + weight_2[39:32] + weight_3[39:32] + weight_4[39:32] + weight_5[39:32] + weight_6[39:32] + weight_7[39:32]);
    assign spike_and_weight[5] = spike_in[5] * (weight_0[47:40] + weight_1[47:40] + weight_2[47:40] + weight_3[47:40] + weight_4[47:40] + weight_5[47:40] + weight_6[47:40] + weight_7[47:40]);
    assign spike_and_weight[6] = spike_in[6] * (weight_0[55:48] + weight_1[55:48] + weight_2[55:48] + weight_3[55:48] + weight_4[55:48] + weight_5[55:48] + weight_6[55:48] + weight_7[55:48]);
    assign spike_and_weight[7] = spike_in[7] * (weight_0[63:56] + weight_1[63:56] + weight_2[63:56] + weight_3[63:56] + weight_4[63:56] + weight_5[63:56] + weight_6[63:56] + weight_7[63:56]);

    // Integrate current
    assign memb_potential_integrate = spike_and_weight[0]
                                    + spike_and_weight[1]
                                    + spike_and_weight[2] 
                                    + spike_and_weight[3]
                                    + spike_and_weight[4]
                                    + spike_and_weight[5]
                                    + spike_and_weight[6]
                                    + spike_and_weight[7];

    // integrate membrane potential and current
    assign synaptic_integration = memb_potential_in + memb_potential_integrate;

    // leak current
    assign leak_and_int_potential = synaptic_integration - leak_value;
    assign underflow = synaptic_integration < leak_value;

    always @(posedge clk or negedge reset_n)
    begin
        if (~reset_n) begin
            spike_out <= 1'b0;
            voltage <= 8'b0;
            tr <= 4'b0;
        end

        else begin
            // check if in refractory period
            if (tr > 0) begin
                spike_out <= 1'b0;
                tr <= tr - 4'b1;
                voltage = 8'b0;
            end
            else if (underflow) begin
                spike_out <= 1'b0;
                voltage <= 8'b0;
            end
            else if (leak_and_int_potential >= threshold) begin   // leak_and_int_potential >= threshold
                spike_out <= 1'b1;  
                tr <= tref;     // refractory period
                voltage = 8'b0;
            end
            else begin
                spike_out <= 1'b0;
                voltage <= leak_and_int_potential[7:0];
            end
        end
    end
    
    assign memb_potential_out = voltage;

endmodule
