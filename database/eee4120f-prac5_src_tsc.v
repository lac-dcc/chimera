// This program was cloned from: https://github.com/nkosinathintuli/eee4120f-prac5
// License: MIT License

`timescale 1ns / 1ps

module TSC (

    input wire reset,               // reset when high
    input wire start,               // start pulse
    input wire clk,                 // clock for TSC
    input wire [7:0] adc_data,      // data from adc
    input wire adc_rdy,             // ADC ready signal connected to the ADC
    input wire sbf,                 // send buffer signal from the test bench

    output reg req,                 // request line to ADC
    output reg trd,                 // trigger detected
    output reg cd,                  // completed data transfer
    output reg [31:0] trigtm,       // Timer when TSC module is triggered
    output reg sd                   // serial data out
);



    // state machine definitions for the TSC module 

    localparam IDLE = 0;
    localparam RUNNING = 1;
    localparam TRIGGERED = 2;
    localparam BUFFER_SEND = 3;
    localparam START_BIT = 4;
    localparam DATA_BIT = 5;
    localparam COMPLETE = 6;

    // regs for the state machine
    reg [3:0] state = IDLE;
    reg [31:0] timer = 0;
    reg [4:0] head = 0;                     //stores the index of the head of the ring buffer
    reg [4:0] tail = 0;                     // stores the index of the tail of the ring buffer 
    reg [7:0] ring_buffer [31:0];           // 32 byte ring buffer to store adc values
    reg [7:0] trigvl = 8'd208;              // Trigger value (constant)
    reg [4:0] post_count = 0;                // Counter for capturing additional values after trigger
    reg [4:0] byte_count = 31;           // Counter for bytes transmitted
    reg [3:0] bit_count = 8;            // Counter for bits transmitted within a byte

    
    initial begin
        integer i;
        for (i = 0; i < 32; ++i) begin
            ring_buffer[i] = 8'h0;          // initializing the values in the ring buffer to 0
        end
    end

    always @ (posedge clk) begin                // synchronizing on the rising edge of the clock
        if (reset) begin
            $display("RESET");
            state <= IDLE;
            timer <= 32'h0;
            head <= 5'b0;
            tail <= 5'b0;
            trd <= 1'b0;
            cd <= 1'b0;                         // initial values 
            req <= 1'b0;
            post_count <= 5'b0;
            byte_count <= 31;
            bit_count <= 8;
            trigtm <= 32'h0;

        end else begin
            case (state)
                IDLE: begin
                    if (start) begin
                        trd <= 0;
                        cd <= 0;
                        req <= 1'b1;        // Start requesting data from ADC
                        state <= RUNNING;
                    end else if (sbf) begin
                        state <= BUFFER_SEND;  // Transition to BUFFER_SEND state when sbf is asserted by the test bench
                    end
                end
                RUNNING: begin
                    timer++;                       // Increment timer
                    $display("RUNNING");
                    if (adc_rdy) begin
                        ring_buffer[tail] <= adc_data;      // Store data in ring buffer
                        tail <= (tail + 1) % 32; 
                        $display("Data received: %h -> %b", adc_data, adc_data);  // showing the data received from the adc
                        if (adc_data > trigvl) begin
                            trigtm <= timer;                    // Store trigger time
                            post_count <= 16;                  // Reset counter for capturing additional values after the trigger event
                            state <= TRIGGERED;
                        end
                        req <= 0;  // Set req to 0 after receiving data
                    
                        req <= 1;  // Set req to 1 to request next data
                    end
                end
                TRIGGERED: begin
                    timer++; 
                    $display("TRIGGERED");
                    if (post_count > 0) begin
                        ring_buffer[tail] <= adc_data;      // Store data in ring buffer
                        tail <= (tail + 1) % 32;            // Wrap around tail pointer
                        post_count <= post_count -1;
                        $display("Data received: %h -> %b", adc_data, adc_data);
                        
                        req <= 0;  // Set req to 0 after receiving data
                        
                        req <= 1;  // Set req to 1 to request next data

                    end else begin 
                        $display("TRANSITION TO BUFFER_SEND");
                        trd <= 1;  // set trigger detect high
                        state <= IDLE;
                    end
                end
                BUFFER_SEND: begin
                    $display("BUFFER_SEND");
                    sd <= 1;
                    cd <= 0;
                    state <= START_BIT;
                end
                START_BIT: begin
                    @ (negedge clk)begin
                        $display("Sending start bit");
                        sd <= 0;  // Set SD line to low for start bit
                        bit_count <= 7;
                        state <= DATA_BIT;
                    end
                end

                DATA_BIT: begin
                    @ (negedge clk)begin
                        $display("Sending bit %d for data %b (%h)", bit_count, ring_buffer[head], ring_buffer[head]);
                        //$display("Sending data bit %d for data %b (%h)", bit_count, ring_buffer[(tail - byte_count - 1) % 32], ring_buffer[(tail - byte_count - 1) % 32]);
                        //sd <= ring_buffer[(tail - byte_count - 1) % 32][bit_count];  
                        sd <= ring_buffer[head][bit_count];  // Transmit data bit big endian (MSB first)
                        if (bit_count > 0) begin                
                            bit_count <= bit_count - 1;
                        end else begin

                            if (byte_count == 0) begin
                                state <= COMPLETE;
                                
                            end else begin
                                byte_count <= byte_count - 1;
                                head <= (head + 1) % 32;
                                bit_count <= 8;
                                state <= START_BIT;  // Transition to START_BIT state for the next byte
                            end
                        end
                    end
                end
                COMPLETE: begin
                    @(posedge clk);  // Wait for one more clock pulse
                    cd <= 1;  // Set CD line to high to indicate transfer completion
                    sd <= 0;
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule

