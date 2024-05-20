// This program was cloned from: https://github.com/PaolaUniSa/tt6_rsnn_test0
// License: Apache License 2.0

// Enhanced Test Bench with Multiple Test Cases for tt_um_chatgpt_rsnn_paolaunisa

`timescale 1ns/1ps

module tb_tt_um_chatgpt_rsnn_paolaunisa;
    // Testbench signals
    reg [7:0] ui_in;
    wire [7:0] uo_out;
    wire [7:0] uio_out;
    reg clk, rst_n, ena;
    
    parameter integer CLOCK_PERIOD = 20;  // Clock period in nanoseconds 

    // Instantiate the module
    tt_um_chatgpt_rsnn_paolaunisa dut (
        .ui_in(ui_in),
        .uo_out(uo_out),
        .uio_in(ui_in),  // Assuming bi-directional IOs are tied together for testing
        .uio_out(uio_out),
        .uio_oe(),  // Ignoring for simplicity
        .ena(ena),
        .clk(clk),
        .rst_n(rst_n)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #(CLOCK_PERIOD/2) clk = !clk;
    end

    // Reset generation
    initial begin
        ena = 0;
        ui_in = 8'h00;
        rst_n = 0;
        #(2*CLOCK_PERIOD)
        rst_n = 1;
        #(2*CLOCK_PERIOD)
        ena = 1;
    end


    task dummy_writing;
    begin
        ui_in = {2'b11, 1'b0, 5'b00000}; // Parameter Load + data
        #(5*CLOCK_PERIOD); // Wait 5 clock cycles
        ui_in = {2'b10,  1'b0, 5'b00000};  // Stop loading data
        #(2*CLOCK_PERIOD); // Allow some time before next operation
       end
    endtask
    
    // Startup mode - Data Writing Task
    // Task to write 8-bit data serially
    task write_data;
        input [7:0] data;  // Input data is now 8 bits
        integer i;
        begin
            for (i = 0; i < 8; i = i + 1) begin
                ui_in = {2'b11, data[i], 5'b00000}; // Parameter Load + data
                #(5*CLOCK_PERIOD); // Wait 5 clock cycles
                ui_in = {2'b10, data[i], 5'b00000};  // Stop loading data
                #(2*CLOCK_PERIOD); // Allow some time before next operation
            end
        end
    endtask


    // Task to write all neuron parameters
    task write_neuron_parameters;
        input [7:0] feedback_scale, refractory_period, decay_rate, membrane_threshold;
        begin
            write_data(feedback_scale);        // Write feedback_scale
            write_data(refractory_period);     // Write refractory_period
            write_data(decay_rate);            // Write decay_rate
            write_data(membrane_threshold);    // Write membrane_threshold
        end
    endtask

    // Task to write 9 weights
    task write_neuron_weights;
        input [8:0] weight_0, weight_1, weight_2, weight_3,weight_4, weight_5, weight_6,weight_7, weight_8;
        begin
            write_data(weight_0);
            write_data(weight_1);       
            write_data(weight_2);     
            write_data(weight_3);           
            write_data(weight_4); 
            write_data(weight_5);       
            write_data(weight_6);     
            write_data(weight_7);           
            write_data(weight_8);   
        end
    endtask
    
    // Run mode - Spike Input Task
    task write_spikes;
        input [2:0] spikes;
        integer i;  // Declare the loop counter inside the task
        begin
            ui_in[7] = 0;  // Test mode select (if needed)
            ui_in[6:3] = 4'b0011;  // RSNN and spikein reg enable
            for (i = 0; i < 1000; i=i+1) begin
                ui_in[2:0] = spikes;
                #(1*CLOCK_PERIOD); // Change spikes every clock cycle
            end
            ui_in = 8'h00;  // Clear inputs after run
            #(5*CLOCK_PERIOD);
        end
    endtask



    // Test sequence
    initial begin
       // Reset and setup
       #(5*CLOCK_PERIOD);  // Wait for reset to finish and setup time
       
       // Case: No output SPIKES
       // Startup mode  - Write parameters 
       // Feedback scale - Refractory Period - Decay rate - Membrane Threshold
       write_neuron_parameters(8'h01, 8'h04, 8'h01, 8'h1F); // parameter LYR 3
       write_neuron_parameters(8'h01, 8'h04, 8'h01, 8'h1F); // parameter LYR 2
       write_neuron_parameters(8'h01, 8'h04, 8'h01, 8'h1F); // parameter LYR 1
       
       write_neuron_weights(8'h01, 8'h01, 8'h01, 8'h01,8'h01, 8'h01, 8'h01, 8'h01,8'h01); // weights LYR 3
       write_neuron_weights(8'h01, 8'h01, 8'h01, 8'h01,8'h01, 8'h01, 8'h01, 8'h01,8'h01); // weights LYR 2
       write_neuron_weights(8'h01, 8'h01, 8'h01, 8'h01,8'h01, 8'h01, 8'h01, 8'h01,8'h01); // weights LYR 1
       dummy_writing;
       #(5*CLOCK_PERIOD);
       
       write_spikes(3'b111);  // Write spikes '111' 1000 times
       write_spikes(3'b101);  // Write spikes '101' 1000 times
       write_spikes(3'b000);  // Write spikes '000' 1000 times
       write_spikes(3'b100);  // Write spikes '100' 1000 times
       write_spikes(3'b110);  // Write spikes '110' 1000 times
       
       
       // Case: Output SPIKES
       // Startup mode - Write parameters
       // Feedback scale - Refractory Period - Decay rate - Membrane Threshold
       write_neuron_parameters(8'h01, 8'h01, 8'h01, 8'h1F); // parameter LYR 3
       write_neuron_parameters(8'h01, 8'h01, 8'h01, 8'h1F); // parameter LYR 2
       write_neuron_parameters(8'h01, 8'h01, 8'h01, 8'h1F); // parameter LYR 1
       
       write_neuron_weights(8'h0F, 8'h0F, 8'h0F, 8'h0F,8'h0F, 8'h0F, 8'h0F, 8'h01,8'h0F); // weights LYR 3
       write_neuron_weights(8'h0F, 8'h0F, 8'h0F, 8'h0F,8'h0F, 8'h0F, 8'h0F, 8'h01,8'h0F); // weights LYR 2
       write_neuron_weights(8'h0F, 8'h0F, 8'h0F, 8'h0F,8'h0F, 8'h0F, 8'h0F, 8'h01,8'h0F); // weights LYR 1
       dummy_writing;
       #(5*CLOCK_PERIOD);
       
       write_spikes(3'b111);  // Write spikes '111' 1000 times
       write_spikes(3'b101);  // Write spikes '101' 1000 times
       write_spikes(3'b000);  // Write spikes '000' 1000 times
       write_spikes(3'b100);  // Write spikes '100' 1000 times
       write_spikes(3'b110);  // Write spikes '110' 1000 times
       
       #(10*CLOCK_PERIOD);  // Wait some time to observe outputs
       
       

       $finish;  // End simulation
    end
    
    
endmodule
