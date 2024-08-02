// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License

module tart(
    input  CLK_16,

    input SCLK,
    output MISO,
    input MOSI,
    input CS,

    output RADIO_RECONFIG,

    input[23:0] I1,
    input[23:0] Q1
);

/********** Counter **********/
//parameter Clock_frequency = 27_000_000; // Crystal oscillator frequency is 27Mhz
parameter count_value       = 13_499_999; // The number of times needed to time 0.5S

reg [23:0]  count_value_reg ; // counter_value
reg         count_value_flag; // IO chaneg flag

reg [23:0] I_data;
reg [23:0] Q_data;

reg MISO_reg = 1'b0; // Initial state
reg RECONFIG_reg = 1'b0; // Initial state

// Latch the data
always @(posedge CLK_16) begin
    I_data <= I1;
    Q_data <= Q1;
end


always @(posedge CLK_16) begin
    if ( count_value_reg <= count_value ) begin //not count to 0.5S
        count_value_reg  <= count_value_reg + 1'b1; // Continue counting
        count_value_flag <= 1'b0 ; // No flip flag
    end
    else begin //Count to 0.5S
        count_value_reg  <= 23'b0; // Clear counter,prepare for next time counting.
        count_value_flag <= 1'b1 ; // Flip flag
        MISO_reg <= I_data[0];
    end
end



/***** Add an extra line of code *****/
assign MISO = MISO_reg;
assign RADIO_RECONFIG = RECONFIG_reg;

endmodule