`timescale 1ns / 1ps

module autoconfig_zii(
	input C7M,
	input CFGIN_n,
	input JP2,
	input JP4,
	input AS_CPU_n,
	input RESET_n,
	input DS_n,
	input RW_n,
	input [23:16] A_HIGH,
	input [6:1] A_LOW,
	inout [15:12] D,
	output reg [7:5] BASE_RAM,
	output reg [7:0] BASE_IDE,
	output RAM_CONFIGURED_n,
	output IDE_CONFIGURED_n,
	output CFGOUT_n
);

localparam RAM_CARD		= 1'b0;
localparam IDE_CARD		= 1'b1;

localparam CONFIGURING_RAM 	= 2'b11;
localparam CONFIGURING_IDE 	= 2'b10;

localparam [15:0] MFG_ID   	= 16'h082C;	// 2092   - BSC
localparam [7:0]  RAM_PROD_ID	= 8'd8;  	// 2092/8 - Oktagon 2008, BSC Memory Master (8M)
localparam [7:0]  IDE_PROD_ID	= 8'd6;  	// 2092/6 - Oktagon 2008, BSC I/O device / A1K.org Community IDE Controller by Matze (64K)
localparam [15:0] SERIAL   	= 16'd0;

/*
SysInfo reports it as a BSC Oktagon 2008 Z2 memory and a BSC Oktagon I/O device.
scsi.device v109.3 or oktagon.device v6.10, selectable via jumper.
*/

reg [3:0] data_out = 4'hF;
reg [1:0] config_out_n = 2'b11;
reg [1:0] configured_n = 2'b11;
reg [1:0] shutup_n = 2'b11;

wire autoconfig_access = !CFGIN_n && CFGOUT_n && (A_HIGH == 8'hE8) && !AS_CPU_n;

assign RAM_CONFIGURED_n = configured_n[RAM_CARD];
assign IDE_CONFIGURED_n = configured_n[IDE_CARD];
assign CFGOUT_n = |config_out_n;
assign D = autoconfig_access && RW_n && !DS_n ? data_out : 4'bZ;

always @(negedge RESET_n or posedge AS_CPU_n) begin

	if (!RESET_n) begin
	
		config_out_n <= 2'b11;
		
	end else begin
	
		config_out_n <= configured_n & shutup_n;
		
	end
end

always @(negedge RESET_n or posedge C7M) begin

	if (!RESET_n) begin

		configured_n <= 2'b11;
		shutup_n <= 2'b11;
		data_out <= 4'bZ;

	end else begin
	
		if(autoconfig_access && !DS_n) begin
		
			if (RW_n) begin
				
				// AutoConfig Read sequence. Here is where we publish the RAM and I/O port size and hardware attributes.
				
				// All nibbles except 00,02,40 and 42 must be inverted
				
				case (A_LOW)
				
					6'h00: begin
						if (config_out_n == CONFIGURING_RAM) data_out <= 4'b1110;	// (00) 1110 Link into memory free list
						if (config_out_n == CONFIGURING_IDE) data_out <= JP4 ? 4'b1101 : 4'b1100;	// (00) 1101 Optional ROM vector valid
					end
					6'h01: begin
						if (config_out_n == CONFIGURING_RAM) data_out <= JP2 ? 4'b0000 : 4'b0111;	// (02) 8 or 4 MB RAM
						if (config_out_n == CONFIGURING_IDE) data_out <= 4'b0001;			// (02) 64KB
					end
					6'h02: begin
						if (config_out_n == CONFIGURING_RAM) data_out <= ~RAM_PROD_ID[7:4];	// (04) Product number RAM
						if (config_out_n == CONFIGURING_IDE) data_out <= ~IDE_PROD_ID[7:4];	// (04) Product number IDE
					end
					6'h03: begin
						if (config_out_n == CONFIGURING_RAM) data_out <= ~RAM_PROD_ID[3:0];	// (06) Product number RAM
						if (config_out_n == CONFIGURING_IDE) data_out <= ~IDE_PROD_ID[3:0];	// (06) Product number IDE
					end
					
					6'h04: 	data_out <= ~4'b1100; 		// (08) 1100 Board can be shut up and has preference to be put in 8 Meg space.
					6'h05: 	data_out <= ~4'b0000;		// (0A) 0000 Reserved
					
					6'h08: 	data_out <= ~MFG_ID[15:12]; 	// (10) Manufacturer ID
					6'h09: 	data_out <= ~MFG_ID[11:8];  	// (12) Manufacturer ID
					6'h0A:   data_out <= ~MFG_ID[7:4];   	// (14) Manufacturer ID
					6'h0B:   data_out <= ~MFG_ID[3:0];   	// (16) Manufacturer ID
					
					/*
					6'h0C: 	data_out <= 4'hF;  		// (18) Serial number, byte 0 (msb)
					6'h0D:	data_out <= 4'hF;  		// (1A) ----------"----------
					6'h0E:	data_out <= 4'hF;  		// (1C) Serial number, byte 1
					6'h0F:	data_out <= 4'hF;  		// (1E) ----------"----------
					*/
					
					6'h10:	data_out <= ~SERIAL[15:12]; 	// (20) Serial number, byte 2
					6'h11:	data_out <= ~SERIAL[11:8];  	// (22) ----------"----------
					6'h12:	data_out <= ~SERIAL[7:4];   	// (24) Serial number, byte 3 (lsb)
					6'h13:	data_out <= ~SERIAL[3:0];   	// (26) ----------"----------
										
					/*
					//Optional ROM vector, these two bytes are the offset from the board's base address
					6'h14: if (config_out_n == CONFIGURING_IDE) data_out <= ~4'b0000;	//	(28) ROM vector high byte high nybble
					6'h15: if (config_out_n == CONFIGURING_IDE) data_out <= ~4'b0000;	//	(2A) ROM vector high byte low nybble
					6'h16: if (config_out_n == CONFIGURING_IDE) data_out <= ~4'b0000;	//	(2C) ROM vector low byte high nybble
					*/
					6'h17: if (config_out_n == CONFIGURING_IDE) data_out <= ~4'b0001;	//	(2E) Rom vector low byte low nybble
					
					6'h20:	data_out <= 4'd0;		// (40) Because this card does not generate INT's
					6'h21:	data_out <= 4'd0;		// (42) Because this card does not generate INT's
					
					default: data_out <= 4'hF;
					
				endcase
				
			end else begin
				
				// AutoConfig Write sequence. Here is where we receive from the OS the base address for the RAM.
				
				case (A_LOW)
				
					6'h24: begin	// Written Second (48)
						if (config_out_n == CONFIGURING_RAM) begin 
							BASE_RAM[7:5] <= D[15:13];			//A23,A22,A21 is sufficient as base. (2 MB chunks)
							configured_n[RAM_CARD] <= 1'b0;
						end
						if (config_out_n == CONFIGURING_IDE) begin 
							BASE_IDE[7:4] <= D[15:12];
							configured_n[IDE_CARD] <= 1'b0;
						end
					end
					6'h25: begin	// Written first (4A)
						//if (config_out_n == CONFIGURING_RAM) BASE_RAM[3:0] <= D[15:12];
						if (config_out_n == CONFIGURING_IDE) BASE_IDE[3:0] <= D[15:12];
					end
					6'h26: begin	// (4C) "Shut up" address, if KS decides to not configure a specific device
						if (config_out_n == CONFIGURING_RAM) shutup_n[RAM_CARD] <= 1'b0;
						if (config_out_n == CONFIGURING_IDE) shutup_n[IDE_CARD] <= 1'b0;
					end
					
				endcase
				
			end
		end
	end
end




endmodule
