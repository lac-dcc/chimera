/*
MidiStepperSynthV2 by Jonathan Kayne, December 2018
This is the Top level module for the Stepper Synth V2. It connects all the modules together
and has an enable timout feature. The Timeout enables the steppers on the presence of a MIDI signal,
and disables the steppers after 30 seconds of inactivity.

This uses the following modules:
MIDI_rx, MIDI_baudrate_generator, MIDI_ShiftReg - converts the MIDI UART into a parallel signal. (Based off code by Electronoobs)
mux_NoteOnOff - passes a zero or the MIDI data through depending on Note ON/OFF commands
ChannelSel - routes the MIDI data to the appropriate MIDI Channel
MIDI_PitchConv - turns the MIDI pitch value into a number of clock pulses
StepperFM - pulses the state of a pin to create the appropriate motor speed 
MIDI_vel - routes the pulses to 0-4 channels depending on the velocity/volume level

This connects to the GPIO0 on the DE0-nano FPGA.
Pin 1 = MIDI_in
Pin 2 = Enable
Pins 4-39 = Channels 1A-8D (skipping 3.3v and 5v of course!)
Rst_n should be connected to KEY0
*/
module MidiStepperSynthV2(MIDI_in, Clk, Rst_n, Enable, Switch, LED,
O1A, O1B, O1C, O1D, 
O2A, O2B, O2C, O2D,
O3A, O3B, O3C, O3D,
O4A, O4B, O4C, O4D,
O5A, O5B, O5C, O5D,
O6A, O6B, O6C, O6D,
O7A, O7B, O7C, O7D,
O8A, O8B, O8C, O8D);

	input MIDI_in, Clk, Rst_n;
	input [3:0] Switch; //the 4 switches on the DE0-nano
	output reg [7:0] LED; //the 8 LEDs on the DE0-nano
	output 	O1A, O1B, O1C, O1D, O2A, O2B, O2C, O2D, O3A, O3B, O3C, O3D, O4A, O4B, O4C, O4D, 
				O5A, O5B, O5C, O5D, O6A, O6B, O6C, O6D, O7A, O7B, O7C, O7D, O8A, O8B, O8C, O8D;
	output reg Enable;
	wire [23:0] MIDI_data;
	wire [15:0] RegData, RegOut1, RegOut2, RegOut3, RegOut4, RegOut5, RegOut6, RegOut7, RegOut8;
	wire [7:0] 	RegEn, RegClr, 
					ConvVel1, ConvVel2, ConvVel3, ConvVel4, ConvVel5, ConvVel6, ConvVel7, ConvVel8, 
					Vel1, Vel2, Vel3, Vel4, Vel5, Vel6, Vel7, Vel8;
	wire [23:0] Pitch1, Pitch2, Pitch3, Pitch4, Pitch5, Pitch6, Pitch7, Pitch8;
	wire FM1, FM2, FM3, FM4, FM5, FM6, FM7, FM8, RxDne, Baud, Rst_p;
	wire State;
	reg [31:0] EnTimeout; //counter for when to disable steppers
	reg Invalid;
	
	
	//ENABLE TIMEOUT
	initial //disable steppers at start
	begin
		Enable <= 1'b1;
	end
	
	always @ (posedge Clk) //enable timeout if idle for 30s
	begin
		if (!MIDI_in) EnTimeout <= 1500000000; //reset timer if any MIDI activity occurs (MIDI_in is 1 when idle)
		else if (EnTimeout != 0) EnTimeout <= EnTimeout - 1'b1; //otherwise count down to zero
		else Invalid <= 1'bx;
		
		if (EnTimeout > 0) Enable <= 1'b0; //enable when positive
		else if (EnTimeout == 0) Enable <= 1'b1; //disable when zero
		else Invalid <= 1'bx;
	end
	
	always @ (*) //for debug use, routes data to LEDs depending on switch configuration
	begin
		case (Switch)
			4'b0000: LED = 8'b00000000;
			4'b0001: LED = 8'b11111111;
			4'b0010: LED = 8'b00000000;
			4'b0011: LED = {7'b0, MIDI_in};
			4'b0100: LED = 8'b00000000;
			4'b0101: LED = 8'b00000000;
			4'b0110: LED = 8'b00000000;
			4'b0111: LED = 8'b00000000;
			4'b1000: LED = MIDI_data[23:16]; //MIDI byte 1 (Command and Channel)
			4'b1001: LED = 8'b00000000;
			4'b1010: LED = RegOut1[15:8];
			4'b1011: LED = RegOut1[7:0];
			4'b1100: LED = MIDI_data[15:8]; //MIDI byte 2 (pitch)
			4'b1101: LED = {State, RxDne, RegEn[0], 4'b0};
			4'b1110: LED = MIDI_data[7:0]; //MIDI byte 3 (velocity)
			4'b1111: LED = 8'b01010101;
			default LED = 8'b00000000;
		endcase
	end
	
	MIDI_ShiftReg SR1(Clk, Rst_n, MIDI_in, MIDI_data, RxDne, State);
	
	MIDI_dataRouter DRT1(MIDI_data, Clk, Rst_n, RegData, RegClr, RegEn);
	
	//MIDI_dataReg(Clk, in, en, clr, out);
	MIDI_dataReg DR1(Clk, RegData, RegEn[0], RegClr[0], RegOut1);
	MIDI_dataReg DR2(Clk, RegData, RegEn[1], RegClr[1], RegOut2);
	MIDI_dataReg DR3(Clk, RegData, RegEn[2], RegClr[2], RegOut3);
	MIDI_dataReg DR4(Clk, RegData, RegEn[3], RegClr[3], RegOut4);
	MIDI_dataReg DR5(Clk, RegData, RegEn[4], RegClr[4], RegOut5);
	MIDI_dataReg DR6(Clk, RegData, RegEn[5], RegClr[5], RegOut6);
	MIDI_dataReg DR7(Clk, RegData, RegEn[6], RegClr[6], RegOut7);
	MIDI_dataReg DR8(Clk, RegData, RegEn[7], RegClr[7], RegOut8);
	
	//MIDI_PitchConv(dataIn, pitchOut, velOut, Clk);
	MIDI_PitchConv PC1(RegOut1, Pitch1, ConvVel1, Clk);
	MIDI_PitchConv PC2(RegOut2, Pitch2, ConvVel2, Clk);
	MIDI_PitchConv PC3(RegOut3, Pitch3, ConvVel3, Clk);
	MIDI_PitchConv PC4(RegOut4, Pitch4, ConvVel4, Clk);
	MIDI_PitchConv PC5(RegOut5, Pitch5, ConvVel5, Clk);
	MIDI_PitchConv PC6(RegOut6, Pitch6, ConvVel6, Clk);
	MIDI_PitchConv PC7(RegOut7, Pitch7, ConvVel7, Clk);
	MIDI_PitchConv PC8(RegOut8, Pitch8, ConvVel8, Clk);
	
	MIDI_vel MV1(Vel1, FM1, O1A, O1B, O1C, O1D, Clk);
	MIDI_vel MV2(Vel2, FM2, O2A, O2B, O2C, O2D, Clk);
	MIDI_vel MV3(Vel3, FM3, O3A, O3B, O3C, O3D, Clk);
	MIDI_vel MV4(Vel4, FM4, O4A, O4B, O4C, O4D, Clk);
	MIDI_vel MV5(Vel5, FM5, O5A, O5B, O5C, O5D, Clk);
	MIDI_vel MV6(Vel6, FM6, O6A, O6B, O6C, O6D, Clk);
	MIDI_vel MV7(Vel7, FM7, O7A, O7B, O7C, O7D, Clk);
	MIDI_vel MV8(Vel8, FM8, O8A, O8B, O8C, O8D, Clk);
	
	//StepperFM(Clk, Pitch, FM_out, VelIn, VelOut);
	StepperFM SFM1(Clk, Pitch1, FM1, ConvVel1, Vel1);
	StepperFM SFM2(Clk, Pitch2, FM2, ConvVel2, Vel2);
	StepperFM SFM3(Clk, Pitch3, FM3, ConvVel3, Vel3);
	StepperFM SFM4(Clk, Pitch4, FM4, ConvVel4, Vel4);
	StepperFM SFM5(Clk, Pitch5, FM5, ConvVel5, Vel5);
	StepperFM SFM6(Clk, Pitch6, FM6, ConvVel6, Vel6);
	StepperFM SFM7(Clk, Pitch7, FM7, ConvVel7, Vel7);
	StepperFM SFM8(Clk, Pitch8, FM8, ConvVel8, Vel8);

endmodule
