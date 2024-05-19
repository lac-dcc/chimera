// This program was cloned from: https://github.com/ahegazy/aes
// License: MIT License

/*
*
*	Creator : Ahmad Hegazy <github.com/ahegazy> <ahegazipro@gmail.com>
*
*	Date: September 2018
* 
* Description: AES Encryption Verilog TestBench.
* Language: Verilog
*
*/

`timescale 10ns/1ns
module encryption_TB;


/*INPUTS*/

reg [7:0] key_byte, state_byte;
reg clk,rst,enable;

/* OUTPUTS */
wire [7:0] state_out_byte;
wire load,ready;

/* instance */
AES_encryption AES_TB(key_byte, state_byte,clk,rst,enable,state_out_byte,load,ready);

reg startSend;

/*Initializing inputs*/
initial 
begin 
 //initialize here 
	clk = 0;
	rst = 0;
  key_byte = 0;
  state_byte =0;
	enable = 0;
	startSend=0;
end 


/*Monitor values*/
initial 
begin 
  $display ("\t\ttime,\tkey_Byte,\tdata_Byte,\tload,\tready,\tdata_out_byte");
  $monitor ("%d,\t%b,\t%b,\t%b,\t%b,\t%b",$time,key_byte,state_byte,load,ready,state_out_byte);
end

//Generate clock 
always 
#1 clk = ~clk;

event reset_done;
/*Generating input values */
task reset();
  begin
  @(negedge clk);
    rst = 1;
	#5
  @(negedge clk);
		begin 
		rst = 0;
		->reset_done;
		end
	
	

end 
endtask


reg [127:0] full_key,full_state;
integer i;

always @(negedge clk)
begin 
	if ( startSend && (i > 0) )
	begin 
		key_byte <= full_key[i-:8];
		state_byte <= full_state[i-:8];
		i = i-8;
	end 
end 


initial 
begin 
/*
		 // 16 cycle  key = 54 68 61 74 73 20 6D 79 20 4B 75 6E 67 20 46 75 
				// ;data = 54 77 6F 20 4F 6E 65 20 4E 69 6E 65 20 54 77 6F 
				
									 54 77 6F 20
									 4F 6E 65 20
									 4E 69 6E 65
									 20 54 77 6F 
*/
	full_key <= 128'h5468617473206D79204B756E67204675;
	full_state <= 128'h54776F204F6E65204E696E652054776F;

  i <= 127;
	#1 reset();
end

initial
begin 
  @(reset_done)
  begin
	#2;
		enable = 1;
	#2; /*wait one cycle because datsa is recieved in the design after one cycle of the enable signal is set*/
		startSend = 1;
		@(ready) 
			begin 
				#35;
				$stop;
			end 
  end
end 
endmodule