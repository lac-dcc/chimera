// This program was cloned from: https://github.com/shuji-oh/PLI_TDC_for_CAN
// License: MIT License

/* Simple SPI slave code from http://www.fpga4fun.com/SPI2.html */
/* Reading the module increments a counter. */
/* LSbit of written data shows on the LED port */

module spi(
   input CLK,
   input SCK,
   input SSEL,
   input MOSI,
   output MISO,
   input [33:0] out_data,
   output read_request,
   input read_error
   //output reg LEDR0,
   );
	
   // sync SCK to the FPGA clock using a 3-bits shift register
   reg [2:0] SCKr = 0;
   always @(posedge CLK) begin
      SCKr <= {SCKr[1:0], SCK};
   end
   // now we can detect SCK rising edges
   wire      SCK_risingedge = (SCKr[2:1]==2'b01); 
   // and falling edges 
   wire      SCK_fallingedge = (SCKr[2:1]==2'b10);

   // same thing for SSEL
   reg [2:0] SSELr = 3'b111;  always @(posedge CLK) SSELr <= {SSELr[1:0], SSEL};
   wire      SSEL_active = ~SSELr[1];  // SSEL is active low
   // message starts at falling edge
   wire      SSEL_startmessage = (SSELr[2:1]==2'b10);
   // message stops at rising edge
   wire      SSEL_endmessage = (SSELr[2:1]==2'b01);

   // and for MOSI
   reg [1:0] MOSIr = 0;  
   always @(posedge CLK) 
     MOSIr <= {MOSIr[0], MOSI};
   
   wire      MOSI_data = MOSIr[1];

   // we handle SPI in 8-bits format, so we need a 3 bits counter to
   //  count the bits as they come in
   reg [5:0] bitcnt = 0;

   reg 	     byte_received= 0;  // high when a byte has been received
   reg [7:0] byte_data_received = 0;

   always @(posedge CLK)
     begin
	if(~SSEL_active)
	  bitcnt <= 6'b000000;
	else
	  if(SCK_risingedge)
	    begin
	       bitcnt <= bitcnt + 6'b000001;
	       
	       // implement a shift-left register (since we receive the data 
	       // MSB first)
	       byte_data_received <= {byte_data_received[6:0], MOSI_data};
	    end
     end

   always @(posedge CLK) 
     byte_received <= SSEL_active && SCK_risingedge && (bitcnt==6'b111111);

   // we use the LSB of the data received to control an LED
   //reg LED = 0;
   //always @(posedge CLK) if(byte_received) LEDR0 <= byte_data_received[0];
   
   reg [33:0] byte_data_sent = 0;

   reg [33:0] cnt = 0;

   //out_hex out_hex(.clk(SCK_fallingedge), .byte_data_send(cnt[23:0]), .HEX_5(HEX5), .HEX_4(HEX4), .HEX_3(HEX3), .HEX_2(HEX2), .HEX_1(HEX1), .HEX_0(HEX0));

   reg read_req;

   assign read_request = read_req;
   always @(posedge CLK) 
    if(SSEL_startmessage) begin
        if(~read_error) begin
            read_req<=1;
            cnt<=out_data;  // count the messages
        end
        else cnt<=34'h3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    end
    else read_req<=0;

   always @(posedge CLK)
    if(SSEL_active) begin
	    if(SSEL_startmessage) begin
	      // first byte sent in a message is the message count
	      byte_data_sent <= cnt;
      end
	  else
	    if(SCK_fallingedge) begin
		   if(bitcnt==7'b0000000)
		     byte_data_sent <= 32'h0; // after that, we send 0s
		   else
		     byte_data_sent <= {byte_data_sent[32:0], 1'b0};
	    end
    end

   assign MISO = (!SSEL) ? byte_data_sent[33] : 1'bZ;  // send MSB first
   // we assume that there is only one slave on the SPI bus
   // so we don't bother with a tri-state buffer for MISO
   // otherwise we would need to tri-state MISO when SSEL is inactive

endmodule
