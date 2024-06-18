// This program was cloned from: https://github.com/habibagamal/SoC_Automation
// License: GNU General Public License v2.0

/* AHB XIP from QSI flash                                           */
/* This module is designed for Microchip SST26VF064B Flash memory   */
/* No flash programing. Only fetching instructions is supported     */
/* Author: M. Shalan                                                */
/*
  It must be placed starting from address 8
*/


`define     S_RESET     2'b00
`define     S_INIT      2'b01
`define     S_RDY       2'b10
`define     S_RUN       2'b11


module QSPIXIP(
	// Global Signals
	input   HCLK,
	input   HRESETn,

	// QSPI flash interface
	input   wire    [3:0]   fdi,
	output  reg    [3:0]   fdo,
	output  reg    [3:0]   fdoe,
	output  wire            fsclk,
	output  reg            fcen,

	// AHB-Lite Slave Interface
	input  wire             HSEL,
	input  wire             HREADY,
	input  wire     [1:0]   HTRANS,
	input  wire     [2:0]   HSIZE,
	input  wire             HWRITE,
	input  wire     [31:0]  HADDR,

	output reg              HREADYOUT,
	output wire     [31:0]  HRDATA
);

	reg [1:0]   state;                              // Controller Status
	reg [7:0]   counter;                            // Cycle Counter
	reg         pending_flag;                       // A request is pending
	reg [31:0]  fData;                              // Data to be written to the flash

	reg         clken;                              // Flash clock enable
	wire        clken_run, clken_init, clken_mux;   // clk enable from init and run controllers + mux
	wire        fcen_run, fcen_init, fcen_mux;      // Flash chip enable from init and run controllers + mux
	wire [3:0]  fdo_run, fdo_init, fdo_mux;         // Flash data out (to flash) from init and run controllers + mux
	wire [3:0]  fdoe_run, fdoe_init, fdoe_mux;      // Flash out enable from init and run controllers + mux

	wire        RegWE = HSEL & HREADY;
	wire        transfer = RegWE & HTRANS[1];


	//reg APhase_HSEL;
	//reg APhase_HWRITE;
	//reg [1:0] APhase_HTRANS;
	reg [31:0] APhase_HADDR;
	//reg [2:0] APhase_HSIZE;

	always @(posedge HCLK or negedge HRESETn)
	begin
		if(!HRESETn)
		begin
			APhase_HADDR <= 32'h0;
		end
		else if(transfer)//(RegWE)
		begin
			APhase_HADDR <= HADDR;
		end
	end

	wire[23:0]  fAddr = APhase_HADDR[23:0];

	always @(posedge HCLK or negedge HRESETn)
	if(!HRESETn)
		pending_flag <= 1'b0;
	else
		if( (state == `S_INIT) && (transfer == 1'b1) )
			pending_flag <= 1'b1;
		else if(state == `S_RUN)
			pending_flag <= 1'b0;

	always @(posedge HCLK or negedge HRESETn)
	  if(!HRESETn)
			HREADYOUT <= 1'b1;
	  else begin

		  //if((counter == 8'd66) && (state ==`S_INIT))
		  //		HREADYOUT <= 1'b1;
		  //else 
		  if((state ==`S_INIT) & HTRANS[1]) 
		  		HREADYOUT <= 1'b0;	
		  else if( transfer )
		  	  HREADYOUT <= 1'b0;
		  else if((state == `S_RUN) && (counter == 8'd25))
			  HREADYOUT <= 1'b1;
		  else if (HSEL & HREADY & ~HTRANS[1])
			  HREADYOUT <= 1'b1;
		  else if(state == `S_RDY)
				HREADYOUT <= 1'b0;
	  end


	assign HRDATA = fData;


	always @ (negedge HCLK or negedge HRESETn)
		if(!HRESETn) begin
			fdo <= 4'hf;
			fdoe <= 4'h0;
			clken <= 1'b0;
			fcen <= 1'b0;
		end else begin
			fdo <= fdo_mux;
			fdoe <= fdoe_mux;
			clken <= clken_mux;
			fcen <= fcen_mux;
		end
/*
	always @ (posedge HCLK or negedge HRESETn)
		if(!HRESETn) begin
			//fdo <= 4'hf;
			//fdoe <= 4'h0;
			//clken <= 1'b0;
			fcen <= 1'b0;
		end else begin
			//fdo <= fdo_mux;
			//fdoe <= fdoe_mux;
			//clken <= clken_mux;
			fcen <= fcen_mux;
		end
*/
	assign  fsclk   =   clken & HCLK;

	reg [1:0] next_state;

	always @*
	   case (state)
		   `S_RESET:   next_state = `S_INIT;
		   `S_INIT :   if(counter == 8'd66)
						 next_state = `S_RDY;
						else
						  next_state = `S_INIT;
								  
		   `S_RDY  :   if(transfer | pending_flag)
						 next_state = `S_RUN;
					   else
						 next_state = `S_RDY;

		   `S_RUN  :   if(counter == 8'd25)
						 next_state = `S_RDY;
					   else
						 next_state = `S_RUN;

		   default :   next_state = `S_RESET;
	   endcase

	always @(posedge HCLK or negedge HRESETn)
		if(!HRESETn)
			state <= `S_RESET;
		else
			state <= next_state;


	reg [7:0]   next_count;

	always @*
		case (state)
			`S_INIT :   next_count = counter + 1'b1;
			`S_RESET:   next_count = 8'd0;
			`S_RDY  :   next_count = 8'd3;
			`S_RUN  :   next_count = counter + 1'b1;
			default :   next_count = 8'd0;
		endcase

	always @(negedge HCLK or negedge HRESETn)
		if(!HRESETn)
			counter <= 8'd0;
		else
			counter <= next_count;


	QSIXIP_INIT init_unit (
					.counter(counter),
					.fdo(fdo_init),
					.fdoe(fdoe_init),
					.fcen(fcen_init),
					.clken(clken_init)
				);
	QSIXIP_RUN run_unit (
					.counter(counter),
					.fAddr(fAddr[23:0]),
					.fdo(fdo_run),
					.fdoe(fdoe_run),
					.fcen(fcen_run),
					.clken(clken_run)
				);

	assign  fdo_mux     =   (state == `S_INIT)  ?   fdo_init    :
							(state == `S_RUN)   ?   fdo_run     :   4'b1111 ;

	assign  fdoe_mux    =   (state == `S_INIT)  ?   fdoe_init    :
							(state == `S_RUN)   ?   fdoe_run     :   4'b1101 ;

	assign  clken_mux   =   (state == `S_INIT)  ?   clken_init    :
							(state == `S_RUN)   ?   clken_run     :   1'b0 ;

	assign  fcen_mux    =   (state == `S_INIT)  ?   fcen_init    :
							(state == `S_RUN)   ?   fcen_run     :   1'b1 ;


	always @ (negedge HCLK or negedge HRESETn)
		if(!HRESETn)   fData <= 32'd0;
		else
			if(state == `S_RUN)
				case(counter)
					5'd17:   fData[7:4] <= fdi;
					5'd18:   fData[3:0] <= fdi;
					5'd19:   fData[15:12] <= fdi;
					5'd20:   fData[11:8] <= fdi;
					5'd21:   fData[23:20] <= fdi;
					5'd22:   fData[19:16] <= fdi;
					5'd23:   fData[31:28] <= fdi;
					5'd24:   fData[27:24] <= fdi;
				endcase
			/*
				if(counter[4] & ~counter[3])
					case(counter[2:0])
						3'd0:   fData[7:4] <= fdi;
						3'd1:   fData[3:0] <= fdi;
						3'd2:   fData[15:12] <= fdi;
						3'd3:   fData[11:8] <= fdi;
						3'd4:   fData[23:20] <= fdi;
						3'd5:   fData[19:16] <= fdi;
						3'd6:   fData[31:28] <= fdi;
						3'd7:   fData[27:24] <= fdi;
					endcase
					*/
					
endmodule



module QSIXIP_INIT(
	input   [7:0]   counter,
	output  [3:0]   fdo,
	output  [3:0]   fdoe,
	output          clken,
	output          fcen
);

reg clken;
reg[3:0] fdo, fdoe;
reg fcen;

always @*
		case (counter)
			8'd1    :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b0, 4'b1101, 4'b1111};
			8'd2    :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd3    :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd4    :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd5    :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd6    :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd7    :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1111};
			8'd8    :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1111};
			8'd9    :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd10   :   {fcen, clken, fdoe, fdo} = {1'b1, 1'b0, 4'b1101, 4'b1110};

			8'd11   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b0, 4'b1101, 4'b1111};
			8'd12   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd13   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd14   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd15   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd16   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd17   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd18   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd19   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1111};

			8'd20   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd21   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd22   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd23   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd24   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd25   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd26   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd27   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};

			8'd28   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd29   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd30   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd31   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd32   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1111};
			8'd33   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd34   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1111};
			8'd35   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd36   :   {fcen, clken, fdoe, fdo} = {1'b1, 1'b0, 4'b1101, 4'b1110};

			8'd37   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b0, 4'b1101, 4'b1111};

			8'd38   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1111};
			8'd39   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1111};
			8'd40   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1111};
			8'd41   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd42   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1111};
			8'd43   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd44   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1111};
			8'd45   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1111};

			8'd46   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, 4'b0000};
			8'd47   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, 4'b0000};
			8'd48   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, 4'b0000};
			8'd49   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, 4'b0000};
			8'd50   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, 4'b0000};
			8'd51   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, 4'b0000};
			8'd52   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, 4'b1010};
			8'd53   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, 4'b0101};

			8'd54   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd55   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd56   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b1010};
			8'd57   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0101};

			8'd58   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b1111};
			8'd59   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b1111};
			8'd60   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b1111};
			8'd61   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b1111};
			8'd62   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b1111};
			8'd63   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b1111};
			8'd64   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b1111};
			8'd65   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b1111};

			8'd66   :   {fcen, clken, fdoe, fdo} = {1'b1, 1'b0, 4'b1101, 4'b1110};

			default :   {fcen, clken, fdoe, fdo} = {1'b1, 1'b0, 4'b1101, 4'b1111};
		endcase
endmodule

module QSIXIP_RUN(
	input   [7:0]   counter,
	input   [23:0]  fAddr,
	output  [3:0]   fdo,
	output  [3:0]   fdoe,
	output          clken,
	output          fcen
);

reg clken;
reg[3:0] fdo, fdoe;
reg fcen;

always @*
		case (counter)

			8'd3   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b0, 4'b1101, 4'b1111};

			8'd4   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, fAddr[23:20]};
			8'd5   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, fAddr[19:16]};
			8'd6   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, fAddr[15:12]};
			8'd7   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, fAddr[11:8]};
			8'd8   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, fAddr[7:4]};
			8'd9   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, fAddr[3:0]};
			8'd10   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, 4'hA};
			8'd11   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, 4'h5};

			8'd12   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd13   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd14   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b1010};
			8'd15   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0101};

			8'd16   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd17   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd18   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b1010};
			8'd19   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0101};
			8'd20   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd21   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd22   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b1010};
			8'd23   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0101};

			8'd24   :   {fcen, clken, fdoe, fdo} = {1'b1, 1'b0, 4'b1101, 4'b1110};

			default :   {fcen, clken, fdoe, fdo} = {1'b1, 1'b0, 4'b1101, 4'b1111};
		endcase
endmodule