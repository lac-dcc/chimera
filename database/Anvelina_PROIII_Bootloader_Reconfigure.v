// This program was cloned from: https://github.com/n1gp/Anvelina_PROIII_Bootloader
// License: GNU General Public License v3.0

//
//  HPSDR - High Performance Software Defined Radio
//
//  BootLoader code. 
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


//  Reconfigure copyright 2010, 2011 Phil Harman VK6APH
//  Reconfigure copyright 2010, 2011 Michael Wyrick, N3UC 




//------------------------------------------------------------------------------
//  Remote Update
//------------------------------------------------------------------------------

// This code is based on original work by Michael Wyrick, N3UC.
// Uses the Remote Update Megafunction

// On FPGA reset if control is low then the Factory code is loaded, if 
// high then the application code is loaded starting at the BootAddress. 



module Reconfigure (reset, clock, clk_freq, BootAddress, control, CRC_error, done);

input reset;
input clock;
input [6:0]clk_freq;			// clock requency we are using 
input [23:0]BootAddress;		// address in EPCS16 to boot application code from
input control;

output CRC_error;				// high if a CRC error occurs when loading the application code
output done;					// high when this state machine has run

reg ReconfigLine;
reg [21:0] DataIn;
reg [2:0] Param;
reg WriteParam;
reg ReadParam;
reg [1:0]ReadSource;
wire Busy;
wire [23:0]DataOut;
reg [7:0]ConfigState;
reg [4:0]Reason;
reg ResetRU;
reg CRC_error;
reg done;
reg [6:0]loop;

wire [6:0]delay;

// calculate delay based on clock speed that we need to hold ReconfigLine high for > 250nS as per handbook. 
// use Ceiling to determine the delay to use 
assign delay = ((clk_freq * 250) % 1000 == 0) ? (clk_freq * 250/1000) : (clk_freq * 250/1000) + 1'b1; 



// Remote Update State Machine
always @ (posedge clock)
begin
  if (reset) ConfigState <= 0;
  
  case (ConfigState)
// Reset State  
0:	begin
	  ResetRU <= 'b1;
	  if (Busy)
	    ConfigState <= 0;
	  else
	    ConfigState <= ConfigState + 1'b1;
	end

//Setup Defaults  
1:	begin
	  ResetRU <= 'b0;
	  CRC_error <= 1'b0;
	  done <= 1'b0;
	  ReconfigLine <= 1'b0;
	  WriteParam <= 1'b0;
	  ReadSource <= 2'b0;
	  Reason <= 5'b01011; 
	  loop <= 0;     
	  ConfigState <= ConfigState + 1'b1;
	end

//Turn on CONFG_DONE early
2:	begin
	  DataIn <= 'b1;            
	  Param <= 3'b001;
	  ConfigState <= ConfigState + 1'b1;
	end
3:	begin
	  WriteParam <= 1'b1;
	  ConfigState <= ConfigState + 1'b1;
	end
4:	begin
	  WriteParam <= 1'b0;
	  ConfigState <= ConfigState + 1'b1;
	end
5:	begin
	  if (Busy)
	    ConfigState <= 5;
	  else
	    ConfigState <= ConfigState + 1'b1;
	end

//Turn on OSC_INT
6:	begin
	  DataIn <= 1;                
	  Param <= 3'b110;
	  ConfigState <= ConfigState + 1'b1;
	end
7:	begin
	  WriteParam <= 1'b1;
	  ConfigState <= ConfigState + 1'b1;
	end
8:	begin
	  WriteParam <= 1'b0;
	  ConfigState <= ConfigState + 1'b1;
	end
9:	begin
	  if (Busy)
	    ConfigState <= 9;
	  else
	    ConfigState <= ConfigState + 1'b1;
	end

//Set Application Boot_Address
10:	begin
	  DataIn <= (BootAddress >> 2);   // Set the Boot Address of the Application Image,  Only the 22 MSB bits are written
	  Param <= 3'b100;
	  ConfigState <= ConfigState + 1'b1;
	end
11:	begin
	  WriteParam <= 1'b1;
	  ConfigState <= ConfigState + 1'b1;
	end
12:	begin
	  WriteParam <= 1'b0;
	  ConfigState <= ConfigState + 1'b1;
	end
13:	begin
	  if (Busy)
	    ConfigState <= 13;
	  else
	    ConfigState <= ConfigState + 1'b1;
	end

//Disable the WATCHDOG_EN
14:	begin
	  DataIn <= 0;						// set DataIn to 0 to disable	
	  Param <= 3'b011;
	  ConfigState <= ConfigState + 1'b1;
	end
15:	begin
	  WriteParam <= 1'b1;
	  ConfigState <= ConfigState + 1'b1;
	end
16:	begin
	  WriteParam <= 1'b0;
	  ConfigState <= ConfigState + 1'b1;
	end
17:	begin
	  if (Busy)
	    ConfigState <= 17;
	  else
	    ConfigState <= ConfigState + 1'b1;
	end

// READ REASON for last Config 
18:	begin
	  Param <= 3'b111;
	  ConfigState <= ConfigState + 1'b1;
	end
19:	begin
	  ReadParam <= 1'b1;
	  ConfigState <= ConfigState + 1'b1;
	end
20:	begin
	  ReadParam <= 1'b0;
	  ConfigState <= ConfigState + 1'b1;
	end
21:	begin
	  if (Busy) begin
	    ConfigState <= 21;
	  end else
	    ConfigState <= ConfigState + 1'b1;
	end
22:	begin
	  Reason <= DataOut[4:0];   // Read the Reason for Last ReConfig
	  ConfigState <= ConfigState + 1'b1;
	end
23:	begin
	  ConfigState <= ConfigState + 1'b1;
	end

// Check if we need to Reconfig	
24:	begin
	  if (Reason[3])  begin         // If we are here due to CRC Error, skip reconfig &
	    CRC_error <= 1'b1;			// set CRC error flag
	    ConfigState <= 27;
	  end 
	  else
	    ConfigState <= ConfigState + 1'b1;    
	end		
25:	begin
	  if (control) begin        // If control is high then change to Application Config, If Gnd, stay here
	    ReconfigLine <= 1'b1;
	  end else
	    ReconfigLine <= 1'b0;  
	  ConfigState <= ConfigState + 1'b1;
	end
26:	begin					 // Hold ReconfigLine high for > 250nS as per handbook 
		if (loop == delay)
			ConfigState <= ConfigState + 1'b1; 
		else  loop <= loop + 1'b1;			 
	end
	
// End State	
27:	begin
      done <= 1'b1;		     // Indicate the State Machine is Finished
	  ConfigState <= 27;     // Loop here
	end
	  
  default: ConfigState <= 0;
  endcase
end
  
Remote Remoteinst(
	.clock(clock),
	.data_in(DataIn),
	.param(Param),
	.read_param(ReadParam), 
	.read_source(ReadSource),
	.reconfig(ReconfigLine),
	.reset(ResetRU),
	.busy(Busy),
	.data_out(DataOut),
	.write_param(WriteParam)
);

endmodule

 