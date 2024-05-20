// This program was cloned from: https://github.com/n1gp/Anvelina_PROIII
// License: GNU General Public License v3.0

/***********************************************************
*
*	Orion
*
************************************************************/


//
//  HPSDR - High Performance Software Defined Radio
//
//  Angelia code. 
//
//  This program is free software; you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation; either version 2 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program; if not, write to the Free Software
//  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

// (C) Phil Harman VK6APH/VK6PH, Kirk Weedman KD7IRS  2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015


/*
	2013 Dec 24 - Start coding 
					- remove log 
	2015 Jun 20 - First release with 4 receivers.  Number of receivers can be set using NR

	2015 Jun 21 - Changed to 7 receivers.
					- Changed version number to v9.2
				24 - replaced cdc_sync_strobe  with cdc_mcp.  2 Rx and Sync OK.
					- saved as today's date.
				27 - Sync not OK - force same phase word for both Rx. Add clock frequency and NR to Discovery reply
				   - Set NR = 2, Sync OK,  saved as today's date. 
					- Mod so that only Rx0 and Rx1 can be synced.  Independent phase words for both receivers.
					- All OK, saved as today's dat2 _2.
					- try 7 Rx - fails after a few seconds.
				   - replace Rx frequency with phase word from PC, 2 receivers.
				   - OK but Sync some times not work.
				   - save as today's data _phase_word.
				   - remove unnessary frequency to phase code
				   - enable Sync selection.
				   - All OK, save as today's date _phase_word_2	
					- try 4 receives, Sync not work, save as today's date _phase_word_3
					- try 7 receives,  Sync not work nor Rx3 ???
					- hold fifo clear until spd_rdy, 7 receivers OK but no Sync. Save as today's date _phase_word_4
					- unfold receivers. 7 receivers but Rx6 did fail and all will fail sometimes after deselecting Sync. 
				28 - Check Rx fifo is empty after Sync changes of status before continuing.
				   - NR = 2;
					- Connect fifo_clear to test LED to check that fifo is being reset.
					- works - saved as today's date.
					- replaced set_min_delay -from PHY_RX_CLOCK -to PHY_RX_CLOCK -4 with set_multicycle_path
					- works - saved as today's date _2 (and ping works!). 
				29 - Added items from Alex's network code to SDC file. Changed PHY delay to 1.2nS and updated sdc. 
				   - NR = 7, Receivers OK but not Sync.  Changed PHY delay back to 2nS. 
					- By forcing Rx1 phase word to Rx0 phase word then all receivers OK and Sync works. 
					- Try selecting Rx1 phase word dependent on Sync[0] setting. Runs but possible Sync problem.
		 Jul   2 - Revert to normal phase word selection. Receivers appear to work but not sure about Sync.
		         - Saved as today's date and sent to Warren etc for testing. 
				 3 - Warren reports that Rx1 and Rx5 seem to share the same frequency - confirmed - no idea why!  Unrolled Rx generation - no change.
				 4 - Unroll frequency selection in Hi Priority C&C, seems to have fixed the same frequency problem.
				   - Saved as today's date and sent to Kirk for assistance.
					- Code just stops running for some reason. 
				21 - Changed phy_cfg to turn off Tx delay and set Rx delay to F0 or C0 or 00 - all seem to work the same. 
				22 - Changed phy_cfg to use different Rx clock delays.
				   - Changed sdc to use different PHY data_in settings.  Checked 7 receivers appears OK, still not sure about Sync. 
					- Saved as today's date.
				23 - Changed KK so that each receiver can be set to different frequency. Works but some receivers fail when chip is cold.
					- Try unfolding Rx generation.  Appears to work OK, ping works for a few mins until FPGA warms up. 
					- Saved as today's date and sent to Warren for testing.
				25 - force same phase word to Rx0 and Rx1. Sync works but phase offset.  
				   - Force CORDIC reset when selecting Sync - no difference
					
					____________________________________________________________________________-
					
					- Two receiver version to speed up debug.
					- force Rx1 to use Rx0 phase word when in Sync mode - works OK.
					- force CIC reset when selecting sync - works OK.
					- force FIR reset when selecting sync - Rx hangs when Sync selected. 
					- independent phase words for Rx0 and Rx1 - not work
					- change High_Priority_CC so that Rx0 and Rx1 phase words are captured at the same time. Works until Rx1 is tuned.
					- when Sync active force Rx1 phase word to equal Rx0 phase word - wont run! see line 1038.
					- try setting Rx1 phase word  = Rx0 phase word  in High_Priority_CC when Sync active - no change
				26 - try reset CORDIC phase to zero when reset active. Works until you change frequency then need to set Sync again.
				   - remove reset code from High_Priority_CC  - same result.
					- remove reset from CIC filters - same result.
					- try just reseting CORDIC phase rather than other variables - same result.
					- use cdc_mcp to move receiver phase words to Rx clock domain - same result i.e. works until you change frequency.
					- use Sync to force Rx1 = Rx0 phase word - when you select Sync no Rx data sent?
					- force code to read phase at same time - using cdc_mcp - not work 
					- try using cdc_sync - works, can drag tune very slowly and phase preserved.
		         - set Rx1 = Rx0 phase word - code not run 
					- revert to separate Rx0 and Rx1 phase words. 
					- set Rx1 = Rx0 in High_Priority_CC - code runs but phase not work.
					- revert to separate Rx0 and Rx1 phase words.
				27 - Also reset CORDIC when new phase word arrives using Alex_data_ready - will not start.
					- Just use Alex_data_ready - Rx always at 0Hz, reasonable since as soon as new phase word is received it is set to zero. 
					- Move Alex_data_ready stobe to just before new Rx0 and Rx1 phase words.  Works most of the time but can tune such that phases are not correct.
					- Try Alex_data_ready directly after new Rx phases - works but blip in Rx audio as you tune not unexpectedly.
					- Try right at end - works OK. Sync does not hold after changing sampling rates.
				29 - Force Rx1 = Rx0 sample rate. Sync OK when changing sample rates.
				   - Force Rx1 = Rx0 sample rate from KK as well as Rx0 = Rx1 frequency.  Sync OK when changing sampling rate.
				   - Try setting Rx1 = Rx0 phase when Sync set again - remove reset of phase accumalator when frequency changes - WORKS!!!	
					- Saved as todays date. 
		  Aug  1 - Added Wideband_packets_per_frame.
				 2 - Sent to Warren for testing.
				 5 - Fixed bug in Wideband_packets_per_frame. Added Wideband_update_rate. Sync not work!  Was 70
				   - Try 60, 50 = OK, but not second time, 40.  Leave at 50. Try F0 = OK.
				 8 - modified ping check sum - not work and Rx0 not work. Ping error is due to incorrect data being received.
				 9 - modified ping code to use dual clock fifo and clock tx side on negedge. Ping works but not Sync.
				   - Try phy_config with E0. Sync works but not ping, last data element missing.
					- revert to F0 and posedge clock for Tx fifo. Review ping code later.
					- Use as basis of port to Hermes.
				29 - Saved as today's date.
				   - Imported changes from ANAN-10E code. Uses new Discovery protocol, namely:
							- Initial zero of unused C&C data
							- fix bug in C&C data relating to ADC overload
							- added openHPSDR Protocol version supported
							- modified CW so that MOX/PTT required if break-in not selected
							- changed Discovery reply to new protocol format
							- added hardware reset timer (but not enabled)	
							- added !run to sdr_send
					- Sync not work
					- Fixed DHCP bug reported by Hermes-Lite group.
					- Sync works but not after changing sampling rates. 
					- Remove for loop for Rx in sdr_send - no change
					- set Rx1 = Rx0 sampling rate when Sync selected. When in Sync mode can now change sampling rate.
				   - remove this set and still works
					- try resetting CORDIC when Sync changes state - no
					- try resetting CIC integrators - no
					- try increasing length of reset signal
					- try resetting CIC combs - no
					- try only rest when Sync goes 0 -> 1 - no
					- try more reset on CORDIC - no.
					- try using DEBUG_LED10 mono for long reset - no.
					- what works is to stop run, change speed on both receives, and run again. 
					- remove DEBUG_LED10. OK
					- remove CORDIC reset. OK
					- remove CIC int and combs. OK
					- remove try only rest when Sync goes 0 -> 1. OK
					- remove set Rx1 = Rx0 sampling rate when Sync selected. OK 
					- saved as today's date
				31	- Test 7 receivers
				   - Rx OK but not Sync. 
					- Unroll send_sdr. Rx 2 not work.					
		Sep    2 - High_Priority_CC mod to latch Rx frequency after it changes.
					- Rx2 not work.  Removed phase wire for Rx2.
				   - Works, saved as today's date. 
				 3 - High_Priority_CC output reg [31:0]Rx_frequency[0:NR-1] -- ramstyle = "logic" --  -- saved as today's date_1 --
				   - sdr_send.v input [7:0]Rx_data[0:NR-1] ramstyle = "logic" --  -- saved as today's date_2 --
					- Works. Sent as release to Doug, Warren and Joe. 
					- Saved as today's date.					
				 4 - Testing Alex data - set NR = 2.
				   - Change Alex data clock to CBCLK.
					- Modify Alex to update on change of data.
					- Works - saved as today's date.
				   - Set NR = 7.
				   - Redo timing - works.
				   - Save as today's date _2.	
		Oct    3 - Added new Erase code from Hermes.
               - Updated sdr_send.v to use latest erase and send_more replies.
					- not run with more than 4 receivers. Enabling 5th stops data being sent.
					- Saved as today's date. 
			    4 - Redo timing - works - saved as today's date.
			    5 - Fixed erase and program, change ASMI_interface back to use negedge.
			      - Redo timing - works - saved as today's date.
			   21 - Enabled deadman timer.
					- Saved as today's date.
					
					------------------------------------------------------------------
					
				31 - Test code for setting Rx levels.
					- NR = 2.
		Nov    2 - Increased gain of FIR by 12dB to match previous code.
					- Saved as today's date
					- NR = 7
					- Saved as today's date_2
				 4 - Test sending 16 bits to Rx1 as DAC feedback rather than 14. 
				   - removed 12dB gain in FIR
				 6 - Truncated Tx CIC output. 
				 7 - Added 12dB Rx gain in FIR.
				   - Set DAC feedback to 16 bits. CORDIC was set to 16 bits but only 15 used - fixed. Signals jump - try NR = 2.
					- NR = 2;
				 8 - Redo timing to give clean 16 bit feedback. 
				   - 16 bit feedback shows lots of low level spurs on Rx1 feedback.
					- Built both 14 and 16 bit versions and sent to Warren.
					- This is 14 bit version
					- saved as today's date
				14 - Testing 16 bit feedback
				   - 17 bit Tx chain, 14 bits to DAC, 16 bits to DAC feeback Rx.
					- Using top 14 bits of Tx data for DAC. Can now get full power out. 
				16 - Added 15 phase shift to DAC clock as per current Angelia code.
			      - Added phase shifted clock to sdc file and redo timing.	
				19 - If send 16bits of DAC data then when FPGA warms up noise floor gets high.
				   - Just sending 14 DAC bits.
					- Sent to Warren for testing.
					- Saved as today's date.
				22 - NR = 7 not run, need to turn hardware reset off. 
				   - OK now. 
					- Saved as today's date, sent to Warren for testing.
				27 - Added hardware resets to C&C code.
				   - Corrected reset from Tx_specific_CC.
					- Hardware timer still not correct.
					- Saved as today's date.
				28 - Try different hardware timer.
					- works using slow reset signals.
				   - Modify Tx_specific_data ready code.
					- redo timing.
					- OK now.
					- Prevent Discovery reply if already running - in sdr_send.v
					- Breaks DAC feedback signal - try redo timing.
					- OK now - sent to John and Warren for testing.
					- Moved open collectors to match V2.2.
					- not compliled - saved as today's date.
		  Dec  4 - Fixed bug that caused Mic PTT to latch .PTT in data to CC_Encoder
					- redo timing.
					- OK - saved as today's date and sent to John and Warren for testing.
				 5 - Test code for Discovery bug - NR = 2
				   - Set Discovery reply to 60 bytes - sdr_send.v modified
					- Set Protcol version to v2.2
					- No bug found, PC should not try and connect if Discovery reply indicates busy.
					- Changed code so that Discovery can be sent to either broadcast or hardware's IP address. 
					- NR = 7.
					- OK - saved as today's date and sent for testing.
				 6 - NR = 2.
				   - Testing hardware reset code.
				   - Increase timer to 2 seconds and use data_ready* to reset.
					- Remove broadcast test 255.255.255.255 in ip_recv.v from line 17.
					- Unreliable - use HW_reset* instead.
					- redo timing
					- NR = 7.
				 7	- OK - saved as today's date and sent for testing.
				 9 - The following changes prevent the HW restarting after a time out by issuing a Discovery command.
					  Requires a run command to restart. 
							Prevent HW timer reseting if not General_CC data, line 109. 
							Add HW_timeout to High_Priority_CC so that run is cleared on HW timeout, line 127
							Modify HW timer to give HW_timeout, lines 460-467.
							Replace run_set with run.
				10 - OK - saved as today's date and sent to John for testing.
				   - Only send Exciter, FWD & REV power when PTT active
				19 - Set protocol to V2.3
				   - Tidy Tx code comments relating to use of 22 bits from CORDIC now.
					- Match Tune and CW power out levels since change to 22 bits. 
					- NR = 2
					- new profile.mif table and added 'raised cosine profile.xls' to files
					- attenuate sidetone level, see line 1090
				   - NR = 7.	
					- OK - saved as today's date and released.
				20 - Corrected Mic and wideband data - swapped bytes
					- Saved as today's date and released.
	2016 Jan 17 - Added Tx_IQ_fifo almost_full, almost_empty.
					- Clear TR relay and Open Collectors if run not active.
					- Saved as today's date and released.
				18 - Added AIN4 user analog input.
				   - Added IO4 user digital input.
				20 - Redo timing. No output or sequence errors.
				22 - Remove set max and min delays from Angelia.sdc - runs OK  
				   - Saved as today's date. Release for testing.
				23 - modified Tx DACD clock to use 30 deg phase shift instead of 15 degrees 
					- modified deadman timer code to cure occasional-halt behavior
					- modified .sdc timing constraint file to achieve timing closure
					- Saved as today's date.  Released for testing.  					
				30 - removed references to Mercury in Angelia.qsf
					- added TX INHIBIT using IO4
					- added IO5 external CW keying feature for ext amp autotune support in iambic CW mode, using debounced IO5, 
						changes in Angelia.v and iambic.v
					- set all dual purpose pins to "use as regular IO" in Assignments > Device... > Device and Pin Options
					- changed blocking assignments ( = ) to unblocking assignments ( <= ) in all always and generate 
						blocks unless used in "assign" statements
					- changed x++ occurances to x <= x + 1 in always and generate blocks because ++ is a blocking operation
					- set deadman timer to 2 seconds interval
					- fixed sequence number output bugs for CC_seqnumber and spec_seq_number to send upper 8 bits of seq numbers
						correctly in sdr_send.v
			   31 - removed C122_PLL output c1 for phase shifted TX DAC data clock, created timing for TX DAC data and TX DAC
						as a set_output_delay constraint instead in Angelia.sdc
					- added max and min delays into Angelia.sdc to achieve timing closure
					- changed protocol_version number to v2.6
					- saved as today's date, changed version number to 10.2					

			
					**** IMPORTANT: Prevent Quartus merging PLLs! *****

	3 FEB 2016 - TRIAL TIMING APPROACH: SIMPLIFIED PHY IO CONSTRAINTS
				  - modified Angelia.sdc PHY-related "set_input_delay" and "set_output_delay" constraints,
					 including changing to a single constraint for PHY_RX with setup/hold delays of zero (i.e., identical 
					 setup and hold delay of zero but it nevertheless works!).  Set DACD[*] setup/hold delays to 0.2 nSec and 
					 PHY_TX setup/hold delays to 0.2 nSec, removed all existing "set_max_delay" and "set_min_delay" contstraints, 
					 compiled, then re-timed failing paths using only set_max_delay and set_min_delay constraints.
					 
		 Feb  6 - Added revised polyphase FIR, uses less RAM and ROM. 
			     - Fixed a number of compiler warnings. 
				  - Redo timing - all appears OK, released for testing.
		     18 - Modified timer hardware reset signals so that a reset signal can't stay high if Network lost
			     - Timing not closed.  Released as todays date for testing. 
				  
				  - re-instated input and output delays of 19Dec version for PHY timing on leading and trailing edges of clock,
					 set TX DAC data output delay to 0.8 nSec
				  - closed timing
			  19 - saved as today's date and released for testing
			  20 - Added hardware timer enable
					 Saved as today's date and released for testing. 
			  24 - Testing different sdc file. 
			  25 - Closed timing - works OK. Saved as today's date. 
		Mar   4 - New sdc file. 
			     - Saved as today's date - DAC feedback fails when hot
				7 - Try Tx PLL using source sync compensation for C0 output. 
			     - Try _122_90 to clock DAC data into Rx.
				  - Seems OK - saved as today's date and released for testing.
		Apr  24 - Testing Altera suggestions i.e. PHY_TX[*] instead of PHY_TX*
				  - Saved as today's date and released for testing.
	   Aug  29 - Change Mic data to have 64 samples (128 bytes) and Rx audio to have 64 samples (256 bytes)
					 Mic data - see Angelia.v line 886 and sdr_send line 397
				    Rx audio - see byte_to_32bits line 106.
					 Sent to Warren for testing.
		Sep   3 - Corrected Rx audio to be 64 samples
		          Sent to Warren for testing.
			  19 - Moved Wideband data to after DDC data so have lower priority.	
					 Sent to Warren for testing.
			  21 - Now send WB data after all DDC data has been sent. 
					 Sent to Warren for testing.
		Oct   7 - Change NR = 4
		Oct  17 - Modified Mux_clear to fix PureSignal switching issues.
		        - Moved phy_ready to C122 clock domain		
				  - Sent to Warren for testing.
				  - Basically OK but high noise floor on DAC feedback Rx on Warren's board.
			  19 - redo timing closure. 
			     - Sent to Warren for testing. Even high DAC noise floor.
				  - Saved as today's date.
			  21 - Fed Rx1 DAC data without 90 phase shift (used DAC)
			       Still high DAC noise floor when FPGA cold. 
				  - try latch DAC data when RF data available - NBG
				  - don't wait for DAC DDC to be ready - OK when hot, check when cold.
				  - when cold high DAC DDC noise floor.
			  22 - redo timing closure.
			     - check that Rx0 fifo is empty when PureSignal starts 
				  - works OK cold and hot starts
				  - sent to Warren for testing, works OK for him also.
				  - saved as today's date.
			  30 - fixed sequence number error in mic data - see sdr_send.v line 412.
			     - released for testing
				  - saved as today's date.
		Dec  12 - Modified FIR to use 4 ROMs for testing.
		     15 - Incorporate Hermes-Lite mods for DHCP and ICMP files change are network.v, dhcp.v, ip_recv.v, icmp.v & icmp_fifo.v.
					 Saved as today's date.
					 
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
					 					 
		- Using Quartus Prime Lite v16.0
		
		Dec 29	- port of Angelia_15Dec2016 code to Orion
					- updated all megafunctions and regenerated afresh all PLL megafunctions
					- moved _122_90 clock output from C122_PLL/.c1 to PLL_IF/.c3, changed phase 
						shift from 90 to 60 degrees
					- added Orion mic PTT/tip/ring/selection code
					- added external 10MHz ref input
					- added OSC_enable code
					- changed hardware ID to 05 for Orion ID
					- changed C122_PLL/.c0 output from 80khz to 10MHz
					- changed 122.88MHz clock XOR to operate at 10MHz vs 80khz				
					- changed phase shift for PLL_IF/.c1 output (CBCLK) from 0 to 90 degrees
					- added additional 3 receivers (NR = 7)
					- changed firmware version number to v0.1
					- closed timing	
		Dec 30	- changed hardware ID to 04 for Orion MkI (ID = 5 is for Orion MkII)
					- changed version number to 0.2					
	Jan 1 2017	- enabled HW_timeout feature
					- changed phase shift of PLL_IF/.c3 to 45 degrees 
					- changed version number to 0.3
		  Jan 2	- fixed mic PTT bug
					- changed version number to 0.4
					
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	Jan 2 2017	- port from Orion_NP_v0.4 (Orion MkI) to the Orion MkII board
					- increased the number of bits used by DACD from the cordic from 14 to 16 bits
					- changed DACD from 2's complement format to offset binary format for the MkII Tx DAc
					- increased Alex data word size from 32 bits to 48 bits in Orion.v, High_Priority_CC.v,
						and SPI.v
					- modified High_Priority_CC.v to properly parse the 48-bit Alex data word for MkII
					- changed hardware ID to 5 for Orion MkII
					- added DRIVER_PA_EN, SW1, and  code and FPGA pin assignments for MkII
					- modified 10MHz ref and 122.88MHZ XOR code for MkII board use
					- eliminated EXT_C10_PLL, not needed for the MkII board
					- removed OSC_ENABLE, not needed on the MkII board
					- set phase shift for PLL_IF/.c3 output from 45 to 90 degrees
					- changed version number to v2.2 (Orion MkII NP)
					
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

		Feb 11	- port from Orion_MkII_NP_v2.2 (uses software-selectable ADC/DDC assignments)
					- replaced entire Ethernet folder with Ethernet folder from Orion_MkII_NP_v0.2
						to capture the DHCP lease renewal fixes of v0.2
					- changed network_state to match v0.2 DHCP lease renewal fixes of v0.2
					- changed DACD to correctly form the offset binary format for the MAX5891 DAC
					- added IO4 inhibit to DACD assignment to zero DACD when IO4 is asserted
					- removed debounce_PTT from input conditions of FPGA_PTT assignment, to prevent possible
						pops/clicks of audio on Rx-to-Tx transitions
					- changed version number to v0.3
					- removed all max/min delay constraints in Orion.sdc, re-compiled, retimed/compiled
						iteratively until closed timing achieved
					
		Mar 6 	- modified the following megafunctions to add an additional MSB to fix the empty fifo problem
						Rx_fifo: increased Rx_used to [11:0] Rx_used[0:NR-2]
						Rx_Audio_fifo (although usedw not implemented in Orion.v)
						SP_fifo (although usedw not implemented in Orion.v)
						Tx1_IQ_fifo: increased write_used to [12:0] write_used in Orion.v
						(Mic_fifo: additional MSB bit was previously implemented)
					- zero'd the two LSBs of DACD before conversion to offset binary format
					- changed almost_full and almost_empty code for Tx1_IQ_fifo to fix sporadic Tx halts
					- changed version number to v0.4
					- changed protocol version number to v3.3
					- removed all max/min delay constraints
					- iteratively compiled, retimed until timing met
		Mar 9		- fixed ASMI code for EPCS128 larger bootloader area (2MB vs 1MB),
						increased erase boundary to 6MB, set FPGA image starting position at 2MB
					- changed firmware version number to v0.5

					- changed FW version number to v0.6
					- removed all max/min delay constraints from Orion.sdc
					- retimed/compiled iteratively until timing closed
					
		Mar 17	- changed bit size of C122_cordic_i_output to 23 bits
					- changed method of converting from signed binary to offset binary for DACD
					- added a one-spi-clock delay to SPI.v code when the Alex_SPI_Tx data word changes
						to allow the data word to become stable before sending it to the bus
						- changed FW version to v0.7
					- removed all max/min delay constraints from Orion.sdc
					- retimed/compiled iteratively until timing closed
					
		Mar 18	- removed yesterday's on-spi-clock delay coding in SPI.v
					- modified SPI.v to send Alex data word twice when the Alex data word changes
					- changed FW version number to v0.8
					- removed all max/min delay constraints from Orion.sdc
					- retimed/compiled iteratively until timing closed	
		Mar 19	- changed CTRL_TRSW assignment to be: 
							assign CTRL_TRSW = FPGA_PTT && XVTR_ENABLE;
					- corrected line 281 in send_sdr.v to send only 60 bytes total for CC_data
					- corrected definition of CC_data to 8 bits wide by 56 words deep:
						wire [7:0]CC_data[0:55]
					- added User_ADC1 (AIN3) and User_ADC2 (AIN4) to CC_data, available on both Rx and Tx				
					- assigned user digital inputs to byte 55 of CC_data in CC_encoder.v (via User_IO) as follows:
							byte 55[0] = IO4 input
							byte 55[1] = IO5 input
							byte 55[2] = IO6 input
							byte 55[3] = IO8 input
							byte 55[4] = IO2 input
							byte 55[5] = not assigned
							byte 55[6] = not assigned
							byte 55[7] = not assigned
						which when incorporated and sent out in the High Priority Status packet via sdr_send.v
						conforms to the new-protocol specification for byte 59 user inputs: 
							byte 59[0] = IO4 input
							byte 59[1] = IO5 input
							byte 59[2] = IO6 input
							byte 59[3] = IO8 input
							byte 59[4] = IO2 input
							byte 59[5] = not assigned
							byte 59[6] = not assigned
							byte 59[7] = not assigned
					- added byte 1400 to the High_Priority_CC packet as follows:
							byte 1400[0] = XVTR_enable (0 = disabled, 1 = enabled)
							byte 1400[1] = IO1 output to enable/mute audio (0=audio enabled, 1= mute)
							byte 1400[2] = not assigned
							byte 1400[3] = not assigned
							byte 1400[4] = not assigned
							byte 1400[5] = not assigned
							byte 1400[6] = not assigned
							byte 1400[7] = not assigned
						for support of the ANAN-8000DLE
					- changed FW version to v0.9
					- removed all max/min delay constraints from Orion.sdc
					- retimed/compiled iteratively until timing closed	
					
		Mar 22	- changed definition and ref clock for temp_DACD and DACD
					- reduced width of cordic_i_output to 22 bits
					- changed version number to v1.0
					- retimed/compiled iteratively until timing closed	
					
		Mar 23	- changed user digital IO connections as follows:
						IO5 = TX INHIBIT, pin 16 of J16, 8000DLE rear panel DIG IN 1 (low = Tx inhibited)
						IO8 = External CW Key, pin 13 of J16, 8000DLE rear panel DIG IN 2
					- added debounce to IO8 and IO5 inputs
					- changed iambic.v to set IO8 as ext CW key input
					- changed PLL_IF/.c3 phase angle to 120 degrees
					- changed FW version number to v1.1
					- removed all max/min delay constraints from Orion.sdc
					- retimed/compiled iteratively until timing closed	
					
		Apr 17	- added peak detect for AIN1 and AIN2:
							- replaced Orion_ADC.v with version from Orion_MkII_v1.6
							- added pk_detect_reset and pk_detect_ack to Orion.v and CC_encoder.v
							- added PLL_30MHz/.c0 to generate 30.72MHz clock for Orion_ADC,
									results in a 7.68MHz clock to the ADC78H90 chip increasing 
									AIN conversion rates x10
					- changed to values[6] <= 16'h70FF in Ethernet/phy_cfg.v for PHY clk skew settings
					- changed version number to v1.2
					- removed all max/min delay constraints from Orion.sdc
					- iteratively retimed/compiled until timing closed
					
2018	Feb  10  - Merged files from Hermes-Lite project and those provided by Rick, N1GP.
				   - Fixed bug that caused non response to Discovery request.
				   - retimed	
					- set version to 11.7
					- Archived project as Angelia_Protocol_2_v11.7-Quartus-17
					- removed almost_full and almost_empty flags since no longer required by Simon, G4ELI, SDR-Radio software
					- corrected text explaining external 10MHz reference operation
					- released as 11.7 and archived as before. 

2018	Feb  21  - (N1GP) Merged files from Orion_MkII protocol 1 to provide support for Tx Attenuator.
				   -  If TX_ATTEN_SELECT (K22) is low then uses Tx attenuator, if high then uses DAC current only to control Tx power.
				      Note that I/O pin K22 is assigned a weak pull-up so high if external resistor is not fitted to pull low. 
				      The pull-up is added using the Assignment Editor, add a new line with: 
				      TO						Assignment Name 			Value 	Enabled 
				      TX_ATTEN_SELECT			Weak Pull-Up Resistor 		On	 	Yes 
				   -  Added Tx Attenuator I/O to sdc file.
				   -  Added ROMs for Tx Attenuator (Tx_Atten) and PWM (Tx_DAC) values.
				      See 'Tx Power Control Using Attenuator.xlsx' for method of calculating values.
		Mar  28  - Modified CC_encoder so that data is sent every mS if FPGA_PTT is active i.e. HW is transmitting.
					  This is so that Thetis receives FWD and REV voltages fast enough to calculate SWR.

2018	Dec  23 - (N1GP) Swapped Rx Left & Right audio out to be aligned with P1
			 - Changed phy_cfg.v rx/tx clock skews from 40/77 to 40/40
			 - Unfolded the for loops in Rx_specific_C&C.v for the 7rx's as a test, seemed to make an improvement
			   need to revisit, perhaps use a generate there?
			 - Changed receiver_inst1 to use fifo_clear1 -vs- fifo_clear for reseting it's DSP chain
			 - Tweaked timings in SDC file to meet timing closure.
			 - changed FW version number to v1.4
 
2018	Dec  25 - (N1GP) Put receiver_inst1 back to using fifo_clear
			 - Replaced _122MHz with C122_clk to better match DAC timings w/ ADC's
			 - Changed Rx NR code to use generate
			 - Updated SPI.v to ensure data is constant throughout transfer
			 - Changed FW version number to v1.5

2019	Jan  15 - (N1GP) Put receiver_inst1 back to using fifo_clear
			 - Replaced _122MHz with _122_90 as clock for loading temp_DACD samples
			 - Adjusted Clock delay from 1.0 to 2.8 to 1.0 to 2.6 per datasheet table 7-1
			 - Copied in sdc timings from the Orion MkI v1.5 

2019	Jan 19 - (VK6PH) change clock for Rx Attenuator from CMCLK (12.288MHz) to  CBCLK(3.072MHz)
			 since new version of DAT-31A-SP+ attenuator chip is not reliable at faster clock speed.
			 - Changed FW version number to v1.6

2019	Mar  2 - (N1GP) Worked with Chris/W2PA and Doug/W5WC on an issue with FPGA_PTT
			   coming in late and cutting off the beginning of the CW_char.
			   Or'd FPGA_PTT with Alex_data[43] assigned to runsafe_Alex_data,
			   QSK much improved.
			 - Added latching of data in initial states of SPI, TLV320_SPI, and Attenuator

2019	Mar 30 - (N1GP) Changed to 4 rx's as it's quicker to compile and make timing.
			 - Upgraded to Quartus 18.1
			 - Changed FW version number to v1.7

2019	Apr 14 - (N1GP) Fixed an issue with Mic Boost (and others) in TLV320_SPI
			 - Changed FW version number to v1.8

2019	Dec 1 - (N1GP) Moved the LED clock to CLOCK_25MHZ, added 'set_clock_groups -exclusive -group' for various clocks
			 - Changed FW version number to v1.9

2020	Jan 4 - (N1GP) Fixed DHCP issue where a dhcp transaction not bound for the local MAC would get passed up and interfere
			 with ongoing network traffic. Passed dhcp_enable down to udp_recv.v so the request was only considered when enabled.
			 Changed bias_ctrl to atu_ctrl for future ATU and enforced that TR relay was disabled if PA_Enable was set to disable.
			 - Changed FW version number to v2.0

2021	Jun 7 - (N1GP) Added support for KSZ9031 Ethernet Phy (automatically detects either 9021 or 9031), removed/fixed stuck mode in sdr_send.v,
                         merged HL2 dhcp updates in, forced PHY_TX_CLOCK to use dedicated PLL_1 output (Orion.qsf) which required use of 135 degrees
                         phase -vs- 90. NR=8 8 separate bands in CW SkimServ and SparkSDR @192K OK. Can run 2 Rx's @ 1536K in Thetis now without Seq errors.

2021	Aug 3 - (N1GP) Added beta_version for better tracking of test releases (byte 23 of discovery, per protocol2 doc v3.8).
                       Experimenting with phase step adjustment of tx_pll PHY_TX_CLOCK.
                       Added sequence error (from host data) reporting back to the host in high priority packet.
                         - Changed FW version number to v2.1

2024	Mar 21 - (N1GP) Adding initial work from Yuri / EU2AV for Anvilina_PROIII SDR with KSZ9031RNX ported from protocol 2 version 2.1.19 of Orion2.

2024	Mar 21 - (N1GP) Updated to Quartus 20.1. Removed for loops in sdr_send.v, added a resyncronising mechanism
                       to sdr_send.v such that if the fifo gets out of order (manifests as a high noise floor in panadapter)
                       it can be reordered due to an extra bit (9 bits) in the fifo data used to show MSB.

2024	Mar 21 - (N1GP) Added a dedicated RX slice for the temp_DAC output. This is used for puresignal
                       and is intended to be more stable and lock in more quickly due to being switched
                       at 192KHz -vs- 122.88MHz.

2024	Mar 21 - (N1GP) Changed SPI clock in Orion_ADC.v from 25% to 50% as some users reported
                       instability in the 12V reading and the adc78h90 is spec'd @  min %40 / max %60

2024	Mar 21 - (N1GP) Added use of Alex1's upper 16 bits for TX relay control. Namely the ANT1-3 bits.
                       This is to avoid RF appearing on an RX only ANT due to a later arrival of a HP
                       message telling us to switch the ANT when we are already in TX mode sending RF.
                       The client program should send this before going to TX.

*/

module Orion(
	//clock PLL
  input _122MHz,                 //122.88MHz from VCXO
  input  OSC_10MHZ,              //10MHz reference in 
  output FPGA_PLL,               //122.88MHz VCXO contol voltage

  //attenuator (DAT-31-SP+)
  output ATTN_DATA,              //data for input attenuator
  output ATTN_DATA_2,
  output ATTN_CLK,               //clock for input attenuator
  output ATTN_CLK_2, 
  output ATTN_LE,                //Latch enable for input attenuator
  output ATTN_LE_2,

  //rx adc (LTC2208)
  input  [15:0]INA,              //samples from LTC2208
  input  [15:0]INA_2,            //samples from LTC2208 #2
  input  LTC2208_122MHz,         //122.88MHz from LTC2208_122MHz pin 
  input  LTC2208_122MHz_2,       //122.88MHz from #2 LTC2208_122MHz pin 
  input  OVERFLOW,               //high indicates LTC2208 have overflow
  input  OVERFLOW_2,             //high indicates LTC2208 have overflow
  output RAND,            			//high turns ramdom on
  output RAND_2,          			//high turns ramdom on
  output PGA,            			//high turns LTC2208 internal preamp on
  output PGA_2,          			//high turns LTC2208 internal preamp on
  output DITH,            			//high turns LTC2208 dither on 
  output DITH_2,          			//high turns LTC2208 dither on 
  output SHDN,            			//x shuts LTC2208 off
  output SHDN_2,          			//x shuts LTC2208 off

  //tx adc (AD9744ARU)
  output reg  DAC_ALC,          	//sets Tx DAC output level
  output reg signed [15:0]DACD,  //16-bit Tx data word
  
  //audio codec (TLV320AIC23B)
  output CBCLK,               
  output CLRCIN, 
  output CLRCOUT,
  output CDIN,                   
  output CMCLK,                  //Master Clock to TLV320 
  output CMODE,                  //sets TLV320 mode - I2C or SPI
  output nCS,                    //chip select on TLV320
  output MOSI,                   //SPI data for TLV320
  output SSCK,                   //SPI clock for TLV320
  input  CDOUT,                  //Mic data from TLV320  
  
  //phy rgmii (KSZ9021RL)
  output [3:0]PHY_TX,
  output PHY_TX_EN,              //PHY Tx enable
  output PHY_TX_CLOCK,           //PHY Tx data clock
  input  [3:0]PHY_RX,     
  input  RX_DV,                 //PHY has data flag
  input  PHY_RX_CLOCK,           //PHY Rx data clock
  input  PHY_CLK125,             //125MHz clock from PHY PLL
  input  PHY_INT_N,              //interrupt (n.c.)
  input  PHY_RESET_N,
  input  CLOCK_25MHZ,              //25MHz clock (n.c.)  
  
	//phy mdio (KSZ9021RL)
	inout  PHY_MDIO,               //data line to PHY MDIO
	output PHY_MDC,                //2.5MHz clock to PHY MDIO
  
	//eeprom (25AA02E48T-I/OT)
	output 	SCK, 							// clock on MAC EEPROM
	output 	SI,							// serial in on MAC EEPROM
	input   	SO, 							// SO on MAC EEPROM
	output  	CS,							// CS on MAC EEPROM
	
  //eeprom (M25P16VMW6G)  
  output NCONFIG,                //when high causes FPGA to reload from eeprom EPCS16	
  
  //12 bit adc's (ADC78H90CIMT)
  output ADCMOSI,                
  output ADCCLK,
  input  ADCMISO,
  output nADCCS, 
  
  //Tx Attenuator (F1912)
  //output TX_ATTN_LE,					// High for parallel mode
  //output TX_ATTN_CLK,				// not used in parallel mode  
  //output TX_ATTN_DATA,				// not used in parallel mode
  //output [5:0] TX_ATTEN,		   // [0] = bit 0, [1] = bit 1, [2] = bit 4, [3] = bit 8 etc.
  //output TX_ATTN_MODE,				// Low for parallel mode 
  //input	TX_ATTEN_SELECT,			// Low for Tx attenuator, high for DAC current
 
  //alex/apollo spi
  output SPI_SDO,                //SPI data to Alex or Apollo 
//  input  SPI_SDI,                //SPI data from Apollo 
  output SPI_SCK,                //SPI clock to Alex or Apollo 
  output J15_5,                  //SPI Rx data load strobe to Alex / Apollo enable
  output J15_6,                  //SPI Tx data load strobe to Alex / Apollo ~reset 
  
  //mic and osc configuration 
  output MICBIAS_ENABLE, 
  output PTT_SELECT, 
  output MIC_SIG_SELECT, 
  output MICBIAS_SELECT,

  //misc. i/o
  input  PTT,                    //PTT active low
  input  KEY_DOT,                //dot input from J11
  input  KEY_DASH,               //dash input from J11
  output FPGA_PTT,               //high turns Q4 on for PTTOUT
  input  MODE2,                  //jumper J14 on Orion: 1 if removed = ECPS128; 0 if jumpered = ECPQ128A
  input  ANT_TUNE,               //atu
  output IO1,                    //high to mute AF amp    
  input  IO2,                    //PTT, used by Apollo 
  //input  SW1,							//bootloader mode switch option
  output DRIVER_PA_EN,
  output CTRL_TRSW,		
  output atu_ctrl,					//controls pin 10 of J16 (BUFF_OUT) via U20 and FPGA pin AH30 (BUFF_OUT_FPGA) for 7000DLE support

  //user digital inputs
  input  IO4,                    
  input  IO5,							// TX INHIBIT digital input
  input  IO6,
  input  IO8,							// external CW key digital input
  
  //user outputs
  output USEROUT0,               
  output USEROUT1,
  output USEROUT2,
  output USEROUT3,
  output USEROUT4,
  output USEROUT5,
  output USEROUT6,
  
    //debug led's
  output Status_LED,      
  output DEBUG_LED1,             
  output DEBUG_LED2,
  output DEBUG_LED3,
  output DEBUG_LED4,
  output DEBUG_LED5,
  output DEBUG_LED6,
  output DEBUG_LED7,
  output DEBUG_LED8,
  output DEBUG_LED9,
  output DEBUG_LED10,
  output DEBUG_LED11,             
  output DEBUG_LED12,
  output DEBUG_LED13,
  output DEBUG_LED14,
  output DEBUG_LED15,
  output DEBUG_LED16,
  output DEBUG_LED17,
  output DEBUG_LED18,
  output DEBUG_LED19,
  output DEBUG_LED20,
  //output LED_D23,
  //output LED_D47,
 
	// RAM
  output wire RAM_A0,
  //output wire RAM_A1,
  //output wire RAM_A2,
  //output wire RAM_A3,
  output wire RAM_A4,
  //output wire RAM_A5,
  //output wire RAM_A6,
  output wire RAM_A7,
  //output wire RAM_A8,
  //output wire RAM_A9,
  //output wire RAM_A10,
  //output wire RAM_A11,
  output wire RAM_A12,
  output wire RAM_A13  
);

assign USEROUT0 = run ? Open_Collector[1] : 1'b0;					
assign USEROUT1 = run ? Open_Collector[2] : 1'b0;   				
assign USEROUT2 = run ? Open_Collector[3] : 1'b0;  					
assign USEROUT3 = run ? Open_Collector[4] : 1'b0;  		
assign USEROUT4 = run ? Open_Collector[5] : 1'b0; 
assign USEROUT5 = run ? Open_Collector[6] : 1'b0; 
assign USEROUT6 = run ? Open_Collector[7] : 1'b0; 

assign RAM_A0  = 0;
//assign RAM_A1  = 0;
//assign RAM_A2  = 0;
//assign RAM_A3  = 0;
assign RAM_A4  = 0;
//assign RAM_A5  = 0;
//assign RAM_A6  = 0;
assign RAM_A7  = 0;
//assign RAM_A8  = 0;
//assign RAM_A9  = 0;
//assign RAM_A10  = 0;
//assign RAM_A11  = 0;
assign RAM_A12  = 0;
assign RAM_A13  = 0;

assign PGA = 0;								// 1 = gain of 3dB, 0 = gain of 0dB
assign PGA_2 = 0;
assign SHDN = 1'b0;				   		// normal LTC2208 operation
assign SHDN_2 = 1'b0;

assign atu_ctrl = run ? AUTO_TUNE : 1'b0;		// high turns on auto-tune for 7/8000DLE

assign NCONFIG = IP_write_done || reset_FPGA;


initial DRIVER_PA_EN = 1'b0;					// ensure PA bias is OFF initially

assign  DRIVER_PA_EN = FPGA_PTT; 			// PA bias switching, low turns PA bias ON during Tx

assign  CTRL_TRSW = FPGA_PTT && XVTR_ENABLE;

// NOTE: Orion FPGA can fit up to 14 RXs but the bootloader is limiting file size to 2MB
// the Orion.rbf is over that when > 10 RXs
localparam NR = 8;	// number of receivers to implement
localparam master_clock = 122880000; 	// DSP  master clock in Hz.

parameter M_TPD   = 4;
parameter IF_TPD  = 2;

localparam board_type = 8'h05;		  	// 00 for Metis, 01 for Hermes, 02 for Griffin, 03 for Angelia, and 05 for Orion
parameter  Orion_version = 8'd22;			// FPGA code version
parameter  beta_version = 8'd4;	// Should be 0 for official release
parameter  protocol_version = 8'd43;	// openHPSDR protocol version implemented

//--------------------------------------------------------------
// Reset Lines - C122_rst, IF_rst, SPI_Alex_reset
//--------------------------------------------------------------

wire  IF_rst;
wire SPI_Alex_rst;
wire C122_rst;
//wire SPI_clk;
	
assign IF_rst = !network_state;  // hold code in reset until Ethernet code is running.
//assign PHY_RESET_N = 1'b1;

// transfer IF_rst to 122.88MHz clock domain to generate C122_rst
cdc_sync #(1)
	reset_C122 (.siga(IF_rst), .rstb(0), .clkb(C122_clk), .sigb(C122_rst)); // 122.88MHz clock domain reset

// ***RRK I dont think PHY_RESET_N can be used as an input (blocking diode)!
// PHY_RESET_N will go high after ~100ms due to RC, use to create Alex reset pulse
pulsegen reset_Alex  (.sig(PHY_RESET_N), .rst(0), .clk(CBCLK), .pulse(SPI_Alex_rst));

//cdc_sync #(1)
//	reset_Alex (.siga(run), .rstb(0), .clkb(CBCLK), .sigb(SPI_Alex_rst));  // SPI_clk domain reset
	
// Deadman timer - clears run if HW_timer_enable and no C&C commands received for ~2 seconds.

wire timer_reset = (HW_reset1 | HW_reset2 | HW_reset3 | HW_reset4);

reg [27:0] sec_count;
wire HW_timeout;
always @ (posedge rx_clock)
begin
	if (HW_timer_enable) begin
		if (timer_reset) sec_count <= 28'b0;
		else if (sec_count < 28'd250_000_000) 	// approx 2 secs. 
			sec_count <= sec_count + 28'b1;
	end
	else sec_count <= 28'd0;
end

 assign HW_timeout = (sec_count >= 28'd250_000_000) ? 1'd1 : 1'd0;


//---------------------------------------------------------
//		CLOCKS
//---------------------------------------------------------

wire C122_clk = LTC2208_122MHz;
//wire C122_clk_2 = LTC2208_122MHz_2;
wire CLRCLK;
assign CLRCIN  = CLRCLK;
assign CLRCOUT = CLRCLK;


wire IF_locked;
//wire C122_cbrise;
wire _122_90;

// Generate _122_90 (122.88Mhz 90deg) CMCLK (12.288MHz), CBCLK(3.072MHz) and CLRCLK (48kHz) from 122.88MHz using PLL
// NOTE: CBCLK is generated at 180 degs, as in P1: so that LRCLK occurs on negative edge of BCLK
PLL_IF PLL_IF_inst (.inclk0(C122_clk), .c0(_122_90), .c1(CMCLK), .c2(CBCLK), .c3(CLRCLK), .locked(IF_locked));
//pulsegen pulse  (.sig(CBCLK), .rst(IF_rst), .clk(!CMCLK), .pulse(C122_cbrise));  // pulse on rising edge of BCLK for Rx/Tx frequency calculations

//-----------------------------------------------------------------------------
//                           network module
//-----------------------------------------------------------------------------

wire network_state;
wire clock_12_5MHz;
wire [7:0] network_status;
wire rx_clock;
wire tx_clock;
wire udp_rx_active;
wire [7:0] udp_rx_data;
wire udp_tx_active;
wire [47:0] local_mac;	
wire broadcast;
wire [15:0] udp_tx_length;
wire [7:0] udp_tx_data;
wire udp_tx_request;
wire udp_tx_enable;
wire set_ip;
wire IP_write_done;	
wire static_ip_assigned;
wire dhcp_timeout;
wire dhcp_success;
wire icmp_rx_enable;
reg is_9031;

network network_inst (

		// inputs
  .udp_tx_request(udp_tx_request),
  .udp_tx_data(udp_tx_data),  
  .set_ip(set_ip),
  .assign_ip(assign_ip),
  .port_ID(port_ID), 
  
  // outputs
  .clock_12_5MHz(clock_12_5MHz),
  .rx_clock(rx_clock),
  .tx_clock(tx_clock),
  .broadcast(broadcast),
  .udp_rx_active(udp_rx_active),
  .udp_rx_data(udp_rx_data),
  .udp_tx_length(udp_tx_length),
  .udp_tx_active(udp_tx_active),
  .local_mac(local_mac),
  .udp_tx_enable(udp_tx_enable), 
  .IP_write_done(IP_write_done),
  .icmp_rx_enable(icmp_rx_enable),   // test for ping bug
  .to_port(to_port),   					// UDP port the PC is sending to
  .is_9031(is_9031),

	// status outputs
  .network_state(network_state),	
  .network_status(network_status),
  .static_ip_assigned(static_ip_assigned),
  .dhcp_timeout(dhcp_timeout),
  .dhcp_success(dhcp_success),

  //make hardware pins available inside this module
  .PHY_TX(PHY_TX),
  .PHY_TX_EN(PHY_TX_EN),            
  .PHY_TX_CLOCK(PHY_TX_CLOCK),         
  .PHY_RX(PHY_RX),     
  .PHY_DV(RX_DV),    					// use PHY_DV to be consistent with Metis            
  .PHY_RX_CLOCK(PHY_RX_CLOCK),         
  .PHY_CLK125(PHY_CLK125),           
  .PHY_MDIO(PHY_MDIO),             
  .PHY_MDC(PHY_MDC),
  .SCK(SCK),                  
  .SI(SI),                   
  .SO(SO), 				
  .CS(CS)
  );

//-----------------------------------------------------------------------------
//                          sdr receive
//-----------------------------------------------------------------------------
wire sending_sync;
wire discovery_reply;
wire pc_send;
wire debug;
wire seq_error;
wire erase_ACK;
wire EPCS_FIFO_enable;
wire erase;	
wire send_more;
wire send_more_ACK;
wire set_up;
wire [31:0] assign_ip;
wire [15:0]to_port;
wire [31:0] PC_seq_number;				// sequence number sent by PC when programming
wire discovery_ACK;
wire discovery_ACK_sync;


sdr_receive sdr_receive_inst(
	//inputs 
	.rx_clock(rx_clock),
	.udp_rx_data(udp_rx_data),
	.udp_rx_active(udp_rx_active),
	.sending_sync(sending_sync),
	.broadcast(broadcast),
	.erase_ACK(busy),						// set when erase is in progress
	.EPCS_wrused(EPCS_wrused),
	.local_mac(local_mac),
	.to_port(to_port),
	.discovery_ACK(discovery_ACK_sync),	// set when discovery reply request received by sdr_send
	
	//outputs
	.discovery_reply(discovery_reply),
	.erase(erase),
	.num_blocks(num_blocks),
	.EPCS_FIFO_enable(EPCS_FIFO_enable),
	.set_ip(set_ip),
	.assign_ip(assign_ip),
	.sequence_number(PC_seq_number)
	);
			        


//-----------------------------------------------------------------------------
//                               sdr rx, tx & IF clock domain transfers
//-----------------------------------------------------------------------------
wire run_sync;
wire wideband_sync;
wire discovery_reply_sync;

// transfer tx clock domain signals to rx clock domain
sync sync_inst1(.clock(rx_clock), .sig_in(udp_tx_active), .sig_out(sending_sync));   
sync sync_inst2(.clock(rx_clock), .sig_in(discovery_ACK), .sig_out(discovery_ACK_sync));

// transfer rx clock domain signals to tx clock domain  
sync sync_inst5(.clock(tx_clock), .sig_in(discovery_reply), .sig_out(discovery_reply_sync)); 
sync sync_inst6(.clock(tx_clock), .sig_in(run), .sig_out(run_sync)); 
sync sync_inst7(.clock(tx_clock), .sig_in(wideband), .sig_out(wideband_sync));


//-----------------------------------------------------------------------------
//                          sdr send
//-----------------------------------------------------------------------------

wire [7:0] port_ID;
wire [7:0]Mic_data;
wire mic_fifo_rdreq;
wire [8:0]Rx_data[0:NR-1];
wire fifo_ready[0:NR-1];
wire fifo_rdreq[0:NR-1];
logic [15:0] checksum;

sdr_send #(board_type, NR, master_clock, protocol_version) sdr_send_inst(
	//inputs
	.tx_clock(tx_clock),
	.udp_tx_active(udp_tx_active),
	.discovery(discovery_reply_sync),
	.run(run_sync),
	.wideband(wideband_sync),
	.sp_data_ready(sp_data_ready),
	.sp_fifo_rddata(sp_fifo_rddata),		// **** why the odd name - use spectrum_data ?
	.local_mac(local_mac),
	.code_version(Orion_version),
	.beta_version(beta_version),
	.Rx_data(Rx_data),						// Rx I&Q data to send to PHY
	.udp_tx_enable(udp_tx_enable),
	.erase_done(erase_done | erase),    // send ACK when erase command received and when erase complete
	.send_more(send_more),
	.Mic_data(Mic_data),						// mic data to send to PHY
	.fifo_ready(fifo_ready),				// data available in Rx fifo
	.mic_fifo_ready(mic_fifo_ready),		// data avaiable in mic fifo
	.CC_data_ready(CC_data_ready),      // C&C data availble 
	.CC_data(CC_data),
	.sequence_number(PC_seq_number),		// sequence number to send when programming and requesting more data
	//.samples_per_frame(samples_per_frame),
	//.tx_length(tx_length),
	.Wideband_packets_per_frame(Wideband_packets_per_frame),  
	.checksum(checksum),  
	
	//outputs
	.udp_tx_data(udp_tx_data),
	.udp_tx_length(udp_tx_length),
	.udp_tx_request(udp_tx_request),
	.fifo_rdreq(fifo_rdreq),				// high to indicate read from Rx fifo required
	.sp_fifo_rdreq	(sp_fifo_rdreq	),		// high to indicate read from spectrum fifo required
	.erase_done_ACK(erase_done_ACK),		
	.send_more_ACK(send_more_ACK),
	.port_ID(port_ID),
	.mic_fifo_rdreq(mic_fifo_rdreq),		// high to indicate read from mic fifo required
	.CC_ack(CC_ack),							// ack to CC_encoder that send request received
	.WB_ack(WB_ack),							// ack to WB controller that send request received	
	.phy_ready(phy_ready),					// set when PHY is not sending DDC data
	.discovery_ACK(discovery_ACK) 		// set to acknowlege discovery reply received
	 ); 		

//---------------------------------------------------------
// 		Set up TLV320 using SPI 
//---------------------------------------------------------


TLV320_SPI TLV (.clk(CMCLK), .CMODE(CMODE), .nCS(nCS), .MOSI(MOSI), .SSCK(SSCK), .boost(Mic_boost), .line(Line_In), .line_in_gain(Line_In_Gain));

//-------------------------------------------------------------------------
//			Determine number of I&Q samples per frame when in Sync or Mux mode
//-------------------------------------------------------------------------

`ifdef DONT
reg [15:0] samples_per_frame[0:NR-1] ;
reg [15:0] tx_length[0:NR-1];				// calculate length of Tx packet here rather than do it at high speed in the Ethernet code. 

generate
genvar j;

for (j = 0 ; j < NR; j++)
	begin:q

		always @ (*)
		begin 
			samples_per_frame[j] <= 16'd238;
			tx_length[j] <= 16'd1444;
	   end 
	end

endgenerate

`endif

//------------------------------------------------------------------------
//   Rx(n)_fifo  (2k Bytes) Dual clock FIFO - Altera Megafunction (dcfifo)
//------------------------------------------------------------------------

/*
	  
						   +-------------------+
     Rx(n)_fifo_data                               |data[7:0]     wrful| Rx(n)_fifo_full
						   |                   |
     Rx(n)_fifo_wreq                               |wreq               | 
						   |                   |
           C122_clk                                |>wrclk  wrused[9:0]| 
                                                   +-------------------+
     fifo_rdreq[n]                                 |rdreq        q[7:0]| Rx_data[n]
                                                   |                   |
        tx_clock                                   |>rdclk     rdempty | Rx_fifo_empty[n]
                                                   |                   |
						   |      rdusedw[10:0]| Rx(n)_used  (0 to 2047 bytes)
						   +-------------------+
                                                   |                   |
   Rx_fifo_clr[n] OR                               |aclr               |
         IF_rst	OR !run                            +-------------------+
         OR fifo_clear
		
    

*/

wire 			Rx_fifo_wreq[0:NR-1];
wire  [8:0] Rx_fifo_data[0:NR-1];
wire        Rx_fifo_full[0:NR-1];
wire [11:0] Rx_used[0:NR-1];
wire        Rx_fifo_clr[0:NR-1];
wire [NR-1:0] Rx_fifo_empty;
wire 			write_enable;
wire 			phy_ready;
wire 			convert_state;
wire 			C122_run;



// move flags into correct clock domains
wire C122_phy_ready;
cdc_sync #(1) cdc_phyready  (.siga(phy_ready), .rstb(C122_rst), .clkb(C122_clk), .sigb(C122_phy_ready));

cdc_sync #(1) C122_run_sync  (.siga(run), .rstb(C122_rst), .clkb(C122_clk), .sigb(C122_run));
cdc_sync #(8) C122_EnableRx0_7_sync  (.siga(EnableRx0_7), .rstb(C122_rst), .clkb(C122_clk), .sigb(C122_EnableRx0_7));

// This is just for Rx0 since it can sync with Rx1.
		Rx_fifo Rx0_fifo_inst(.wrclk (C122_clk),.rdreq (fifo_rdreq[0]),.rdclk (tx_clock),.wrreq (Rx_fifo_wreq[0]), .rdempty (Rx_fifo_empty[0]),
							 .data (Rx_fifo_data[0]), .q (Rx_data[0]), .wrfull(Rx_fifo_full[0]),
							 .rdusedw(Rx_used[0]), .aclr (IF_rst | Rx_fifo_clr[0] | !C122_run));  											

		Rx_fifo_ctrl #(NR) Rx0_fifo_ctrl_inst( .reset(!C122_run || !C122_EnableRx0_7[0] ), .clock(C122_clk), .data_in_I(rx_I[1]), .data_in_Q(rx_Q[1]),
							.spd_rdy(strobe[0]), .spd_rdy2(strobe[1]), .spd_rdy3(strobe[NR]), .fifo_full(Rx_fifo_full[0]), .data_in_IDAC(rx_I[NR]), .data_in_QDAC(rx_Q[NR]),
							.wrenable(Rx_fifo_wreq[0]), .data_out(Rx_fifo_data[0]), .fifo_clear(Rx_fifo_clr[0]),
							.Sync_data_in_I(rx_I[0]), .Sync_data_in_Q(rx_Q[0]), .Sync(C122_SyncRx[0][1]), .ps(C122_RxADC[1] == 8'd2));	

		always @ (posedge tx_clock)    
			fifo_ready[0] = (Rx_used[0] > 12'd2047) ? 1'b1 : 1'b0;  // used to signal that fifo has enough data to send to PC
			//fifo_ready[0] = (Rx_used[0] > 12'd1427) ? 1'b1 : 1'b0;  // used to signal that fifo has enough data to send to PC
													
// When Mux first set, inhibit fifo write then wait for PHY to be looking for more Rx0 data to ensure there is no data in transit.
// Then reset fifo then wait for 48 to 8 converter to be looking for Rx0 DDC data at first byte. Then enable write to fifo again.

generate
genvar d;

for (d = 1 ; d < NR; d++)
	begin:p

		Rx_fifo RxX_fifo_inst(.wrclk (C122_clk),.rdreq (fifo_rdreq[d]),.rdclk (tx_clock),.wrreq (Rx_fifo_wreq[d]), .rdempty(Rx_fifo_empty[d]),
							 .data (Rx_fifo_data[d]), .q (Rx_data[d]), .wrfull(Rx_fifo_full[d]),
							 .rdusedw(Rx_used[d]), .aclr (IF_rst | Rx_fifo_clr[d] | !C122_run));

		// Convert 48 bit Rx I&Q data (24bit I, 24 bit Q) into 8 bits to feed Tx FIFO. Only run if EnableRx0_7[x] is set.
		// If Sync[n] enabled then select the data from the receiver to be synchronised.
		// Do this by using C122_SyncRx(n) to select the required receiver I & Q data.

		Rx_fifo_ctrl #(NR) RxX_fifo_ctrl_inst( .reset(!C122_run || !C122_EnableRx0_7[d]), .clock(C122_clk), .data_in_I(), .data_in_Q(),
							.spd_rdy(strobe[d]), .spd_rdy2(), .fifo_full(Rx_fifo_full[d]), .SampleRate(C122_SampleRate[d]),
							.wrenable(Rx_fifo_wreq[d]), .data_out(Rx_fifo_data[d]), .fifo_clear(Rx_fifo_clr[d]),
							.Sync_data_in_I(rx_I[d]), .Sync_data_in_Q(rx_Q[d]), .Sync(1'b0));
													
		always @ (posedge tx_clock)    
			fifo_ready[d] = (Rx_used[d] > 12'd2047) ? 1'b1 : 1'b0;  // used to signal that fifo has enough data to send to PC
			//fifo_ready[d] = (Rx_used[d] > 12'd1427) ? 1'b1 : 1'b0;  // used to signal that fifo has enough data to send to PC

	end
endgenerate

											  
//------------------------------------------------------------------------
//   Mic_fifo  (1024 words) Dual clock FIFO - Altera Megafunction (dcfifo)
//------------------------------------------------------------------------

/*
						   +-------------------+
         mic_data 	|data[15:0]	  wrfull| 
						   |				        |
		mic_data_ready	|wrreq		        |
						   |					     |
				 CBCLK	|>wrclk	           | 
						   +-------------------+
   mic_fifo_rdreq		|rdreq		  q[7:0]| Mic_data
						   |					     |
	     tx_clock		|>rdclk		        | 
						   |		 rdusedw[11:0]| mic_rdused* (0 to 2047 bytes)
						   +-------------------+
			            |                   |
	         !run  	|aclr               |
				         +-------------------+
							
		* additional bit added so not zero when full.
		LSByte of input data is output first
	
*/

wire [11:0]	mic_rdused; 
							  
Mic_fifo Mic_fifo_inst(.wrclk (CBCLK),.rdreq (mic_fifo_rdreq),.rdclk (tx_clock),.wrreq (mic_data_ready), 
							  .data ({mic_data[7:0], mic_data[15:8]}), .q (Mic_data), .wrfull(),
                       .rdusedw(mic_rdused), .aclr(!run)); 

wire mic_fifo_ready = mic_rdused > 12'd131 ? 1'b1 : 1'b0;		// used to indicate that fifo has enough data to send to PC.					  
							  
//----------------------------------------------
//		Get mic data from  TLV320 in I2S format 
//---------------------------------------------- 

wire [15:0] mic_data;
wire mic_data_ready;

mic_I2S mic_I2S_inst (.clock(CBCLK), .CLRCLK(CLRCLK), .in(CDOUT), .mic_data(mic_data), .ready(mic_data_ready));

	 
//------------------------------------------------
//   SP_fifo  (16384 words) dual clock FIFO
//------------------------------------------------

/*
        The spectrum data FIFO is 16 by 16384 words long on the input.
        Output is in Bytes for easy interface to the PHY code
        NB: The output flags are only valid after a read/write clock has taken place

       
							   SP_fifo
						+--------------------+
  Wideband_source |data[15:0]	   wrfull| sp_fifo_wrfull
						|				         |
	sp_fifo_wrreq	|wrreq	     wrempty| sp_fifo_wrempty
						|				         |
			C122_clk	|>wrclk              | 
						+--------------------+
	sp_fifo_rdreq	|rdreq		   q[7:0]| sp_fifo_rddata
						|                    | 
						|				         |
		 tx_clock	|>rdclk		         | 
						|		               | 
						+--------------------+
						|                    |
	   !wideband   |aclr                |
		      	   |                    |
	    				+--------------------+
		
*/

wire  sp_fifo_rdreq;
wire [7:0]sp_fifo_rddata;
wire sp_fifo_wrempty;
wire sp_fifo_wrfull;
wire sp_fifo_wrreq;


//-----------------------------------------------------------------------------
//   Wideband Spectrum Data 
//-----------------------------------------------------------------------------

//	When sp_fifo_wrempty fill fifo with 'user selected' # words of consecutive ADC samples.
// Pass sp_data_ready to sdr_send to indicate that data is available.
// Reset fifo when !wideband so the data always starts at a known state.
// The time between fifo fills is set by the user (0-255mS). . The number of  samples sent per UDP frame is set by the user
// (default to 1024) as is the sample size (defaults to 16 bits).
// The number of frames sent, per fifo fill, is set by the user - currently set at 8 i.e. 4,096 samples. 


wire have_sp_data;

wire wideband = (Wideband_enable[0] | Wideband_enable[1]);  							// enable Wideband data if either selected
wire [15:0] Wideband_source = Wideband_enable[0] ? temp_ADC[0] : temp_ADC[1];	// select Wideband data source ADC0 or ADC1

SP_fifo  SPF (.aclr(!wideband), .wrclk (C122_clk), .rdclk(tx_clock), 
             .wrreq (sp_fifo_wrreq), .data ({Wideband_source[7:0], Wideband_source[15:8]}), .rdreq (sp_fifo_rdreq),
             .q(sp_fifo_rddata), .wrfull(sp_fifo_wrfull), .wrempty(sp_fifo_wrempty)); 	
				 
sp_rcv_ctrl SPC (.clk(C122_clk), .reset(0), .sp_fifo_wrempty(sp_fifo_wrempty),
                 .sp_fifo_wrfull(sp_fifo_wrfull), .write(sp_fifo_wrreq), .have_sp_data(have_sp_data));	
				 
// **** TODO: change number of samples in FIFO (presently 16k) based on user selection **** 


// wire [:0] update_rate = 100T ?  12500 : 125000; // **** TODO: need to change counter target when run at 100T.
wire [17:0] update_rate = 125000;

reg  sp_data_ready;
reg [24:0]wb_counter;
wire WB_ack;

always @ (posedge tx_clock)	
begin
	if (wb_counter == (Wideband_update_rate * update_rate)) begin	  // max delay 255mS
		wb_counter <= 25'd0;
		if (have_sp_data & wideband) sp_data_ready <= 1'b1;	  
	end
	else begin 
			wb_counter <= wb_counter + 25'd1;
			if (WB_ack) sp_data_ready <= 0;  // wait for confirmation that request has been seen
	end
end	


//----------------------------------------------------
//   					Rx_Audio_fifo
//----------------------------------------------------

/*
							  Rx_Audio_fifo (4k) 
							
								+--------------------+
				 audio_data |data[31:0]	  wrfull | Audio_full
								|				         |
	Rx_Audio_fifo_wrreq	|wrreq				   |
								|					      |									    
				 rx_clock	|>wrclk	 		      |
								+--------------------+								
	  get_audio_samples  |rdreq		  q[31:0]| LR_data 
								|					      |					  			
								|   		            | 
								|            rdempty | Audio_empty 							
				    CBCLK	|>rdclk              |    
								+--------------------+								
								|                    |
		  !run OR IF_rst  |aclr                |								
								+--------------------+	
								
	Only request audio samples if fifo not empty 						
*/

wire Rx_Audio_fifo_wrreq;
wire  [31:0] temp_LR_data;
wire  [31:0] LR_data;
wire get_audio_samples;  // request audio samples at 48ksps
wire Audio_full;
wire Audio_empty;
wire get_samples;
wire [31:0]audio_data;
reg [12:0]Rx_Audio_Used;

Rx_Audio_fifo Rx_Audio_fifo_inst(.wrclk (rx_clock),.rdreq (get_audio_samples),.rdclk (CBCLK),.wrreq(Rx_Audio_fifo_wrreq), 
			.rdusedw(Rx_Audio_Used), .data (audio_data),.q (LR_data), .aclr(IF_rst | !run), .wrfull(Audio_full), .rdempty(Audio_empty));
					 
// Manage Rx Audio data to feed to Audio FIFO  - parameter is port #
byte_to_32bits #(1028) Audio_byte_to_32bits_inst
			(.clock(rx_clock), .run(run), .udp_rx_active(udp_rx_active), .udp_rx_data(udp_rx_data), .to_port(to_port),
			 .fifo_wrreq(Rx_Audio_fifo_wrreq), .data_out(audio_data), .sequence_errors(Audio_sequence_errors), .full(Audio_full));
			
// select sidetone when CW key active and sidetone_level is not zero else Rx audio.
reg [31:0] Rx_audio;
wire [33:0] Mixed_audio;
wire signed [31:0] Mixed_LR;
wire signed [15:0] Mixed_side;
reg [5:0] Mix_count = 6'd0;

// if break_in (QSK) mix in rx audio as well
always @ (posedge CBCLK)    
begin
    Mix_count <= Mix_count + 1'd1;
    case (Mix_count)
        56:
        begin
            Mixed_side <= (prof_sidetone + 16'd32768) >> 1;
            Mixed_LR[31:16] <= (LR_data[31:16] + 16'd32768) >> 1;
            Mixed_LR[15:0] <= (LR_data[15:0] + 16'd32768) >> 1;
        end

        58:
        begin
            Mixed_audio[33:17] <=  (Mixed_LR[31:16] + Mixed_side) - (Mixed_LR[31:16] * Mixed_side / 17'd65536);
            Mixed_audio[16:0] <=  (Mixed_LR[15:0] + Mixed_side) - (Mixed_LR[15:0] * Mixed_side / 17'd65536);
        end

        60:
        begin
            if (Mixed_audio[33:17] == 17'd65536)
                Mixed_audio[33:17] <= 17'd65535;
            if (Mixed_audio[16:0] == 17'd65536)
                Mixed_audio[16:0] <= 17'd65535;
        end

        62:
        begin
            if (CW_PTT && sidetone)
            begin
                if (break_in)
                begin
                    Rx_audio[31:16] <= Mixed_audio[33:17] - 17'd32768;
                    Rx_audio[15:0] <= Mixed_audio[16:0] - 17'd32768;
                end
                else
                    Rx_audio <= {prof_sidetone, prof_sidetone};
            end
            else
                Rx_audio <= LR_data;
        end
    endcase
end

// send receiver audio to TLV320 in I2S format, swap L&R
audio_I2S audio_I2S_inst (.run(run), .empty(Audio_empty), .BCLK(CBCLK), .rdusedw(Rx_Audio_Used), .LRCLK(CLRCLK), .data_in({Rx_audio[15:0], Rx_audio[31:16]}), .data_out(CDIN), .get_data(get_audio_samples)); 


//----------------------------------------------------
//   					Tx1_IQ_fifo
//----------------------------------------------------

/*
							   Tx1_IQ_fifo (4k) 
							
								+--------------------+
			 Tx1_IQ_data   |data[47:0]	         | 
								|				         |
			Tx1_fifo_wrreq |wrreq  wrusedw[11:0]|	write_used[11:0]	
								|					      |									    
				 rx_clock	|>wrclk	 		      |
								+--------------------+								
	               req1  |rdreq		  q[47:0]| C122_IQ1_data
								|					      |					  			
								|   		            | 
								|                    | 							
				  _122MHz	|>rdclk              | 	    
								+--------------------+								
								|                    |
		  !run | IF_rst   |aclr                |								
								+--------------------+	
								
*/

wire Tx1_fifo_wrreq;
wire [47:0]C122_IQ1_data;
wire [47:0]Tx1_IQ_data;
wire [12:0]write_used;

Tx1_IQ_fifo Tx1_IQ_fifo_inst(.wrclk (rx_clock),.rdreq (req1),.rdclk (C122_clk),.wrreq(Tx1_fifo_wrreq), 
					 .data (Tx1_IQ_data), .q(C122_IQ1_data), .aclr(!run | IF_rst), .wrusedw(write_used));
					 
// Manage Tx I&Q data to feed to Tx  - parameter is port #
byte_to_48bits #(1029) IQ_byte_to_48bits_inst
			(.clock(rx_clock), .run(run), .udp_rx_active(udp_rx_active), .udp_rx_data(udp_rx_data), .to_port(to_port),
			 .fifo_wrreq(Tx1_fifo_wrreq), .data_out(Tx1_IQ_data), .full(1'b0), .sequence_errors(DUC_sequence_errors));

// Ensure I&Q data is zero if not transmitting
wire [47:0] IQ_Tx_data = FPGA_PTT ? C122_IQ1_data : 48'b0; 													

// indicate how full or empty the FIFO is - was required by Simon G4ELI code but no longer required. 
//wire almost_full 	= (write_used > 13'd3584) ? 1'b1 : 1'b0; //(write_used[11:8] == 4'b1111) ? 1'b1 : 1'b0;  // >= 3,840 samples
//wire almost_empty = (write_used < 13'd512)  ? 1'b1 : 1'b0; //(write_used[11:9] == 4'b0001) ? 1'b1 : 1'b0;  // <= 511 samples




													
//--------------------------------------------------------------------------
//			EPCS16 Erase and Program code 
//--------------------------------------------------------------------------

/*
					    EPCS_fifo (1k bytes) 
					
					    +-------------------+
	  udp_rx_data   |data[7:0]	         | 
					    |				         |
 EPCS_FIFO_enable  |wrreq		         | 
					    |					      |									    
	    rx_clock	 |>wrclk wrusedw[9:0]| EPCS_wrused
					    +-------------------+								
	   EPCS_rdreq   |rdreq		  q[7:0] | EPCS_data
					    |					      |					  			
			     	    |   		            |  
			          |                   | 							
     clock_12_5MHz |>rdclk rdusedw[9:0]| EPCS_Rx_used	    
					    +-------------------+								
					    |                   |
			  IF_rst  |aclr               |								
					    +-------------------+						
*/

wire [7:0]EPCS_data;
wire [10:0]EPCS_Rx_used;
wire  EPCS_rdreq;
wire [31:0] num_blocks;  
wire EPCS_full;
wire [10:0] EPCS_wrused;


EPCS_fifo EPCS_fifo_inst(.wrclk (rx_clock),.rdreq (EPCS_rdreq),.rdclk (clock_12_5MHz),.wrreq(EPCS_FIFO_enable),  
                .data (udp_rx_data),.q (EPCS_data), .rdusedw(EPCS_Rx_used), .aclr(IF_rst), .wrusedw(EPCS_wrused));

//----------------------------
// 			ASMI Interface
//----------------------------
wire busy;				 // drives LED
wire erase_done;
wire erase_done_ACK;
wire reset_FPGA;

ASMI_interface  ASMI_int_inst(.clock(clock_12_5MHz), .busy(busy), .erase(erase), .erase_ACK(erase_ACK), .IF_PHY_data(EPCS_data), .EPCS_flash(MODE2),
					 .IF_Rx_used(EPCS_Rx_used), .rdreq(EPCS_rdreq), .erase_done(erase_done), .num_blocks(num_blocks), .checksum(checksum),
					 .send_more(send_more), .send_more_ACK(send_more_ACK), .erase_done_ACK(erase_done_ACK), .NCONFIG(reset_FPGA)); 
							 
//--------------------------------------------------------------------------------------------
//  	Iambic CW Keyer
//--------------------------------------------------------------------------------------------

wire keyout;

// parameter is clock speed in kHz.
iambic #(48) iambic_inst (.clock(CLRCLK), .cw_speed(keyer_speed),  .iambic(iambic), .keyer_mode(keyer_mode), .weight(keyer_weight), 
                          .letter_space(keyer_spacing), .dot_key(!KEY_DOT | Dot), .dash_key(!KEY_DASH | Dash),
								  .CWX(CWX), .paddle_swap(key_reverse), .keyer_out(keyout), .IO8(debounce_IO8));
						  
//--------------------------------------------------------------------------------------------
//  	Calculate  Raised Cosine profile for sidetone and CW envelope when internal CW selected 
//--------------------------------------------------------------------------------------------

wire CW_char;
assign CW_char = (keyout & internal_CW & run);		// set if running, internal_CW is enabled and either CW key is active
wire [15:0] CW_RF;
wire [15:0] profile;
wire CW_PTT;

profile profile_sidetone (.clock(CLRCLK), .CW_char(CW_char), .profile(profile),  .delay(8'd0));
profile profile_CW       (.clock(CLRCLK), .CW_char(CW_char), .profile(CW_RF),    .delay(RF_delay), .hang(hang), .PTT(CW_PTT));

//--------------------------------------------------------
//			Generate CW sidetone with raised cosine profile
//--------------------------------------------------------	
wire signed [15:0] prof_sidetone;
sidetone sidetone_inst( .clock(CLRCLK), .enable(sidetone), .tone_freq(tone_freq), .sidetone_level(sidetone_level), .CW_PTT(CW_PTT),
                        .prof_sidetone(prof_sidetone),  .profile(profile >>> 1));	// divide sidetone profile level by two since only 16 bits used
				
				
//-------------------------------------------------------
//		De-ramdomizer
//--------------------------------------------------------- 

/*

 A Digital Output Randomizer is fitted to the LTC2208. This complements bits 15 to 1 if 
 bit 0 is 1. This helps to reduce any pickup by the A/D input of the digital outputs. 
 We need to de-ramdomize the LTC2208 data if this is turned on. 
 
*/

reg [15:0]temp_ADC[0:1];
//reg [15:0] DAC; // move DAC data into Rx clock domain for PureSignal use.
reg [15:0] temp_DACD;
//reg [15:0] x;

always @ (posedge _122_90)
	temp_DACD <={C122_cordic_i_out[21:8], 2'b00};
	//temp_DACD <= C122_cordic_i_out[22:7]; 	//for predistortion use (PureSignal)


always @ (posedge C122_clk) 
begin 

	 //{DAC,x} <= {x, C122_cordic_i_out[21:8], 2'b0}; // make DAC 16-bits, use high bits for DAC

   if (RAND) begin	// RAND set so de-ramdomize
		if (INA[0]) temp_ADC[0] <= {~INA[15:1],INA[0]};
		else temp_ADC[0] <= INA;
	end
   else temp_ADC[0] <= INA;  // not set so just copy data	 
		
	if (RAND_2) begin
		if (INA_2[0]) temp_ADC[1] <= {~INA_2[15:1], INA_2[0]};
		else temp_ADC[1] <= INA_2;	
	end
	else temp_ADC[1] <= INA_2;
	
end 



//------------------------------------------------------------------------------
//                 All DSP code is in the Receiver module
//------------------------------------------------------------------------------

wire      [31:0] C122_frequency_HZ [0:NR-1];   // frequency control bits for CORDIC
reg       [31:0] C122_frequency_HZ_Tx;
reg       [31:0] C122_last_freq [0:NR-1];
reg       [31:0] C122_last_freq_Tx;
//reg       [31:0] C122_sync_phase_word [0:NR-1];
//reg       [31:0] C122_sync_phase_word_Tx;
wire      [63:0] C122_ratio [0:NR-1];
wire      [63:0] C122_ratio_Tx;
wire      [23:0] rx_I [0:NR];
wire      [23:0] rx_Q [0:NR];
wire             strobe [0:NR];
wire      [15:0] C122_SampleRate[0:NR-1]; 
wire       [7:0] C122_RxADC[0:NR-1];
wire       [7:0] C122_SyncRx[0:NR-1];
wire      [31:0] C122_phase_word[0:NR-1]; 
wire [15:0] select_input_RX[0:NR-1];		// set receiver module input sources
//reg              frequency_change[0:NR-1];  // bit set when frequency of Rx[n] changes

generate
genvar c;
  for (c = 0; c < NR; c = c + 1) 
   begin: MDC
	
	// Move RxADC[n] to C122 clock domain
	cdc_mcp #(16) ADC_select
	(.a_rst(C122_rst), .a_clk(rx_clock), .a_data(RxADC[c]), .a_data_rdy(Rx_data_ready), .b_rst(C122_rst), .b_clk(C122_clk), .b_data(C122_RxADC[c]));


	// Move Rx[n] sample rate to C122 clock domain
	cdc_mcp #(16) S_rate
	(.a_rst(C122_rst), .a_clk(rx_clock), .a_data(RxSampleRate[c]), .a_data_rdy(Rx_data_ready), .b_rst(C122_rst), .b_clk(C122_clk), .b_data(C122_SampleRate[c]));

	// move Rx phase words to C122 clock domain
	cdc_sync #(32) Rx_freqX
	(.siga(Rx_frequency[c]), .rstb(C122_rst), .clkb(C122_clk), .sigb(C122_frequency_HZ[c]));

	if (c > 0) begin
	receiver2 receiver_instX(   
	//control
	//.reset(fifo_clear || !C122_run),
	.reset(!C122_run),
	.clock(C122_clk),
	.sample_rate(C122_SampleRate[c]),
	.frequency(C122_frequency_HZ[c]),     // PC send phase word now
	.out_strobe(strobe[c]),
	//input
	.in_data((C122_RxADC[c]==8'd1)?temp_ADC[1]:temp_ADC[0]),
	//output
	.out_data_I(rx_I[c]),
	.out_data_Q(rx_Q[c])
	);
	end
  end
endgenerate

	receiver2 receiver_instDAC(   
	//control
	.reset(!C122_run),
	.clock(C122_clk),
	.sample_rate(C122_SampleRate[0]),
	.frequency(C122_frequency_HZ[0]),
	.out_strobe(strobe[NR]),
	//input
	.in_data(temp_DACD),
	//output
	.out_data_I(rx_I[NR]),
	.out_data_Q(rx_Q[NR])
	);

	receiver2 receiver_inst0(   
	//control
	//.reset(fifo_clear || !C122_run),
	.reset(!C122_run),
	.clock(C122_clk),
	.sample_rate(C122_SampleRate[0]),
	.frequency(C122_frequency_HZ[0]),     // PC send phase word now
	.out_strobe(strobe[0]),
	//input
	.in_data((C122_RxADC[0]==8'd1)?temp_ADC[1]:temp_ADC[0]),
	//output
	.out_data_I(rx_I[0]),
	.out_data_Q(rx_Q[0])
	);

// only using Rx0 and Rx1 Sync for now so can use simpler code
	// Move SyncRx[n] into C122 clock domain
	cdc_mcp #(8) SyncRx_inst
	(.a_rst(C122_rst), .a_clk(rx_clock), .a_data(SyncRx[0]), .a_data_rdy(Rx_data_ready), .b_rst(C122_rst), .b_clk(C122_clk), .b_data(C122_SyncRx[0]));
	
	
//---------------------------------------------------------
//    ADC SPI interface 
//---------------------------------------------------------
// generate a 30.72MHz clock for the Orion_ADC module, results in a 7.68MHz clock to the ADC78H90 chip
PLL_30MHz PLL_30MHz_inst(.inclk0(C122_clk), .c0(userADC_clock));

wire [11:0] AIN1;  // FWD_power
wire [11:0] AIN2;  // REV_power
wire [11:0] AIN3;  // User 1, PA Voltage
wire [11:0] AIN4;  // User 2, PA Current
wire [11:0] AIN5;  // holds 12 bit ADC value of Forward Voltage detector.
wire [11:0] AIN6;  // holds 12 bit ADC of 13.8v supply measurement 

wire pk_detect_reset;
wire pk_detect_ack;
wire userADC_clock;

Orion_ADC ADC_SPI(.clock(userADC_clock/*CBCLK*/), .SCLK(ADCCLK), .nCS(nADCCS), .MISO(ADCMISO), .MOSI(ADCMOSI),
				   .AIN1(AIN1), .AIN2(AIN2), .AIN3(AIN3), .AIN4(AIN4), .AIN5(AIN5), .AIN6(AIN6),
					.pk_detect_reset(pk_detect_reset), .pk_detect_ack(pk_detect_ack));	
				   

wire Alex_SPI_SDO;
wire Alex_SPI_SCK;
wire SPI_TX_LOAD;
wire SPI_RX_LOAD;

assign SPI_SDO = Alex_SPI_SDO;		// select which module has control of data
assign SPI_SCK = Alex_SPI_SCK;		// and clock for serial data transfer
assign J15_5   = SPI_RX_LOAD;			// Alex Rx_load or Apollo Reset
assign J15_6   = SPI_TX_LOAD;      // Alex Tx_load or Apollo Enable 


	
				   
//---------------------------------------------------------
//                 Transmitter code 
//---------------------------------------------------------	

//---------------------------------------------------------
//  Interpolate by 640 CIC filter
//---------------------------------------------------------

//For interpolation, the growth in word size is  Celi(log2(R^(M-1))
//so for 5 stages and R = 640  = log2(640^4) = 37.28 so use 38

wire req1;
wire [16:0] y2_r, y2_i;

CicInterpM5 #(.RRRR(640), .IBITS(24), .OBITS(17), .GBITS(38)) in2 (C122_clk, 1'd1, req1, IQ_Tx_data[47:24],
					IQ_Tx_data[23:0], y2_r, y2_i); 

	
//------------------------------------------------------
//    CORDIC NCO 
//---------------------------------------------------------

// Code rotates input at set frequency and produces I & Q 
// overall cordic gain is Sqrt(2)*1.647 = 2.33 

wire signed [21:0] C122_cordic_i_out; 				// use 22 bit output from CORDIC to allow for gain
wire signed [31:0] C122_phase_word_Tx;

wire signed [16:0] I;
wire signed [16:0] Q;

// if in VNA mode use the Rx[0] phase word for the Tx
//assign C122_phase_word_Tx = VNA ? C122_sync_phase_word[0] : C122_sync_phase_word_Tx;

// if break_in is selected then CW_PTT can generate RF otherwise PC_PTT must be active.
	
assign I =  VNA ? 17'd19000 : ((CW_PTT & break_in) ? CW_RF: ((CW_PTT & PC_PTT) ?  CW_RF: y2_i));  // select VNA or CW mode if active. 
																																		
// select VNA or CW mode if active else use CIC output 
assign Q = (VNA | CW_PTT)  ? 17'd0 : y2_r; 					


cpl_cordic # (.IN_WIDTH(17)) 
 		cordic_inst (.clock(C122_clk), .frequency(C122_frequency_HZ_Tx), .in_data_I(I),  
		.in_data_Q(Q), .out_data_I(C122_cordic_i_out), .out_data_Q());							// .out_data is 22 bits.
			 	 
/* 
  We can use either the I or Q output from the CORDIC directly to drive the DAC.

    exp(jw) = cos(w) + j sin(w)

  When multplying two complex sinusoids f1 and f2, you get only f1 + f2, no
  difference frequency.

      Z = exp(j*f1) * exp(j*f2) = exp(j*(f1+f2))
        = cos(f1 + f2) + j sin(f1 + f2)
*/

always @ (posedge _122_90)
begin
 	   DACD <= debounce_IO5 ? (16'd32768 + temp_DACD) : 16'b0; 				// convert to 16-bit offset binary format and assign to DACD
		//DACD <= {C122_cordic_i_out[22], ~C122_cordic_i_out[21:7]};  // convert top 16-bits to offset binary for TxDAC
end


//------------------------------------------------------------
//  Set Power Output 
//------------------------------------------------------------

/*
	Code used to set power output depends on hardware. If TX_ATTEN_SELECT is high then PWM DAC drive current is used.
	If low then a digital attenuator (0-31dB in 0.5dB steps) is used to control power output.
	Since 0.5dB steps are too course, the PWM DAC is used for fine control. The selection of attenuator step and DAC PWM 
	settings, based on Drive_Level,is done via ROMs (Tx_Atten and Tx_DAC).

*/
reg [7:0] PWM_count;
always @ (posedge rx_clock)
begin 
	PWM_count <= PWM_count + 1'b1;
	if (Drive_Level >= PWM_count)
		DAC_ALC <= 1'b1;
	else 
		DAC_ALC <= 1'b0;
end 

//---------------------------------------------------------
//              Decode Command & Control data
//---------------------------------------------------------
// Orion mic tip/ring configuration; mic bias enabled/disabled via C&C command above
//
// NOTE:  The Orion Rev3.0.pdf schematic is labeled incorrectly relative to how the Orion (Mk I) board is actually wired:
//		U29 pin 1 should be labeled PTTRING
//		U29 pin 3 should be labeled PTTTIP
//
//		U32 pin 1 should be labeled MIC_TIP
//    U32 pin 3 should be labeled MIC_RING
//
//		U33 pin 1 should be labeled BIASRING
//		U33 pin 3 should be labeled BIASTIP
//
//  Thus the logic in this always block is reversed from what you find in the Orion Mk I firmware, as the Mk II Orion schematic
//  is accurate with how the Mk II Orion board is wired for these connections

always @ (posedge CMCLK)
begin
	  if (Orion_tip_ring_select == 1'b0)
		begin	
			PTT_SELECT 		<= 1'b0;						 // set Orion mic ptt to tip (ref note above)
			MIC_SIG_SELECT <= 1'b0;						 // set Orion mic signal to ring (ref note above)
			MICBIAS_SELECT <= 1'b1; 					 // set Orion mic bias to ring (ref note above)
		end
		else begin
			PTT_SELECT 		<= 1'b1;						 // set Orion mic ptt to ring (ref note above)
			MIC_SIG_SELECT <= 1'b1;						 // set Orion mic signal to tip (ref note above)
			MICBIAS_SELECT <= 1'b0;						 // set Orion mic bias to tip (ref note above)
		end			
end	


wire         mode;     			// normal or Class E PA operation 
wire         Attenuator;		// selects input attenuator setting, 1 = 20dB, 0 = 0dB 
wire  [31:0] frequency[0:NR-1]; 	// Tx, Rx1, Rx2, Rx3, Rx4, Rx5, Rx6, Rx7
wire         IF_duplex;
wire   [7:0] Drive_Level; 		// Tx drive level
wire         Mic_boost;			// Mic boost 0 = 0dB, 1 = 20dB
wire         Line_In;				// Selects input, mic = 0, line = 1
wire			 common_Merc_freq;		// when set forces Rx2 freq to Rx1 freq
wire   [4:0] Line_In_Gain;		// Sets Line-In Gain value (00000=-32.4 dB to 11111=+12 dB in 1.5 dB steps)
wire         Apollo;				// Selects Alex (0) or Apollo (1)
wire   [4:0] Attenuator0;			// 0-31 dB Heremes attenuator value
wire			 TR_relay_disable;		// Alex T/R relay disable option
wire	 [4:0] Attenuator1;		// attenuation setting for input attenuator 2 (input atten for ADC2), 0-31 dB
wire         internal_CW;			// set when internal CW generation selected
wire   [7:0] sidetone_level;		// 0 - 100, sets internal sidetone level
wire 			 sidetone;				// Sidetone enable, 0 = off, 1 = on
wire   [7:0] RF_delay;				// 0 - 255, sets delay in mS from CW Key activation to RF out
wire   [9:0] hang;					// 0 - 1000, sets delay in mS from release of CW Key to dropping of PTT
wire  [11:0] tone_freq;				// 200 to 1000 Hz, sets sidetone frequency.
wire         key_reverse;		   // reverse CW keyes if set
wire   [5:0] keyer_speed; 			// CW keyer speed 0-60 WPM
wire         keyer_mode;			// 0 = Mode A, 1 = Mode B
wire 			 iambic;					// 0 = external/straight/bug  1 = iambic
wire   [7:0] keyer_weight;			// keyer weight 33-66
wire         keyer_spacing;		// 0 = off, 1 = on
wire 			 break_in;				// if set then use break in mode
wire   [4:0] atten0_on_Tx;			// ADC0 attenuation value to use when Tx is active
wire   [4:0] atten1_on_Tx;			// ADC1 attenuation value to use when Tx is active
wire  [31:0] Rx_frequency[0:NR-1];	// Rx(n) receive frequency
wire  [31:0] Tx0_frequency;		// Tx0 transmit frequency
wire  [47:0] Alex_data;				// control data to Alex board
wire  [15:0] Alex_Tx_data;			// control data to Alex board used during Tx
wire         run;						// set when run active 
wire 		    PC_PTT;					// set when PTT from PC active
wire 	 [7:0] dither;					// Dither for ADC0[0], ADC1[1]...etc
wire   [7:0] random;					// Random for ADC0[0], ADC1[1]...etc
wire   [7:0] RxADC[0:NR-1];			// ADC or DAC that Rx(n) is connected to
wire 	[15:0] RxSampleRate[0:NR-1];	// Rxn Sample rate 48/96/192 etc
wire 			 Alex_data_ready;		// indicates Alex data available
wire         Rx_data_ready;		// indicates Rx_specific data available
wire 			 Tx_data_ready;		// indicated Tx_specific data available
wire   [7:0] Mux;						// Rx in mux mode when bit set, [0] = Rx0, [1] = Rx1 etc 
wire   [7:0] SyncRx[0:NR-1];			// bit set selects Rx to sync or mux with
wire 	 [7:0] EnableRx0_7;			// Rx enabled when bit set, [0] = Rx0, [1] = Rx1 etc
wire 	 [7:0] C122_EnableRx0_7;
wire  [15:0] Rx_Specific_port;	// 
wire  [15:0] Tx_Specific_port;
wire  [15:0] High_Prioirty_from_PC_port;
wire  [15:0] High_Prioirty_to_PC_port;			
wire  [15:0] Rx_Audio_port;
wire  [15:0] Tx_IQ_port;
wire  [15:0] Rx0_port;
wire  [15:0] Mic_port;
wire  [15:0] Wideband_ADC0_port;
wire   [7:0] Wideband_enable;					// [0] set enables ADC0, [1] set enables ADC1
wire  [15:0] Wideband_samples_per_packet;				
wire   [7:0] Wideband_sample_size;
wire   [7:0] Wideband_update_rate;
wire   [7:0] Wideband_packets_per_frame; 
wire  [15:0] Envelope_PWM_max;
wire  [15:0] Envelope_PWM_min;
wire   [7:0] Open_Collector;
wire   [7:0] User_Outputs;
wire   [7:0] Mercury_Attenuator;	
wire 			 CWX;						// CW keyboard from PC 
wire         Dot;						// CW dot key from PC
wire         Dash;					// CW dash key from PC]
wire freq_data_ready;


//wire         Time_stamp;
//wire         VITA_49;				
wire         VNA;									// Selects VNA mode when set. 
//wire   [7:0] Atlas_bus;
//wire     [7:0] _10MHz_reference,
wire         PA_enable;
//wire         Apollo_enable;	
wire   [7:0] Alex_enable;			
wire         data_ready;
wire 			 HW_reset1;
wire 			 HW_reset2;	
wire 			 HW_reset3;
wire 			 HW_reset4;
wire 			 HW_timer_enable;

wire	Orion_micPTT_disable;
wire	Orion_tip_ring_select;

wire [7:0]DLE_outputs;

General_CC #(1024) General_CC_inst // parameter is port number  ***** this data is in rx_clock domain *****
			(
				// inputs
				.clock(rx_clock),
				.to_port(to_port),
				.udp_rx_active(udp_rx_active),
				.udp_rx_data(udp_rx_data),
				// outputs
			   .Rx_Specific_port(Rx_Specific_port),
				.Tx_Specific_port(Tx_Specific_port),
				.High_Prioirty_from_PC_port(High_Prioirty_from_PC_port),
				.High_Prioirty_to_PC_port(High_Prioirty_to_PC_port),			
				.Rx_Audio_port(Rx_Audio_port),
				.Tx_IQ_port(Tx_IQ_port),
				.Rx0_port(Rx0_port),
				.Mic_port(Mic_port),
				.Wideband_ADC0_port(Wideband_ADC0_port),
				.Wideband_enable(Wideband_enable),
				.Wideband_samples_per_packet(Wideband_samples_per_packet),				
				.Wideband_sample_size(Wideband_sample_size),
				.Wideband_update_rate(Wideband_update_rate),
				.Wideband_packets_per_frame(Wideband_packets_per_frame),
			//	.Envelope_PWM_max(Envelope_PWM_max),
			//	.Envelope_PWM_min(Envelope_PWM_min),
			//	.Time_stamp(Time_stamp),
			//	.VITA_49(VITA_49),				
				.VNA(VNA),
				//.Atlas_bus(),
				//._10MHz_reference(),
				.PA_enable(PA_enable),
			//	.Apollo_enable(Apollo_enable),	
				.Alex_enable(Alex_enable),			
				.data_ready(data_ready),
				.HW_reset(HW_reset1),
				.HW_timer_enable(HW_timer_enable)
				);


High_Priority_CC #(1027, NR) High_Priority_CC_inst  // parameter is port number 1027  ***** this data is in rx_clock domain *****
			(
				// inputs
				.clock(rx_clock),
				.to_port(to_port),
				.udp_rx_active(udp_rx_active),
				.udp_rx_data(udp_rx_data),
				.HW_timeout(HW_timeout),					// used to clear run if HW timeout.
				// outputs
				.run(run),
				.PC_PTT(PC_PTT),
				.CWX(CWX),
				.Dot(Dot),
				.Dash(Dash),
				.Rx_frequency(Rx_frequency),
				.Tx0_frequency(Tx0_frequency),
				.Alex_data(Alex_data),
				.Alex_Tx_data(Alex_Tx_data),
				.drive_level(Drive_Level),
				.Attenuator0(Attenuator0),
				.Attenuator1(Attenuator1),
				.Open_Collector(Open_Collector),			// open collector outputs on Orion
			//	.User_Outputs(),
			//	.Mercury_Attenuator(),	
				.Alex_data_ready(Alex_data_ready),
				.HW_reset(HW_reset2),
				.sequence_errors(HP_sequence_errors),
				.DLE_outputs(DLE_outputs)
			);


wire XVTR_ENABLE, AUTO_TUNE;
assign XVTR_ENABLE = DLE_outputs[0];

// enable AF Amp
assign IO1 = DLE_outputs[1];				// low to enable, high to mute

// enable Auto-Tune
assign AUTO_TUNE = DLE_outputs[2];			// high to enable auto-tune

			
// if break_in is selected then CW_PTT can activate the FPGA_PTT. 
// if break_in is selected then CW_PTT can generate RF otherwise PC_PTT must be active.	
// (OLD, changed to below) inhibit T/R switching if IO4 TX INHIBIT is active (low)		
// IO4 is the MUTE signal from the Andromeda Front Panel
assign FPGA_PTT = debounce_IO5 && ((break_in && CW_PTT) || PC_PTT); // CW_PTT is used when internal CW is selected

// we may want to do more specific relay control during TX with this upper 16 bits,
// but for now just validate ANT 1-3 bits, only one should be set
wire Alex_Tx_data_ok = Alex_Tx_data[10:8] == 3'b100 || Alex_Tx_data[10:8] == 3'b010 || Alex_Tx_data[10:8] == 3'b001;

wire [15:0] Alex_upper = (FPGA_PTT && Alex_Tx_data_ok) ? Alex_Tx_data : Alex_data[47:32];
// clear TR relay and Open Collectors if run not set 
wire [47:0]runsafe_Alex_data = {Alex_upper[15:12], run & PA_enable & (FPGA_PTT | Alex_upper[11]),
                                                             Alex_upper[10:0], Alex_data[31:0]};

Tx_specific_CC #(1026)Tx_specific_CC_inst //   // parameter is port number  ***** this data is in rx_clock domain *****
			( 	
				// inputs
				.clock (rx_clock),
				.to_port (to_port),
				.udp_rx_active (udp_rx_active),
				.udp_rx_data (udp_rx_data),
				// outputs
				.EER() ,
				.internal_CW (internal_CW),
				.key_reverse (key_reverse), 
				.iambic (iambic),					
				.sidetone (sidetone), 			
				.keyer_mode (keyer_mode), 		
				.keyer_spacing(keyer_spacing),
				.break_in(break_in), 						
				.sidetone_level(sidetone_level), 
				.tone_freq(tone_freq), 
				.keyer_speed(keyer_speed),	
				.keyer_weight(keyer_weight),
				.hang(hang), 
				.RF_delay(RF_delay),
				.Line_In(Line_In),
				.Line_In_Gain(Line_In_Gain),
				.Mic_boost(Mic_boost),
				.Orion_micPTT_disable(Orion_micPTT_disable),
				.Orion_tip_ring_select(Orion_tip_ring_select),
				.MICBIAS_ENABLE(MICBIAS_ENABLE),
				.Orion_atten_Tx1(atten1_on_Tx),
				.Orion_atten_Tx0(atten0_on_Tx),	
				.data_ready(Tx_data_ready),
				.HW_reset(HW_reset3)

			);

Rx_specific_CC #(1025, NR) Rx_specific_CC_inst // parameter is port number 
			( 	
				// inputs
				.clock(rx_clock),
				.to_port(to_port),
				.udp_rx_active(udp_rx_active),
				.udp_rx_data(udp_rx_data),
				.run(run),
				// outputs
				.dither(dither),
				.random(random),
				.RxSampleRate(RxSampleRate),
				.RxADC(RxADC),	
				.SyncRx(SyncRx),
				.EnableRx0_7(EnableRx0_7),
				.Rx_data_ready(Rx_data_ready),
				.Mux(Mux),
				.HW_reset(HW_reset4),
				.sequence_errors(Rx_spec_sequence_errors)
			);			
			
assign  RAND   = random[0];        		//high turns random on
assign  RAND_2 = random[1]; 
assign  DITH   = dither[0];      		//high turns LTC2208 dither on 
assign  DITH_2 = dither[1]; 		

// transfer C&C data in rx_clock domain, on strobe, into relevant clock domains
cdc_mcp #(32) Tx1_freq 
 (.a_rst(C122_rst), .a_clk(rx_clock), .a_data(Tx0_frequency), .a_data_rdy(Alex_data_ready), .b_rst(C122_rst), .b_clk(C122_clk), .b_data(C122_frequency_HZ_Tx));
 
// move Mux data into C122_clk domain
wire [7:0]C122_Mux;
cdc_mcp #(8) Mux_inst 
	(.a_rst(C122_rst), .a_clk(rx_clock), .a_data(Mux), .a_data_rdy(Rx_data_ready), .b_rst(C122_rst), .b_clk(C122_clk), .b_data(C122_Mux)); 

// move Alex data into CBCLK domain
wire  [47:0] SPI_Alex_data;
//cdc_sync #(48) SPI_Alex (.siga(runsafe_Alex_data), .rstb(IF_rst), .clkb(CBCLK), .sigb(SPI_Alex_data));
cdc_sync #(48) SPI_Alex (.siga(runsafe_Alex_data), .rstb(SPI_Alex_rst), .clkb(CBCLK), .sigb(SPI_Alex_data));
 

 

//------------------------------------------------------------
//  			High Priority to PC C&C Encoder 
//------------------------------------------------------------

// All input data is transfered to tx_clock domain in the encoder

wire CC_ack;
wire CC_data_ready;
wire [7:0] CC_data[0:55];			//[15:0] CC_data[0:56];
wire [15:0] Exciter_power = FPGA_PTT ? {4'b0,AIN5} : 16'b0; 
wire [15:0] FWD_power     = FPGA_PTT ? {4'b0,AIN1} : 16'b0;
wire [15:0] REV_power     = FPGA_PTT ? {4'b0,AIN2} : 16'b0;
wire [15:0] user_analog1  = {4'b0, AIN3};  //FPGA_PTT ? {4'b0,AIN4} : 16'b0;
wire [15:0] user_analog2  = {4'b0, AIN4}; 

reg [31:0] HP_sequence_errors;
reg [31:0] Audio_sequence_errors;
reg [31:0] DUC_sequence_errors;
reg [31:0] Rx_spec_sequence_errors;
reg [31:0] ALL_sequence_errors;
reg [31:0] ALL_sequence_errors_tx;

assign ALL_sequence_errors = HP_sequence_errors + Audio_sequence_errors + DUC_sequence_errors + Rx_spec_sequence_errors;

cdc_sync #(32)cdc_sync_ALL (.siga(ALL_sequence_errors), .rstb(1'b0), .clkb(tx_clock), .sigb(ALL_sequence_errors_tx));

CC_encoder #(50, NR) CC_encoder_inst (				// 50mS update rate
					//	inputs
					.clock(tx_clock),					// tx_clock  125MHz
					.ACK (CC_ack),
					.PTT ((break_in & CW_PTT) | debounce_PTT),
					.Dot (debounce_DOT),
					.Dash(debounce_DASH),
					//.frequency_change(frequency_change),
					.locked_10MHz(locked_10MHz),		// set if the 10MHz divider PLL is locked.
					.ADC0_overload (OVERFLOW),
					.ADC1_overload (OVERFLOW_2),
					.Exciter_power (Exciter_power),			
					.FWD_power (FWD_power),
					.REV_power (REV_power),
					.Supply_volts ({4'b0,AIN6}),  
					.User_ADC1 (user_analog1),
					.User_ADC2 (user_analog2),
					.User_IO ({3'b0, IO2, debounce_IO8, IO6, debounce_IO5, IO4}),
					.pk_detect_ack(pk_detect_ack),		// from Orion_ADC
					.FPGA_PTT(FPGA_PTT),						// when set change update rate to 1mS
					.Debug_data(16'd0),
					//.Debug_data({6'b000000,~DEBUG_LED10,~DEBUG_LED9,~DEBUG_LED8,~DEBUG_LED7,~DEBUG_LED6,~DEBUG_LED5,~DEBUG_LED4,~DEBUG_LED3,~DEBUG_LED2,~DEBUG_LED1}),
					.sequence_errors(ALL_sequence_errors_tx),
							
					//	outputs
					.CC_data (CC_data),
					.ready (CC_data_ready),
					.pk_detect_reset(pk_detect_reset)	// to Orion_ADC
				);
							
 
 
 
//------------------------------------------------------------
//  Orion on-board attenuators 
//------------------------------------------------------------

// set the two input attenuators
wire [4:0] atten0;
wire [4:0] atten1;

assign atten0 = FPGA_PTT ? atten0_on_Tx : Attenuator0;
assign atten1 = FPGA_PTT ? atten1_on_Tx : Attenuator1; 

Attenuator Attenuator_ADC0 (.clk(CBCLK), .data(atten0), .ATTN_CLK(ATTN_CLK),   .ATTN_DATA(ATTN_DATA),   .ATTN_LE(ATTN_LE));
Attenuator Attenuator_ADC1 (.clk(CBCLK), .data(atten1), .ATTN_CLK(ATTN_CLK_2), .ATTN_DATA(ATTN_DATA_2), .ATTN_LE(ATTN_LE_2));


//----------------------------------------------
//		Alex SPI interface
//----------------------------------------------

SPI Alex_SPI_Tx (.reset (SPI_Alex_rst), .enable(Alex_enable[0]), .Alex_data(SPI_Alex_data), .SPI_data(Alex_SPI_SDO),
                 .SPI_clock(Alex_SPI_SCK), .Tx_load_strobe(SPI_TX_LOAD),
                 .Rx_load_strobe(SPI_RX_LOAD), .spi_clock(CBCLK));	

//---------------------------------------------------------
//  Debounce inputs - active low
//---------------------------------------------------------

wire Orion_micPTT;

assign Orion_micPTT = Orion_micPTT_disable ? 1'b1 : PTT;

wire debounce_PTT;    // debounced button
wire debounce_DOT;
wire debounce_DASH;
wire debounce_IO5;
wire debounce_IO8;

debounce de_PTT	(.clean_pb(debounce_PTT),  .pb(~Orion_micPTT/*!PTT*/), .clk(CMCLK));
debounce de_DOT	(.clean_pb(debounce_DOT),  .pb(!KEY_DOT), .clk(CMCLK));
debounce de_DASH	(.clean_pb(debounce_DASH), .pb(!KEY_DASH), .clk(CMCLK));
debounce de_IO5	(.clean_pb(debounce_IO5),	.pb(IO5), 		 .clk(CMCLK));	 // TX INHIBIT in, pin 16 J16
debounce de_IO8	(.clean_pb(debounce_IO8),  .pb(!IO8), 		 .clk(CMCLK));  // ext CW key in, pin 13 J16

//-------------------------------------------------------
//    PLLs 
//---------------------------------------------------------


/* 
	Divide the 122.880MHz osc using a PLL to give 10.000MHz to XOR with the local/external 10MHz ref to
	control the 122.880MHz osc module.  Switching between internal/external 10MHz ref is automatic
	via circuitry on the MkII board.  
*/


wire osc_10MHZ; 
wire locked_10MHz; 

// Use a PLL to divide 122.88MHz clock to 10MHz for XOR operation to generate feedback voltage for 
// the 122.88 MHz osc module							
C122_PLL PLL_inst ( .areset(0), .inclk0(_122MHz), .c0(osc_10MHZ), .locked(locked_10MHz));
	
//Apply to EXOR phase detector 

assign FPGA_PLL = osc_10MHZ ^ OSC_10MHZ;		// Orion MkII 

//-----------------------------------------------------------
//  LED Control  
//-----------------------------------------------------------

/*
	LEDs:  
	
	DEBUG_LED1  	- Lights when an Ethernet broadcast is detected
	DEBUG_LED2  	- Lights when traffic to the boards MAC address is detected
	DEBUG_LED3  	- Lights when detect a received sequence error or ASMI is busy
	DEBUG_LED4 		- Displays state of PHY negotiations - fast flash if no Ethernet connection, slow flash if 100T and on if 1000T
	DEBUG_LED5		- Lights when the PHY receives Ethernet traffic
	DEBUG_LED6  	- Lights when the PHY transmits Ethernet traffic
	DEBUG_LED7  	- Displays state of DHCP negotiations or static IP - on if ACK, slow flash if NAK, fast flash if time out 
					     and long then short flash if static IP
	DEBUG_LED8  	- Lights when sync (0x7F7F7F) received from PC
	DEBUG_LED9  	- Lights when a Metis discovery packet is received
	DEBUG_LED10 	- Lights when a Metis discovery packet reply is sent	
	
	Status_LED	    - Flashes once per second
	
	A LED is flashed for the selected period on the positive edge of the signal.
	If the signal period is greater than the LED period the LED will remain on.


*/

parameter [24:0] half_second = 2_500_000; // at 12.288MHz clock rate
parameter [24:0] fast_clock_half_second = 25_000_000; // at Gigbit PHY rate

`ifdef LEDTEST
wire i_clk;
assign i_clk = HB_counter[23];

reg	[4:0]	led_posn;
	always @(posedge i_clk)
		led_posn <= (led_posn == 5'h13) ? 5'h0 : led_posn + 1'b1;

always @(posedge i_clk)
	begin
		DEBUG_LED1 <= ~(led_posn == 5'h0);
		DEBUG_LED2 <= ~(led_posn == 5'h1);
		DEBUG_LED3 <= ~(led_posn == 5'h2);
		DEBUG_LED4 <= ~(led_posn == 5'h3);
		DEBUG_LED5 <= ~(led_posn == 5'h4);
		DEBUG_LED6 <= ~(led_posn == 5'h5);
		DEBUG_LED7 <= ~(led_posn == 5'h6);
		DEBUG_LED8 <= ~(led_posn == 5'h7);
		DEBUG_LED9 <= ~(led_posn == 5'h8);
		DEBUG_LED10 <= ~(led_posn == 5'h9);
		DEBUG_LED11 <= ~(led_posn == 5'ha);
		DEBUG_LED12 <= ~(led_posn == 5'hb);
		DEBUG_LED13 <= ~(led_posn == 5'hc);
		DEBUG_LED14 <= ~(led_posn == 5'hd);
		DEBUG_LED15 <= ~(led_posn == 5'he);
		DEBUG_LED16 <= ~(led_posn == 5'hf);
		DEBUG_LED17 <= ~(led_posn == 5'h10);
		DEBUG_LED18 <= ~(led_posn == 5'h11);
		DEBUG_LED19 <= ~(led_posn == 5'h12);
		DEBUG_LED20 <= ~(led_posn == 5'h13);
	end

`else

// flash LED1 for ~ 0.2 second whenever rgmii_rx_active
//Led_flash Flash_LED1(.clock(CMCLK), .signal(network_status[2]), .LED(DEBUG_LED1), .period(half_second)); 	
//Led_flash Flash_LED1(.clock(CBCLK), .signal(mic_wr_full), .LED(DEBUG_LED1), .period(half_second));

// flash LED2 for ~ 0.2 second whenever the PHY transmits
//Led_flash Flash_LED2(.clock(CMCLK), .signal(network_status[1]), .LED(DEBUG_LED2), .period(half_second)); 
//assign RAM_A2 = 1'b1; // turn the LED off for now. 	
//Led_flash Flash_LED2(.clock(tx_clock), .signal(mic_rd_empty), .LED(DEBUG_LED2), .period(fast_clock_half_second));

// flash LED3 for ~0.2 seconds whenever ip_rx_enable
//Led_flash Flash_LED3(.clock(CMCLK), .signal(network_status[1]), .LED(DEBUG_LED3), .period(half_second));
//Led_flash Flash_LED3(.clock(rx_clock), .signal(HP_CC_seq_err), .LED(DEBUG_LED3), .period(fast_clock_half_second));

// flash LED4 for ~0.2 seconds whenever traffic to the boards MAC address is received 
//Led_flash Flash_LED4(.clock(CMCLK), .signal(network_status[0]), .LED(DEBUG_LED4), .period(half_second));
//Led_flash Flash_LED4(.clock(rx_clock), .signal(G_CC_seq_err), .LED(DEBUG_LED4), .period(fast_clock_half_second));

assign DEBUG_LED20 = 1'b1;
assign DEBUG_LED19 = 1'b1;
assign DEBUG_LED18 = 1'b1;
assign DEBUG_LED17 = 1'b1;
assign DEBUG_LED16 = 1'b1;
assign DEBUG_LED15 = 1'b1;
assign DEBUG_LED14 = 1'b1;
assign DEBUG_LED13 = 1'b1;
assign DEBUG_LED12 = 1'b1;
assign DEBUG_LED11 = 1'b1;
assign DEBUG_LED10 = 1'b1;
assign DEBUG_LED9 = 1'b1;
assign DEBUG_LED8 = 1'b1;
assign DEBUG_LED7 = 1'b1;
assign DEBUG_LED6 = 1'b1;
assign DEBUG_LED5 = 1'b1;
assign DEBUG_LED4 = 1'b1;
assign DEBUG_LED3 = 1'b1;
assign DEBUG_LED2 = 1'b1;
assign DEBUG_LED1 = 1'b1;

// flash LED7 for ~0.2 seconds whenever udp_rx_active
//Led_flash Flash_LED7(.clock(CMCLK), .signal(network_status[4]), .LED(DEBUG_LED7), .period(half_second));		// udp_rx_active
//Led_flash Flash_LED6(.clock(rx_clock), .signal(RX_CC_seq_err), .LED(DEBUG_LED6), .period(fast_clock_half_second));

//Led_flash Flash_LED7(.clock(rx_clock), .signal(TX_CC_seq_err), .LED(DEBUG_LED7), .period(fast_clock_half_second));

//Led_flash Flash_LED8(.clock(rx_clock), .signal(Audio_seq_err), .LED(DEBUG_LED8), .period(fast_clock_half_second));

// flash LED8 for ~0.2 seconds when
//Led_flash Flash_LED9(.clock(rx_clock), .signal(Audio_empty), .LED(DEBUG_LED9), .period(fast_clock_half_second));

// flash LED9 for ~0.2 seconds when
//Led_flash Flash_LED9(.clock(rx_clock), .signal(discovery_reply), .LED(DEBUG_LED9), .period(fast_clock_half_second)); // note fast clock now
//Led_flash Flash_LED10(.clock(rx_clock), .signal(Audio_full), .LED(DEBUG_LED10), .period(fast_clock_half_second)); // note fast clock now


//------------------------------------------------------------
//   Multi-state LED Control   - code in Led_control is for active LOW LEDs
//------------------------------------------------------------

parameter clock_speed = 12_288_000; // 12.288MHz clock 

// display state of PHY negotiations  - fast flash if no Ethernet connection, slow flash if 100T, on if 1000T
// and swap between fast and slow flash if not full duplex
//Led_control #(clock_speed) Control_LED0(.clock(CMCLK), .on(network_status[6]), .fast_flash(~network_status[5] || ~network_status[6]),
//										.slow_flash(network_status[5]), .vary(~network_status[7]), .LED(DEBUG_LED5));  
										
// display state of DHCP negotiations - on if success, slow flash if fail, fast flash if time out and swap between fast and slow 
// if using a static IP address
//Led_control # (clock_speed) Control_LED1(.clock(CMCLK), .on(dhcp_success), .slow_flash(dhcp_failed & !dhcp_timeout),
//										.fast_flash(dhcp_timeout), .vary(static_ip_assigned), .LED(DEBUG_LED6));	

`endif

//Flash Heart beat LED
reg [24:0]HB_counter;
always @(posedge CLOCK_25MHZ) HB_counter <= HB_counter + 1'b1;
assign Status_LED = HB_counter[is_9031 ? 24 : 23];  // Blink slower for 9031

endmodule 

