// This program was cloned from: https://github.com/habibagamal/SoC_Automation
// License: GNU General Public License v2.0

/* **************************************************************** */
/* AHB XIP from Quad I/O SI flash                                   */
/* This module is designed for Microchip SST26VF064B Flash memory   */
/* No flash programing; only fetching instructions is supported     */
/* It has a dirct-mapped cache with 32 lines x 16 bytes each. Basic	*/
/* testing showed a speed up of 4x over not using the cache (CM0).	*/
/* The module assumes that the flash memory is configured for Quad  */
/* I/O operation during programming									*/
/*                                                                  */
/* Important Note:  The controller assumes that the flash occupies  */
/*                  the first 16MB of the address space only        */
/*                                                                  */
/* To do:															*/
/*	+ Parameterize the cache								        */
/*  + Testing!                                                      */
/* **************************************************************** */
/* Author: M. Shalan                                                */
/* **************************************************************** */

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
	output  reg     [3:0]   fdo,
	output  reg     [3:0]   fdoe,
	output  wire            fsclk,
	output  reg             fcen,

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

    // The cache - 32 lines x 16 bytes
	// 16MB Program memory ==> 24-bit address
	// Offset:4, Index:5, Tag:15
    parameter   no_of_lines         = 32;
    parameter   line_size_bytes     = 8;
    parameter   address_size_bits   = 32;
    localparam  line_size_bits      = line_size_bytes*16;
    localparam  off_size            = $clog2(line_size_bytes);
    localparam  index_size          = $clog2(no_of_lines);
    localparam  tag_size            = address_size_bits - off_size - index_size;
    localparam  off_start           = 0;
    localparam  off_end             = off_size - 1;
    localparam  index_start         = off_end + 1;
    localparam  index_end           = index_start + index_size - 1;
    localparam  tag_start           = index_end + 1;
    localparam  tag_end             = tag_start + tag_size - 1;
    localparam  data_counter_end    = (line_size_bytes==8) ? 33 : 49; 


	reg [1:0]   state;                              // Controller Status
	reg [7:0]   counter;                            // Cycle Counter
	reg         pending_flag;                       // A request is pending
	reg [31:0]  fData0, fData1, fData2, fData3;     // Data to be written to the flash
    reg [line_size_bits-1: 0]   fData;

	reg         clken;                              // Flash clock enable
	wire        clken_run, clken_init, clken_mux;   // clk enable from init and run controllers + mux
	wire        fcen_run, fcen_init, fcen_mux;      // Flash chip enable from init and run controllers + mux
	wire [3:0]  fdo_run, fdo_init, fdo_mux;         // Flash data out (to flash) from init and run controllers + mux
	wire [3:0]  fdoe_run, fdoe_init, fdoe_mux;      // Flash out enable from init and run controllers + mux

	wire        RegWE = HSEL & HREADY;
	wire        transfer = RegWE & HTRANS[1];

	reg [31:0] APhase_HADDR;

	
    
	reg [line_size_bits-1:0]    CD [no_of_lines-1:0];
	reg [tag_size-1      :0]	CT [no_of_lines-1:0];
	reg [no_of_lines-1   :0]	CV;

	wire [tag_size-1    :0]	    tag 	= APhase_HADDR[tag_end : tag_start];
	wire [index_size-1  :0]	    indx	= APhase_HADDR[index_end : index_start];
	wire [off_size-1    :0]	    offset	= APhase_HADDR[off_end : off_start];

	wire 		hit 	    = CV[HADDR[index_end:index_start]] & (CT[HADDR[index_end:index_start]]==HADDR[tag_end:tag_start]);
	wire 		APhase_hit  = CV[indx] & (CT[indx]==tag);

	always @(posedge HCLK or negedge HRESETn)
	begin
		if(!HRESETn)
		begin
			CV <= {no_of_lines{1'b0}}; //no_of_lines'h0;
		end
		else if(counter == 8'd33)
		begin
			CV[indx] <= 1'b1;
			CT[indx] <= tag;
			//CD[indx] <= {fData1, fData0};
            CD[indx] <= fData;
			//$display("Write to the Cache @ index:%X Tag:%X Address:%X", indx, tag, APhase_HADDR);
		end
	end

	always @(posedge HCLK or negedge HRESETn)
	begin
		if(!HRESETn)
		begin
			APhase_HADDR <= 32'h0;
		end
		else if(RegWE) // transfer
		begin
			APhase_HADDR <= HADDR;
			//if(hit) $display("Hit!");
		end
	end

	wire[23:0]  fAddr = {APhase_HADDR[23:3],3'd0};

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
		  HREADYOUT = 0;
		  if(hit & HTRANS[1])
		  	  HREADYOUT <= 1'b1;	
		  //else if( transfer )
		  //	  HREADYOUT <= 1'b0;
		  else if((state == `S_RUN) && (counter == data_counter_end)) //25
		  	  HREADYOUT <= 1'b1;
		  else if (HSEL & HREADY & ~HTRANS[1])
		  	  HREADYOUT <= 1'b1;
		  //else if(!hit)
		  //	  HREADYOUT <= 1'b0;
	  end

	//wire hrdy = HSEL & HREADY & ~HTRANS[1];
	wire [line_size_bits-1:0] line = CD[indx];

    // supports only 2 line sizes: 16 and 32 bytes
    generate
        if(line_size_bytes == 8)
	        assign HRDATA = APhase_hit ?    (offset[2] ? line[63:32] : line[31:0]) : 
								            //(offset[2] ? fData0 : fData0);
                                            (offset[2] ? fData[63:32] : fData[31:0]);
        else
            assign HRDATA = APhase_hit ?    ((offset[3:2]==2'h0) ? line[31:0] : (offset[3:2]==2'h1) ? line[63:32] : (offset[3:2]==2'h2) ? line[95:64] : line[127:96]) :
								            ((offset[3:2]==2'h0) ? fData[31:0] : (offset[3:2]==2'h1) ? fData[63:32] : (offset[3:2]==2'h2) ? fData[95:64] : fData[127:96]);
    endgenerate
	always @ (negedge HCLK or negedge HRESETn)
		if(!HRESETn) begin
			fdo 	<= 	4'hf;
			fdoe 	<= 	4'h0;
			clken 	<= 	1'b0;
			fcen 	<= 	1'b1;
		end else begin
			fdo 	<= 	fdo_mux;
			fdoe 	<= 	fdoe_mux;
			clken 	<= 	clken_mux;
			fcen 	<= 	fcen_mux;
		end

	assign  fsclk   =   clken & HCLK;

	// Flash controller FSM
	reg [1:0] next_state;
	always @*
	   case (state)
		   `S_RESET:   next_state = `S_INIT;
		   `S_INIT :   if(counter == 8'd58) //66
						 next_state = `S_RDY;
						else
						  next_state = `S_INIT;
								  
		   `S_RDY  :   if((transfer & ~hit)| pending_flag)
						 next_state = `S_RUN;
					   else
						 next_state = `S_RDY;

		   `S_RUN  :   if(counter == data_counter_end) //25
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
			`S_RESET:   next_count = 8'd36; //0
			`S_RDY  :   next_count = 8'd4; //3
			`S_RUN  :   next_count = counter + 1'b1;
			default :   next_count = 8'd0;
		endcase

	always @(negedge HCLK or negedge HRESETn)
		if(!HRESETn)
			counter <= 8'd36; //0
		else
			counter <= next_count;


	QSIXIP_INIT init_unit (
					.counter(counter),
					.fdo(fdo_init),
					.fdoe(fdoe_init),
					.fcen(fcen_init),
					.clken(clken_init)
				);
generate
if(line_size_bytes==8)
	QSIXIP_RUN_8 run_unit (
					.counter(counter),
					.fAddr(fAddr[23:0]),
					.fdo(fdo_run),
					.fdoe(fdoe_run),
					.fcen(fcen_run),
					.clken(clken_run)
				);
else
    QSIXIP_RUN_16 run_unit (
					.counter(counter),
					.fAddr(fAddr[23:0]),
					.fdo(fdo_run),
					.fdoe(fdoe_run),
					.fcen(fcen_run),
					.clken(clken_run)
				);
endgenerate
	assign  fdo_mux     =   (state == `S_INIT)  ?   fdo_init    :
							(state == `S_RUN)   ?   fdo_run     :   4'b1111 ;

	assign  fdoe_mux    =   (state == `S_INIT)  ?   fdoe_init    :
							(state == `S_RUN)   ?   fdoe_run     :   4'b1101 ;

	assign  clken_mux   =   (state == `S_INIT)  ?   clken_init    :
							(state == `S_RUN)   ?   clken_run     :   1'b0 ;

	assign  fcen_mux    =   (state == `S_INIT)  ?   fcen_init    :
							(state == `S_RUN)   ?   fcen_run     :   1'b1 ;

	always @ (negedge HCLK or negedge HRESETn) // posedge HCLK ???? check!
		if(!HRESETn)   begin
			//fData0 <= 32'd0;
			//fData1 <= 32'd0;
            fData <= {line_size_bits{1'b0}};
		end
		else
			if(state == `S_RUN)
				case(counter)
                /*
					8'd17:   fData0[7:4] 	<= fdi;
					8'd18:   fData0[3:0] 	<= fdi;
					8'd19:   fData0[15:12] 	<= fdi;
					8'd20:   fData0[11:8] 	<= fdi;
					8'd21:   fData0[23:20] 	<= fdi;
					8'd22:   fData0[19:16] 	<= fdi;
					8'd23:   fData0[31:28] 	<= fdi;
					8'd24:   fData0[27:24] 	<= fdi;

					8'd25:   fData1[7:4] 	<= fdi;
					8'd26:   fData1[3:0] 	<= fdi;
					8'd27:   fData1[15:12] 	<= fdi;
					8'd28:   fData1[11:8] 	<= fdi;
					8'd29:   fData1[23:20] 	<= fdi;
					8'd30:   fData1[19:16] 	<= fdi;
					8'd31:   fData1[31:28] 	<= fdi;
					8'd32:   fData1[27:24] 	<= fdi;
                */
                    8'd17:   fData[7:4] 	<= fdi;
					8'd18:   fData[3:0] 	<= fdi;
					8'd19:   fData[15:12] 	<= fdi;
					8'd20:   fData[11:8] 	<= fdi;
					8'd21:   fData[23:20] 	<= fdi;
					8'd22:   fData[19:16] 	<= fdi;
					8'd23:   fData[31:28] 	<= fdi;
					8'd24:   fData[27:24] 	<= fdi;

					8'd25:   fData[39:36] 	<= fdi;
					8'd26:   fData[35:32] 	<= fdi;
					8'd27:   fData[47:44] 	<= fdi;
					8'd28:   fData[43:40] 	<= fdi;
					8'd29:   fData[55:52] 	<= fdi;
					8'd30:   fData[51:48] 	<= fdi;
					8'd31:   fData[63:60] 	<= fdi;
					8'd32:   fData[59:56] 	<= fdi;

                    8'd33:   fData[7+64:4+64] 	    <= fdi;
					8'd34:   fData[3+64:0+64] 	    <= fdi;
					8'd35:   fData[15+64:12+64] 	<= fdi;
					8'd36:   fData[11+64:8+64] 	    <= fdi;
					8'd37:   fData[23+64:20+64] 	<= fdi;
					8'd38:   fData[19+64:16+64] 	<= fdi;
					8'd39:   fData[31+64:28+64] 	<= fdi;
					8'd40:   fData[27+64:24+64] 	<= fdi;

					8'd41:   fData[39+64:36+64] 	<= fdi;
					8'd42:   fData[35+64:32+64] 	<= fdi;
					8'd43:   fData[47+64:44+64] 	<= fdi;
					8'd44:   fData[43+64:40+64] 	<= fdi;
					8'd45:   fData[55+64:52+64] 	<= fdi;
					8'd46:   fData[51+64:48+64] 	<= fdi;
					8'd47:   fData[63+64:60+64] 	<= fdi;
					8'd48:   fData[59+64:56+64] 	<= fdi;
				endcase		
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
			
			8'd36   :   {fcen, clken, fdoe, fdo} = {1'b1, 1'b0, 4'b1101, 4'b1110};
			
			8'd37   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b0, 4'b1101, 4'b1111};
			
			// CMD: EB
			8'd38   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1111};
			8'd39   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1111};
			8'd40   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1111};
			8'd41   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd42   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1111};
			8'd43   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1110};
			8'd44   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1111};
			8'd45   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1101, 4'b1111};
			// Address 0 and A5 pattern
			8'd46   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, 4'h0};
			8'd47   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, 4'h0};
			8'd48   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, 4'h0};
			8'd49   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, 4'h0};
			8'd50   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, 4'h0};
			8'd51   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, 4'h0};
			8'd52   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, 4'hA};
			8'd53   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, 4'h5};
			// Dummy Bytes (2)
			8'd54   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd55   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd56   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b1010};
			8'd57   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0101};
			
			8'd58   :   {fcen, clken, fdoe, fdo} = {1'b1, 1'b0, 4'b1101, 4'b1110}; // 66

			default :   {fcen, clken, fdoe, fdo} = {1'b1, 1'b0, 4'b1101, 4'b1111};
		endcase
endmodule

module QSIXIP_RUN_8(
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

			// Address
			8'd4   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, fAddr[23:20]};
			8'd5   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, fAddr[19:16]};
			8'd6   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, fAddr[15:12]};
			8'd7   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, fAddr[11:8]};
			8'd8   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, fAddr[7:4]};
			8'd9   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, fAddr[3:0]};
			8'd10   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, 4'hA};
			8'd11   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, 4'h5};
			// dummy
			8'd12   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd13   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd14   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b1010};
			8'd15   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0101};

			// data (8 bytes to be used with the cache) -- Todo: clear the fdo nibbles
			8'd16   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd17   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd18   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b1010};
			8'd19   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0101};
			8'd20   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd21   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd22   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b1010};
			8'd23   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0101};

			8'd24   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd25   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd26   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b1010};
			8'd27   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0101};
			8'd28   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd29   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd30   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b1010};
			8'd31   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0101};

			8'd32   :   {fcen, clken, fdoe, fdo} = {1'b1, 1'b0, 4'b1101, 4'b1110};

			default :   {fcen, clken, fdoe, fdo} = {1'b1, 1'b0, 4'b1101, 4'b1111};
		endcase
endmodule
module QSIXIP_RUN_16(
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

			// Address
			8'd4   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, fAddr[23:20]};
			8'd5   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, fAddr[19:16]};
			8'd6   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, fAddr[15:12]};
			8'd7   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, fAddr[11:8]};
			8'd8   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, fAddr[7:4]};
			8'd9   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, fAddr[3:0]};
			8'd10   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, 4'hA};
			8'd11   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b1111, 4'h5};
			// dummy
			8'd12   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd13   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd14   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b1010};
			8'd15   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0101};
			// data (16 bytes to be used with the cache) -- Todo: clear the fdo nibbles 
			8'd16   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd17   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd18   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b1010};
			8'd19   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0101};
			8'd20   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd21   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd22   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b1010};
			8'd23   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0101};

			8'd24   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd25   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd26   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b1010};
			8'd27   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0101};
			8'd28   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd29   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd30   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b1010};
			8'd31   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0101};

            8'd32   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd33   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd34   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b1010};
			8'd35   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0101};
			8'd36   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd37   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd38   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b1010};
			8'd39   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0101};

            8'd40   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd41   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd42   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b1010};
			8'd43   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0101};
			8'd44   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd45   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0000};
			8'd46   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b1010};
			8'd47   :   {fcen, clken, fdoe, fdo} = {1'b0, 1'b1, 4'b0000, 4'b0101};

			8'd48   :   {fcen, clken, fdoe, fdo} = {1'b1, 1'b0, 4'b1101, 4'b1110};

			default :   {fcen, clken, fdoe, fdo} = {1'b1, 1'b0, 4'b1101, 4'b1111};
		endcase
endmodule