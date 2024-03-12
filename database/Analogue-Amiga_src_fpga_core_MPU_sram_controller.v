`default_nettype none

module sram_controller
			#(real SRAM_TIME_TO_DATA = 55,		// Period of TDL in NS
			  real CLOCK_MHZ = 74.25,			// MHZ Of clock coming in
			  parameter CLOCKED_DATA_OUT = 0)	// This will reg the data out if true so this will add a wait state.		
    (
        // Clock and Reset
        input  wire        clk,       //! Input Clock
        input  wire        reset_l,     //! Reset
        // Single Port Internal Bus Interface
        input  wire        we,        //! Write Enable
		input  wire        rd,        //! Write Enable
		input  wire [1:0]  mask,      //! Mask Enable - high is enable that mask
        input  wire [16:0] addr,      //! Address In
        input  wire [15:0] d,         //! Data In
        output reg  [15:0] q,         //! Data Out
        output reg  	   ready,     //! Data ready
        // SRAM External Interface
        output  reg [16:0] sram_addr, //! Address Out
        inout  wire [15:0] sram_dq,   //! Data In/Out
        output  reg        sram_oe_n, //! Output Enable
        output  reg        sram_we_n, //! Write Enable
        output  reg        sram_ub_n, //! Upper Byte Mask
        output  reg        sram_lb_n  //! Lower Byte Mask
    );

localparam real time_of_clock_wait = $floor(SRAM_TIME_TO_DATA / ((1 / CLOCK_MHZ)  * 1000)); // This will make sure the timing is ok. Anything over 1 will generated the core.
        reg [15:0]  sram_dq_reg;
		reg           read_state;
// We will make two cores where if the clock speed is below the TTL for the read then we can 
generate
	if (time_of_clock_wait >= 1 && CLOCKED_DATA_OUT == 0) begin 

		reg [1:0] 	sram_state;
		reg [7:0] 	cnt;
		
		parameter idle_core			= 0,
				  wait_state  	= 1;

		always @(posedge clk or negedge reset_l) begin : RW_SRAM
			if(~reset_l) begin
				{sram_lb_n, sram_ub_n} <= 2'b11; 					// Mask Low/High Byte
				{sram_we_n, sram_oe_n} <= 2'b11; 					// Write Disabled/Output Enabled
				sram_addr 	<= {17{1'b0}};       					// Set Address as "Don't Care"
				sram_state 	<= idle_core;								// State is idle 
				cnt 		<= 0;									// Cnt is zero
				read_state	<= 0;									// Make the read state zero
			end
			else begin
				case (sram_state)
					idle_core : begin
						{sram_lb_n, sram_ub_n} <= 2'b11; 			// Unmask Low/High Byte
						{sram_we_n, sram_oe_n} <= 2'b11; 			// Write Disabled/Output Enabled
						sram_addr <= {17{1'b0}};         			// Set Address as "Don't Care"
						cnt <= 0;
						if (|{we,rd}) begin							// We see if the RD or WR is high
							cnt 		<= time_of_clock_wait - 1;	// Set the cnt for the amount of clock cycles
							sram_addr 	<= addr;               		// Set Address
							sram_state 	<= wait_state;				// Change the state
							if(we) begin
								sram_ub_n <= !mask[1]; 			 	// mask High Byte [15:8]
								sram_lb_n <= !mask[0]; 			 	// mask Low Byte [7:0]
								{sram_oe_n, sram_we_n} <= 2'b10; 	// Output Disabled/Write Enabled
								sram_dq_reg 	<= d;				// Data output to SRAM 
								read_state	<= 0;				 	// Advise that the core is doing a Write 
							end
							else begin
								{sram_lb_n, sram_ub_n} <= 2'b00; 	// Unmask Low/High Byte
								{sram_we_n, sram_oe_n} <= 2'b10; 	// Write Disabled/Output Enabled
								read_state	<= 1;				 	// Advise that the core is doing a Read 
							end
						end
					end
					wait_state : begin
						if (cnt == 0) begin
							sram_state <= idle_core;		 				// When the cnt == 0 then the SRAM TDL is completed
							{sram_lb_n, sram_ub_n} <= 2'b11; 		// Unmask Low/High Byte
							{sram_we_n, sram_oe_n} <= 2'b11; 		// Write Disabled/Output Enabled
							if (read_state) sram_dq_reg <= sram_dq;	// Read data goes to the d output 
						end
						else cnt <= cnt - 1;					 	// Decrease the cnt until 0 
					end 
				endcase
			end
		end
	
		always @* begin 
			ready <= ((sram_state == idle_core) && ~|{we,rd}); // we are makeing this a 0 clock state 
			q <= sram_dq;
		end
	
	end
		if (time_of_clock_wait >= 1 && CLOCKED_DATA_OUT == 1) begin 

		reg [1:0] 	sram_state;
		reg [7:0] 	cnt;
		
		parameter idle_core			= 0,
				  wait_state  	= 1;

		always @(posedge clk or negedge reset_l) begin : RW_SRAM
			if(~reset_l) begin
				{sram_lb_n, sram_ub_n} <= 2'b11; 					// Mask Low/High Byte
				{sram_we_n, sram_oe_n} <= 2'b11; 					// Write Disabled/Output Enabled
				sram_addr 	<= {17{1'b0}};       					// Set Address as "Don't Care"
				sram_state 	<= idle_core;								// State is idle 
				cnt 		<= 0;									// Cnt is zero
				read_state	<= 0;									// Make the read state zero
			end
			else begin
				case (sram_state)
					idle_core : begin
						{sram_lb_n, sram_ub_n} <= 2'b11; 			// Unmask Low/High Byte
						{sram_we_n, sram_oe_n} <= 2'b11; 			// Write Disabled/Output Enabled
						sram_addr <= {17{1'b0}};         			// Set Address as "Don't Care"
						read_state	<= 0;
						cnt <= 0;
						if (|{we,rd}) begin							// We see if the RD or WR is high
							cnt 		<= time_of_clock_wait - 1;	// Set the cnt for the amount of clock cycles
							sram_addr 	<= addr;               		// Set Address
							sram_state 	<= wait_state;				// Change the state
							if(we) begin
								sram_ub_n <= !mask[1]; 			 	// mask High Byte [15:8]
								sram_lb_n <= !mask[0]; 			 	// mask Low Byte [7:0]
								{sram_oe_n, sram_we_n} <= 2'b10; 	// Output Disabled/Write Enabled
								sram_dq_reg 	<= d;				// Data output to SRAM 
								read_state	<= 0;				 	// Advise that the core is doing a Write 
							end
							else begin
								{sram_lb_n, sram_ub_n} <= 2'b00; 	// Unmask Low/High Byte
								{sram_we_n, sram_oe_n} <= 2'b10; 	// Write Disabled/Output Enabled
								read_state	<= 1;				 	// Advise that the core is doing a Read 
							end
						end
					end
					wait_state : begin
						if (cnt == 0) begin
							sram_state <= idle_core;		 				// When the cnt == 0 then the SRAM TDL is completed
							{sram_lb_n, sram_ub_n} <= 2'b11; 		// Unmask Low/High Byte
							{sram_we_n, sram_oe_n} <= 2'b11; 		// Write Disabled/Output Enabled
							if (read_state) begin 
								sram_dq_reg <= sram_dq;				// Read data goes to the d output 
								read_state	<= 0;
							end
						end
						else cnt <= cnt - 1;					 	// Decrease the cnt until 0 
					end 
				endcase
			end
		end
	
		always @(posedge clk) begin 
			ready <= (cnt == 0 && (sram_state == idle_core && ~|{we,rd})); // we are makeing this a 0 clock state 
			if (&{cnt == 0, read_state}) q <= sram_dq;
		end
	
	end
	
	else if (time_of_clock_wait == 0 && CLOCKED_DATA_OUT == 1) begin 
	   
		always @* begin 
			sram_addr 	<= addr; //! Address Out
			sram_dq_reg <= d;   //! Data In/Out
			sram_oe_n 	<= ~rd; //! Output Enable
			sram_we_n 	<= ~we; //! Write Enable
			sram_ub_n 	<= ~(|{mask[1] && we, rd}); //! Upper Byte Mask
			sram_lb_n 	<= ~(|{mask[0] && we, rd}); //! Lower Byte Mask
			read_state 	<= ~rd;
		end 
		always @(posedge clk) begin 
			ready <= 1; // we are makeing this a 0 clock state 
			q <= sram_dq;
		end
	end
	
	else begin 
	
	   	
		always @* begin 
			sram_addr 	<= addr; //! Address Out
			sram_dq_reg <= d;   //! Data In/Out
			sram_oe_n 	<= ~rd; //! Output Enable
			sram_we_n 	<= ~we; //! Write Enable
			sram_ub_n 	<= ~(|{mask[1] && we, rd}); //! Upper Byte Mask
			sram_lb_n 	<= ~(|{mask[0] && we, rd}); //! Lower Byte Mask
			read_state 	<= ~rd;
		end 
		always @* begin 
			ready <= 1; // we are makeing this a 0 clock state 
			q <= sram_dq;
		end
	end
endgenerate
    
assign sram_dq = read_state ? 16'bz : sram_dq_reg;

endmodule