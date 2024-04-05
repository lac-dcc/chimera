module spi(input                            clk,

           input                            miso,
           output                           mosi,
           output                           sck,

           input                            rst,
           input                            start,
           input                            cpol,
           input                            cpha,
           input   [4:0]                    bits_per_word,
           input   [5:0]                    div,

           input   [MAX_DATA_WIDTH-1:0]     data_in,
           output  [MAX_DATA_WIDTH-1:0]     data_out,

           output                           busy,
           output                           new_data);

parameter  MAX_DATA_WIDTH    = 32;

localparam IDLE              = 3'd0;
localparam START             = 3'd1;
localparam TRANSFER_STAGE_1  = 3'd2;
localparam TRANSFER_STAGE_2  = 3'd3;

reg [1:0] state;
reg [1:0] next_state;

reg [4:0] ctrl;
reg [4:0] next_ctrl;

reg clk_div;
reg [15:0] counter;

reg new_data;

reg sck;
reg mosi;
assign busy = state != IDLE;

always @ (posedge clk or posedge rst)
begin
    if (rst) begin
        counter <= 0;
        clk_div <= 1'b0;
    end else begin
        if (counter == div) begin
            clk_div <= 1'b1;
            counter <= 0;
        end else begin
            clk_div <= 1'b0;
            counter <= counter + 1'b1;
        end
    end
end

always @ (posedge clk or posedge rst)
begin
    if (rst) begin
        next_state <= IDLE;
        next_ctrl <= 5'b00000;
        new_data <= 1'b0;
    end else begin
        if (clk_div) begin
            case (state)
                IDLE: begin
                    sck <= cpol;
                    mosi <= 1'b0;
                    next_ctrl = 5'b00000;
                    if (start == 1'b1) begin
                        next_state = START;
                        new_data <= 1'b0;
                    end
                end

                START: begin
                    if (start == 1'b0) begin
                        if (cpha == 1'b0) begin
                            next_state = TRANSFER_STAGE_1;
                        end else begin
                            next_state = TRANSFER_STAGE_2;
                        end
                    end
                end

                TRANSFER_STAGE_1: begin
                    next_state = TRANSFER_STAGE_2;
                    sck <= cpol;

                    if (cpha == 1'b0) begin
                        mosi <= data_in[bits_per_word-ctrl];
                    end else begin
                        data_out[bits_per_word-ctrl] <= miso;
                        next_ctrl = ctrl + 1'b1;
                    end

                    if (ctrl == bits_per_word && cpha == 1'b1) begin
                        next_state = IDLE;
                        new_data <= 1'b1;
                    end
                end

                TRANSFER_STAGE_2: begin
                    next_state = TRANSFER_STAGE_1;
                    sck <= !cpol;

                    if (cpha == 1'b0) begin
                        data_out[bits_per_word-ctrl] <= miso;
                        next_ctrl = ctrl + 1'b1;
                    end else begin
                        mosi <= data_in[bits_per_word-ctrl];
                    end

                    if (ctrl == bits_per_word && cpha == 1'b0) begin
                        next_state = IDLE;
                        new_data <= 1'b1;
                    end
                end
            endcase
        end
    end
end

always @ (posedge clk or posedge rst)
begin
    if (rst) begin
        state <= IDLE;
        ctrl <= 5'b00000;
    end else begin
        ctrl <= next_ctrl;
        state <= next_state;
    end
end

endmodule
