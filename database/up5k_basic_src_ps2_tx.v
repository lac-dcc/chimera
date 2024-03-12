// ps2_tx.v - PS/2 transmitter
// 05-30-19 E. Brombaugh

`default_nettype none

module ps2_tx(
		input clk,
		input rst,
		input tx_ena,
		input [7:0] tx_data,
		input ps2_clk_ena,
		input ps2_clk_sync,
		input ps2_dat_sync,
		output reg tx_active,
		output reg tx_err,
		output reg ps2_clk_oe,
		output reg ps2_dat_oe
);
	// state machine
	localparam ST_WAIT = 4'h0;
	localparam ST_RQST = 4'h1;
	localparam ST_STRT = 4'h2;
	localparam ST_DAT0 = 4'h3;
	localparam ST_DAT1 = 4'h4;
	localparam ST_DAT2 = 4'h5;
	localparam ST_DAT3 = 4'h6;
	localparam ST_DAT4 = 4'h7;
	localparam ST_DAT5 = 4'h8;
	localparam ST_DAT6 = 4'h9;
	localparam ST_DAT7 = 4'hA;
	localparam ST_PRTY = 4'hB;
	localparam ST_STOP = 4'hC;
	localparam ST_WACK = 4'hD;
	localparam ST_WOFF = 4'hE;
	reg [3:0] tx_state;
	reg [17:0] timer;
	reg [8:0] tx_sreg;
	always @(posedge clk)
		if(rst)
		begin
			tx_state <= ST_WAIT;
			tx_active <= 1'b0;
			tx_err <= 1'b0;
			ps2_clk_oe <= 1'b0;
			ps2_dat_oe <= 1'b0;
		end
		else
			case(tx_state)
				ST_WAIT:
					// wait for tx write
					if(tx_ena)
					begin
						// move to REQUEST state
						tx_state <= ST_RQST;
						timer <= 18'd1599;
						tx_active <= 1'b1;
						tx_sreg <= {~(^tx_data),tx_data};
						ps2_clk_oe <= 1'b1;
					end
				
				ST_RQST:
					// pull clock low & wait 100us to start
					if(timer == 18'd0)
					begin
						// move to START state
						tx_state <= ST_STRT;
						timer <= 18'd238399;	// 14.9ms
						ps2_clk_oe <= 1'b0;
						ps2_dat_oe <= 1'b1;
					end
					else
						// decrement timer
						timer <= timer - 18'd1;
				
				ST_STRT, ST_DAT0, ST_DAT1, ST_DAT2, ST_DAT3, ST_DAT4,
				ST_DAT5, ST_DAT6, ST_DAT7, ST_PRTY, ST_STOP:
					// wait for clk falling edge to shift out data
					if(ps2_clk_ena)
					begin
						tx_state <= tx_state + 4'h1;
						if(tx_state == ST_STRT)
							timer <= 18'd31999;	// 2ms
						if(tx_state == ST_STOP)
							ps2_dat_oe <= 1'b0;
						else
							ps2_dat_oe <= ~tx_sreg[0];
						tx_sreg <= {1'b1,tx_sreg[8:1]};
					end
					else
					begin
						// in START state wait 15ms max for clock edge
						// in all other states wait 2ms max
						if(timer == 18'd0)
						begin
							// timeout - set err and return to wait
							tx_state <= ST_WAIT;
							tx_err <= 1'b1;
							tx_active <= 1'b0;
						end
						else
							timer <= timer - 18'd1;
					end
				
				ST_WACK:
					// wait for ACK (dat = 0)
					if(ps2_dat_sync == 1'b0)
					begin
						tx_state <= ST_WOFF;
					end
					else
					begin
						// in all other states wait 2ms max
						if(timer == 18'd0)
						begin
							// timeout - set err and return to wait
							tx_state <= ST_WAIT;
							tx_err <= 1'b1;
							tx_active <= 1'b0;
						end
						else
							timer <= timer - 18'd1;
					end
				
				ST_WOFF:
					// wait for device to release bus (clk,dat = 1)
					if((ps2_clk_sync == 1'b1)&&(ps2_dat_sync == 1'b1))
					begin
						tx_state <= ST_WAIT;
						tx_err <= 1'b0;
						tx_active <= 1'b0;
					end
				
				default:
				begin
					// exit illegal state
					tx_state <= ST_WAIT;
					tx_active <= 1'b0;
					tx_err <= 1'b0;
					ps2_clk_oe <= 1'b0;
					ps2_dat_oe <= 1'b0;
				end
			endcase
endmodule
