`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Scott Gravenhorst
// email: music.maker@gte.net
// 
// Create Date:     15:00:00 05/16/2008 
// Design Name:     GateManPoly
// Module Name:     
// Project Name:    
// Target Devices:  xc3s500e
//
// This synthesizer is a polyphonic version of the GateMan synth.
//
//////////////////////////////////////////////////////////////////////////////////
//
//                                PUSH BUTTON CONTROLS:
//
//                                BTN_N : microcontroller reset
//                                                   
//   BTN_W  :                                                            BTN_E  :
//
//                                BTN_S :
//                                NCO reset, forces phase alignment
//        
//
///////////////////////////////////////////////////////////////////////////////////
//
// ver_a: Basic 4 NCO per voice polyphonic function 
//        Fine tune and DAC window are working.
//
// ver_b: Add coarse tune
//
// ver_c: Add noise modulation, appears to work.
//        Fixed timing constraint failure unnoticed in ver_b
//        Lowered sample rate to 125 Khz to get more clocks per voice.
//
// ver_d: Add waveform select.  
//        Works, PWM connects only to mod wheel for testing
//
// ver_e: Add PWM control
//
// ver_f: Add version display from hardware version character.
//        NOTE: There is a problem using a shifter to implement
//        the DAC window.  When the shifter is included, ISE
//        claims a combinatorial loop and the design operates
//        incorrectly (amplitude ADSR is affecting pitch).  When
//        the shifter logic is replaced with a simple integer,
//        the design works correctly...  This has been partially
//        fixed by registering O_octave.  The combinatorial loop
//        still exists, but the ADSR affecting pitch problem is
//        apparently resolved.  
//        The loop was eliminated by adding register NEXT_DAC 
//        which is loaded during the last clock of the state 
//        machine.  NEXT_DAC is then shifted and it works just 
//        fine.  I have no idea why this register is required 
//        since it seems the register MIXER should have provided 
//        the same functionality.
//
// ver_g: Add velocity control over amplitude
//        Add synch
//
// ver_h: Add selectors for PWM modulation sources -- works
//
// ver_i: Add SVF and ADSR.  Optimized state machine.
//        Removed synch, not interesting without portamento and it was
//        costing at least one clock.
//        Sample rate increased to 250 KHz
//
// ver_j: Change MIDI controller to do round robin assignment at all times.
//        This should mitigate a voice stealing itself from retriggering.
//
// ver_k: Move divide by 12 from hardware ROM to software in the MCU.
//        Reduce computation of each NCO from 4 clocks to 3.
//        Fix noise modulation calculation, add noise signal boost control
//
// ver_l: Add better gain adjustment windowing for both DAC and noise
//
// ver_m: Returning to 4 clocks per NCO, seems sinewave output is corrupt
//        because block RAM requires a clock to set the address and a 
//        clock for the output data to become valid.
//
//////////////////////////////////////////////////////////////////////////////////
module GateManPoly( CLKIN_IN, led,
            lcd_rs, lcd_rw, lcd_e, lcd_d, lcd_contrast,
//            ROTa, ROTb,
//            ROTpress,
            BTN_E, 
            BTN_W, 
            BTN_N, 
            BTN_S,
				deltaS_out,
				//deltaS_out_plus,
            //spi_sck, spi_sdi, spi_dac_cs, spi_sdi, spi_sdo, spi_rom_cs, 
            //spi_amp_cs, spi_adc_conv, spi_dac_cs, spi_amp_shdn, spi_dac_clr,
            //strataflash_oe, strataflash_ce, strataflash_we,
            //platformflash_oe,
            //SW, 
            Raw_MIDI_In,
            TTY_In,
//            cfg 
            );


// This parameter supplies the version number to an MCU port which is displayed in the LCD.
/////////////////////////////////////////////////////////////////////////////////////
                              //                                                   //
                              //  #     #  #####  ####    ###   ###   ###   #   #  //
                              //  #     #  #      #   #  #       #   #   #  ##  #  //
  parameter version = "m";    //   #   #   ###    ####    ###    #   #   #  # # #  //
                              //    # #    #      #  #       #   #   #   #  #  ##  //
                              //     #     #####  #   #   ###   ###   ###   #   #  //
                              //                                                   //
/////////////////////////////////////////////////////////////////////////////////////


  parameter VOICES = 8;          // set the total number of voices
  parameter DACTIME = 12'd125;   // DAC time of 200 clocks total = 250 KHz
                                 // At 200 clocks per DACena, there are 24 clocks available for each voice.
  
  input CLKIN_IN;
  output [7:0] led;
  
  inout [7:4] lcd_d;
  output lcd_rs;
  output lcd_rw;
  output lcd_e;
  output lcd_contrast;
  
//  input ROTa;
//  input ROTb;
  
  input BTN_E;
  input BTN_W;
  input BTN_N;
  input BTN_S;
//  input ROTpress;
  
//  output spi_sck;
//  output spi_sdi;
//  input spi_sdo;
//  output spi_rom_cs;
//  output spi_amp_cs;
//  output spi_adc_conv;
//  output spi_dac_cs;
//  output spi_amp_shdn;
//  output spi_dac_clr;
//  output strataflash_oe;
//  output strataflash_ce;
//  output strataflash_we;
//  output platformflash_oe;
  
  output deltaS_out;
//  output deltaS_out_plus;

//  input [3:0] SW;
  
  input Raw_MIDI_In;
  input TTY_In;
  
//  input cfg;

/////////////////////////////////////////////////////////////////////////////////////
// LCD connections and logic
  wire [7:4] lcd_d;
  wire lcd_rs;
  wire lcd_rw;
  wire lcd_rw_control;
  wire lcd_e;
  wire lcd_drive;
  
  reg [7:0] LCD;      // written by MCU
  
  assign lcd_d[7:4] = ( lcd_drive == 1'b1 & lcd_rw_control == 1'b0 ) ? LCD[7:4] : 4'bzzzz;
  assign lcd_drive = LCD[3];
  assign lcd_rs = LCD[2];
  assign lcd_rw_control = LCD[1];
  assign lcd_e = LCD[0];
  assign lcd_rw = lcd_rw_control & lcd_drive;
  //assign deltaS_out_plus = deltaS_out;

  reg [7:0] led_reg;
  
  wire [3:0] SW;

  wire clk;
//  wire [14:0] ROTval;         // output from rotary encoder's register
  wire BTN_W;
  wire BTN_N;
  wire BTN_S;
//  wire ROTpress;              // raw rotary button output
//  wire ROTp;                  // debounced ROTpressed

//  wire cfg;                   // This is for sensing an external 1 or 0 indicating whether the rotary encoder is backwards or not.
  
  wire [3:0] rstd;                // POR delay
  wire reset;                     // POR/User reset
  wire kcpsm6_reset; 
  
  wire interrupt;
  wire interrupt_ack;
  wire interrupt0;
  wire interrupt1;
  wire [11:0] address;             // wires to connect address lines from uC to ROM
  wire [17:0] instruction;        // uC data lines, need connection between uC and ROM
  wire [7:0] out_port;            //
  wire [7:0] in_port;             // 
  wire [7:0] port_id;
  wire proc_reset;                // an output from the mcu ROM, not sure what it's supposed to connect to.
  reg [7:0] in_port_reg;          // hold data for mcu
  assign in_port = in_port_reg;

// MIDI & TTY receivers
  wire [7:0] rx0data;
  wire rx0ready_status;
  wire reset_rx0ready_status;
  wire midi_ready;
  
  wire [7:0] rx1data;
  wire rx1ready_status;
  wire reset_rx1ready_status;

  wire resetsignal;
// mcu
  wire read_strobe;
  wire write_strobe;
  
  

///////////////////////////////////////////////////////////////////////////////////////
// Synth signals

  reg [VOICES-1:0] MCU_GATE = 0;

  //reg [VOICES-1:0] ACTIVE = 0;

// Output values from processing of MIDI data.
  reg [6:0] MOD_WHL = 7'd0;                      // a usable initial value
  reg [6:0] CHANpres = 7'd0;
  reg SUSTAIN = 1'b0;
  
  reg [6:0] VEL[VOICES-1:0];                // dist RAM
  reg [3:0] NOTE[VOICES*4-1:0];               // dist RAM
  reg [3:0] OCT[VOICES*4-1:0];                // dist RAM
  
  reg [6:0] TRANSPOSE = 7'd00;              // global transposition in half steps.  The MIDI controller reads
                                            // this value and subtracts it from all note on message note numbers.
                                            // The synth hardware sees this adjusted value.

  reg [2:0] VOX;                            // voice select.  Managed by state machine
  reg [2:0] VXa;
  reg [2:0] VXb;
  reg [2:0] VXc;
  reg [1:0] NCO;                            // NCO select.  Managed by state machine
  reg [1:0] NC;                             // SHADOW NCO select.  Managed by state machine
  reg [1:0] NCO_old;                        // shadow register for quirky state machine to reduce NCO to 3 states

  reg [3:0] NT;              // state machine NOTE working register
  reg [3:0] OC;              // state machine OCTAVE working register
  reg [6:0] VL;              // state machine VEL working register
  
  reg [13:0] PW = 14'd0;


  reg [6:0] CRSTUN[3:0];        // DIST. RAM - coarse tune registers, half setp

  reg [1:0] PWMmdSRC[3:0];      // DIST. RAM - PWM modulation source registers

  reg [1:0] WAVSEL[3:0];        // DIST. RAM - waveform select

  reg [6:0] PWMstatic[3:0];        // DIST. RAM - PWM static configured values

  reg [6:0] FINTUNhi[3:0];      // DIST. RAM - fine tune registers
  reg [6:0] FINTUNlo[3:0];      // DIST. RAM
  
  reg [6:0] LEVhi[3:0];       // DIST. RAM - level value MSB
  reg [6:0] LEVlo[3:0];       // DIST. RAM - level value LSB

  reg [3:0] BOOST [3:0];      // noise signal boost (shifts)
    
///////////////////////////////////////////////////////////////////////////////////////  

  reg [6:0] NZmodhi[3:0];         // DIST. RAM - noise filter modulation level MSB
  reg [6:0] NZmodlo[3:0];         // DIST. RAM - noise filter modulation level LSB
  
///////////////////////////////////////////////////////////////////////////////////////  

  reg [4:0] NZbw[3:0];            // DIST. RAM - noise filter bandwidth values

///////////////////////////////////////////////////////////////////////////////////////  

  reg [13:0] SVFadsrA;
  reg [13:0] SVFadsrD;
  reg [13:0] SVFadsrS;
  reg [13:0] SVFadsrR;
  reg [13:0] SVFpk;                // peak config value
  reg [13:0] SVFmin;               // min config value

///////////////////////////////////////////////////////////////////////////////////////  

  reg [13:0] NCAadsrA;
  reg [13:0] NCAadsrD;
  reg [13:0] NCAadsrS;
  reg [13:0] NCAadsrR;
  
///////////////////////////////////////////////////////////////////////////////////////  

  reg [1:0] SVFpkMDsrc;
  reg [1:0] SVFsusMDsrc;
  
///////////////////////////////////////////////////////////////////////////////////////  

  reg [1:0] NCApeakMDsrc;
  reg [1:0] NCAsusMDsrc;

///////////////////////////////////////////////////////////////////////////////////////  

  reg [1:0] SYNCH = 2'b00;      // synch enables

///////////////////////////////////////////////////////////////////////////////////////  

  reg [63:0] LFSR = 64'h461B87AA9928112E;            // 64 bit LFSR register with seed

// register to remember which voices are active.  This is because the MIDI controller
// is programmed to show the true state of each key, only held keys have GATE high.
// But because of the sustain pedal, a voice can be sounding even if it's GATE is low.
// This register contains one bit per voice.  The bit is set when the voice is activated
// and reset when the voice is stopped.  This register is made available to the MCU
// for controlling voice assignment.
//  reg [7:0] ACTIVE = 8'b00000000;

///////////////////////////////////////////////////////////////////////////////////////
// DIAGNOSTICS
//  reg [7:0] MCULED;

///////////////////////////////////////////////////////////////////////////////////////
// POR delay FF chain - taken from Eric Brombaugh's code for the SPI DAC.
  FDCE rst_bit0 (.Q(rstd[0]), .C(clk), .CE(1'b1), .CLR(1'b0), .D(1'b1));
  FDCE rst_bit1 (.Q(rstd[1]), .C(clk), .CE(1'b1), .CLR(1'b0), .D(rstd[0]));
  FDCE rst_bit2 (.Q(rstd[2]), .C(clk), .CE(1'b1), .CLR(1'b0), .D(rstd[1]));
  FDCE rst_bit3 (.Q(rstd[3]), .C(clk), .CE(1'b1), .CLR(1'b0), .D(rstd[2]));
  //assign reset = ~rstd[3] | BTN_N;
  assign reset = 1'b0;						//hardwire the reset button to 0 for now. JPG
  assign SW = 4'b0000;
  assign lcd_contrast = 1'b0;

// Tie off the flash enables to allow SPI to work
  assign strataflash_oe = 1'b1;
  assign strataflash_ce = 1'b1;
  assign strataflash_we = 1'b1;
  assign platformflash_oe = 1'b0;
  
// Tie off other SPI enables to isolate DAC
  assign spi_rom_cs = 1'b1;
  assign spi_amp_cs = 1'b1;
  assign spi_adc_conv = 1'b0;
  assign spi_amp_shdn = 1'b1;
  assign spi_dac_clr = 1'b1;
///////////////////////////////////////////////////////////////////////////////////////

DCM32to50 instance_name (
    .CLKIN_IN(CLKIN_IN), 
    .CLKFX_OUT(clk), 
    .CLKIN_IBUFG_OUT(CLKIN_IBUFG_OUT), 
    .CLK0_OUT(CLK0_OUT)
    );

///////////////////////////////////////////////////////////////////////////////////////
// instantiate the uC (kcpsm3) with it's ROM

  kcpsm6 #(
	.interrupt_vector	(12'h3FF),
	.scratch_pad_memory_size(64),
	.hwbuild		(8'h00))
  MCU0 (
	.address 		(address),
	.instruction 	(instruction),
	.bram_enable 	(bram_enable),
	.port_id 		(port_id),
	.write_strobe 	(write_strobe),
	.k_write_strobe 	(k_write_strobe),
	.out_port 		(out_port),
	.read_strobe 	(read_strobe),
	.in_port 		(in_port),
	.interrupt 		(interrupt),
	.interrupt_ack 	(interrupt_ack),
	.reset 		(reset),
	.sleep		(kcpsm6_sleep),
	.clk 			(clk)); 

//  kcpsm6 MCU0 ( .address(address), .instruction(instruction), .port_id(port_id), 
//    .write_strobe(write_strobe), .out_port(out_port), .read_strobe(read_strobe), .in_port(in_port), 
//    .interrupt(interrupt), .interrupt_ack(interrupt_ack), 
//    .reset(proc_reset|reset), .clk(clk) );  

  //midictrl PSM_ROM0 ( .address(address), .instruction(instruction), .proc_reset(proc_reset), .clk(clk) );
    midictrl #(
	.C_FAMILY		   ("S6"),   	//Family 'S6' or 'V6'
	.C_RAM_SIZE_KWORDS	(1),  	//Program size '1', '2' or '4'
	.C_JTAG_LOADER_ENABLE	(0))  	//Include JTAG Loader when set to '1' 
  PSM_ROM0 (    				//Name to match your PSM file
 	.rdl 			(kcpsm6_reset),
	.enable 		(bram_enable),
	.address 		(address),
	.instruction 	(instruction),
	.clk 			(clk));
  
  // MIDI receiver.  31,250 Baud
  assign resetsignal = write_strobe && ( port_id == 8'hFF );  // When port_id == FF with write strobe, reset the UARTs
  assign MIDI_In = Raw_MIDI_In;                    // Don't invert the MIDI serial stream for 6N138

///////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////
// MIDI UART                                                                            ///
// UART code by Jim Patchell                                                            ///
  MIDIuartrx RX0 ( .dout(rx0data), .clk(clk), .reset(resetsignal), .rxd(MIDI_In),       ///
    .frame(), .overrun(), .ready(midi_ready), .busy(), .CS(),                                     ///
    .interrupt(interrupt0), .interrupt_ack(interrupt_ack),                              ///
    .rxready_status(rx0ready_status),                                                   ///
    .reset_rxready_status(reset_rx0ready_status)                                        ///
    );                                                                                  ///
  /////// VERY IMPORTANT HARDWARE /////////////////////////////////////////////////////////
  // decode read port 01, send pulse to reset rxready flop                              ///
  // This allows the mcu to clear the rxready bit automatically just by reading rxdata. ///
  assign reset_rx0ready_status = (read_strobe == 1'b1) & (port_id[4:0] == 5'h01);       ///
                                                                                        ///
///////////////////////////////////////////////////////////////////////////////////////////
// TTY UART, 115.2 or 19.2 kilobuad (baudrate configured in module)                     ///
// UART code by Jim Patchell                                                            ///
  TTYuartrx RX1 ( .dout(rx1data), .clk(clk), .reset(resetsignal), .rxd(TTY_In),         ///
    .frame(), .overrun(), .ready(), .busy(), .CS(),                                     ///
    .interrupt(interrupt1), .interrupt_ack(interrupt_ack),                              ///
    .rxready_status(rx1ready_status),                                                   ///
    .reset_rxready_status(reset_rx1ready_status)                                        ///
    );                                                                                  ///
  /////// VERY IMPORTANT HARDWARE /////////////////////////////////////////////////////////
  // decode read port 04, send pulse to reset rxready flop                              ///
  // This allows the mcu to clear the rxready bit automatically just by reading rxdata. ///
  assign reset_rx1ready_status = (read_strobe == 1'b1) & (port_id[4:0] == 5'h09);       ///
                                                                                        ///
// common interrupt signal for both serial ports.                                       ///
// ISR gets to figure out which UART did it.                                            ///
  assign interrupt = (interrupt0 | interrupt1);                                         ///
                                                                                        ///
///////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////
// DAC - SPI interface logic
// This DAC version accepts value 'cycles' which 
// determines the amount of time between enables.

  reg [11:0] DACreg = 12'b100000000000;    // Data for SPI DAC

// DAC, module by Eric Brombaugh
  spi_dac_out DAC (.clk(clk),.reset(reset),
                   .spi_sck(spi_sck),.spi_sdo(spi_sdi),.spi_dac_cs(spi_dac_cs),
						 .deltaS_out(deltaS_out),
                   .ena_out( DACena ),.data_in( DACreg ),
                   .cycles( DACTIME ) );

  reg [5:0] WINDOW = 6'd0;

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
// ADSR

  reg                ADSRena0 = 0;    // Multi ADSR requires 2 enables, ADSRena0 must occur before ADSRena1.
  reg                ADSRena1 = 0;    // See ADSR design code for details.
                                      // Note that both ADSRs are enabled in parallel.
 
///////////////// amplitude envelope ADSR //////////////////////

  wire signed [17:0] ampADSRout;

  ADSR #( .SIZE( 28 ), .VOICES( VOICES ) )              // a smaller value of SIZE causes the ADSR to respond more quickly 
    ADSRamp ( .out( ampADSRout ), .clk( clk ), .ena0( ADSRena0 ), .ena1( ADSRena1 ), .sel( VXb ), .GATE( MCU_GATE[VXb] ), 
              .A( NCAadsrA ), .D( NCAadsrD ), .S( {NCAadsrS,3'b000} ), .R( NCAadsrR ), 
              .led() );

///////////////// SVF envelope ADSR //////////////

  wire signed [17:0] svfADSRout;

  ADSR #( .SIZE( 28 ), .VOICES( VOICES ) )              // a smaller value of SIZE causes the ADSR to respond more quickly 
    ADSRsvf ( .out( svfADSRout ), .clk( clk ), .ena0( ADSRena0 ), .ena1( ADSRena1 ), .sel( VXb ), .GATE( MCU_GATE[VXb] ), 
              .A( SVFadsrA ), .D( SVFadsrD ), .S( {SVFadsrS,3'b000} ), .R( SVFadsrR ), 
              .led() );

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
// Interpolating Tuner
// Phase increment value calculated by linear interpolation between two tuning tables.

  wire signed [17:0] hi;
  wire signed [17:0] lo;                  // high and low pitch ROM outputs
  
  tuning_ROM TUN ( .addr( NT ), .out_hi( hi ), .out_lo( lo ) );

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// SVF - A digital state variable filter with resonance.

  reg signed [20:0] NCOmixer = 0;    // this has to be here because the SVF is the first thing to use it.

  reg signed  [13:0] qval;
  reg signed  [11:0] SVF_in [VOICES-1:0];
  reg                SVF_ena;
  wire signed [17:0] SVF_out;
  
  SVF_multi SVF ( .clk( clk ), .ena( SVF_ena ), .sel( VXb ), 
                  .f( svfADSRout >>> 4 ), .q( {1'b0,qval,3'b111} ), 
                  .In( SVF_in[VXa] ), .Out( SVF_out ), .reset(BTN_S) );

//////////////////////////////////////////////////////////////////////////////////////////
// Noise filter

  reg nzFILTena = 0;
  
  wire signed [17:0] nzFILTout;
  
  noise_iir #( .dsz(18), .q(31) ) 
    NZLPF ( .clk( clk ), .ena( nzFILTena ), .bw( NZbw[NCO] ), .in( LFSR[17:0] ), .sel( {VXc,NCO} ), .out( nzFILTout ) );

//////////////////////////////////////////////////////////////////////////////////////////
// Shared multiplier with signed 36 bit and signed 18 bit outputs.

  reg  signed [17:0] A0;
  reg  signed [17:0] B0;
  wire signed [35:0] P0;
  wire signed [17:0] PROD0;
  assign P0 = A0 * B0;                  // shared multiplier
  assign PROD0 = P0 >>> 17;            // 18 bit signed output

  reg  signed [17:0] A1;
  reg  signed [17:0] B1;
  wire signed [35:0] P1;
  wire signed [17:0] PROD1;
  assign P1 = A1 * B1;                  // shared multiplier
  assign PROD1 = P1 >>> 17;            // 18 bit signed output

  reg  signed [17:0] A2;
  reg  signed [17:0] B2;
  wire signed [35:0] P2;
  wire signed [17:0] PROD2;
  assign P2 = A2 * B2;                  // shared multiplier
  assign PROD2 = P2 >>> 17;            // 18 bit signed output

  reg  signed [17:0] A3;
  reg  signed [17:0] B3;
  wire signed [35:0] P3;
  wire signed [17:0] PROD3;
  assign P3 = A3 * B3;                  // shared multiplier
  assign PROD3 = P3 >>> 17;            // 18 bit signed output

//////////////////////////////////////////////////////////////////////////////////////////
// Sine table, 1024 locations, 18 data bits, 1/4 cycle.

  wire        [9:0]  SINadr;
  wire signed [17:0] SINrom;
  sine_tab SIN ( .CLK( clk ), .A( SINadr ), .O( SINrom ) );

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
// main state machine


reg [7:0] DIAG;
  
  reg [1:0] WS;                     // Cache for WAVSEL[]
  reg [13:0] LV;                    // Cache for {LEVhi[NCO],LEVlo[NCO]}

  reg [13:0] NZMOD;
  reg [13:0] FINETUNE;
  
  reg [1:0] PWM_MOD_SRC;
  
  reg [6:0] PWM_STAT;
  
  reg [3:0] NZ_BOOST;
  
  reg NCOreset = 0;
// Gate change detection objects:
  reg  [VOICES-1:0] old_GATE = 0;
  wire [VOICES-1:0] GATEchgd;
 
  reg signed [20:0] MIXER = 0;
 
  assign GATEchgd = MCU_GATE ^ old_GATE;       // true whenever gate signal changes state.

  reg [4:0] state = 5'h00;
  reg run = 1'b0;
  
  reg        [32:0] intPhInc = 0;                             // managed by state machine
  reg        [32:0] PAcache = 0;                              // Phase accumulator cache
  reg        [32:0] PA [(VOICES*4)-1:0];                      // 33 bit phase accumulator RAM.  4 per voice

/////////////// WAVEFORM LOGIC /////////////////// 
// TRI waveform:
  wire signed [17:0] TRIout;
  wire signed [17:0] TRItmp;
  assign TRItmp = (PAcache[32]) ? PAcache[31:14] : ~PAcache[31:14] ;
  assign TRIout = TRItmp + 18'b100000000000000000;

// SINE waveform:  
  wire signed [17:0] SINout;
  assign SINadr = TRIout[17] ? ~TRIout[16:7] : TRIout[16:7];        
  assign SINout = TRIout[17] ? ~SINrom : SINrom ;
 
// PWM based on tri waveform - if tri waveform value < PWMctl, then output = -max_val else output = +max_val
  wire        [7:0]  PWMsum;       // this calculation prevents cutout
  wire        [6:0]  PWMapplied;
  wire        [17:0] PWMout;       // PWM output (was signed, doesn't seem necessary)     
  reg         [6:0]  PWMthresh;    // level value at which PWM turns on (was signed, doesn't seem necessary)     

  assign PWMsum = {1'b0,PWMthresh} + 8'b00000010 ;
  assign PWMapplied = ( PWMsum >= 8'b01111111 ) ? 7'b1111111 : PWMsum[6:0] ;
  assign PWMout = ( TRItmp < {1'b0,PWMapplied,10'b0000000000} ) ? 18'sb100000000000000001 : 18'sb011111111111111111 ;  

// SAW waveform
  wire signed [17:0] SAWout;
  assign SAWout = PAcache[32:15];
///////////////////////////////////////////////////////////////

// linear interpolator for pitch ROMs
  wire [32:0] interp;
  assign interp = ( ( PROD3 + lo ) << OC ) ;

// noise boost window
  wire [32:0] sh;
  wire [17:0] window18;
  assign sh = interp << NZ_BOOST;
  assign window18 = sh[32:15];
  
// DAC
  reg  [20:0] NEXT_DAC;  
  wire [11:0] DAC_WIN;             // 12 bit movable window
  wire [20:0] DAC_SHIFTER;
  assign DAC_SHIFTER = NEXT_DAC << WINDOW;
  assign DAC_WIN = DAC_SHIFTER[20:9];

//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==//==//
// state machine structure:

  always @ ( posedge clk )
    begin
    if ( DACena )
      begin
      state <= 5'h00;                                   // starting state
      run <= 1'b1;                                      // tell state machine to run
      VOX <= 3'b000;                                    // Select voice zero to start
      VXa <= 3'b000;                                    // copy of VOX to avoid high fanout
      VXb <= 3'b000;                                    // copy of VOX to avoid high fanout
      DACreg <= {~DAC_WIN[11],DAC_WIN[10:0]};           // REPLACES:  DACreg <= DAC_WIN + 12'h800;  No adder needed.
      MIXER <= 0;                                       // reset output sum (MIXER)
      old_GATE <= MCU_GATE;                             // snapshot MCU_GATE for detecting a gate change
      if ( BTN_S ) begin NCOreset <= 1; end
      end
    
    else        // else if NOT DACena:
      
      begin
		
      if ( run )
        begin
        case ( state ) 
        
        5'h00:                                // initialize for this voice
          begin  state <= state + 1;
          VXa  <= VOX ;                        // shadows VOX to reduce fanout
          VXb  <= VOX ;                        // shadows VOX to reduce fanout
          VXc  <= VOX ;                        // shadows VOX to reduce fanout

          VL <= VEL[VOX];                     // get velocity value to VL register from VEL RAM

          NCO <= 0;
          NC <= 0;
          NCO_old <= 0;
          NCOmixer <= 0;

          ADSRena0 <= 1;                      // assert ADSRena0 once for each VOX.

          SVF_ena <= 1;
          end

        5'h01:                                // initialize for this voice
          begin  state <= state + 1;
          ADSRena0 <= 0;                      // assert ADSRena0 once for each VOX.
          ADSRena1 <= 1;                      // assert ADSRena0 once for each VOX.

          NT          <= NOTE[{VXa,NCO}];                   // get note number being played 
          PAcache     <= PA[{VXa,NC}];                    // get current phase accumulator value to cache register
          NZMOD       <= {NZmodhi[NC],NZmodlo[NC]};
          FINETUNE    <= {FINTUNhi[NC],FINTUNlo[NC]};
          OC          <= OCT [{VXa,NC}];
          WS          <= WAVSEL[NC];
          LV          <= {LEVhi[NC],LEVlo[NC]};
          NZ_BOOST    <= BOOST[NC];
          case ( PWMmdSRC[NC] )                    // PWM modulation source selector
            2'h0: PWMthresh <= 127-PWMstatic[NC] ;
            2'h1: PWMthresh <= 127-CHANpres ;
            2'h2: PWMthresh <= 127-VL ;
            2'h3: PWMthresh <= 127-MOD_WHL ;
          endcase

          SVF_ena <= 0;
          end

        //////////////// START OF NCO LOOP ///////////////////////////

        5'h02:
          begin  state <= state + 1;
   	      LFSR <= {LFSR[62:0],(( LFSR[63] ^ LFSR[62] ) ^ ( LFSR[60] ^ LFSR[59] ))} ;   // LFSR XOR logic for noise (nz) generator
          nzFILTena <= 1;                           // enable the noise generator IIR filter for each NCO.
          ADSRena1 <= 0;                            // assert ADSRena0 once for each VOX.
      
          if ( PWMthresh < 20 ) PWMthresh <= 20;                // prevent too narrow a pulse width

          A1 <= nzFILTout ;                                     // IIR filtered noise
          B1 <= {1'b0,NZMOD,3'b000} ;                           // noise modulation level control

          A3 <= hi - lo ;                                       //
          B3 <= {1'b0,FINETUNE,3'b000} ;
          end
          
        5'h03:
          begin  state <= state + 1;
          case ( WS )
          2'h0:  A2 <= TRIout ;       // TRI
          2'h1:  A2 <= SAWout ;       // SAW
          2'h2:  A2 <= PWMout ;       // PWM
          2'h3:  A2 <= SINout ;       // SINE
          endcase 
          B2 <= {1'b0,LV,3'b000} ;          // level amount

          nzFILTena <= 0;
          end

        5'h04:
          begin  state <= state + 1;
          NCOmixer <= NCOmixer + {PROD2[17],PROD2[17],PROD2[17],PROD2} ;

          intPhInc <= interp ;  // finish interpolation

          A0 <= window18;                  // window18 is a magnitude window
          B0 <= PROD1;                     // level controlled noise

          NCO_old <= NCO;
          NCO <= NCO + 1;
          NC <= NC + 1;
          end

        5'h05:
          begin
          PA[{VXa,NCO_old}] <= (BTN_S) ? 33'd0 : PAcache + (intPhInc << 3) + {PROD0,15'h0000};

          NT          <= NOTE[{VXa,NCO}];                    // get note number being played 
          PAcache     <= PA[{VXa,NC}];                 // get current phase accumulator value to cache register
          NZMOD       <= {NZmodhi[NC],NZmodlo[NC]};
          FINETUNE    <= {FINTUNhi[NC],FINTUNlo[NC]};
          OC          <= OCT [{VXa,NC}];
          WS          <= WAVSEL[NC];
          LV          <= {LEVhi[NC],LEVlo[NC]};
          NZ_BOOST    <= BOOST[NC];
          case ( PWMmdSRC[NC] )                    // PWM modulation source selector
            2'h0: PWMthresh <= 127-PWMstatic[NC] ;
            2'h1: PWMthresh <= 127-CHANpres ;
            2'h2: PWMthresh <= 127-VL ;
            2'h3: PWMthresh <= 127-MOD_WHL ;
          endcase

          if ( NCO == 0 )  state <= state + 1;                 // ESCAPE NCO LOOP
          else             state <= state - 3;                 // LOOP FOR NEXT NCO
          end
        //////////////// END OF NCO LOOP ////////////////////////////////// 
        
        // at entering the next state, all 4 NCOs are updated and NCOmixer has the sum of all 4

        5'h06:                             //// START OF SVF
          begin  state <= state + 1;
          SVF_in[VXa] <= NCOmixer[20:9];

          A1 <= SVF_out;
          B1 <= {1'b0,VL,10'b1111111111} ;                     // modulate with velocity
          end
         
        5'h07:                              
          begin  state <= state + 1;
          A1 <= PROD1 ;                                         // level modulated audio
          B1 <= ampADSRout ;
          end

        5'h08:      
          begin  state <= state + 1;
          MIXER <= MIXER +  {PROD1[17],PROD1[17],PROD1[17],PROD1} ;    // Sum NCA output (NCOmixer) with main MIXER
          end

        5'h09:
		      begin  state <= 5'h0;                           // set state to start of voice process
          VOX <= VOX + 1;                                    // select next voice

          if ( VOX == VOICES - 1 )
            begin
            run <= 1'b0;                                  // stop the state machine after all voices are processed
            NCOreset <= 0;                                // set general reset off
            NEXT_DAC <= MIXER;
            end
          end

        endcase
        end
      end
    end  

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////  
// Decode structures for hardware receiving data from the MCU

reg [7:0] MCU_LED;

  reg [7:0] SYSEX_ADDR_MSB;

  always @ ( posedge clk )
  begin
    if ( write_strobe == 1'b1 )
    begin
// This case block contains selection logic for system level ports and for CC ports.
// Note that these ports all have the bit 7 of port_id set.
    casex ( port_id )
    8'b10000xxx: VEL[port_id[2:0]]      <= out_port[6:0];         //  80 - 87

    8'b101xxxxx: 
      begin
      NOTE[port_id[4:0]] <= out_port[3:0];        //  AO - BF
      OCT[port_id[4:0]]  <= out_port[7:4];        //  AO - BF
      end

    8'h90:       LCD                    <= out_port;
    8'h91:       SYSEX_ADDR_MSB         <= out_port;

    8'hF0:       CHANpres               <= out_port[6:0];  // channel pressure value, global
    8'hF1:       PW[13:7]               <= out_port[6:0];  // pitch wheel MSB, global
    8'hF2:       PW[6:0]                <= out_port[6:0];  // pitch wheel LSB, global
    8'hF3:       MOD_WHL                <= out_port[6:0];  // modulation wheel, global
    
    8'hF8:       MCU_GATE               <= out_port[7:0];  // MCU_GATE signal, 8 gate bits controlled by MCU
    8'hFC:       SUSTAIN                <= out_port[6];    // sustain command register
    
    8'hFE:       MCU_LED                <= out_port[7:0];
    endcase
//////////////////////////////////////////////////////////////////////////////////////////
// These if blocks contain case blocks for sysex populated parameters     
// below this, all port_id values have bit 7 set to zero
// Address space is 14 bits.

      // SYSEX updatable parameter ports:    

    if ( SYSEX_ADDR_MSB == 8'h00 )                 //
      begin
      casex ( port_id )
      8'b000000xx: CRSTUN[port_id[1:0]]            <= out_port[6:0];   // 00 to 03        coarse tuning offset values
    
      8'b000001xx: FINTUNhi[port_id[1:0]]          <= out_port[6:0];   // 04 to 07        // micro tune, only 7 bits used in each port    
      8'b000010xx: FINTUNlo[port_id[1:0]]          <= out_port[6:0];   // 08 to 0B
      
      8'b000011xx: LEVhi[port_id[1:0]]             <= out_port[6:0];   // 0C to 0F
      8'b000100xx: LEVlo[port_id[1:0]]             <= out_port[6:0];   // 10 to 13

      8'b000110xx: NZmodhi[port_id[1:0]]           <= out_port[6:0];   // 18 to 1B
      8'b000111xx: NZmodlo[port_id[1:0]]           <= out_port[6:0];   // 1C to 1F 

      8'b001000xx: NZbw[port_id[1:0]]              <= out_port[4:0];   // 20 to 23

      8'b001001xx: PWMstatic[port_id[1:0]]         <= out_port[6:0];   // 24 to 27
      8'b001010xx: PWMmdSRC[port_id[1:0]]          <= out_port[1:0];   // 28 to 2B
      
      8'b001011xx: WAVSEL[port_id[1:0]]            <= out_port[1:0];   // 2C to 2F

      8'b001100xx: BOOST[port_id[1:0]]             <= out_port[3:0];   // 30 to 33
      endcase
      end

    if ( SYSEX_ADDR_MSB == 8'h01 )
      begin
      casex ( port_id )
      8'h10:       TRANSPOSE                       <= out_port[6:0];   // global transpose by semitones, neg values don't work - fix this

      8'h20:       SVFadsrA[13:7]                  <= out_port[6:0];
      8'h21:       SVFadsrA[6:0]                   <= out_port[6:0];
      8'h22:       SVFadsrD[13:7]                  <= out_port[6:0];
      8'h23:       SVFadsrD[6:0]                   <= out_port[6:0];
      8'h24:       SVFadsrS[13:7]                  <= out_port[6:0];
      8'h25:       SVFadsrS[6:0]                   <= out_port[6:0];
      8'h26:       SVFadsrR[13:7]                  <= out_port[6:0];
      8'h27:       SVFadsrR[6:0]                   <= out_port[6:0];
//      8'h28:       SVFpk[13:7]                     <= out_port[6:0];
//      8'h29:       SVFpk[6:0]                      <= out_port[6:0];
//      8'h2A:       SVFmin[13:7]                    <= out_port[6:0];
//      8'h2B:       SVFmin[6:0]                     <= out_port[6:0];

      8'h30:       NCAadsrA[13:7]                  <= out_port[6:0];
      8'h31:       NCAadsrA[6:0]                   <= out_port[6:0];
      8'h32:       NCAadsrD[13:7]                  <= out_port[6:0];
      8'h33:       NCAadsrD[6:0]                   <= out_port[6:0];
      8'h34:       NCAadsrS[13:7]                  <= out_port[6:0];
      8'h35:       NCAadsrS[6:0]                   <= out_port[6:0];
      8'h36:       NCAadsrR[13:7]                  <= out_port[6:0];
      8'h37:       NCAadsrR[6:0]                   <= out_port[6:0];
		 
//      8'h40:       SVFpkMDsrc                      <= out_port[1:0];
//      8'h41:       SVFsusMDsrc                     <= out_port[1:0];

//      8'h48:       NCApeakMDsrc                    <= out_port[1:0];
//      8'h49:       NCAsusMDsrc                     <= out_port[1:0];

      8'h50:       qval[13:7]                      <= out_port[6:0];
      8'h51:       qval[6:0]                       <= out_port[6:0];
       
      8'h60:       WINDOW                          <= out_port[5:0];   // DAC window value
       
      endcase
      end
/////////////////////////////////////////////////////////////////////////////////////////////
/*
// Use this for address space extension.  Each block created like this one must
// have a unique SYSEX_ADDR_MSB value which cannot be larger than 127
     if ( SYSEX_ADDR_MSB == 7'b01 )
       begin
       case ( port_id )
       endcase
       end       
*/
    end
  end


// make sure that in_port_reg always contains selected data at rising edge of clk,
// PicoBlaze will read it when it needs it.
  always @ ( posedge clk ) 
    begin
    casex ( port_id[3:0] )                               // decode and transfer data to in_port_reg
    4'h0:    in_port_reg <= {rx1ready_status,rx0ready_status,6'b000000}; // UART1 & UART0 rxready bits
    4'h1:    in_port_reg <= rx0data;                     // MIDI UART rxdata
    4'h2:    in_port_reg <= {4'b0000,SW};                // slide switches

    4'b01xx: in_port_reg <= {1'b0,CRSTUN[port_id[1:0]]}; // CRS pitch offset for NCO0 (half steps, signed) 04-07

    4'h8:    in_port_reg <= {1'b0,TRANSPOSE};
    4'h9:    in_port_reg <= rx1data;                     // TTY UART rxdata
//    4'hA:    in_port_reg <= ACTIVE;                      // sounding state of each voice  - may not be required
    4'hF:    in_port_reg <= version;                     // The GateMan version number stored in hardware
    default: in_port_reg <= 8'bxxxxxxxx;
	  endcase
    end

//////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
// LEDs

//  assign led = MCU_GATE;

//assign led = {6'd0,WS};

assign led = {7'b0100010,midi_ready};

//  assign led = ( BTN_W ) ? B0[17:10] : A0[17:10] ;

//assign led = MCU_LED;

//  assign led = DIAG;
//assign led = qval[13:6] ;

// assign led = {6'b000000,SYNCH};

//assign led = {7'h00,~TTY_In};

endmodule

