// This program was cloned from: https://github.com/phoenix367/tang_nano_9K_ov7670
// License: MIT License

module I2C_Controller #(
    parameter MAIN_CLOCK_FREQUENCY = 'd27_000_000,      // Clock frequency
    parameter DATA_BUFFER_SIZE = 'd8                    // Memory buffer size in bytes for read and write data
)
(
    input clk,                  // clk input
    input rst_n,                // reset input
    input [6:0] device_addr,
    output reg init_done,
    inout master_scl,
    inout master_sda,
    input [7:0] data_in,
    output reg [7:0] data_out,
    input store_data,
    input send_data,
    output reg send_complete
);

localparam I2C_CLOCK_FREQUENCY = 'd100_000;      // 100 KHz clock frequency for I2C
localparam [15:0] I2C_PRESCALE_VALUE = int'(MAIN_CLOCK_FREQUENCY / (5 * I2C_CLOCK_FREQUENCY)) - 'd1;
localparam BUFFER_INDEX_WIDTH = $clog2(DATA_BUFFER_SIZE);

// I2C Master registers
localparam [2:0] Prescale_reg0                  = 3'h0;
localparam [2:0] Prescale_reg1                  = 3'h1;
localparam [2:0] Control_reg                    = 3'h2;
localparam [2:0] Transmit_reg                   = 3'h3;
localparam [2:0] Receive_reg                    = 3'h3;
localparam [2:0] Command_reg                    = 3'h4;
localparam [2:0] Status_reg                     = 3'h4;

// I2C Master control bits
localparam [7:0] I2C_MASTER_ENABLE              = 8'b10000000;
localparam [7:0] I2C_MASTER_INTERRUPT_ENABLE    = 8'b01000000;

typedef enum bit[4:0] {STATE_IDLE, I2C_INIT, SET_CONTROL_REG, WAIT_COMMAND,
                       SEND_ADDR, PRE_CHECK_TIP, CHECK_TIP, SEND_NEXT_BYTE,
                       SEND_LAST_BYTE, WRITE_SLAVE_ADDR, PREPARE_SEND_BYTE,
                       SEND_CURRENT_BYTE, SEND_BYTE_PRE_CHECK_TIP, SEND_BYTE_CHECK_TIP} PROCESSING_STATES;

reg tx_en;
reg rx_en;
reg [7:0] wr_data;
reg [2:0] wr_addr;
wire [7:0] rd_data;
reg [2:0] rd_addr;
reg [2:0] i2c_control_cnt;

reg [7:0] memory_buffer[DATA_BUFFER_SIZE - 1:0];
reg [BUFFER_INDEX_WIDTH - 1:0] wr_index;
reg [BUFFER_INDEX_WIDTH - 1:0] wr_pointer;
reg [BUFFER_INDEX_WIDTH - 1:0] rd_index;

I2C_MASTER_Control i2c_master(
    .I_CLK(clk), 
    .I_RESETN(rst_n), 
    .SCL(master_scl),
    .SDA(master_sda),
    .I_TX_EN(tx_en),
    .I_WDATA(wr_data),
    .I_WADDR(wr_addr),
    .I_RX_EN(rx_en),
    .O_RDATA(rd_data),
    .I_RADDR(rd_addr)
);

PROCESSING_STATES state;

initial begin
    state <= STATE_IDLE;
    i2c_control_cnt <= 'd0;
    tx_en <= 1'b0;
    rx_en <= 1'b0;
    init_done <= 1'b0;
    send_complete <= 1'b0;
end

always @(posedge clk or negedge rst_n)
begin
    if (!rst_n)
        begin
            state <= STATE_IDLE;
            i2c_control_cnt <= 'd0;
            init_done <= 1'b0;
            send_complete <= 1'b0;
        end 
    else 
        begin
            case(state)
                STATE_IDLE: state = I2C_INIT;
                I2C_INIT: 
                begin
                    if (i2c_control_cnt < 'd2)
                        i2c_control_cnt += 1;
                    else begin
                        state <= SET_CONTROL_REG;
                    end
                end
                SET_CONTROL_REG:
                begin
                    state <= WAIT_COMMAND;
                    init_done <= 1'b1;
                end
                WAIT_COMMAND:
                begin
                    if (send_data)
                        state <= WRITE_SLAVE_ADDR;
                end
                WRITE_SLAVE_ADDR: state <= SEND_ADDR;
                SEND_ADDR:
                begin
                    state <= PRE_CHECK_TIP;
                    i2c_control_cnt <= 3'd0;
                end
                PRE_CHECK_TIP:
                begin
                    if (i2c_control_cnt < 3'd2)
                        i2c_control_cnt += 3'd1;
                    else begin
                        state <= CHECK_TIP;
                    end
                end
                CHECK_TIP:
                begin
                    if (rd_data[1] == 1'b0)
                    begin
                        wr_pointer <= 'd0;
                        state <= PREPARE_SEND_BYTE;
                    end
                end
                PREPARE_SEND_BYTE: state <= SEND_CURRENT_BYTE; 
                SEND_CURRENT_BYTE: 
                begin
                    i2c_control_cnt <= 3'd0;
                    state <= SEND_BYTE_PRE_CHECK_TIP;
                end
                SEND_BYTE_PRE_CHECK_TIP:
                begin
                    if (i2c_control_cnt < 3'd2)
                        i2c_control_cnt += 3'd1;
                    else begin
                        state <= SEND_BYTE_CHECK_TIP;
                    end
                end
                SEND_BYTE_CHECK_TIP:
                begin
                    if (rd_data[1] == 1'b0)
                    begin
                        if (wr_pointer < wr_index - 1)
                        begin
                            state <= SEND_NEXT_BYTE;
                            wr_pointer = wr_pointer + 1'b1;
                        end else
                            state <= SEND_LAST_BYTE;
                    end
                end
                SEND_LAST_BYTE: 
                begin
                    state <= WAIT_COMMAND;
                    send_complete <= 1'b1;
                end
            endcase
        end
end

always @(negedge clk or negedge rst_n)
begin
    if (!rst_n)
        begin
            tx_en <= 1'b0;
            rx_en <= 1'b0;
        end 
    else 
        begin
            if (state == I2C_INIT) begin
                if (i2c_control_cnt == 'd0) begin
                    tx_en <= 1'b1;
                    wr_data <= I2C_PRESCALE_VALUE[7:0];
                    wr_addr <= Prescale_reg0;
                end else if (i2c_control_cnt == 'd1) begin
                    wr_data <= I2C_PRESCALE_VALUE[15:8];
                    wr_addr <= Prescale_reg1;
                end else
                    tx_en <= 1'b0;
            end else if (state == SET_CONTROL_REG) begin
                wr_data <= I2C_MASTER_ENABLE | I2C_MASTER_INTERRUPT_ENABLE;     // Enable I2C master and interupt pin
                wr_addr <= Control_reg;
                tx_en <= 1'b1;
            end else if (state == WAIT_COMMAND) begin
                tx_en <= 1'b0;
                rx_en <= 1'b0;

                if (store_data)
                begin
                    memory_buffer[wr_index] = data_in;
                    wr_index = wr_index + 1'b1;
                end
            end else if (state == SEND_ADDR)
            begin
                wr_data <= 8'h90;
                wr_addr <= Command_reg;
                tx_en <= 1'b1;
            end else if (state == CHECK_TIP || state == PRE_CHECK_TIP)
            begin
                tx_en <= 1'b0;
                rx_en <= 1'b1;
                rd_addr <= Status_reg;
            end else if (state == SEND_NEXT_BYTE || state == SEND_LAST_BYTE)
            begin
                tx_en <= 1'b1;
                rx_en <= 1'b0;

                if (state == SEND_LAST_BYTE)
                begin
                    wr_data <= 8'h50;
                    wr_addr <= Command_reg;
                end
            end else if (state == WRITE_SLAVE_ADDR)
            begin
                tx_en <= 1'b1;
                rx_en <= 1'b0;
                wr_data <= {device_addr, 1'b0};
                wr_addr <= Transmit_reg;
            end else if (state == PREPARE_SEND_BYTE)
            begin
                tx_en <= 1'b1;
                rx_en <= 1'b0;
                wr_data <= memory_buffer[wr_pointer];
                wr_addr <= Transmit_reg;
            end else if (state == SEND_CURRENT_BYTE)
            begin
                tx_en <= 1'b1;
                rx_en <= 1'b0;
                wr_data <= 8'h10;
                wr_addr <= Command_reg;
            end else if (state == SEND_BYTE_PRE_CHECK_TIP || state == SEND_BYTE_CHECK_TIP)
            begin
                tx_en <= 1'b0;
                rx_en <= 1'b1;
                rd_addr <= Status_reg;
            end
        end
end

endmodule
