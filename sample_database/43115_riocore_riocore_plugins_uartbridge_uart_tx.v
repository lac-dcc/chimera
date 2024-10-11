// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0

/* verilator lint_off WIDTHTRUNC */
/* verilator lint_off WIDTHEXPAND */

module uart_tx(
	input clk,
	input TxD_start,
	input [7:0] TxD_data,
	output TxD,
	output TxD_busy
);

    // Assert TxD_start for (at least) one clock cycle to start transmission of TxD_data
    // TxD_data is latched so that it doesn't have to stay valid while it is being sent

    parameter ClkFrequency = 12000000;
    parameter Baud = 2000000;

    wire BitTick;
    uart_baud #(ClkFrequency, Baud) tickgen(.clk(clk), .enable(TxD_busy), .tick(BitTick));

    reg [3:0] TxD_state = 0;
    wire TxD_ready = (TxD_state==0);
    assign TxD_busy = ~TxD_ready;

    reg [7:0] TxD_shift = 0;
    always @(posedge clk)
    begin
        if(TxD_ready & TxD_start)
            TxD_shift <= TxD_data;
        else
        if(TxD_state[3] & BitTick)
            TxD_shift <= (TxD_shift >> 1);

        case(TxD_state)
            4'b0000: if(TxD_start) TxD_state <= 4'b0100;
            4'b0100: if(BitTick) TxD_state <= 4'b1000;  // start bit
            4'b1000: if(BitTick) TxD_state <= 4'b1001;  // bit 0
            4'b1001: if(BitTick) TxD_state <= 4'b1010;  // bit 1
            4'b1010: if(BitTick) TxD_state <= 4'b1011;  // bit 2
            4'b1011: if(BitTick) TxD_state <= 4'b1100;  // bit 3
            4'b1100: if(BitTick) TxD_state <= 4'b1101;  // bit 4
            4'b1101: if(BitTick) TxD_state <= 4'b1110;  // bit 5
            4'b1110: if(BitTick) TxD_state <= 4'b1111;  // bit 6
            4'b1111: if(BitTick) TxD_state <= 4'b0010;  // bit 7
            4'b0010: if(BitTick) TxD_state <= 4'b0011;  // stop1
            4'b0011: if(BitTick) TxD_state <= 4'b0000;  // stop2
            default: if(BitTick) TxD_state <= 4'b0000;
        endcase
    end

    assign TxD = (TxD_state<4) | (TxD_state[3] & TxD_shift[0]);  // put together the start, data and stop bits
endmodule

