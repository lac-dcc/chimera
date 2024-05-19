// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0

/* verilator lint_off WIDTHCONCAT */
/* verilator lint_off WIDTHEXPAND */

// https://github.com/lushaylabs/tangnano9k-series-examples/blob/master/ads1115_adc/


module ads1115 (
        input clk,
        inout sda,
        output scl,
        output reg [15:0] adc0,
        output reg [15:0] adc1,
        output reg [15:0] adc2,
        output reg [15:0] adc3
    );

    localparam STATE_TRIGGER_CONV = 0;
    localparam STATE_WAIT_FOR_START = 1;
    localparam STATE_SAVE_VALUE_WHEN_READY = 2;

    wire [1:0] i2cInstruction;
    wire [7:0] i2cByteToSend;
    wire [7:0] i2cByteReceived;
    wire i2cComplete;
    wire i2cEnable;
    wire sdaIn;
    wire sdaOut;
    wire isSending;
    assign sda = (isSending & ~sdaOut) ? 1'b0 : 1'bz;
    assign sdaIn = sda ? 1'b1 : 1'b0;
    reg [2:0] drawState = 0;
    reg [1:0] adcChannel = 0;
    wire [15:0] adcOutputData;
    wire adcDataReady;
    reg adcEnable = 0;

    ads1115_i2c i2c(
                    clk,
                    sdaIn,
                    sdaOut,
                    isSending,
                    scl,
                    i2cInstruction,
                    i2cEnable,
                    i2cByteToSend,
                    i2cByteReceived,
                    i2cComplete
                );

    ads1115_adc #(7'b1001001) adc(
                    clk,
                    adcChannel,
                    adcOutputData,
                    adcDataReady,
                    adcEnable,
                    i2cInstruction,
                    i2cEnable,
                    i2cByteToSend,
                    i2cByteReceived,
                    i2cComplete
                );

    always @(posedge clk) begin
        case (drawState)
            STATE_TRIGGER_CONV: begin
                adcEnable <= 1;
                drawState <= STATE_WAIT_FOR_START;
            end
            STATE_WAIT_FOR_START: begin
                if (~adcDataReady) begin
                    drawState <= STATE_SAVE_VALUE_WHEN_READY;
                end
            end
            STATE_SAVE_VALUE_WHEN_READY: begin
                if (adcDataReady) begin
                    if (adcChannel == 2'd0) begin
                        adc0 <= adcOutputData[15] ? 12'd0 : adcOutputData[14:3];
                        adcChannel <= 2'd1;
                    end else if (adcChannel == 2'd1) begin
                        adc1 <= adcOutputData[15] ? 12'd0 : adcOutputData[14:3];
                        adcChannel <= 2'd2;
                    end else if (adcChannel == 2'd2) begin
                        adc2 <= adcOutputData[15] ? 12'd0 : adcOutputData[14:3];
                        adcChannel <= 2'd3;
                    end else if (adcChannel == 2'd3) begin
                        adc3 <= adcOutputData[15] ? 12'd0 : adcOutputData[14:3];
                        adcChannel <= 2'd0;
                    end
                    drawState <= STATE_TRIGGER_CONV;
                    adcEnable <= 0;
                end
            end
        endcase
    end
endmodule



module ads1115_i2c (
        input clk,
        input sdaIn,
        output reg sdaOutReg = 1,
        output reg isSending = 0,
        output reg scl = 1,
        input [1:0] instruction,
        input enable,
        input [7:0] byteToSend,
        output reg [7:0] byteReceived = 0,
        output reg complete
    );
    localparam INST_START_TX = 0;
    localparam INST_STOP_TX = 1;
    localparam INST_READ_BYTE = 2;
    localparam INST_WRITE_BYTE = 3;
    localparam STATE_IDLE = 4;
    localparam STATE_DONE = 5;
    localparam STATE_SEND_ACK = 6;
    localparam STATE_RCV_ACK = 7;

    reg [6:0] clockDivider = 0;
    reg [2:0] state = STATE_IDLE;
    reg [2:0] bitToSend = 0;

    always @(posedge clk) begin
        case (state)
            STATE_IDLE: begin
                if (enable) begin
                    complete <= 0;
                    clockDivider <= 0;
                    bitToSend <= 0;
                    state <= {1'b0,instruction};
                end
            end
            INST_START_TX: begin
                isSending <= 1;
                clockDivider <= clockDivider + 7'd1;
                if (clockDivider[6:5] == 2'b00) begin
                    scl <= 1;
                    sdaOutReg <= 1;
                end else if (clockDivider[6:5] == 2'b01) begin
                    sdaOutReg <= 0;
                end else if (clockDivider[6:5] == 2'b10) begin
                    scl <= 0;
                end else if (clockDivider[6:5] == 2'b11) begin
                    state <= STATE_DONE;
                end
            end
            INST_STOP_TX: begin
                isSending <= 1;
                clockDivider <= clockDivider + 7'd1;
                if (clockDivider[6:5] == 2'b00) begin
                    scl <= 0;
                    sdaOutReg <= 0;
                end else if (clockDivider[6:5] == 2'b01) begin
                    scl <= 1;
                end else if (clockDivider[6:5] == 2'b10) begin
                    sdaOutReg <= 1;
                end else if (clockDivider[6:5] == 2'b11) begin
                    state <= STATE_DONE;
                end
            end
            INST_READ_BYTE: begin
                isSending <= 0;
                clockDivider <= clockDivider + 7'd1;
                if (clockDivider[6:5] == 2'b00) begin
                    scl <= 0;
                end else if (clockDivider[6:5] == 2'b01) begin
                    scl <= 1;
                end else if (clockDivider == 7'b1000000) begin
                    byteReceived <= {byteReceived[6:0], sdaIn ? 1'b1 : 1'b0};
                end else if (clockDivider == 7'b1111111) begin
                    bitToSend <= bitToSend + 3'd1;
                    if (bitToSend == 3'b111) begin
                        state <= STATE_SEND_ACK;
                    end
                end else if (clockDivider[6:5] == 2'b11) begin
                    scl <= 0;
                end
            end
            STATE_SEND_ACK: begin
                isSending <= 1;
                sdaOutReg <= 0;
                clockDivider <= clockDivider + 7'd1;
                if (clockDivider[6:5] == 2'b01) begin
                    scl <= 1;
                end else if (clockDivider == 7'b1111111) begin
                    state <= STATE_DONE;
                end else if (clockDivider[6:5] == 2'b11) begin
                    scl <= 0;
                end
            end
            INST_WRITE_BYTE: begin
                isSending <= 1;
                clockDivider <= clockDivider + 7'd1;
                sdaOutReg <= byteToSend[3'd7-bitToSend] ? 1'b1 : 1'b0;

                if (clockDivider[6:5] == 2'b00) begin
                    scl <= 0;
                end else if (clockDivider[6:5] == 2'b01) begin
                    scl <= 1;
                end else if (clockDivider == 7'b1111111) begin
                    bitToSend <= bitToSend + 3'd1;
                    if (bitToSend == 3'b111) begin
                        state <= STATE_RCV_ACK;
                    end
                end else if (clockDivider[6:5] == 2'b11) begin
                    scl <= 0;
                end
            end
            STATE_RCV_ACK: begin
                isSending <= 0;
                clockDivider <= clockDivider + 7'd1;

                if (clockDivider[6:5] == 2'b01) begin
                    scl <= 1;
                end else if (clockDivider == 7'b1111111) begin
                    state <= STATE_DONE;
                end else if (clockDivider[6:5] == 2'b11) begin
                    scl <= 0;
                end
                // else if (clockDivider == 7'b1000000) begin
                //     sdaIn should be 0
                // end
            end
            STATE_DONE: begin
                complete <= 1;
                if (~enable)
                    state <= STATE_IDLE;
            end
        endcase
    end
endmodule


module ads1115_adc #(
        parameter address = 7'd0
    ) (
        input clk,
        input [1:0] channel,
        output reg [15:0] outputData = 0,
        output reg dataReady = 1,
        input enable,
        output reg [1:0] instructionI2C = 0,
        output reg enableI2C = 0,
        output reg [7:0] byteToSendI2C = 0,
        input [7:0] byteReceivedI2C,
        input completeI2C
    );

    // setup config
    reg [15:0] setupRegister = {
            1'b1, // Start Conversion
            3'b100, // Channel 0 Single ended
            3'b001, // FSR +- 4.096v
            1'b1, // Single shot mode
            3'b100, // 128 SPS
            1'b0, // Traditional Comparator
            1'b0, // Active low alert
            1'b0, // Non latching
            2'b11 // Disable comparator
        };

    localparam CONFIG_REGISTER = 8'b00000001;
    localparam CONVERSION_REGISTER = 8'b00000000;

    localparam TASK_SETUP = 0;
    localparam TASK_CHECK_DONE = 1;
    localparam TASK_CHANGE_REG = 2;
    localparam TASK_READ_VALUE = 3;

    localparam INST_START_TX = 0;
    localparam INST_STOP_TX = 1;
    localparam INST_READ_BYTE = 2;
    localparam INST_WRITE_BYTE = 3;

    localparam STATE_IDLE = 0;
    localparam STATE_RUN_TASK = 1;
    localparam STATE_WAIT_FOR_I2C = 2;
    localparam STATE_INC_SUB_TASK = 3;
    localparam STATE_DONE = 4;
    localparam STATE_DELAY = 5;

    reg [1:0] taskIndex = 0;
    reg [2:0] subTaskIndex = 0;
    reg [4:0] state = STATE_IDLE;
    reg [7:0] counter = 0;
    reg processStarted = 0;

    always @(posedge clk) begin
        case (state)
            STATE_IDLE: begin
                if (enable) begin
                    state <= STATE_RUN_TASK;
                    taskIndex <= 0;
                    subTaskIndex <= 0;
                    dataReady <= 0;
                    counter <= 0;
                end
            end
            STATE_RUN_TASK: begin
                case ({taskIndex,subTaskIndex})
                    {TASK_SETUP,3'd0},
                    {TASK_CHECK_DONE,3'd1},
                    {TASK_CHANGE_REG,3'd1},
                    {TASK_READ_VALUE,3'd0}: begin
                        instructionI2C <= INST_START_TX;
                        enableI2C <= 1;
                        state <= STATE_WAIT_FOR_I2C;
                    end
                    {TASK_SETUP,3'd1},
                    {TASK_CHANGE_REG,3'd2},
                    {TASK_CHECK_DONE,3'd2},
                    {TASK_READ_VALUE,3'd1}: begin
                        instructionI2C <= INST_WRITE_BYTE;
                        byteToSendI2C <= {address, (taskIndex == TASK_CHECK_DONE || taskIndex == TASK_READ_VALUE) ? 1'b1 : 1'b0};
                        enableI2C <= 1;
                        state <= STATE_WAIT_FOR_I2C;
                    end
                    {TASK_SETUP,3'd5},
                    {TASK_CHECK_DONE,3'd5},
                    {TASK_CHANGE_REG,3'd4},
                    {TASK_READ_VALUE,3'd5}: begin
                        instructionI2C <= INST_STOP_TX;
                        enableI2C <= 1;
                        state <= STATE_WAIT_FOR_I2C;
                    end
                    {TASK_SETUP,3'd2},
                    {TASK_CHANGE_REG,3'd3}: begin
                        instructionI2C <= INST_WRITE_BYTE;
                        byteToSendI2C <= taskIndex == TASK_SETUP ? CONFIG_REGISTER : CONVERSION_REGISTER;
                        enableI2C <= 1;
                        state <= STATE_WAIT_FOR_I2C;
                    end
                    {TASK_SETUP,3'd3}: begin
                        instructionI2C <= INST_WRITE_BYTE;
                        byteToSendI2C <= {
                            setupRegister[15] ? 1'b1 : 1'b0,
                            1'b1, channel,
                            setupRegister[11:8]
                        };
                        enableI2C <= 1;
                        state <= STATE_WAIT_FOR_I2C;
                    end
                    {TASK_SETUP,3'd4}: begin
                        instructionI2C <= INST_WRITE_BYTE;
                        byteToSendI2C <= setupRegister[7:0];
                        enableI2C <= 1;
                        state <= STATE_WAIT_FOR_I2C;
                    end
                    {TASK_CHECK_DONE,3'd0}: begin
                        state <= STATE_DELAY;
                    end
                    {TASK_CHECK_DONE,3'd3},
                    {TASK_READ_VALUE,3'd2}: begin
                        instructionI2C <= INST_READ_BYTE;
                        enableI2C <= 1;
                        state <= STATE_WAIT_FOR_I2C;
                    end
                    {TASK_CHECK_DONE,3'd4},
                    {TASK_READ_VALUE,3'd3}: begin
                        instructionI2C <= INST_READ_BYTE;
                        outputData[15:8] <= byteReceivedI2C;
                        enableI2C <= 1;
                        state <= STATE_WAIT_FOR_I2C;
                    end
                    {TASK_CHANGE_REG,3'd0}: begin
                        if (outputData[15])
                            state <= STATE_INC_SUB_TASK;
                        else begin
                            subTaskIndex <= 0;
                            taskIndex <= TASK_CHECK_DONE;
                        end
                    end
                    {TASK_READ_VALUE,3'd4}: begin
                        state <= STATE_INC_SUB_TASK;
                        outputData[7:0] <= byteReceivedI2C;
                    end
                    default:
                        state <= STATE_INC_SUB_TASK;
                endcase
            end
            STATE_WAIT_FOR_I2C: begin
                if (~processStarted && ~completeI2C) begin
                    processStarted <= 1;
                end else if (completeI2C && processStarted) begin
                    state <= STATE_INC_SUB_TASK;
                    processStarted <= 0;
                    enableI2C <= 0;
                end
            end
            STATE_INC_SUB_TASK: begin
                state <= STATE_RUN_TASK;
                if (subTaskIndex == 3'd5) begin
                    subTaskIndex <= 0;
                    if (taskIndex == TASK_READ_VALUE) begin
                        state <= STATE_DONE;
                    end else begin
                        taskIndex <= taskIndex + 2'd1;
                    end
                end else begin
                    subTaskIndex <= subTaskIndex + 3'd1;
                end
            end
            STATE_DELAY: begin
                counter <= counter + 8'd1;
                if (counter == 8'b11111111) begin
                    state <= STATE_INC_SUB_TASK;
                end
            end
            STATE_DONE: begin
                dataReady <= 1;
                if (~enable) begin
                    state <= STATE_IDLE;
                end
            end
        endcase
    end

endmodule

