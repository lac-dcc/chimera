// This program was cloned from: https://github.com/HurleyResearch/nRFICE
// License: GNU General Public License v3.0


`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module toptb;

    reg clock_in;
	reg reset_in;
	//reg [7:0] period_in;
	reg spicsn;
	reg spiclk;
	reg spimosi;
	wire spimiso;

	
//	reg [15:0] ontime_in;
    wire pwm_out;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
   // parameter mosiword = 32'hAA558811;  
 parameter mosiwordWrite1 = 32'h1001AAAA;    
 parameter mosiwordRead1 =  32'h11010000;    
 parameter mosiwordWrite2 = 32'h1001AAAA;    
 parameter mosiwordRead2 =  32'h11010000;    
 parameter mosiwordWrite3 = 32'h10015555;    
 parameter mosiwordRead3 =  32'h11010000;    
 // when DO we want to get info out of the fpga at runtime?
 
 parameter hardwareClockTime = 22;
 parameter clockInTime = 127;
 parameter initTime = 100 * clockInTime;
 parameter resetTime = 100 * clockInTime;
  parameter csnTime = 100 * clockInTime;
   parameter clkTime = 17 * clockInTime;
   parameter setupTime = 23 * clockInTime;
 parameter endTime = clkTime * 32 * 16 + csnTime * 10;
 
 
 // jkh we left off here. we have to add commands 12 13 14 (hex) to write to pwmregs 0 1 2 respectively. 
 // then put it in the app, and the firmware, then run it, then base the pwm on it although that is kidna
 // done alreayd maybe. 

     top UUT (.clock_in(clock_in), .reset_in(reset_in)
	// , .period_in(period_in)
	 , .spicsn(spicsn), .spiclk(spiclk), .spimosi(spimosi), .spimiso(spimiso)
	 , .pwm_out(pwm_out) );

reg [5:0] x;


initial
 begin
    $dumpfile("e:/verilog/NRFICE04/testbench.vcd");
  //  $dumpfile("whereami.vcd");
    $dumpvars(0,toptb);
	#initTime;
	x = 5'b0;
	spicsn = 1'b1;
	spiclk = 1'b0;
	spimosi = 1'b0;
//	spimiso = 1'b0;
	
	//  period_in = 8'b00001111;
	  #resetTime;
	 reset_in = 1'b0;
	 #resetTime;
	 reset_in = 1'b1;
	 #resetTime;
	 reset_in = 1'b0;
	  #resetTime;
	 reset_in = 1'b0;
	  #resetTime;

spicsn = 1'b0;
 #csnTime;
 	x = 5'b0;
 for( x = 0; x < 32; x = x + 1 ) begin
    spimosi = mosiwordWrite1[31-x];
	#setupTime;
	spiclk = 1'b1;
	#clkTime;
	spiclk = 1'b0;
	
 
end
#csnTime;
spicsn = 1'b1;

#csnTime

spicsn = 1'b0;
 #csnTime;
  for( x = 0; x < 32; x = x + 1 ) begin
    spimosi = mosiwordRead1[31-x];
	#setupTime;
	spiclk = 1'b1;
	#clkTime;
	spiclk = 1'b0;
	
 
end
#csnTime;
spicsn = 1'b1;

#csnTime;

spicsn = 1'b0;
 #csnTime;
 	x = 5'b0;
 for( x = 0; x < 32; x = x + 1 ) begin
    spimosi = mosiwordWrite2[31-x];
	#setupTime;
	spiclk = 1'b1;
	#clkTime;
	spiclk = 1'b0;
	
 
end
#csnTime;
spicsn = 1'b1;

#csnTime

spicsn = 1'b0;
 #csnTime;
  for( x = 0; x < 32; x = x + 1 ) begin
    spimosi = mosiwordRead2[31-x];
	#setupTime;
	spiclk = 1'b1;
	#clkTime;
	spiclk = 1'b0;
	
 
end
#csnTime;
spicsn = 1'b1;

#csnTime;

spicsn = 1'b0;
 #csnTime;
 	x = 5'b0;
 for( x = 0; x < 32; x = x + 1 ) begin
    spimosi = mosiwordWrite3[31-x];
	#setupTime;
	spiclk = 1'b1;
	#clkTime;
	spiclk = 1'b0;
	
 
end
#csnTime;
spicsn = 1'b1;

#csnTime

spicsn = 1'b0;
 #csnTime;
  for( x = 0; x < 32; x = x + 1 ) begin
    spimosi = mosiwordRead3[31-x];
	#setupTime;
	spiclk = 1'b1;
	#clkTime;
	spiclk = 1'b0;
	
 
end
#initTime;
spicsn = 1'b1;
#initTime;

	 
	 
 end




// note that sensitive list is omitted in always block
// therefore always-block run forever
// clock period = 2 ns
always 
begin
    clock_in = 1'b1; 
    #hardwareClockTime; // high for 20 * timescale = 20 ns

    clock_in = 1'b0;
    #hardwareClockTime; // low for 20 * timescale = 20 ns
end



always @(posedge clock_in)
begin
   
    #endTime; // wait for period 
    
    $stop;   // end of simulation
end




endmodule