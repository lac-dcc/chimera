// This program was cloned from: https://github.com/Lefteris-B/ecko_efabless
// License: Apache License 2.0

module conv2d_psram #(
    parameter INPUT_WIDTH = 40, // MFCC features
    parameter INPUT_HEIGHT = 1, // Single feature height
    parameter INPUT_CHANNELS = 1, // Single channel input
    parameter KERNEL_SIZE = 3,
    parameter NUM_FILTERS = 8,
    parameter PADDING = 1,
    parameter ACTIV_BITS = 16
) (
    input wire clk,
    input wire rst,
    input wire [INPUT_WIDTH * INPUT_HEIGHT * INPUT_CHANNELS * ACTIV_BITS-1:0] data_in,
    input wire data_valid,
    output wire [INPUT_WIDTH * INPUT_HEIGHT * NUM_FILTERS * ACTIV_BITS-1:0] data_out,
    output wire data_out_valid,
    output wire done,  // Add done signal

    // PSRAM interface signals
    output wire psram_sck,
    output wire psram_ce_n,
    inout wire [3:0] psram_d,
    output wire [3:0] psram_douten,
    
    // Base addresses for weights and biases
    input wire [23:0] weight_base_addr,
    input wire [23:0] bias_base_addr
);

    // State definitions
    localparam IDLE = 0,
               LOAD_WEIGHTS = 1,
               LOAD_BIASES = 2,
               CONV = 3,
               STORE_RESULT = 4,
               DONE = 5;

    reg [3:0] state, next_state;
    reg [23:0] addr;
    reg [31:0] psram_data;
    reg psram_start, psram_rd_wr;
    reg [2:0] psram_size;
    reg psram_qspi, psram_qpi, psram_short_cmd;
    wire psram_done;
    
    wire [31:0] psram_data_out;

    // Instantiate PSRAM controller
    EF_PSRAM_CTRL_V2 psram_ctrl (
        .clk(clk),
        .rst(rst),
        .addr(addr),
        .data_i(psram_data),
        .data_o(psram_data_out),
        .size(psram_size),
        .start(psram_start),
        .done(psram_done),
        .wait_states(4'd8), // Adjust wait states as needed
        .cmd(8'hEB), // Example command
        .rd_wr(psram_rd_wr),
        .qspi(psram_qspi),
        .qpi(psram_qpi),
        .short_cmd(psram_short_cmd),
        .sck(psram_sck),
        .ce_n(psram_ce_n),
        .din(psram_d),
        .dout(psram_d),
        .douten(psram_douten)
    );

    reg [ACTIV_BITS-1:0] weights [0:NUM_FILTERS-1][0:INPUT_CHANNELS-1][0:KERNEL_SIZE-1][0:KERNEL_SIZE-1];
    reg [ACTIV_BITS-1:0] biases [0:NUM_FILTERS-1];
    reg [ACTIV_BITS-1:0] conv_result [0:INPUT_HEIGHT-1][0:INPUT_WIDTH-1][0:NUM_FILTERS-1];

    integer i, j, k, l, m, n, p, q;

    // State machine
    always @(posedge clk) begin
        if (rst)
            state <= IDLE;
        else
            state <= next_state;
    end

    always @(*) begin
        next_state = state;
        case (state)
            IDLE: if (data_valid) next_state = LOAD_WEIGHTS;
            LOAD_WEIGHTS: if (psram_done) next_state = LOAD_BIASES;
            LOAD_BIASES: if (psram_done) next_state = CONV;
            CONV: next_state = STORE_RESULT;
            STORE_RESULT: if (psram_done) next_state = DONE;
            DONE: next_state = IDLE;
        endcase
    end

    // Control logic for PSRAM operations
    always @(posedge clk) begin
        if (rst) begin
            addr <= 24'b0;
            psram_data <= 32'b0;
            psram_start <= 0;
            psram_rd_wr <= 0;
            psram_size <= 3'b010; // 4 bytes
            psram_qspi <= 0;
            psram_qpi <= 0;
            psram_short_cmd <= 0;
        end else begin
            psram_start <= 0;
            case (state)
                LOAD_WEIGHTS: begin
                    addr <= weight_base_addr;
                    psram_rd_wr <= 1;
                    psram_start <= 1;
                end
                LOAD_BIASES: begin
                    addr <= bias_base_addr;
                    psram_rd_wr <= 1;
                    psram_start <= 1;
                end
                STORE_RESULT: begin
                    addr <= 24'hXXXXXX; // Address to store results in PSRAM
                    psram_data <= conv_result[m][n][p];
                    psram_rd_wr <= 0;
                    psram_start <= 1;
                end
            endcase
        end
    end

    // Convolution operation
    always @(posedge clk) begin
        if (rst) begin
            for (i = 0; i < INPUT_HEIGHT; i = i + 1)
                for (j = 0; j < INPUT_WIDTH; j = j + 1)
                    for (k = 0; k < NUM_FILTERS; k = k + 1)
                        conv_result[i][j][k] <= 0;
        end else if (state == CONV) begin
            for (m = 0; m < INPUT_HEIGHT; m = m + 1) begin
                for (n = 0; n < INPUT_WIDTH; n = n + 1) begin
                    for (p = 0; p < NUM_FILTERS; p = p + 1) begin
                        conv_result[m][n][p] = biases[p];
                        for (q = 0; q < INPUT_CHANNELS; q = q + 1) begin
                            for (i = 0; i < KERNEL_SIZE; i = i + 1) begin
                                for (j = 0; j < KERNEL_SIZE; j = j + 1) begin
                                    if ((m + i) < INPUT_HEIGHT && (n + j) < INPUT_WIDTH) begin
                                        conv_result[m][n][p] = conv_result[m][n][p] + weights[p][q][i][j] * data_in[((m + i) * INPUT_WIDTH * INPUT_CHANNELS + (n + j) * INPUT_CHANNELS + q) * ACTIV_BITS +: ACTIV_BITS];
                                    end
                                end
                            end
                        end
                        // Apply ReLU activation
                        conv_result[m][n][p] = (conv_result[m][n][p][ACTIV_BITS-1] == 0) ? conv_result[m][n][p] : 0;
                    end
                end
            end
        end
    end

    assign data_out = {conv_result[0][0][0], conv_result[0][0][1], conv_result[0][0][2], conv_result[0][0][3], conv_result[0][0][4], conv_result[0][0][5], conv_result[0][0][6], conv_result[0][0][7]};
    assign data_out_valid = (state == DONE);
    assign done = (state == DONE); // Drive the done signal when state is DONE

endmodule