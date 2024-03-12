/***************************************************
*	Name: 	WM8731 reg map
*	Origin:	171003
*	Author:	Helrori
****************************************************/
module device_init_reg 
(
 //       input 					clk,
        input 			[7:0] addr,
        output  	[15:0]DATA
);
    wire [15:0] rom[10:0];
//    always @(posedge clk) begin
    assign    DATA = rom[addr];
//    end

//---------------------------------------------------------------------------
//									Paratameters 
//---------------------------------------------------------------------------

//Default volume (0dB), disable mute, disable simultaneous loading 
parameter LEFT_LINE_IN 					= 9'b000010111;		//addr (00h)
parameter RIGHT_LINE_IN 				= 9'b000010111; 		//addr (01h)

//Default volume (0dB), No zero cross detection, disable simultaneous loading 
parameter LEFT_HEAD_OUT 				= 9'b000110000;		//addr (02h)
parameter RIGHT_HEAD_OUT 				= 9'b000110000;		//addr (03h)

// analog audio path control 
// bit 0: micboost disabled 
// bit 1: mute mic disabled 
// bit 2: INSEL (1: Mic in 0: Line in) line in selected.
// bit 3: BYPASS disabled 
// bit 4: DACSEL (1: select, 0: Dont select)
// bit 5: SIDETONE disabled 
// bit [7:6] sidetone antenuation 00    	
parameter ANALOGUE_AUDIO_PATH_CONTROL 	= 9'b000010000;		//addr (04h)

// digital audio path control 
// bit 0: ADC High Pass Filter Enable (1: disable 0: enable)
// bit[2:1]: De-emphasis Control 
// 		11 = 48kHz
// 		10 = 44.1 kHz
// 		01 = 32kHz
// 		00 = Disable
// bit3: DAC soft mute (1: enable, 0: disable)
// bit4: Store dc offset when High pass Filter disabled (1: store, 0: clear offset) 
parameter DIGITAL_AUDIO_PATH_CONTROL 	= 9'b000000001;		//addr (05h)

// all power saving features are turned off. 
parameter POWER_DOWN_CONTROL 			= 9'b000000000;		//addr (06h)

// digital audio interface format
// bit[1:0] DSP mode 11
// bit[3:2] data length select 
//		11 = 32 bits 
//		10 = 24 bits
//		01 = 20 bits
//		00 = 16 bits   
// bit [4] select DSP mode A/B 
// 		1: MSB on 2nd BCLK rising edge after DACLRC rising edge
//		0: MSB on 1st "  "
// bit [5] Left Right Swap (1:enable 0: disable)
// bit [6] Master/Slave (1:master, 0:slave) 
// bit [7] BCLK invert	(1: invert, 0: don't)
parameter DIGITAL_AUDIO_INTERFACE		= 9'b001010011;		//addr (07h)9'b001010011;

// Normal mode 256fs No clock dividing 
// bit [0] 		1=USB;0=Normal
// bit [1]		BOSR
// bit [5:2]	SR[3:0]
parameter SAMPLING_CONTROL 				= 9'b000000001;		//addr (08h)

//bit [0]: activate interface (1: active, 0: inactive)
parameter ACTIVE_CONTROL 				= 9'b000000001;		//addr (09h)

//writing all zeros resets the device. 
parameter RESET_ZEROS					= 9'b000000000;		//addr (0Fh)

assign rom[0] 	 		= 	{7'h0F,RESET_ZEROS						};	
assign rom[1] 	 		= 	{7'h00,LEFT_LINE_IN						};	
assign rom[2] 	 		= 	{7'h01,RIGHT_LINE_IN						};	
assign rom[3] 		 	=	{7'h02,LEFT_HEAD_OUT						};	
assign rom[4] 		 	= 	{7'h03,RIGHT_HEAD_OUT					};	
assign rom[5] 		 	= 	{7'h04,ANALOGUE_AUDIO_PATH_CONTROL	};	
assign rom[6] 	 		= 	{7'h05,DIGITAL_AUDIO_PATH_CONTROL	};	
assign rom[7] 	 		= 	{7'h06,POWER_DOWN_CONTROL				};	
assign rom[8] 	 		= 	{7'h07,DIGITAL_AUDIO_INTERFACE		};	
assign rom[9] 	 		= 	{7'h08,SAMPLING_CONTROL					};	
assign rom[10] 	 	= 	{7'h09,ACTIVE_CONTROL					};	



endmodule