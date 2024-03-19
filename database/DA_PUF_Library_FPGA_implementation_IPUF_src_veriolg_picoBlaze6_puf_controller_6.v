/*
    This module consists of Picoblaze microcontroller , BRAM program  memory, UART for  
	sending and receiving data to/from PC. This one is specially designed for evaluating PUF
	circuit. It also have ability to read(write) data stream from(to) PC.
*/

module puf_controller #(parameter CLOCK_FRE = 100000000, BAUD_RATE = 9600)(
	clk,
	response_ready,
	RESP_1_PORT,
	RESP_2_PORT,
	RESP_3_PORT,
	RESP_4_PORT,
	RESP_5_PORT,
	RESP_6_PORT,
	RESP_7_PORT,
	RESP_8_PORT,
	RESP_9_PORT,
	RESP_10_PORT,
	RESP_11_PORT,
	RESP_12_PORT,
	RESP_13_PORT,
	RESP_14_PORT,
	RESP_15_PORT,
	RESP_16_PORT,
	rx,
	tx,
	CHAl_1_PORT,
	CHAl_2_PORT,
	CHAl_3_PORT,
	CHAl_4_PORT,
	CHAl_5_PORT,
	CHAl_6_PORT,
	CHAl_7_PORT,
	CHAl_8_PORT,
	CHAl_9_PORT,
	CHAl_10_PORT,
	CHAl_11_PORT,
	CHAl_12_PORT,
	CHAl_13_PORT,
	CHAl_14_PORT,
	CHAl_15_PORT,
	CHAl_16_PORT,
	CHAL_EN_PORT,
   PUF_START_PORT	
	);
	
	
	input 	clk; 
    input 	rx;
	input    response_ready;
	input    [7:0] RESP_1_PORT;
	input    [7:0] RESP_2_PORT;
	input    [7:0] RESP_3_PORT;
	input    [7:0] RESP_4_PORT;
	input    [7:0] RESP_5_PORT;
	input    [7:0] RESP_6_PORT;
	input    [7:0] RESP_7_PORT;
	input    [7:0] RESP_8_PORT;
	input    [7:0] RESP_9_PORT;
	input    [7:0] RESP_10_PORT;
	input    [7:0] RESP_11_PORT;
	input    [7:0] RESP_12_PORT;
	input    [7:0] RESP_13_PORT;
	input    [7:0] RESP_14_PORT;
	input    [7:0] RESP_15_PORT;
	input    [7:0] RESP_16_PORT;
	output	       tx;
	output reg [7:0] CHAl_1_PORT;
	output reg [7:0] CHAl_2_PORT;
	output reg [7:0] CHAl_3_PORT;
	output reg [7:0] CHAl_4_PORT;
	output reg [7:0] CHAl_5_PORT;
	output reg [7:0] CHAl_6_PORT;
	output reg [7:0] CHAl_7_PORT;
	output reg [7:0] CHAl_8_PORT;
	output reg [7:0] CHAl_9_PORT;
	output reg [7:0] CHAl_10_PORT;
	output reg [7:0] CHAl_11_PORT;
	output reg [7:0] CHAl_12_PORT;
	output reg [7:0] CHAl_13_PORT;
	output reg [7:0] CHAl_14_PORT;
	output reg [7:0] CHAl_15_PORT;
	output reg [7:0] CHAl_16_PORT;
	output reg       CHAL_EN_PORT;
	output reg       PUF_START_PORT;
	
//==================================================================
// Declaration of KCPSM3.
// Declaration of program ROM.
// Declaration of UART transmitter with integral 16 byte FIFO buffer.
// Declaration of UART Receiver with integral 16 byte FIFO buffer.
//==================================================================

// Signals used to connect KCPSM3 to program ROM and I/O logic
// -----------------------------------------------------------
	
	// Signals used to connect KCPSM6
	wire [9:0] 	address;
	wire [17:0]	instruction;
	wire [7:0]	port_id;
	wire [7:0] 	out_port;
	reg  [7:0] 	in_port;
	wire			write_strobe;
   wire			k_write_strobe;
   wire			read_strobe;
   wire			interrupt;            //See note above
   wire			interrupt_ack;
   wire			kcpsm6_sleep;         //See note above
   wire			kcpsm6_reset;         //See note above       
	
	// Signals used to connect program memory
	wire rdl;
	
	// Signals used to connect UART_TX6
	wire [7:0]  tx_data_in;
	wire        write_to_uart;
	wire        tx_data_present;
	wire        tx_half_full;
	wire        tx_full;
	wire        tx_reset;
		
	// Signals used to connect UART_RX6
	wire [7:0]  rx_data_out;
	reg         read_from_uart;
	wire        rx_data_present;
	wire        rx_half_full;
	wire        rx_full;
	wire        rx_reset;
	
	// Other UART signals
	reg  [9:0] 	baud_count;
	reg  			en_16_x_baud;

   // Signals for connection of peripherals
	wire [7:0] 	uart_status_port;
	wire [7:0]  rx_data;
	//wire [7:0]  response_data;
	wire [7:0]  response_ready_status;


// KCPSM3: 8-bit PicoBlaze Microcontroller
//----------------------------------------
   (* KEEP_HIERARCHY = "TRUE" *)
   kcpsm6 #(
	.interrupt_vector	      (12'h3FF),
	.scratch_pad_memory_size(64),
	.hwbuild		            (8'h00))
  processor (
	.address 		 (address),
	.instruction 	 (instruction),
	.bram_enable 	 (bram_enable),
	.port_id 		 (port_id),
	.write_strobe 	 (write_strobe),
	.k_write_strobe (k_write_strobe),
	.out_port 		 (out_port),
	.read_strobe 	 (read_strobe),
	.in_port 		 (in_port),
	.interrupt 		 (interrupt),
	.interrupt_ack  (interrupt_ack),
	.reset 		    (kcpsm6_reset),
	.sleep		    (kcpsm6_sleep),
	.clk 			    (clk)); 

	// In many designs (especially your first) interrupt and sleep are not used.
	// Tie these inputs Low until you need them. 

  assign kcpsm6_sleep = 1'b0;
  assign interrupt    = 1'b0;	
  
  // Reset by press button (active Low) or JTAG Loader enabled Program Memory 
  //assign kcpsm6_reset = 1'b0;
  //assign kcpsm6_reset = rdl or cpu_rst;
  assign kcpsm6_reset = rdl;   // Reset connected to JTAG Loader enabled Program Memory
 
//********************************************************************************
// Program memory: 1/2/4k x 18 
//********************************************************************************
  (* KEEP_HIERARCHY = "TRUE" *)
  program #(
	.C_FAMILY		        ("7S"),     //Family 'S6' or 'V6' or '7s'
	.C_RAM_SIZE_KWORDS	  (2),  	     //Program size '1', '2' or '4'
	.C_JTAG_LOADER_ENABLE  (0))  	     //Include JTAG Loader when set to '1' 
  program_rom (    				        //Name to match your PSM file
 	.rdl 			           (rdl),
	.enable 		           (bram_enable),
	.address 		        (address),
	.instruction 	        (instruction),
	.clk 			           (clk));

//********************************************************************************
// UART Transmitter with integral 16 byte FIFO buffer
// Note: Write to buffer in UART Transmitter at port address 01 hex
//********************************************************************************

	(* KEEP_HIERARCHY = "TRUE" *)
	uart_tx6 transmitter(
      .data_in(out_port),
      .en_16_x_baud(en_16_x_baud),
      .serial_out(tx),
      .buffer_write(write_to_uart),
      .buffer_data_present(),    // tx_data_present
      .buffer_half_full(tx_half_full ),
      .buffer_full(tx_full),
      .buffer_reset(tx_reset),              
      .clk(clk));
		
	 assign tx_reset = 1'b0;

//********************************************************************************
// UART Receiver with integral 16 byte FIFO buffer
// Note:
// Read from buffer in UART Receiver at port address 01 hex.
// When KCPMS6 reads data from the receiver a pulse must be generated so that the 
// FIFO buffer presents the next character to be read and updates the buffer flags.
//******************************************************************************** 

	(* KEEP_HIERARCHY = "TRUE" *)
	uart_rx6 receiver(
	  .serial_in(rx),
	  .en_16_x_baud(en_16_x_baud),
	  .data_out(rx_data),
	  .buffer_read(read_from_uart),
	  .buffer_data_present(rx_data_present ),
	  .buffer_half_full(rx_half_full ),
	  .buffer_full(rx_full),
	  .buffer_reset(rx_reset),              
	  .clk(clk ));

	assign rx_reset = 1'b0;
	
//********************************************************************************
// KCPSM6 Input Ports and Decoding Logic
//********************************************************************************

	// Port-1(00): UART FIFO status signals to form a bus
	assign uart_status_port = {3'b 000,rx_data_present,rx_full,rx_half_full,tx_full,tx_half_full};	
	
	// Port 2: Output port of UART Receiver.
	//assign rx_data = rx_data;
	
	// Port 3: PUF Response ready
	assign response_ready_status = {7'b0000000,response_ready};
	
	// Port 4: PUF Response
	//assign response_data = {7'b0000000,response_bit};
		
	// Decoding Logic for input ports
	// ------------------------------

	// The inputs connect via a pipelined multiplexer
	
		always @(posedge clk) begin
		 
			 case({port_id[4],port_id[3],port_id[2],port_id[1],port_id[0]})
			 
					// read UART status at address 00 hex
					5'b00000 : in_port <= uart_status_port;
					
					// read UART receive data at address 01 hex
					5'b00001 : in_port <= rx_data;
					
					// read response_ready status at address 02 hex
					5'b00010 : in_port <= response_ready_status;
					
					// read response byte 0(LSB) at address 03 hex
					5'b00011 : in_port <= RESP_1_PORT;
					
					 // read response data at address 04 hex
					 5'b00100 : in_port <= RESP_2_PORT;
						
					// read response data at address 05 hex
					 5'b00101 : in_port <= RESP_3_PORT;
								
					// read response data at address 06 hex
					5'b00110 : in_port <= RESP_4_PORT;
					
					// read response data at address 07 hex
					5'b00111 : in_port <= RESP_5_PORT;					
					
					// read response data at address 08 hex
				    5'b01000 : in_port <= RESP_6_PORT;
				   
					// read response data at address 09 hex
					5'b01001 : in_port <= RESP_7_PORT;
					
					// read response data at address 0A hex
					5'b01010 : in_port <= RESP_8_PORT;
								
					// read response data at address 0B hex
					5'b01011 : in_port <= RESP_9_PORT;
								
					// read response data at address 0C hex
					5'b01100 : in_port <= RESP_10_PORT;
								
					// read response data at address 0D hex
					5'b01101 : in_port <= RESP_11_PORT;
								
					// read response data at address 0E hex
					5'b01110 : in_port <= RESP_12_PORT;
								
					// read response data at address 0F hex
					5'b01111 : in_port <= RESP_13_PORT;
								
					// read response data at address 10 hex
					5'b10000 : in_port <= RESP_14_PORT;
								
					// read response data at address 11 hex
					5'b10001 : in_port <= RESP_15_PORT;
								
					// read response data at address 12 hex
					5'b10010 : in_port <= RESP_16_PORT;
								
					 // Don't care used for all other addresses to ensure minimum logic implementation
					 default : in_port <= in_port;
								
			 endcase

			 // Form read strobe for UART receiver FIFO buffer.
			 // The fact that the read strobe will occur after the actual data is read by 
			 // the KCPSM6 is acceptable because it is really means 'I have read you'!

			 read_from_uart <= read_strobe & ~port_id[4] & ~port_id[3] & ~port_id[2] & ~port_id[1] & port_id[0] ;

		end


// KCPSM3 output ports (17 8-bit output port)
//	--------------------
   // Decode Logic
	reg [18:0] port_en;  // Port Enable
	always@(port_id[4],port_id[3],port_id[2],port_id[1],port_id[0]) begin
	
		case({port_id[4],port_id[3],port_id[2],port_id[1],port_id[0]})
				
			5'b00000 : port_en = 19'b0000000000000000001 ;  // Chal_1
			5'b00001 : port_en = 19'b0000000000000000010 ;  // Chal_2
			5'b00010 : port_en = 19'b0000000000000000100 ;  // Chal_3
			5'b00011 : port_en = 19'b0000000000000001000 ;  // Chal_4
			5'b00100 : port_en = 19'b0000000000000010000 ;  // Chal_5
			5'b00101 : port_en = 19'b0000000000000100000 ;  // Chal_6
			5'b00110 : port_en = 19'b0000000000001000000 ;  // Chal_7
			5'b00111 : port_en = 19'b0000000000010000000 ;  // Chal_8
			5'b01000 : port_en = 19'b0000000000100000000 ;  // Chal_9
			5'b01001 : port_en = 19'b0000000001000000000 ;  // Chal_10
			5'b01010 : port_en = 19'b0000000010000000000 ;  // Chal_11
			5'b01011 : port_en = 19'b0000000100000000000 ;  // Chal_12
			5'b01100 : port_en = 19'b0000001000000000000 ;  // Chal_13
			5'b01101 : port_en = 19'b0000010000000000000 ;  // Chal_14
			5'b01110 : port_en = 19'b0000100000000000000 ;  // Chal_15
			5'b01111 : port_en = 19'b0001000000000000000 ;  // Chal_16
			5'b10000 : port_en = 19'b0010000000000000000 ;  // Chal_en
			5'b10001 : port_en = 19'b0100000000000000000 ;  // Uart_tx_write
			5'b10010 : port_en = 19'b1000000000000000000 ;  // PUF_Start
			default  : port_en = 19'b0000000000000000000 ;
			
		endcase
	end
	
	
	// Challenge 1
	always @(posedge clk) begin
    
		if(write_strobe == 1'b 1 & port_en[0])
			CHAl_1_PORT <= out_port;
		else
			CHAl_1_PORT <= CHAl_1_PORT;
	end
	
	// Challenge 2
	always @(posedge clk) begin
    
		if(write_strobe == 1'b 1 & port_en[1])
			CHAl_2_PORT <= out_port;
		else
			CHAl_2_PORT <= CHAl_2_PORT;
	end
	
	// Challenge 3
	always @(posedge clk) begin
    
		if(write_strobe == 1'b 1 & port_en[2])
			CHAl_3_PORT <= out_port;
		else
			CHAl_3_PORT <= CHAl_3_PORT;
	end
	
	
	// Challenge 4
	always @(posedge clk) begin
    
		if(write_strobe == 1'b 1 & port_en[3])
			CHAl_4_PORT <= out_port;
		else
			CHAl_4_PORT <= CHAl_4_PORT;
	end
	
	// Challenge 5
	always @(posedge clk) begin
    
		if(write_strobe == 1'b 1 & port_en[4])
			CHAl_5_PORT <= out_port;
		else
			CHAl_5_PORT <= CHAl_5_PORT;
	end
	
	// Challenge 6
	always @(posedge clk) begin
    
		if(write_strobe == 1'b 1 & port_en[5])
			CHAl_6_PORT <= out_port;
		else
			CHAl_6_PORT <= CHAl_6_PORT;
	end
	
	// Challenge 7
	always @(posedge clk) begin
    
		if(write_strobe == 1'b 1 & port_en[6])
			CHAl_7_PORT <= out_port;
		else
			CHAl_7_PORT <= CHAl_7_PORT;
	end
	
	// Challenge 8
	always @(posedge clk) begin
    
		if(write_strobe == 1'b 1 & port_en[7])
			CHAl_8_PORT <= out_port;
		else
			CHAl_8_PORT <= CHAl_8_PORT;
	end
	
	// Challenge 9
	always @(posedge clk) begin
    
		if(write_strobe == 1'b 1 & port_en[8])
			CHAl_9_PORT <= out_port;
		else
			CHAl_9_PORT <= CHAl_9_PORT;
	end
	
	// Challenge 10
	always @(posedge clk) begin
    
		if(write_strobe == 1'b 1 & port_en[9])
			CHAl_10_PORT <= out_port;
		else
			CHAl_10_PORT <= CHAl_10_PORT;
	end
	
	// Challenge 11
	always @(posedge clk) begin
    
		if(write_strobe == 1'b 1 & port_en[10])
			CHAl_11_PORT <= out_port;
		else
			CHAl_11_PORT <= CHAl_11_PORT;
	end
	
	// Challenge 12
	always @(posedge clk) begin
    
		if(write_strobe == 1'b 1 & port_en[11])
			CHAl_12_PORT <= out_port;
		else
			CHAl_12_PORT <= CHAl_12_PORT;
	end
	
	// Challenge 13
	always @(posedge clk) begin
    
		if(write_strobe == 1'b 1 & port_en[12])
			CHAl_13_PORT <= out_port;
		else
			CHAl_13_PORT <= CHAl_13_PORT;
	end
	
	// Challenge 14
	always @(posedge clk) begin
    
		if(write_strobe == 1'b 1 & port_en[13])
			CHAl_14_PORT <= out_port;
		else
			CHAl_14_PORT <= CHAl_14_PORT;
	end
	
	// Challenge 15
	always @(posedge clk) begin
    
		if(write_strobe == 1'b 1 & port_en[14])
			CHAl_15_PORT <= out_port;
		else
			CHAl_15_PORT <= CHAl_15_PORT;
	end
	
	// Challenge 16
	always @(posedge clk) begin
    
		if(write_strobe == 1'b 1 & port_en[15])
			CHAl_16_PORT <= out_port;
		else
			CHAl_16_PORT <= CHAl_16_PORT;
	end
	
	
	// Challenge Enable
	always @(posedge clk) begin
    
		if(write_strobe == 1'b 1 & port_en[16])
			CHAL_EN_PORT <= out_port[0];
		else
			CHAL_EN_PORT <=  CHAL_EN_PORT;
	end
  
	// write to UART transmitter FIFO buffer at address 11 hex.
	// This is a combinatorial decode because the FIFO is the 'port register'.

		assign write_to_uart = write_strobe & port_en[17];
   
	// PUF_START
	always @(posedge clk) begin
    
		if(write_strobe == 1'b 1 & port_en[18])
			PUF_START_PORT <= out_port[0];
		else
			PUF_START_PORT <=  PUF_START_PORT;
	end
	

// Timing reference for serial transmission
// ----------------------------------------
// Set baud rate to 9600 for the UART communications.
// Requires en_16_x_baud to be 153600Hz which is a single cycle pulse every 26 cycles at 4MHz. 
// Baud_count = clock_frequency /(baud_rate*16)	

	localparam BAUD_COUNT = CLOCK_FRE/(BAUD_RATE*16); 
	always @(posedge clk) begin

		if (baud_count == BAUD_COUNT) begin
					baud_count <= 1'b0;
					en_16_x_baud <= 1'b1;
					
		end else begin
					baud_count <= baud_count + 1;
					en_16_x_baud <= 1'b0;
		end
	end


endmodule
