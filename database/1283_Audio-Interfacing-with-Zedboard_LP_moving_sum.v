// This program was cloned from: https://github.com/Hariharan112/Audio-Interfacing-with-Zedboard
// License: MIT License

module low_pass_moving_sum #(parameter data_width = 16, window_width = 5) (
    input wire clk,
    input wire enable,
    input wire [data_width-1:0] sample_in,
    output reg [data_width-1:0] sample_out
);

    reg [data_width-1:0] total = 0;
    reg [window_width*data_width-1:0] delay_line = 0;
    wire [data_width-1:0] end_sample = delay_line[window_width*data_width-1 -: data_width];

    always @(posedge clk) begin
        if (enable) begin
            total <= total + sample_in - end_sample;
            delay_line <= {delay_line[window_width*data_width-data_width-1:0], sample_in};
        end
    end

    assign sample_out = total;

endmodule