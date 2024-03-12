// generates activity on avr SPI aimed to send bytes over SDcard SPI.
//
`ifdef SPITEST

`include "tune.v"



`define AVR_HALF_PERIOD (45.2)

module spitest_avr(
	
	output wire spick,
	output reg  spics_n,
	output wire spido,
	input  wire spidi

);


	reg aclk;


	reg  spistart;
	wire spirdy;

	reg  [7:0] spidin;
	wire [7:0] spidout;




	// clock gen
	initial
	begin
		aclk = 1'b0;

		forever #`AVR_HALF_PERIOD aclk = ~aclk;
	end


	// signals init
	initial
	begin
		spics_n = 1'b1;

		spistart = 1'b0;
	end




	// use standard spi2 module to send and receive over SPI.
	// reverse bytes since spi2 sends and receives MSB first,
	// while slavespi LSB first
	spi2 spi2(

		.clock(aclk),

		.sck(spick),
		.sdo(spido),
		.sdi(spidi),

		.bsync(),

		.start(spistart),
		.rdy  (spirdy  ),

		.speed(2'b00),

		.din ({spidin[0], spidin[1], spidin[2], spidin[3],
		       spidin[4], spidin[5], spidin[6], spidin[7]}),

		.dout({spidout[0], spidout[1], spidout[2], spidout[3],
		       spidout[4], spidout[5], spidout[6], spidout[7]})
	);




	// test loop
	initial
	begin
		repeat(2211) @(posedge aclk);

		forever
		begin
			get_access();
			send_msg();
			release_access();

			repeat(1234) @(posedge aclk);
		end
	end





	task get_access(
	);
		reg [7:0] tmp;

		reg_io( 8'h61, 8'h81, tmp );

		while( !tmp[7] )
			reg_io( 8'h61, 8'h81, tmp );
	endtask

	task send_msg(
	);
		reg [7:0] tmp;
		reg [71:0] msg = "AVR SEND\n";
		integer i;

		reg_io( 8'h61, 8'h80, tmp );

		for(i=8;i>=0;i=i-1)
		begin
			reg_io( 8'h60, msg[i*8 +: 8], tmp );
		end

		reg_io( 8'h61, 8'h81, tmp );
	endtask

	task release_access(
	);
		reg [7:0] tmp;

		reg_io( 8'h61, 8'h81, tmp );
		reg_io( 8'h61, 8'h01, tmp );
	endtask

	task reg_io(
		input  [7:0] addr,
		input  [7:0] wrdata,
		output [7:0] rddata
	);

		reg [7:0] trash;


		spics_n <= 1'b1;
		@(posedge aclk);

		spi_io( addr, trash );

		spics_n <= 1'b0;
		@(posedge aclk);

		spi_io( wrdata, rddata );

		spics_n <= 1'b1;
		@(posedge aclk);

	endtask



	task spi_io(
		input  [7:0] wrdata,
		output [7:0] rddata
	);

		spidin <= wrdata;
		spistart <= 1'b1;

		@(posedge aclk);

		spistart <= 1'b0;

		@(posedge aclk);

		wait(spirdy==1'b1);

		@(posedge aclk);


		rddata = spidout;

	endtask




endmodule
`endif
