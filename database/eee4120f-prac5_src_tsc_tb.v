// This program was cloned from: https://github.com/nkosinathintuli/eee4120f-prac5
// License: MIT License


`timescale 1ns / 1ps

module tsc_tb;

    // TSC inputs
    reg reset;
    reg start;
    reg clk;
    reg sbf;
    
    // ADC outputs
    wire [7:0] adc_data;
    wire adc_rdy;
    
    // TSC outputs
    wire req;
    wire trd;
    wire cd;
    wire [31:0] trigtm;
    wire sd;

    // Instantiate the TSC module
    TSC tsc_inst (
        .reset(reset),
        .start(start),
        .clk(clk),
        .adc_data(adc_data),
        .adc_rdy(adc_rdy),
        .sbf(sbf),
        .req(req),
        .trd(trd),
        .cd(cd),
        .trigtm(trigtm),
        .sd(sd)
    );

    // Instantiate the ADC module
    ADC adc_inst (
        .req(req),
        .rst(reset),
        .rdy(adc_rdy),
        .dat(adc_data)
    );

    // Clock generation
    always #5 clk = ~clk; // every 5 clock units

   
    integer i;      // serial data printing and verification 
    integer j;

    integer sd_indx = 0;
    reg prev_indx = 0;
    reg [255:0] sd_values;          // Serial data reading and capturing for verification
    reg [7:0] byte_val;
    reg [7:0] bit_count = 0;
    

    localparam WAIT_BF_SEND = 2'b00,
               STORE_SD = 2'b01,
               WAIT_START_BIT = 2'b10;

    reg [1:0] sd_state = WAIT_BF_SEND;


    always @(posedge clk) begin
        case (sd_state)
            WAIT_BF_SEND: begin
                if (sd && !prev_indx) begin
                    // Clear the SD values
                    for (i = 0; i < 256; i = i + 1) begin
                        sd_values[i] = 0;
                    end
                    sd_state <= WAIT_START_BIT;
                end
            end
            WAIT_START_BIT: begin
                // SD pulled low in start bit state
                if (!sd) begin
                    sd_state <= STORE_SD;
                end
            end
            STORE_SD: begin
                sd_values[sd_indx] = sd;
                sd_indx ++;
                bit_count ++;
                if (bit_count == 8) begin
                    bit_count = 0;
                    sd_state <= WAIT_START_BIT;
                end
            end
        endcase
    end

    initial begin               // initial begin and initializing inputs
        reset = 1;
        start = 0;
        clk = 0;
        sbf = 0;

        
        #100;
        reset = 0;              // Release reset after some delay

        // Start the TSC
        #20;
        start = 1;              // wait small delay
        #10;
        start = 0;

        // Wait for trigger detection
        wait(trd);
        $display("Trigger detected at time %d", $time);

        // assert the send buffer signal
        sbf = 1;

        // Wait for data transfer completion
        wait(cd);
        // assert send buffer low
        sbf = 0;
        $display("Data transfer completed at time %d", $time);
        
        // Wait for a few clock cycles to observe the data transmission
        #1000


        // Print the received bytes from the TSC module
        for (i = 0; i < 256; i = i + 8) begin
            byte_val = 0;
            for (j = 0; j < 8; j = j + 1) begin
                byte_val = byte_val << 1;
                byte_val[0] = sd_values[i + j];
            end
            $display("Serial data value at index %d: %d -> in hex = %h -> in binary = %b", i, byte_val, byte_val, byte_val);
        end

        // Wait for some time
        #100;

        // End the simulation
        $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars; 
    end
endmodule