`timescale 1 ns / 100 ps
`default_nettype wire
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: The Fighting Meerkat
// 
// Create Date:    12:30:35 11/11/2013 
// Design Name: 
// Module Name:    iic_init 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module iic_init(//Outputs
					 Done,
					 //Inouts
					 SDA, SCL,
					 //Inputs
					 Clk, Reset, Pixel_clk_greater_than_65Mhz);
	//Outputs
	output Done;

	//Inouts
	inout SDA, SCL;

	//Inputs                 
	input Clk, Reset, Pixel_clk_greater_than_65Mhz;

	parameter CLK_RATE_MHZ = 200,
				 SCK_PERIOD_US = 30,
				 TRANSITION_CYCLE = (CLK_RATE_MHZ * SCK_PERIOD_US) / 2,
				 TRANSITION_CYCLE_MSB = 11;
            
	localparam IDLE = 3'd0,
				  INIT = 3'd1,
				  START = 3'd2,
				  CLK_FALL = 3'd3,
				  SETUP = 3'd4,
				  CLK_RISE = 3'd5,
				  WAIT = 3'd6,
				  START_BIT = 1'b1,
				  SLAVE_ADDR  = 7'b1110110,
                  SLAVE_ADDRI = 7'b1001100,
				  ACK = 1'b1,
				  WRITE = 1'b0,
				  REG_ADDR0 = 8'h49,
				  REG_ADDR1 = 8'h21,
				  REG_ADDR2 = 8'h33,
				  REG_ADDR3 = 8'h34,
				  REG_ADDR4 = 8'h36,
                  //Initialize AD9980
                  REG_ADDRI0 = 8'h1E,
                  REG_ADDRI1 = 8'h1F,
                  REG_ADDRI2 = 8'h20,
                  REG_ADDRI3 = 8'h05,
                  REG_ADDRI4 = 8'h06,
                  REG_ADDRI5 = 8'h07,
                  REG_ADDRI6 = 8'h08,
                  REG_ADDRI7 = 8'h09,
                  REG_ADDRI8 = 8'h0A,
                  REG_ADDRI9 = 8'h1B,
                  REG_ADDRI10 = 8'h0B,
                  REG_ADDRI11 = 8'h0C,
                  REG_ADDRI12 = 8'h0D,
                  REG_ADDRI13 = 8'h0E,
                  REG_ADDRI14 = 8'h0F,
                  REG_ADDRI15 = 8'h10,
                  REG_ADDRI16 = 8'h18,
                  REG_ADDRI17 = 8'h12,
                  //Analog 800x600P60
                  REG_ADDRI18 = 8'h01,
                  REG_ADDRI19 = 8'h02,
                  REG_ADDRI20 = 8'h03,
                  REG_ADDRI21 = 8'h04,
                  REG_ADDRI22 = 8'h12,
                  REG_ADDRI23 = 8'h13,
                  REG_ADDRI24 = 8'h14,
                  REG_ADDRI25 = 8'h19,
                  REG_ADDRI26 = 8'h1A,
				  DATA0 = 8'hC0,			  
				  DATA1 = 8'h09,
				  DATA2a = 8'h06,
				  DATA3a = 8'h26,
				  DATA4a = 8'hA0,
				  DATA2b = 8'h08,
				  DATA3b = 8'h16,
				  DATA4b = 8'h60,
                  DATAI0 = 8'hA4,
                  DATAI1 = 8'h14,
                  DATAI2 = 8'h01,
                  DATAI3 = 8'h40,
                  DATAI4 = 8'h00,
                  DATAI5 = 8'h40,
                  DATAI6 = 8'h00,
                  DATAI7 = 8'h40,
                  DATAI8 = 8'h00,
                  DATAI9 = 8'h33,
                  DATAI10 = 8'h02,
                  DATAI11 = 8'h00,
                  DATAI12 = 8'h02,
                  DATAI13 = 8'h00,
                  DATAI14 = 8'h02,
                  DATAI15 = 8'h00,
                  DATAI16 = 8'h00,
                  DATAI17 = 8'h80,
                  //800x600
                  DATAI18 = 8'h42,
                  DATAI19 = 8'h00,
                  DATAI20 = 8'h48,
                  DATAI21 = 8'h80,
                  DATAI22 = 8'h18,
                  DATAI23 = 8'h80,
                  DATAI24 = 8'h18,
                  DATAI25 = 8'h04,
                  DATAI26 = 8'h3C,
                  BYTE_NUM = 5'd31,
				  STOP_BIT=1'b0,
				  SDA_BUFFER_MSB=27;

	reg SDA_out;
	reg SCL_out;
	reg [TRANSITION_CYCLE_MSB:0] cycle_count;
	reg [2:0] c_state;
	reg [2:0] n_state;
	reg Done;
	reg [4:0] write_count;
	reg [31:0] bit_count;
	reg [SDA_BUFFER_MSB:0] SDA_BUFFER;
	wire transition;
	
	always @ (posedge Clk) begin
		if (Reset||c_state==IDLE ) begin
			SDA_out <= 1'b1;
			SCL_out <=1'b1;
		end
		else if (c_state==INIT && transition) //begin
			SDA_out <=1'b0;
		//end
		else if (c_state==SETUP) //begin
			SDA_out <=SDA_BUFFER[SDA_BUFFER_MSB];
		//end
		else if (c_state==CLK_RISE && 
					cycle_count==TRANSITION_CYCLE/2 && 
					bit_count==SDA_BUFFER_MSB) //begin
			SDA_out <= 1'b1;
		//end
		else if (c_state==CLK_FALL) //begin
			SCL_out <=1'b0;
		//end
    
		else if (c_state==CLK_RISE) //begin
			SCL_out <=1'b1;
		//end
	end

//OBUFT_LVCMOS33 sda0(.O(SDA), .I(1'b0), .T(SDA_out));
//OBUFT_LVCMOS33 scl0(.O(SCL), .I(1'b0), .T(SCL_out));
	assign SDA = SDA_out;
	assign SCL = SCL_out;
 
	always @ (posedge Clk) begin
		//reset or end condition
		if(Reset) begin
			SDA_BUFFER <= {SLAVE_ADDR,WRITE,ACK,REG_ADDR0,ACK,DATA0,ACK,STOP_BIT};
			cycle_count<=0;
		end
		//setup sda for sck rise
		else if ( c_state==SETUP && cycle_count==TRANSITION_CYCLE)begin
			SDA_BUFFER <= {SDA_BUFFER[SDA_BUFFER_MSB-1:0],1'b0};
			cycle_count<=0;
		end
		//reset count at end of state
		else if ( cycle_count==TRANSITION_CYCLE)
			cycle_count<=0;
		//reset sda_buffer
		else if (c_state==WAIT && Pixel_clk_greater_than_65Mhz )begin
			case(write_count)
				5'd0: SDA_BUFFER <= {SLAVE_ADDR,WRITE,ACK,REG_ADDR1,ACK,DATA1,ACK,STOP_BIT};
				5'd1: SDA_BUFFER <= {SLAVE_ADDR,WRITE,ACK,REG_ADDR2,ACK,DATA2a,ACK,STOP_BIT};
				5'd2: SDA_BUFFER <= {SLAVE_ADDR,WRITE,ACK,REG_ADDR3,ACK,DATA3a,ACK,STOP_BIT};
				5'd3: SDA_BUFFER <= {SLAVE_ADDR,WRITE,ACK,REG_ADDR4,ACK,DATA4a,ACK,STOP_BIT};
                5'd4: SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI0,ACK,DATAI0,ACK,STOP_BIT};
                5'd5: SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI1,ACK,DATAI1,ACK,STOP_BIT};
                5'd6: SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI2,ACK,DATAI2,ACK,STOP_BIT};
                5'd7: SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI3,ACK,DATAI3,ACK,STOP_BIT};
                5'd8: SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI4,ACK,DATAI4,ACK,STOP_BIT};
                5'd9: SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI5,ACK,DATAI5,ACK,STOP_BIT};
                5'd10:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI6,ACK,DATAI6,ACK,STOP_BIT};
                5'd11:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI7,ACK,DATAI7,ACK,STOP_BIT};
                5'd12:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI8,ACK,DATAI8,ACK,STOP_BIT};
                5'd13:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI9,ACK,DATAI9,ACK,STOP_BIT};
                5'd14:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI10,ACK,DATAI10,ACK,STOP_BIT};
                5'd15:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI11,ACK,DATAI11,ACK,STOP_BIT};
                5'd16:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI12,ACK,DATAI12,ACK,STOP_BIT};
                5'd17:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI13,ACK,DATAI13,ACK,STOP_BIT};
                5'd18:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI14,ACK,DATAI14,ACK,STOP_BIT};
                5'd19:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI15,ACK,DATAI15,ACK,STOP_BIT};
                5'd20:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI16,ACK,DATAI16,ACK,STOP_BIT};
                5'd21:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI17,ACK,DATAI17,ACK,STOP_BIT};
                5'd22:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI18,ACK,DATAI18,ACK,STOP_BIT};
                5'd23:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI19,ACK,DATAI19,ACK,STOP_BIT};
                5'd24:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI20,ACK,DATAI20,ACK,STOP_BIT};
                5'd25:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI21,ACK,DATAI21,ACK,STOP_BIT};
                5'd26:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI22,ACK,DATAI22,ACK,STOP_BIT};
                5'd27:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI23,ACK,DATAI23,ACK,STOP_BIT};
                5'd28:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI24,ACK,DATAI24,ACK,STOP_BIT};
                5'd29:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI25,ACK,DATAI25,ACK,STOP_BIT};
                5'd30:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI26,ACK,DATAI26,ACK,STOP_BIT};
				default: SDA_BUFFER <=28'dx;
			endcase
			cycle_count<=cycle_count+1;
		end
		else if (c_state==WAIT && ~Pixel_clk_greater_than_65Mhz )begin
			case(write_count)
				5'd0: SDA_BUFFER <= {SLAVE_ADDR,WRITE,ACK,REG_ADDR1,ACK,DATA1,ACK,STOP_BIT};
				5'd1: SDA_BUFFER <= {SLAVE_ADDR,WRITE,ACK,REG_ADDR2,ACK,DATA2b,ACK,STOP_BIT};
				5'd2: SDA_BUFFER <= {SLAVE_ADDR,WRITE,ACK,REG_ADDR3,ACK,DATA3b,ACK,STOP_BIT};
				5'd3: SDA_BUFFER <= {SLAVE_ADDR,WRITE,ACK,REG_ADDR4,ACK,DATA4b,ACK,STOP_BIT};
                5'd4: SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI0,ACK,DATAI0,ACK,STOP_BIT};
                5'd5: SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI1,ACK,DATAI1,ACK,STOP_BIT};
                5'd6: SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI2,ACK,DATAI2,ACK,STOP_BIT};
                5'd7: SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI3,ACK,DATAI3,ACK,STOP_BIT};
                5'd8: SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI4,ACK,DATAI4,ACK,STOP_BIT};
                5'd9: SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI5,ACK,DATAI5,ACK,STOP_BIT};
                5'd10:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI6,ACK,DATAI6,ACK,STOP_BIT};
                5'd11:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI7,ACK,DATAI7,ACK,STOP_BIT};
                5'd12:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI8,ACK,DATAI8,ACK,STOP_BIT};
                5'd13:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI9,ACK,DATAI9,ACK,STOP_BIT};
                5'd14:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI10,ACK,DATAI10,ACK,STOP_BIT};
                5'd15:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI11,ACK,DATAI11,ACK,STOP_BIT};
                5'd16:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI12,ACK,DATAI12,ACK,STOP_BIT};
                5'd17:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI13,ACK,DATAI13,ACK,STOP_BIT};
                5'd18:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI14,ACK,DATAI14,ACK,STOP_BIT};
                5'd19:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI15,ACK,DATAI15,ACK,STOP_BIT};
                5'd20:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI16,ACK,DATAI16,ACK,STOP_BIT};
                5'd21:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI17,ACK,DATAI17,ACK,STOP_BIT};
                5'd22:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI18,ACK,DATAI18,ACK,STOP_BIT};
                5'd23:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI19,ACK,DATAI19,ACK,STOP_BIT};
                5'd24:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI20,ACK,DATAI20,ACK,STOP_BIT};
                5'd25:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI21,ACK,DATAI21,ACK,STOP_BIT};
                5'd26:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI22,ACK,DATAI22,ACK,STOP_BIT};
                5'd27:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI23,ACK,DATAI23,ACK,STOP_BIT};
                5'd28:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI24,ACK,DATAI24,ACK,STOP_BIT};
                5'd29:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI25,ACK,DATAI25,ACK,STOP_BIT};
                5'd30:SDA_BUFFER <= {SLAVE_ADDRI,WRITE,ACK,REG_ADDRI26,ACK,DATAI26,ACK,STOP_BIT};
				default: SDA_BUFFER <=28'dx;
			endcase
			cycle_count<=cycle_count+1;
		end
		else
			cycle_count<=cycle_count+1;
	end

	always @ (posedge Clk) begin
		if(Reset)
			write_count<=3'd0;
		else if (c_state==WAIT && cycle_count==TRANSITION_CYCLE)
			write_count<=write_count+1;
	end
  
	always @ (posedge Clk) begin
		if(Reset)
			Done<=1'b0;
		else if (c_state==IDLE)
			Done<=1'b1;
	end
           
	always @ (posedge Clk) begin
		if(Reset||(c_state==WAIT))
			bit_count<=0;
		else if ( c_state==CLK_RISE && cycle_count==TRANSITION_CYCLE)
			bit_count<=bit_count+1;
	end

	always @ (posedge Clk) begin
		if(Reset)
			c_state<=INIT;
		else
			c_state<=n_state;
	end

	assign transition = (cycle_count==TRANSITION_CYCLE);
              
	//Next state
	always @ (*) begin
		case(c_state)
			IDLE: begin
				if(Reset) n_state = INIT;
				else n_state = IDLE;
			end
			INIT: begin
				if (transition) n_state = START;
				else n_state = INIT;
			end
			START: begin
				if(Reset) n_state = INIT;
				else if( transition) n_state = CLK_FALL;
				else n_state = START;
			end
			CLK_FALL: begin
				if(Reset) n_state = INIT;
				else if( transition) n_state = SETUP;
				else n_state = CLK_FALL;
			end
			SETUP: begin
				if(Reset) n_state = INIT;
				else if( transition) n_state = CLK_RISE;
				else n_state = SETUP;
			end
			CLK_RISE: begin
				if(Reset) n_state = INIT;
				else if( transition && bit_count==SDA_BUFFER_MSB)
					n_state = WAIT;
				else if (transition ) n_state = CLK_FALL;
				else n_state = CLK_RISE;
			end
			WAIT: begin
				if(Reset|(transition && write_count!=BYTE_NUM))
					n_state = INIT;
				else if (transition ) n_state = IDLE;
				else n_state = WAIT;
			end
			default: n_state = IDLE;
		endcase
	end

endmodule
