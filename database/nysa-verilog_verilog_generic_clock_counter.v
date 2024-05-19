// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License


/*
 * Attributes:
 *  REFCLOCK_SECOND_COUNTER: Number of clock_ref perioss in a second
 *      By default it is set for 100MHz
 *
 * Ports:
 *  clock_ref:  (Input):    Known Clock (For Example 100 MHz)
 *  rst         (Input):    Reset
 *  clock_input (Output):   Clock To Measure
 *  value       (Output):   Number of clock cycles per second
 */

`include "project_defines.v"

module clock_counter #(
    parameter REFCLK_SECOND_COUNTER = `CLOCK_RATE
)(
    input               clock_ref,
    input               rst,
    input               clock_input,
    output  reg  [31:0] value
);

//Local Parameters

//Registers/Wires
reg [31:0]  ref_count;
reg         capture;
wire        cc_capture;
reg [31:0]  counter;
reg         data_ready_strobe;
wire        ref_data_ready;
reg [31:0]  input_value;


//Submodules
cross_clock_strobe ccc(
    .rst            (rst                ),
    .in_clk         (clock_ref          ),
    .in_stb         (capture            ),

    .out_clk        (clock_input        ),
    .out_stb        (cc_strobe          )

);

cross_clock_strobe ccd(
    .rst            (rst                ),
    .in_clk         (clock_input        ),
    .in_stb         (data_ready_strobe  ),

    .out_clk        (clock_ref          ),
    .out_stb        (ref_data_ready     )
);

//Asynchronous Logic

//Synchronous Logic
always @ (posedge clock_ref) begin
    if (rst) begin
        capture         <=  0;
        ref_count       <=  0;
        value           <=  0;
    end
    else begin
        capture         <=  0;
        if (ref_count < REFCLK_SECOND_COUNTER) begin
            ref_count   <=  ref_count + 32'h01;
        end
        else begin
            ref_count   <=  0;
            capture     <=  1;
        end
        if (ref_data_ready) begin
            value       <= input_value;
        end
    end
end

always @ (posedge clock_input) begin
    if (rst) begin
        counter             <= 0;
        input_value         <= 0;
        data_ready_strobe   <= 0;
    end
    else begin
        data_ready_strobe   <= 0;
        counter <= counter + 1;
        if (cc_strobe) begin
            input_value         <= counter;
            data_ready_strobe   <= 1;
            counter               <= 0;
        end
    end
end

endmodule
