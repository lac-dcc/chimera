// This program was cloned from: https://github.com/Lefteris-B/ecko_efabless
// License: Apache License 2.0

module fully_connected_psram #(
    parameter INPUT_SIZE = 320,
    parameter OUTPUT_SIZE = 64,
    parameter ACTIV_BITS = 16
) (
    input wire clk,
    input wire rst,
    input wire [INPUT_SIZE*ACTIV_BITS-1:0] data_in,
    input wire data_valid,
    output wire [OUTPUT_SIZE*ACTIV_BITS-1:0] data_out,
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
               FC = 3,
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

    reg [ACTIV_BITS-1:0] weights [0:OUTPUT_SIZE-1][0:INPUT_SIZE-1];
    reg [ACTIV_BITS-1:0] biases [0:OUTPUT_SIZE-1];
    reg [ACTIV_BITS-1:0] fc_result [0:OUTPUT_SIZE-1];

    integer i, j;

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
            LOAD_BIASES: if (psram_done) next_state = FC;
            FC: next_state = STORE_RESULT;
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
                    psram_data <= fc_result[i];
                    psram_rd_wr <= 0;
                    psram_start <= 1;
                end
            endcase
        end
    end

    // Fully connected operation
    always @(posedge clk) begin
        if (rst) begin
            for (i = 0; i < OUTPUT_SIZE; i = i + 1)
                fc_result[i] <= 0;
        end else if (state == FC) begin
            for (i = 0; i < OUTPUT_SIZE; i = i + 1) begin
                fc_result[i] = biases[i];
                for (j = 0; j < INPUT_SIZE; j = j + 1) begin
                    fc_result[i] = fc_result[i] + weights[i][j] * data_in[j*ACTIV_BITS +: ACTIV_BITS];
                end
                // Apply ReLU activation
                fc_result[i] = (fc_result[i][ACTIV_BITS-1] == 0) ? fc_result[i] : 0;
            end
        end
    end

    assign data_out = {fc_result[0], fc_result[1], fc_result[2], fc_result[3], fc_result[4], fc_result[5], fc_result[6], fc_result[7]};
    assign data_out_valid = (state == DONE);
    assign done = (state == DONE); // Drive the done signal when state is DONE

endmodule