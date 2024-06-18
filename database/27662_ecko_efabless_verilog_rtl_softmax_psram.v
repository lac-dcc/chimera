// This program was cloned from: https://github.com/Lefteris-B/ecko_efabless
// License: Apache License 2.0

module softmax_psram #(
    parameter INPUT_SIZE = 10,
    parameter ACTIV_BITS = 8,
    parameter ADDR_WIDTH = 24
) (
    input wire clk,
    input wire rst,
    input wire start,
    input wire [ADDR_WIDTH-1:0] input_addr,
    input wire [ADDR_WIDTH-1:0] output_addr,
    input wire [2:0] size,
    input wire [7:0] cmd,
    input wire rd_wr,
    input wire qspi,
    input wire qpi,
    input wire short_cmd,
    output wire done,
    output wire psram_sck,
    output wire psram_ce_n,
    output wire [3:0] psram_d,
    output wire [3:0] psram_douten
);

    // Internal signals
    reg [INPUT_SIZE*ACTIV_BITS-1:0] data_in;
    reg data_valid;
    wire [INPUT_SIZE*ACTIV_BITS-1:0] data_out;
    wire data_out_valid;
    reg [ADDR_WIDTH-1:0] addr;
    reg psram_start;
    wire psram_done;
    reg [31:0] psram_data_i;
    wire [31:0] psram_data_o;

    // Instantiate PSRAM controller
    EF_PSRAM_CTRL_V2 psram_ctrl (
        .clk(clk),
        .rst(rst),
        .addr(addr),
        .data_i(psram_data_i),
        .data_o(psram_data_o),
        .size(size),
        .start(psram_start),
        .done(psram_done),
        .wait_states(4'b0000), // Adjust wait states if necessary
        .cmd(cmd),
        .rd_wr(rd_wr),
        .qspi(qspi),
        .qpi(qpi),
        .short_cmd(short_cmd),
        .sck(psram_sck),
        .ce_n(psram_ce_n),
        .din(psram_d),
        .dout(psram_d),
        .douten(psram_douten)
    );

    // Softmax activation function
    integer i;
    reg [ACTIV_BITS-1:0] exp_values [0:INPUT_SIZE-1];
    reg [2*ACTIV_BITS-1:0] sum_exp;
    reg [ACTIV_BITS-1:0] softmax_values [0:INPUT_SIZE-1];

    always @(posedge clk) begin
        if (rst) begin
            data_valid <= 0;
            psram_start <= 0;
            addr <= 0;
            data_in <= 0;
        end else if (start && !psram_start && !data_valid) begin
            // Start reading input data from PSRAM
            addr <= input_addr;
            psram_start <= 1;
        end else if (psram_done && !data_valid) begin
            // Input data read complete
            psram_start <= 0;
            data_in <= psram_data_o;
            data_valid <= 1;
        end else if (data_valid) begin
            // Compute exponential values
            for (i = 0; i < INPUT_SIZE; i = i + 1) begin
                exp_values[i] <= data_in[i*ACTIV_BITS +: ACTIV_BITS];
            end

            // Compute sum of exponential values
            sum_exp <= 0;
            for (i = 0; i < INPUT_SIZE; i = i + 1) begin
                sum_exp <= sum_exp + {{ACTIV_BITS{1'b0}}, exp_values[i]};
            end

            // Compute softmax values
            for (i = 0; i < INPUT_SIZE; i = i + 1) begin
                softmax_values[i] <= (exp_values[i] << ACTIV_BITS) / sum_exp[2*ACTIV_BITS-1:ACTIV_BITS];
            end

            // Prepare to write output data to PSRAM
            data_valid <= 0;
            addr <= output_addr;
            psram_data_i <= {softmax_values[3], softmax_values[2], softmax_values[1], softmax_values[0]}; // Adjust if needed
            psram_start <= 1;
        end else if (psram_done && !start) begin
            // Output data write complete
            psram_start <= 0;
        end
    end

    assign done = psram_done && !psram_start && !data_valid;

endmodule