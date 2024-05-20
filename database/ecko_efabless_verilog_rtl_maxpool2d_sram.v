// This program was cloned from: https://github.com/Lefteris-B/ecko_efabless
// License: Apache License 2.0

module maxpool_psram #(
    parameter INPUT_WIDTH = 40,
    parameter INPUT_HEIGHT = 1,
    parameter INPUT_CHANNELS = 8,
    parameter KERNEL_SIZE = 2,
    parameter STRIDE = 2,
    parameter ACTIV_BITS = 16,
    parameter ADDR_WIDTH = 24
) (
    input wire clk,
    input wire rst,
    input wire start,
    input wire [ADDR_WIDTH-1:0] input_addr,
    input wire [ADDR_WIDTH-1:0] output_addr,
    output wire done,
    // PSRAM interface signals
    output wire psram_sck,
    output wire psram_ce_n,
    inout wire [3:0] psram_d,
    output wire [3:0] psram_douten
);

    // State definitions
    localparam IDLE = 0,
               LOAD_INPUT = 1,
               MAXPOOL = 2,
               STORE_OUTPUT = 3,
               DONE = 4;

    reg [2:0] state, next_state;
    reg [ADDR_WIDTH-1:0] addr;
    reg [31:0] psram_data_i;
    wire [31:0] psram_data_o;
    reg psram_start, psram_rd_wr;
    reg [2:0] psram_size;
    reg psram_qspi, psram_qpi, psram_short_cmd;
    wire psram_done;

    // Instantiate PSRAM controller
    EF_PSRAM_CTRL_V2 psram_ctrl (
        .clk(clk),
        .rst(rst),
        .addr(addr),
        .data_i(psram_data_i),
        .data_o(psram_data_o),
        .size(psram_size),
        .start(psram_start),
        .done(psram_done),
        .wait_states(4'b0000),  // Adjust wait states if necessary
        .cmd(8'hEB),  // Example command
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

    // Internal signals
    reg [ACTIV_BITS-1:0] input_buffer [0:INPUT_HEIGHT-1][0:INPUT_WIDTH-1][0:INPUT_CHANNELS-1];
    reg [ACTIV_BITS-1:0] max_value [0:INPUT_CHANNELS-1];
    reg [(INPUT_WIDTH/STRIDE) * INPUT_CHANNELS * ACTIV_BITS-1:0] data_out;
    reg data_out_valid;
    
    integer i, j, k, m, n;

    // State machine
    always @(posedge clk) begin
        if (rst)
            state <= IDLE;
        else
            state <= next_state;
    end

    always @* begin
        next_state = state;
        case (state)
            IDLE: if (start) next_state = LOAD_INPUT;
            LOAD_INPUT: if (psram_done) next_state = MAXPOOL;
            MAXPOOL: next_state = STORE_OUTPUT;
            STORE_OUTPUT: if (psram_done) next_state = DONE;
            DONE: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    // Control logic for PSRAM operations
    always @(posedge clk) begin
        if (rst) begin
            addr <= 0;
            psram_data_i <= 0;
            psram_start <= 0;
            psram_rd_wr <= 0;
            psram_size <= 3'b010; // 4 bytes
            psram_qspi <= 0;
            psram_qpi <= 0;
            psram_short_cmd <= 0;
        end else begin
            psram_start <= 0;
            case (state)
                LOAD_INPUT: begin
                    addr <= input_addr;
                    psram_rd_wr <= 1;
                    psram_start <= 1;
                end
                STORE_OUTPUT: begin
                    addr <= output_addr;
                    psram_data_i <= {max_value[3], max_value[2], max_value[1], max_value[0]}; // Adjust if needed
                    psram_rd_wr <= 0;
                    psram_start <= 1;
                end
            endcase
        end
    end

    // Max pooling operation
    always @(posedge clk) begin
        if (rst) begin
            data_out <= 0;
            data_out_valid <= 0;
            for (i = 0; i < INPUT_HEIGHT; i = i + 1) begin
                for (j = 0; j < INPUT_WIDTH; j = j + 1) begin
                    for (k = 0; k < INPUT_CHANNELS; k = k + 1) begin
                        input_buffer[i][j][k] <= 0;
                    end
                end
            end
        end else if (state == LOAD_INPUT && psram_done) begin
            // Load data from PSRAM to input buffer
            for (i = 0; i < INPUT_HEIGHT; i = i + 1) begin
                for (j = 0; j < INPUT_WIDTH; j = j + 1) begin
                    for (k = 0; k < INPUT_CHANNELS; k = k + 1) begin
                        input_buffer[i][j][k] <= psram_data_o[ACTIV_BITS-1:0]; // Adjust if needed
                    end
                end
            end
        end else if (state == MAXPOOL) begin
            // Perform max pooling
            for (i = 0; i < INPUT_HEIGHT/STRIDE; i = i + 1) begin
                for (j = 0; j < INPUT_WIDTH/STRIDE; j = j + 1) begin
                    for (k = 0; k < INPUT_CHANNELS; k = k + 1) begin
                        max_value[k] = input_buffer[i*STRIDE][j*STRIDE][k];
                        for (m = 0; m < KERNEL_SIZE; m = m + 1) begin
                            for (n = 0; n < KERNEL_SIZE; n = n + 1) begin
                                if (i*STRIDE + m < INPUT_HEIGHT && j*STRIDE + n < INPUT_WIDTH) begin
                                    max_value[k] = (input_buffer[i*STRIDE + m][j*STRIDE + n][k] > max_value[k]) ? input_buffer[i*STRIDE + m][j*STRIDE + n][k] : max_value[k];
                                end
                            end
                        end
                        data_out[i*(INPUT_WIDTH/STRIDE)*INPUT_CHANNELS*ACTIV_BITS + j*INPUT_CHANNELS*ACTIV_BITS + k*ACTIV_BITS +: ACTIV_BITS] <= max_value[k];
                    end
                end
            end
            data_out_valid <= 1;
        end else if (state == STORE_OUTPUT && psram_done) begin
            data_out_valid <= 0;
        end
    end

    assign done = (state == DONE);
endmodule