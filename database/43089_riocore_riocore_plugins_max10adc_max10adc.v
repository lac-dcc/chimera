// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0


module max10adc (
        input clk,
        output reg [15:0] adc0,
        output reg [15:0] adc1,
        output reg [15:0] adc2,
        output reg [15:0] adc3,
        output reg [15:0] adc4,
        output reg [15:0] adc5,
        output reg [15:0] adc6,
        output reg [15:0] adc7
    );

    wire sys_clk;
    wire command_ready;
    wire response_valid;
    wire [4:0] response_channel;
    wire [11:0] response_data;
    wire response_startofpacket;
    wire response_endofpacket;
    reg [4:0] command_channel = 0;

    always @ (posedge sys_clk) begin
        if (response_valid) begin
            command_channel <= command_channel + 1;
            case (response_channel)
                1: adc0 <= response_data;
                2: adc1 <= response_data;
                3: adc2 <= response_data;
                4: adc3 <= response_data;
                5: adc4 <= response_data;
                6: adc5 <= response_data;
                7: adc6 <= response_data;
                8: adc7 <= response_data;
                9: command_channel <= 0;
            endcase
        end
    end

    max10adc_ip max10adc0 (
        .clk_clk                              (clk),
        .reset_reset_n                        (1'b1),
        .modular_adc_0_command_valid          (1'b1),
        .modular_adc_0_command_channel        (command_channel+1),
        .modular_adc_0_command_startofpacket  (1'b1),
        .modular_adc_0_command_endofpacket    (1'b1),
        .modular_adc_0_command_ready          (command_ready),
        .modular_adc_0_response_valid         (response_valid),
        .modular_adc_0_response_channel       (response_channel),
        .modular_adc_0_response_data          (response_data),
        .modular_adc_0_response_startofpacket (response_startofpacket),
        .modular_adc_0_response_endofpacket   (response_endofpacket),
        .clock_bridge_sys_out_clk_clk         (sys_clk)
    );

endmodule

