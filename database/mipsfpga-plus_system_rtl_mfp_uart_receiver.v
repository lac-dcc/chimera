`include "mfp_ahb_lite_matrix_config.vh"

module mfp_uart_receiver
(
    input  clock,
    input  reset_n,
    input  rx,
    output reg [7:0] byte_data,
    output           byte_ready
);

    `ifdef MFP_USE_SLOW_CLOCK_AND_CLOCK_MUX
        parameter  clock_frequency        = 50000000 / 2;
    `else
        parameter  clock_frequency        = 50000000;
    `endif

    parameter  baud_rate              = 115200;
    parameter  clock_cycles_in_symbol = clock_frequency / baud_rate;

    // Synchronize rx input to clock

    reg rx_sync1, rx_sync;

    always @(posedge clock or negedge reset_n)
    begin
        if (! reset_n)
        begin
            rx_sync1 <= 1;
            rx_sync  <= 1;
        end
        else
        begin
            rx_sync1 <= rx;
            rx_sync  <= rx_sync1;
        end
    end

    // Finding edge for start bit

    reg prev_rx_sync;

    always @(posedge clock or negedge reset_n)
    begin
        if (! reset_n)
            prev_rx_sync <= 1;
        else
            prev_rx_sync <= rx_sync;
    end

    wire start_bit_edge = prev_rx_sync & ! rx_sync;

    // Counter to measure distance between symbols

    reg [31:0] counter;
    reg        load_counter;
    reg [31:0] load_counter_value;

    always @(posedge clock or negedge reset_n)
    begin
        if (! reset_n)
            counter <= 0;
        else if (load_counter)
            counter <= load_counter_value;
        else if (counter != 0)
            counter <= counter - 1;
    end

    wire counter_done = counter == 1;

    // Shift register to accumulate data

    reg       shift;
    reg [7:0] shifted_1;
    assign    byte_ready = shifted_1 [0];

    always @ (posedge clock or negedge reset_n)
    begin
        if (! reset_n)
        begin
            shifted_1 <= 0;
        end
        else if (shift)
        begin
            if (shifted_1 == 0)
                shifted_1 <= 8'b10000000;
            else
                shifted_1 <= shifted_1 >> 1;

            byte_data <= { rx, byte_data [7:1] };
        end
        else if (byte_ready)
        begin
            shifted_1 <= 0;
        end
    end

    reg idle, idle_r;

    always @*
    begin
        idle  = idle_r;
        shift = 0;

        load_counter        = 0;
        load_counter_value  = 0;

        if (idle)
        begin
            if (start_bit_edge)
            begin
                load_counter       = 1;
                load_counter_value = clock_cycles_in_symbol * 3 / 2;
           
                idle = 0;
            end
        end
        else if (counter_done)
        begin
            shift = 1;

            load_counter       = 1;
            load_counter_value = clock_cycles_in_symbol;
        end
        else if (byte_ready)
        begin
            idle = 1;
        end
    end

    always @ (posedge clock or negedge reset_n)
    begin
        if (! reset_n)
            idle_r <= 1;
        else
            idle_r <= idle;
    end

endmodule
