// This program was cloned from: https://github.com/Asiadav/OpenPBKDF2
// License: MIT License

/**
*SHA256 padder module
**/

module sha256_padder(
     input logic clk_i
    ,input logic rst_i  
  
    ,input logic in_valid
    ,input [7:0] in
    ,input logic last_byte
    ,output logic in_ready

    ,output logic out_valid
    ,output logic [511:0] out
    ,input logic out_ready
);

    enum {WAITING, BUILDING, SENDING, SENT, APPEND, PADDING, LENGTH} state, build_state;

    logic [63:0] read_bytes;

    logic [5:0] index;
    logic [511:0] building;

    always_ff @(posedge clk_i) begin
        if (rst_i) begin
            read_bytes <= 0;
            index <= 0;
            building <= 0;
            in_ready <= 0;
            state <= WAITING;
        end else begin
            case (state)
                WAITING: begin
                    index <= 0;
                    read_bytes <= 0;
                    if (in_valid) begin
                        state <= BUILDING;
                        build_state <= BUILDING;
                        in_ready <= 1;
                    end
                end
                BUILDING: begin
                    if (in_valid) begin
                        building[((64 - index) * 8) +:8] <= in;
                        read_bytes <= read_bytes + 1;

                        if (last_byte) begin
                            in_ready <= 0;
                            index <= index + 6'b1;
                            build_state <= APPEND;
                            state <= index == 63 ? SENDING : APPEND;
                        end else begin
                            if (index == 63) begin
                                index <= 0;
                                in_ready <= 0;
                                state <= SENDING;
                            end else begin
                                index <= index + 6'b1;
                            end
                        end
                    end
                end
                SENDING: begin
                    out <= building;
                    out_valid <= 1;
                    if (out_ready) begin
                        state <= SENT;
                    end
                end
                SENT: begin
                    out_valid <= 0;
                    state <= build_state;
                end
                APPEND: begin
                    building[((64 - index) * 8) +:8] <= 8'b10000000;
                    if (index == 63) begin
                        index <= 0;
                        state <= SENDING;
                    end else begin
                        index <= index + 6'b1;
                        // index == 55 means no padding
                        state <= index == 55 ? LENGTH : PADDING;
                    end
                    build_state <= index == 55 ? LENGTH : PADDING;
                end
                PADDING: begin
                    building[((64 - index) * 8) +:8] <= 8'b00000000;
                    if (index == 63) begin // This can still be hit if the append bit is after index 55
                        index <= 0;
                        state <= SENDING;
                    end else begin
                        index <= index + 6'b1;
                        // index == 55 means no more padding
                        state <= index == 55 ? LENGTH : PADDING;
                    end
                    build_state <= index == 55 ? LENGTH : PADDING;
                end
                LENGTH: begin
                    // Why the -1? seems wrong
                    building[63:0] <= (read_bytes - 1) * 8;
                    index <= 0;
                    state <= SENDING;
                    build_state <= WAITING;
                end
            endcase
        end
    end
endmodule
