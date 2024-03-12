/* Simple SPI slave code from http://www.fpga4fun.com/SPI2.html */
/* Reading the module increments a counter. */
/* LSbit of written data shows on the LED port */

module spi_slave(clk, SCK, MOSI, MISO, SSEL, LED);
   input clk;

   input SCK, SSEL, MOSI;
   output MISO;

   output LED;


   // sync SCK to the FPGA clock using a 3-bits shift register
   reg [2:0] SCKr = 0;  always @(posedge clk) SCKr <= {SCKr[1:0], SCK};
   // now we can detect SCK rising edges
   wire      SCK_risingedge = (SCKr[2:1]==2'b01); 
   // and falling edges 
   wire      SCK_fallingedge = (SCKr[2:1]==2'b10);

   // same thing for SSEL
   reg [2:0] SSELr = 3'b111;  always @(posedge clk) SSELr <= {SSELr[1:0], SSEL};
   wire      SSEL_active = ~SSELr[1];  // SSEL is active low
   // message starts at falling edge
   wire      SSEL_startmessage = (SSELr[2:1]==2'b10);
   // message stops at rising edge
   wire      SSEL_endmessage = (SSELr[2:1]==2'b01);

   // and for MOSI
   reg [1:0] MOSIr = 0;  
   always @(posedge clk) 
     MOSIr <= {MOSIr[0], MOSI};
   
   wire      MOSI_data = MOSIr[1];

   // we handle SPI in 8-bits format, so we need a 3 bits counter to
   //  count the bits as they come in
   reg [2:0] bitcnt = 0;

   reg 	     byte_received= 0;  // high when a byte has been received
   reg [7:0] byte_data_received = 0;

   always @(posedge clk)
     begin
	if(~SSEL_active)
	  bitcnt <= 3'b000;
	else
	  if(SCK_risingedge)
	    begin
	       bitcnt <= bitcnt + 3'b001;
	       
	       // implement a shift-left register (since we receive the data 
	       // MSB first)
	       byte_data_received <= {byte_data_received[6:0], MOSI_data};
	    end
     end

   always @(posedge clk) 
     byte_received <= SSEL_active && SCK_risingedge && (bitcnt==3'b111);

   // we use the LSB of the data received to control an LED
   reg LED = 0;
   always @(posedge clk) if(byte_received) LED <= byte_data_received[0];
   
   reg [7:0] byte_data_sent = 0;

   reg [7:0] cnt = 0;
   always @(posedge clk) 
     if(SSEL_startmessage) cnt<=cnt+8'h1;  // count the messages

   always @(posedge clk)
     if(SSEL_active)
       begin
	  if(SSEL_startmessage)
	    // first byte sent in a message is the message count
	    byte_data_sent <= cnt;  
	  else
	    if(SCK_fallingedge)
	      begin
		 if(bitcnt==3'b000)
		   byte_data_sent <= 8'h00;  // after that, we send 0s
		 else
		   byte_data_sent <= {byte_data_sent[6:0], 1'b0};
	      end
       end
   
   assign MISO = (!SSEL) ? byte_data_sent[7] : 1'bZ;  // send MSB first
   // we assume that there is only one slave on the SPI bus
   // so we don't bother with a tri-state buffer for MISO
   // otherwise we would need to tri-state MISO when SSEL is inactive

endmodule
