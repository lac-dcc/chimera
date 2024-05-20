// This program was cloned from: https://github.com/AleksandarLilic/ama-riscv
// License: GNU General Public License v3.0

//-----------------------------------------------------------------------------
// Project:         AMA-RISCV
// Module:          UART Core for FPGA implementation Testbench
// File:            uart_core_fpga_tb.v
// Date created:    2021-06-06
// Author:          Aleksandar Lilic
// Description:     
//  Module instantiates UART Core sub-module as a off_chip_uart and one 
//  uart_core_fpga and connects them via RX/TX lines. Flow is as follows:
//  Testbench -> off_chip_uart -> Serial line -> uart_core_fpga -> Testbench
//  Testbench drives some data to TX and than compares it with the RX side
//  taking into account the modification that uart_core_fpga does
//
// Version history:
//      2021-06-06  AL  0.1.0 - Initial
//      2021-06-06  AL  1.0.0 - Sign-off
//-----------------------------------------------------------------------------

`timescale 1ns/100ps

`define CLK_PERIOD              8
`define CLOCK_FREQ    125_000_000
`define BAUD_RATE         115_200

module uart_core_fpga_tb();
//-----------------------------------------------------------------------------
// Signals
reg         clk = 0;
reg         rst;

// I/O of uart_core_fpga
wire        FPGA_SERIAL_RX;
wire        FPGA_SERIAL_TX;
wire  [5:0] leds;

// I/O of the off-chip UART
reg   [7:0] data_in;
reg         data_in_valid;
wire        data_in_ready;
wire  [7:0] data_out;
wire        data_out_valid;
reg         data_out_ready;

// Testbench variables
integer     err_cnt;
integer     packet_num;
reg         done = 0;

//-----------------------------------------------------------------------------
// DUT instance
uart_core_fpga #(
    .CLOCK_FREQ         (`CLOCK_FREQ),
    .BAUD_RATE          (`BAUD_RATE)
) DUT (
    .CLK_125MHZ_FPGA    (clk),
    .BUTTONS            ({3'd0, rst}),
    .SWITCHES           (2'd0),
    .LEDS               (leds),
    .FPGA_SERIAL_RX     (FPGA_SERIAL_RX),
    .FPGA_SERIAL_TX     (FPGA_SERIAL_TX)
);

//-----------------------------------------------------------------------------
// The off-chip UART (simulates desktop/workstation computer)
uart_core # (
    .CLOCK_FREQ     (`CLOCK_FREQ),
    .BAUD_RATE      (`BAUD_RATE)
) off_chip_uart (
    .clk            (clk),
    .rst            (rst),
    
    .data_in        (data_in),
    .data_in_valid  (data_in_valid),
    .data_in_ready  (data_in_ready),
    
    .data_out       (data_out),
    .data_out_valid (data_out_valid),
    .data_out_ready (data_out_ready),
    
    // Note: lines are cross connected from first UART
    .serial_in      (FPGA_SERIAL_TX), 
    .serial_out     (FPGA_SERIAL_RX)
);

//-----------------------------------------------------------------------------
// Clock gen: 125 MHz
always #(`CLK_PERIOD/2) clk = ~clk;

//-----------------------------------------------------------------------------
// Test
initial begin
    err_cnt         = 0;
    packet_num      = 0;
    rst             = 1'b0;
    data_in         = 8'h41; // Represents the character 'A' in ASCII
    data_in_valid   = 1'b0;
    data_out_ready  = 1'b0;
    repeat (2) @(posedge clk); #1;

    // Pulse the reset signal
    rst = 1'b1;
    //repeat (40) 
    @(posedge clk); #1;
    rst = 1'b0;

    fork
    begin
        repeat (50) begin
            
            // Wait until the off-chip UART transmitter is ready to transmit
            while (!data_in_ready) 
                @(posedge clk); #1;

            // Once the off-chip UART transmitter is ready, pulse data_in_valid signal 
            // that there is valid data that needs to be sent over the serial line
            // negedge to make semantics clearer
            // to change to posedge
            @(negedge clk); #1;
            data_in_valid = 1'b1;
            @(negedge clk); #1;
            data_in_valid = 1'b0;
            //$display("off-chip UART about to transmit: %h/%c to the on-chip UART", data_in, data_in);

            // Once all the data reaches the on-chip UART, it should set DUT/on_chip_uart/data_out_valid high
            while (!DUT.on_chip_uart.data_out_valid) @(posedge clk); #1;
            //$display("DUT on-chip UART received: %h from the off-chip UART", DUT.on_chip_uart.data_out);

            // Then the state machine in uart_core_fpga should pulse
            // DUT/on_chip_uart/data_out_ready high and send the data
            // it received back through the on-chip UART transmitter
            while (!DUT.on_chip_uart.data_in_valid) @(posedge clk); #1;
            //$display("DUT on-chip UART about to transmit: %h to the off-chip UART", DUT.on_chip_uart.data_in);

            // Finally, when the data is echoed back to the off-chip UART, data_out_valid
            // should go high. Now is when the off chip UART can read the data it received
            // and print it out to the terminal
            
            // Check out why is this wait still needed
            // For whichever reason, UART does not pull data_out_valid low on time 
            repeat (4) @(posedge clk); #1;
            
            while (!data_out_valid) 
                @(posedge clk); #1;
            //$display("off-chip UART received: %h/%c from on-chip UART", data_out, data_out);
            data_out_ready = 1'b1;
            @(posedge clk); #1;
            data_out_ready = 1'b0;
            
            if ((data_out != (data_in + 'h20)) && (data_out != (data_in - 'h20)) && (data_out != data_in)) begin
                $display("ERROR IN TRANSMITION: off-chip UART received: %h/%c; DUT UART sent %h/%c;", 
                data_out, data_out, data_in, data_in);
                err_cnt = err_cnt + 1;
             end
             
            data_in     = data_in + 1;
            packet_num  = packet_num + 1; 
        end
        done = 1;
    end
    
    // Catch time-out:
    begin
        repeat (35000*35) @(posedge clk);
        if (!done) begin
            $display("Failure: timing out");
            $finish();
        end
    end
    join

    repeat (100) @(posedge clk);
    $display("Test done. Number of errors: %0d", err_cnt);
    $finish();
end
endmodule
