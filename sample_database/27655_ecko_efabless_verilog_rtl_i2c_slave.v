// This program was cloned from: https://github.com/Lefteris-B/ecko_efabless
// License: Apache License 2.0

module i2c_slave (
    // I2C interface signals
    input wire scl_i,
    input wire sda_i,
    output reg sda_o,
    output reg sda_t,

    // Output audio signal
    output reg [15:0] audio_data_o,
    output reg audio_valid_o
);

// I2C slave address
parameter I2C_SLAVE_ADDRESS = 7'h45;

// I2C slave state machine
parameter STATE_IDLE     = 3'b000;
parameter STATE_ADDR     = 3'b001;
parameter STATE_ACK_ADDR = 3'b010;
parameter STATE_READ     = 3'b011;
parameter STATE_ACK_DATA = 3'b100;
parameter STATE_STOP     = 3'b101;

// Internal registers and signals
reg [2:0] i2c_state;
reg [6:0] i2c_slave_addr;
reg i2c_rw;
reg [3:0] i2c_bit_count;
reg [15:0] i2c_data_reg;
reg i2c_data_valid;
wire i2c_start;
wire i2c_stop;
wire i2c_ack;

// I2C start and stop condition detection
assign i2c_start = !sda_i && scl_i;
assign i2c_stop  = sda_i && scl_i;

// I2C acknowledge detection
assign i2c_ack = !sda_i;

// I2C slave logic
always @(posedge scl_i or negedge scl_i) begin
    case (i2c_state)
        STATE_IDLE: begin
            if (i2c_start) begin
                i2c_bit_count <= 7;
                i2c_state <= STATE_ADDR;
                audio_valid_o <= 0;
            end
        end
        STATE_ADDR: begin
            if (scl_i) begin
                i2c_slave_addr <= {i2c_slave_addr[5:0], sda_i};
                i2c_bit_count <= i2c_bit_count - 1;
                if (i2c_bit_count == 0) begin
                    i2c_rw <= sda_i;
                    i2c_state <= STATE_ACK_ADDR;
                end
            end
        end
        STATE_ACK_ADDR: begin
            if (!scl_i) begin
                if (i2c_slave_addr == I2C_SLAVE_ADDRESS[6:0]) begin
                    sda_o <= 0; // ACK
                    if (i2c_rw) begin
                        i2c_bit_count <= 15;
                        i2c_state <= STATE_READ;
                    end else begin
                        i2c_state <= STATE_IDLE;
                    end
                end else begin
                    sda_o <= 1; // NACK
                    i2c_state <= STATE_IDLE;
                end
            end else begin
                sda_o <= 1; // Release SDA
            end
        end
        STATE_READ: begin
            if (scl_i) begin
                i2c_data_reg <= {i2c_data_reg[14:0], sda_i};
                i2c_bit_count <= i2c_bit_count - 1;
                if (i2c_bit_count == 0) begin
                    i2c_state <= STATE_ACK_DATA;
                end
            end
        end
        STATE_ACK_DATA: begin
            if (!scl_i) begin
                sda_o <= 0; // ACK
                i2c_data_valid <= 1;
                audio_data_o <= i2c_data_reg;
                audio_valid_o <= 1;
            end else begin
                sda_o <= 1; // Release SDA
                if (i2c_stop) begin
                    i2c_state <= STATE_STOP;
                end else begin
                    i2c_bit_count <= 15;
                    i2c_state <= STATE_READ;
                end
            end
        end
        STATE_STOP: begin
            i2c_state <= STATE_IDLE;
            i2c_data_valid <= 0;
            audio_valid_o <= 0;
        end
        default: begin
            i2c_state <= STATE_IDLE;
            audio_valid_o <= 0;
        end
    endcase
end

// I2C data and clock control
always @(*) begin
    case (i2c_state)
        STATE_ACK_ADDR, STATE_ACK_DATA: begin
            sda_t = 0; // Drive SDA low for ACK
        end
        default: begin
            sda_t = 1; // Release SDA
        end
    endcase
end

endmodule
