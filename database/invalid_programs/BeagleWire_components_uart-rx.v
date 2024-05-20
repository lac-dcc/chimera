// This program was cloned from: https://github.com/pmezydlo/BeagleWire
// License: GNU General Public License v2.0

module uart_rx(input             clk,
               input             rst,
               input    [15:0]   clk_div,
               output   [15:0]   data_out,
               input             rx,
               output            busy,
               output            new_data,
               output            frame_error,
               input     [4:0]   bits_per_word,
               input             parity_en,
               input             parity_evan_odd,
               input             two_stop_bit);

localparam IDLE      = 3'b000;
localparam DATA      = 3'b011;
localparam STOP      = 3'b100;
localparam STOP2     = 3'b101;
localparam PARITY    = 3'b110;

assign busy = (state != IDLE) ? 1'b1 : 1'b0;

reg [15:0] counter;
reg        clken;
reg [2:0]  state;
reg [2:0]  next_state;
reg [4:0]  bit_pos;
reg [4:0]  next_bit_pos;
reg [15:0] data_out;
reg        parity_bit;
reg        next_parity_bit;

always @(posedge clk or posedge rst)
begin
    if (rst) begin
        clken <= 0;
        counter <= 0;
    end else begin
       if (counter == clk_div) begin
           clken <= 1'b1;
           counter <= 1;
       end else begin
           clken <= 1'b0;
           counter <= counter + 1;
       end
    end
end

always @ (posedge clk or posedge rst)
begin
    if (rst) begin
        next_state <= IDLE;
        next_bit_pos <= 5'b00000;
        next_parity_bit <= 1'b0;
    end else begin
        if (clken) begin
            case (state)
                IDLE: begin
                    if (rx == 1'b0)
                        next_state <= DATA;
                    next_bit_pos <= 5'b00000;
                    new_data <= 1'b0;
                    frame_error <= 1'b0;
                    if (parity_evan_odd)
                        next_parity_bit <= 1'b1;
                    else
                        next_parity_bit <= 1'b0;
                end

                DATA: begin
                    if (bit_pos == bits_per_word)
                        if (parity_en)
                            next_state <= PARITY;
                        else
                            next_state <= STOP;
                    else
                        next_bit_pos <= bit_pos + 1;

                    next_parity_bit <= parity_bit ^ rx;
                    data_out[bit_pos] = rx;
                end

                PARITY: begin
                    if (rx == parity_bit)
                        frame_error =| 1;
                    next_state <= STOP;
                end

                STOP: begin
                    if (rx == 0)
                        frame_error =| 1;

                    if (two_stop_bit)
                        next_state <= STOP2;
                    else
                        next_state <= IDLE;
                        new_data <= 1'b1;
                end

                STOP2: begin
                    if (rx == 0)
                        frame_error =| 1;
                    next_state <= IDLE;
                end

                default: begin
                    next_state <= IDLE;
                end
            endcase
        end
    end
end

always @ (posedge clk or posedge rst)
begin
    if (rst) begin
        bit_pos <= 3'b000;
        state <= IDLE;
        parity_bit <= 1'b0;
    end else begin
        bit_pos <= next_bit_pos;
        state <= next_state;
        parity_bit <= next_parity_bit;
    end
end

endmodule
