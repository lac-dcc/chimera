module uart_tx (input    [15:0]   data_in,
                input    [15:0]   clk_div,
                input             wr_en,
                input             clk,
                output            tx,
                output            busy,
                input     [4:0]   bits_per_word,
                input             rst,
                input             parity_en,
                input             parity_evan_odd,
                input             two_stop_bit);

localparam IDLE      = 3'b000;
localparam START     = 3'b001;
localparam VER_START = 3'b010;
localparam DATA      = 3'b011;
localparam STOP      = 3'b100;
localparam STOP2     = 3'b101;
localparam PARITY    = 3'b110;
localparam END       = 3'b111;

reg [15:0] data;
reg [4:0]  bit_pos;
reg [2:0]  state;
reg        tx = 1'b1;
reg        new_data;
reg [15:0] counter;
reg        clken;
reg [2:0]  stop_counter;
reg        parity_bit;

reg [2:0]  next_state;
reg        next_parity_bit;
reg [4:0]  next_bit_pos;

assign busy = (state != IDLE) ? 1'b1 : 1'b0;

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

always @(posedge clk or posedge rst) begin
    if (rst) begin
        next_state <= IDLE;
        next_bit_pos <= 5'b00000;
        tx <= 1'b1;
    end else begin
        case (state)
            IDLE: begin
                if (wr_en) begin
                    next_state <= VER_START;
                    next_bit_pos <= 5'h0;
                end
            end

            VER_START: begin
                if (wr_en == 1'b0) begin
                    next_state <= START;
                end
            end

            START: begin
                if (clken) begin
                    data <= data_in;
                    tx <= 1'b0;
                    next_state <= DATA;
                    if (parity_evan_odd)
                        next_parity_bit <= 1'b1;
                    else
                        next_parity_bit <= 1'b0;
                end
            end

            DATA: begin
                if (clken) begin
                    if (bit_pos == bits_per_word)
                        if (parity_en)
                            next_state <= PARITY;
                        else
                            next_state <= STOP;
                    else
                        next_bit_pos <= bit_pos + 3'h1;
                    next_parity_bit <= parity_bit ^ data[bit_pos];
                    tx <= data[bit_pos];
                end
            end

            PARITY: begin
                if (clken) begin
                    tx <= parity_bit;
                    next_state <= STOP;
                end
            end

            STOP: begin
                if (clken) begin
                    tx <= 1'b1;

                    if (two_stop_bit)
                        next_state <= STOP2;
                    else
                        next_state <= END;
                end
            end

            STOP2: begin
                if (clken)
                    next_state <= END;
            end

            END: begin
                if (clken)
                    next_state <= IDLE;
            end

            default: begin
                tx <= 1'b1;
                next_state <= IDLE;
            end
        endcase
    end
end

always @ (posedge clk or posedge rst)
begin
    if (rst) begin
        bit_pos <= 3'b000;
        state <= IDLE;
        parity_bit <= 0;
    end else begin
        bit_pos <= next_bit_pos;
        state <= next_state;
        parity_bit <= next_parity_bit;
    end
end

endmodule
