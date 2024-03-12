// Hub code for a cluster of miners using async links

// by teknohog

// Xilinx DCM
//`include "main_pll.v"
//`include "main_pll_2x.v"


//module fpgaminer_top (osc_clk, RxD, TxD, extminer_rxd, extminer_txd);
module fpgaminer_top (osc_clk, RxD, TxD, led, extminer_rxd, extminer_txd, dip);
//module fpgaminer_top (osc_clk, RxD, TxD, led);

   input osc_clk;
	input [3:0]dip;
	wire hash_clk, dv_clk;
   main_pll dcm23 (.CLK_IN1(osc_clk), .CLK_OUT1(hash_clk), .CLK_OUT2(dv_clk));
   
   // Reset input buffers, both the workdata buffers in miners, and
   // the nonce receivers in hubs
   //input  ;
   assign 	  reset = dip[0];
	wire nonce_start = dip[1];
	wire miner_busy;
   
   // Nonce stride for all miners in the cluster, not just this hub.
`ifdef TOTAL_MINERS
   parameter TOTAL_MINERS = `TOTAL_MINERS;
`else
   parameter TOTAL_MINERS = 2;
`endif

   // For local miners
`ifdef LOOP_LOG2
   parameter LOOP_LOG2 = `LOOP_LOG2;
`else
   parameter LOOP_LOG2 = 1;
`endif

   // Miners on the same FPGA with this hub
`ifdef LOCAL_MINERS
   parameter LOCAL_MINERS = `LOCAL_MINERS;
`else
   parameter LOCAL_MINERS = 1;
`endif

   // Make sure each miner has a distinct nonce start. Local miners'
   // starts will range from this to LOCAL_NONCE_START + LOCAL_MINERS - 1.
`ifdef LOCAL_NONCE_START
   parameter LOCAL_NONCE_START = `LOCAL_NONCE_START;
`else
   parameter LOCAL_NONCE_START = 0;
`endif
   
   // It is OK to make extra/unused ports, but TOTAL_MINERS must be
   // correct for the actual number of hashers.
`ifdef EXT_PORTS
   parameter EXT_PORTS = `EXT_PORTS;
`else
   parameter EXT_PORTS = 1;
`endif

   localparam SLAVES = LOCAL_MINERS + EXT_PORTS;

   wire [LOCAL_MINERS-1:0] localminer_rxd;

   // Work distribution is simply copying to all miners, so no logic
   // needed there, simply copy the RxD.
   input 	     RxD;

   output TxD;

   // Results from the input buffers (in serial_hub.v) of each slave
   wire [SLAVES*32-1:0] slave_nonces;
   wire [SLAVES-1:0] 	new_nonces;

   // Using the same transmission code as individual miners from serial.v
   wire 		serial_send;
   wire 		serial_busy;
   wire [31:0] 		golden_nonce;
   serial_transmit sertx (.clk(dv_clk), .TxD(TxD), .send(serial_send), .busy(serial_busy), .word(golden_nonce));

   hub_core #(.SLAVES(SLAVES)) hc (.hash_clk(dv_clk), .new_nonces(new_nonces), .golden_nonce(golden_nonce), .serial_send(serial_send), .serial_busy(serial_busy), .slave_nonces(slave_nonces));

   // Common workdata input for local miners
   wire [255:0] 	midstate, data2;
	wire start_mining;
   serial_receive serrx (.clk(dv_clk), .RxD(RxD), .midstate(midstate), .data2(data2), .reset(reset), .RxRDY(start_mining));

   // Local miners now directly connected
	
	wire got_ticket;
	reg new_ticket;
	reg [3:0]ticket_CS = 4'b0001;
	reg [3:0]ticket_NS;

	sha256_top M (.clk(hash_clk), .rst(reset), .midstate(midstate), .data2(data2), .golden_nonce(slave_nonces[31:0]), .got_ticket(got_ticket), .miner_busy(miner_busy), .nonce_start(nonce_start), .start_mining(start_mining));


always@ (posedge dv_clk)
	begin
		ticket_CS <= ticket_NS;
	end

always@ (*)
	begin
		case(ticket_CS)
			4'b0001: if (got_ticket) ticket_NS = 4'b0010; else ticket_NS = ticket_CS;
			4'b0010: ticket_NS = 4'b0100;
			4'b0100: ticket_NS = 4'b1000;
			4'b1000: if (!got_ticket) ticket_NS = 4'b0001; else ticket_NS = ticket_CS;
			default: ticket_NS = 4'b0001;
		endcase
	end

always@ (posedge dv_clk)
	begin
		new_ticket <= (ticket_CS == 4'b0100);
	end

assign new_nonces[0] = new_ticket;


   // External miner ports, results appended to the same
   // slave_nonces/new_nonces as local ones
   output [EXT_PORTS-1:0] extminer_txd;
   input [EXT_PORTS-1:0]  extminer_rxd;
   assign extminer_txd = {EXT_PORTS{RxD}};
      
   generate
      genvar 		  j;
      for (j = LOCAL_MINERS; j < SLAVES; j = j + 1)
	begin: for_ports
   	   slave_receive slrx (.clk(dv_clk), .RxD(extminer_rxd[j-LOCAL_MINERS]), .nonce(slave_nonces[j*32+31:j*32]), .new_nonce(new_nonces[j]), .reset(reset));
	end
   endgenerate

   output [3:0] led;
   //assign led[0] = |golden_nonce;
   assign led[1] = ~RxD;
   assign led[2] = ~TxD;
 	assign led[3] = ~miner_busy;
   // Light up only from locally found nonces, not ext_port results//
  pwm_fade pf1 (.clk(dv_clk), .trigger(|new_nonces[LOCAL_MINERS-1:0]), .drive(led[0]));

endmodule

