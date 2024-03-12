`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////
// Company: 		Gpixel
// Engineer: 		Hongliang.An
// Create Date:	09/04/2014 
// Module Name: 	iserdes_1_to_6_data_diff
// Project Name: 	
// Target Devices:Spartan-6 xc6slx150-3fg900
// Tool versions: ISE13.1
// Function:		1-bit generic 1:6 data receiver module with differential
//						inputs. Includes state machine to control CAL and the
//						phase detector. Data is reveived MSB first.
// Interface:
// Dependencies:
// Revision:
//		V1.0 - First created
//////////////////////////////////////////////////////////////////////////
module iserdes_1_to_6_data_diff(
	gclk, rxioclk, reset,
	rxserdesstrobe,
	bitslip,
	datain_p, datain_n,
	data_out,
	align_en
	);

	// CLOCK & RESET
	input				gclk;						// global clock to sample parallel data
	input				rxioclk;					// io clock to sample serial data, sdr clock
	input				reset;					// reset and high is valid
	input				rxserdesstrobe;		// strobe for receiver
	
	// CMD
	input				bitslip;					// bitslip for word alignment
	
	// DATA
	input				datain_p;				// differential data inputs
	input				datain_n;
	
	output [5:0]	data_out;				// parallel data outputs
	
	input				align_en;

	// SIGNALS
	wire				rx_datain;				// IBUFDS
	
	parameter		SIM_TAP_DELAY = 49;	// IODELAY
	wire				ddly_m;
	wire				ddly_s;
	reg				cal_data_master;
	reg				cal_data_slave;
	reg				inc_data;
	reg				ce_data;
	reg				rst_data;
	wire				busys;
	
	wire				pd_edge;					// ISER2DES
	wire [5:0]		mdataout;
	wire				valid_data;
	wire				incdec_data;
	wire				cascade;
	
	reg [3:0]		state;					// STATE MACHINE
	reg [8:0]		counter;
	reg				enable;
	reg [4:0]		pdcounter;
	
	// IBUFDS
	IBUFDS #(
		.DIFF_TERM	("TRUE")
	)
	data_in (
		.I				(datain_p),
		.IB			(datain_n),
		.O				(rx_datain)
	);

	// IODELAY
	IODELAY2 #(
		.DATA_RATE          ("SDR"),
		.IDELAY_VALUE       (0),
		.IDELAY2_VALUE      (0),
		.IDELAY_MODE        ("NORMAL" ),
		.ODELAY_VALUE       (0),
		.IDELAY_TYPE        ("DIFF_PHASE_DETECTOR"),
		.COUNTER_WRAPAROUND ("WRAPAROUND" ),
		.DELAY_SRC          ("IDATAIN" ),
		.SERDES_MODE        ("MASTER"),
		.SIM_TAPDELAY_VALUE (SIM_TAP_DELAY)
	)
	iodelay_m (
		.IDATAIN        (rx_datain),
		.TOUT           (),
		.DOUT           (),
		.T              (1'b1),
		.ODATAIN        (1'b0),
		.DATAOUT        (ddly_m),
		.DATAOUT2       (),
		.IOCLK0         (rxioclk),
		.IOCLK1         (1'b0),
		.CLK            (gclk),
		.CAL            (cal_data_master),
		.INC            (inc_data),
		.CE             (ce_data),
		.RST            (rst_data),
		.BUSY           ()
	) ;
	 
	IODELAY2 #(
		.DATA_RATE          ("SDR"),
		.IDELAY_VALUE       (0),
		.IDELAY2_VALUE      (0),
		.IDELAY_MODE        ("NORMAL" ),
		.ODELAY_VALUE       (0),
		.IDELAY_TYPE        ("DIFF_PHASE_DETECTOR"),
		.COUNTER_WRAPAROUND ("WRAPAROUND" ),
		.DELAY_SRC          ("IDATAIN" ),
		.SERDES_MODE        ("SLAVE"),
		.SIM_TAPDELAY_VALUE (SIM_TAP_DELAY)
	)    //
	iodelay_s (
		.IDATAIN        (rx_datain),
		.TOUT           (),
		.DOUT           (),
		.T              (1'b1),
		.ODATAIN        (1'b0),
		.DATAOUT        (ddly_s),
		.DATAOUT2       (),
		.IOCLK0         (rxioclk),
		.IOCLK1         (1'b0),
		.CLK            (gclk),
		.CAL            (cal_data_slave),
		.INC            (inc_data),
		.CE             (ce_data),
		.RST            (rst_data),
		.BUSY           (busys)
	);
	
	// ISER2DES_1_TO_6
	ISERDES2 #(
		.DATA_WIDTH         (6),          
		.DATA_RATE          ("SDR"),      
		.BITSLIP_ENABLE     ("TRUE"),     
		.SERDES_MODE        ("MASTER"),   
		.INTERFACE_TYPE     ("RETIMED")
	)  
	iserdes_m (
		.D              (ddly_m),
		.CE0            (1'b1),
		.CLK0           (rxioclk),
		.CLK1           (1'b0),
		.IOCE           (rxserdesstrobe),
		.RST            (reset),
		.CLKDIV         (gclk),
		.SHIFTIN        (pd_edge),
		.BITSLIP        (bitslip),
		.FABRICOUT      (),
		.Q4             (mdataout[0]),
		.Q3             (mdataout[1]),
		.Q2             (mdataout[2]),
		.Q1             (mdataout[3]),
		.DFB            (),
		.CFB0           (),
		.CFB1           (),
		.VALID          (valid_data),
		.INCDEC         (incdec_data),
		.SHIFTOUT       (cascade)
	);

	ISERDES2 #(
		.DATA_WIDTH         (6),            
		.DATA_RATE          ("SDR"),        
		.BITSLIP_ENABLE     ("TRUE"),       
		.SERDES_MODE        ("SLAVE"),      
		.INTERFACE_TYPE     ("RETIMED"))    
	iserdes_s (
		.D              (ddly_s),
		.CE0            (1'b1),
		.CLK0           (rxioclk),
		.CLK1           (1'b0),
		.IOCE           (rxserdesstrobe),
		.RST            (reset),
		.CLKDIV         (gclk),
		.SHIFTIN        (cascade),
		.BITSLIP        (bitslip),
		.FABRICOUT      (),
		.Q4             (mdataout[4]),
		.Q3             (mdataout[5]),
		.Q2             (),
		.Q1             (),
		.DFB            (),
		.CFB0           (),
		.CFB1           (),
		.VALID          (),
		.INCDEC         (),
		.SHIFTOUT       (pd_edge)
	);	
	 
	assign	data_out = mdataout;
	// CAL STATE MACHINE
	always @(posedge gclk) begin
		if (reset == 1'b1) begin
			state					<= 4'd0;
			counter				<= 9'd0;
			enable				<= 1'b0;
			
			cal_data_master	<= 1'b0;
			cal_data_slave		<= 1'b0;
			rst_data				<= 1'b0;
		end
		else begin
			counter				<= counter + 9'd1;
			if (counter[8] == 1'b1) begin
				counter			<= 9'd0;
			end
			if (counter[5] == 1'b1) begin
				enable			<= 1'b1;
			end
			
			case (state)
				4'd0:		begin
								if (enable == 1'b1) begin					// start CAL after external reset
									cal_data_master	<= 1'b0;
									cal_data_slave		<= 1'b0;
									rst_data				<= 1'b0;
									
									if (busys == 1'b0) begin
										state				<= 4'd1;
									end
								end
							end
				4'd1:		begin													// issue CAL command to both master and slave iodelay2
								cal_data_master		<= 1'b1;
								cal_data_slave			<= 1'b1;
								
								if (busys == 1'b1) begin					// wait for command to be accepted
									state					<= 4'd2;
								end
							end
				4'd2:		begin
								cal_data_master		<= 1'b0;
								cal_data_slave			<= 1'b0;
								
								if (busys == 1'b0) begin					// wait finish the CAL and load CAL result, which uses the rst_data
									state					<= 4'd3;
									rst_data				<= 1'b1;
								end
							end
				4'd3:		begin
								rst_data					<= 1'b0;
								
								if (busys == 1'b0) begin
									state					<= 4'd4;
								end
							end
				4'd4:		begin
								if (counter[8] == 1'b1) begin				// wait for occasional enable
									state					<= 4'd5;
								end
							end
				4'd5:		begin
								if (busys == 1'b0) begin					// issue CAL command to slave iodelay
									cal_data_slave		<= 1'b1;
									state					<= 4'd6;
								end
							end
				4'd6:		begin
								if (busys == 1'b1) begin
									cal_data_slave		<= 1'b0;
									state					<= 4'd7;
								end
							end
				4'd7:		begin
								cal_data_slave			<= 1'b0;				// wait for CAL command finished
								if (busys == 1'b0) begin
									state					<= 4'd4;
								end
							end
			endcase
		end
	end
	

	// PHASE DETECTOR MACHINE
	always @(posedge gclk)begin
		if (reset == 1'b1) begin
			pdcounter	<= 5'b10000;
			ce_data		<= 1'b0;
			inc_data		<= 1'b0;
		end
		else begin
			if (align_en == 1'b1) begin
				if ((state != 4'd4) || (busys == 1'b1)) begin
					pdcounter		<= 5'b10000;
					ce_data			<= 1'b0;
				end
				else if (pdcounter == 5'b11111) begin
					pdcounter		<= 5'b10000;
					ce_data			<= 1'b1;
					inc_data			<= 1'b1;
				end
				else if (pdcounter == 5'b00000) begin
					pdcounter		<= 5'b10000;
					ce_data			<= 1'b1;
					inc_data			<= 1'b0;
				end
				else if (valid_data == 1'b1) begin
					ce_data			<= 1'b0;
					
					if (incdec_data == 1'b1 && pdcounter != 5'b11111) begin
						pdcounter	<= pdcounter + 5'd1;
					end
					if (incdec_data == 1'b0 && pdcounter != 5'b00000) begin
						pdcounter	<= pdcounter - 5'd1;
					end
				end
				else begin
					ce_data			<= 1'b0;
					inc_data			<= 1'b0;
				end
			end
			else begin
				pdcounter	<= 5'b10000;
				ce_data		<= 1'b0;
				inc_data		<= 1'b0;
			end
		end
	end
	
endmodule
