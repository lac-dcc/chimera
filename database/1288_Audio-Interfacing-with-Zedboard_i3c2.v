// This program was cloned from: https://github.com/Hariharan112/Audio-Interfacing-with-Zedboard
// License: MIT License

module i3c2 #(parameter clk_divide = 8'd0) (
    input clk,
    output [9:0] inst_address,
    input [8:0] inst_data,
    output reg i2c_scl,
    input i2c_sda_i,
    output reg i2c_sda_o,
    output reg i2c_sda_t,
    input [15:0] inputs,
    output reg [15:0] outputs,
    output reg [4:0] reg_addr,
    output reg [7:0] reg_data,
    output reg reg_write,
    output reg debug_scl,
    output reg debug_sda,
    output reg error
);

    // Constants
    localparam STATE_RUN       = 4'b0000;
    localparam STATE_DELAY     = 4'b0001;
    localparam STATE_I2C_START = 4'b0010;
    localparam STATE_I2C_BITS  = 4'b0011;
    localparam STATE_I2C_STOP  = 4'b0100;


    localparam OPCODE_JUMP      = 4'b0000;
    localparam OPCODE_SKIPSET   = 4'b0001;
    localparam OPCODE_SKIPCLEAR = 4'b0010;
    localparam OPCODE_SET       = 4'b0011;
    localparam OPCODE_CLEAR     = 4'b0100;
    localparam OPCODE_I2C_READ  = 4'b0101;
    localparam OPCODE_DELAY     = 4'b0110;
    localparam OPCODE_SKIPACK   = 4'b0111;
    localparam OPCODE_SKIPNACK  = 4'b1000;
    localparam OPCODE_NOP       = 4'b1001;
    localparam OPCODE_I2C_STOP  = 4'b1010;
    localparam OPCODE_I2C_WRITE = 4'b1011;
    localparam OPCODE_WRITELOW  = 4'b1100;
    localparam OPCODE_WRITEHI   = 4'b1101;
    localparam OPCODE_UNKNOWN   = 4'b1110;

    // Signals
    reg [3:0] state =  STATE_RUN;
    reg [3:0] opcode;
    reg ack_flag = 1'b0;
    reg skip = 1'b1;
    reg i2c_doing_read = 1'b0;
    reg i2c_started = 1'b0;
    reg [3:0] i2c_bits_left;
    reg [9:0] pcnext = 10'b0;
    reg [15:0] delay;
    reg [7:0] bitcount;
    reg [8:0] i2c_data;

    // Process block
    always @(posedge clk) begin
        case(state)
            STATE_I2C_START:
                begin
                    i2c_started <= 1;
                    i2c_scl <= 1;
                    debug_scl <= 1;

                    if (bitcount == {1'b0, clk_divide[7:1]})
                        i2c_sda_t <= 0;

                    if (bitcount == 0) begin
                        state <= STATE_I2C_BITS;
                        i2c_scl <= 0;
                        debug_scl <= 0;
                        bitcount <= clk_divide;
                    end else begin
                        bitcount <= bitcount - 1;
                    end
                end

            STATE_I2C_BITS:
            // scl is always 0 on entry
            // set data half way through low half of clk cycle
                begin
                    if (bitcount == (clk_divide - {2'b00, clk_divide[7: 2]})) begin
                        if (i2c_data[8] == 0)
                            i2c_sda_t <= 0;
                        else
                            i2c_sda_t <= 1;
                    end

                    // raise clk halfway through
                    if (bitcount == {1'b0, clk_divide[7:1]}) begin
                        i2c_scl <= 1;
                        debug_scl <= 1;

                        // Input bits halfway through the cycle
                        i2c_data <= {i2c_data[7:0], i2c_sda_i};
                    end

                    // lower clk at end of cycle
                    if (bitcount == 0) begin
                        i2c_scl <= 0;
                        debug_scl <= 0;
                        if (i2c_bits_left == 0) begin
                            i2c_scl <= 0;
                            debug_scl <= 0;
                            if (i2c_doing_read == 1) begin
                                reg_data <= i2c_data[8:1];
                                reg_write <= 1;
                            end

                            ack_flag <= ~i2c_data[0];
                            state <= STATE_RUN;
                            pcnext <= pcnext + 1;
                        end else begin
                            i2c_bits_left <= i2c_bits_left - 1;
                        end
                        bitcount <= clk_divide;
                    end else begin
                        bitcount <= bitcount - 1;
                    end
                end

            STATE_I2C_STOP:
            // clk stays high and data goes high halfway through a bit
                begin
                    i2c_started <= 0;
                    if (bitcount == clk_divide - {2'b00, clk_divide[7:2]})
                        i2c_sda_t <= 0;
                    if (bitcount == {1'b0, clk_divide[7:1]}) begin
                        i2c_scl <= 1;
                        debug_scl <= 1;
                    end
                    if (bitcount == {2'b00, clk_divide[7:2]})
                        i2c_sda_t <= 1;

                    if (bitcount == 0) begin
                        state <= STATE_RUN;
                        pcnext <= pcnext + 1;

                    end else begin
                        bitcount <= bitcount - 1;
                    end
                end

            STATE_DELAY:
                begin
                    if (bitcount != 0)
                        bitcount <= bitcount - 1;
                    else begin
                        if (delay == 0) begin
                            pcnext <= pcnext + 1;
                            state <= STATE_RUN;
                        end else begin
                            delay <= delay - 1;
                            bitcount <= clk_divide - 1;
                        end
                    end
                end

            STATE_RUN:
                begin
                    reg_data <= 9'bxxxxxxxx;
                    if (skip == 1) begin
                        // do nothing for a cycle, and set skip to 1
                        skip <= 0;
                        pcnext <= pcnext + 1;

                    end else begin
                        case(opcode)
                            OPCODE_JUMP:
                                // Ignore the next instr while fetching the jump destination
                                begin
                                    skip <= 1;
                                    pcnext <= {inst_data[6:0], 3'b000};
                                end

                            OPCODE_I2C_WRITE:
                                begin
                                    i2c_data <= {inst_data[7:0], 1'b1};
                                    bitcount <= clk_divide;
                                    i2c_doing_read <= 0;
                                    i2c_bits_left <= 4'b1000;
                                    if (i2c_started == 0)
                                        state <= STATE_I2C_START;
                                    else
                                        state <= STATE_I2C_BITS;
                                end

                            OPCODE_I2C_READ:
                                begin
                                    reg_addr <= inst_data[4:0];
                                    i2c_data <= 9'b111111111;
                                    bitcount <= clk_divide;
                                    i2c_bits_left <= 4'b1000;
                                    i2c_doing_read <= 1;
                                    if (i2c_started == 0)
                                        state <= STATE_I2C_START;
                                    else
                                        state <= STATE_I2C_BITS;
                                end

                            OPCODE_SKIPCLEAR:
                                begin
                                    skip <= ~((inputs[inst_data[3:0]]) ^ inst_data[4]);
                                    pcnext <= pcnext + 1;
                                end

                            OPCODE_SKIPSET:
                                begin
                                    skip <= ~((inputs[inst_data[3:0]]) ^ inst_data[4]);
                                    pcnext <= pcnext + 1;
                                end

                            OPCODE_CLEAR:
                                begin
                                    outputs[inst_data[3:0]] <= inst_data[4];
                                    pcnext <= pcnext + 1;
                                end

                            OPCODE_SET:
                                begin
                                    outputs[inst_data[3:0]] <= inst_data[4];
                                    pcnext <= pcnext + 1;
                                end

                            OPCODE_SKIPACK:
                                begin
                                    skip <= ack_flag;
                                    pcnext <= pcnext + 1;
                                end

                            OPCODE_SKIPNACK:
                                begin
                                    skip <= ~ack_flag;
                                    pcnext <= pcnext + 1;
                                end

                            OPCODE_DELAY:
                                begin
                                    state <= STATE_DELAY;
                                    bitcount <= clk_divide;
                                    case(inst_data[3:0])
                                        4'b0000: delay <= 16'd1;
                                        4'b0001: delay <= 16'd2;
                                        4'b0010: delay <= 16'd4;
                                        4'b0011: delay <= 16'd8;
                                        4'b0100: delay <= 16'd16;
                                        4'b0101: delay <= 16'd32;
                                        4'b0110: delay <= 16'd64;
                                        4'b0111: delay <= 16'd128;
                                        4'b1000: delay <= 16'd256;
                                        4'b1001: delay <= 16'd512;
                                        4'b1010: delay <= 16'd1024;
                                        4'b1011: delay <= 16'd2048;
                                        4'b1100: delay <= 16'd4096;
                                        4'b1101: delay <= 16'd8192;
                                        default: delay <= 16'd16384;
                                    endcase
                                end

                            OPCODE_I2C_STOP:
                                begin
                                    bitcount <= clk_divide;
                                    state <= STATE_I2C_STOP;
                                end

                            OPCODE_NOP:
                                begin
                                    pcnext <= pcnext + 1;
                                end

                            default:
                                begin
                                    error <= 1;
                                end
                        endcase
                    end
                end

            default:
                begin
                    state <= STATE_RUN;
                    pcnext <= 10'd0;
                    skip <= 1;
                end
        endcase
    end
endmodule
