// ============================================================================
// Copyright (c) 2012 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//                     Terasic Technologies(China)Inc
//                     
//                     Wuhan, China
//                     
//
//                     web: http://www.terasic.com.cn/
//                     email: support@terasic.com
//
// ============================================================================
//
// Major Functions:	IRDA receiver
//
//                  it can realize a IRDA receiver,show the user code(16 bit) on HEX4-HEX7
//                  and key value on HEX0-HEX3  7-SEGS.the user code is fixed for some 
//                  remote control and the key value is not the same for different key
// ============================================================================
//
// Revision History :
// ============================================================================
//   Ver  :| Author            :| Mod. Date   :| Changes Made:
//   V1.0 :| Peli  Li          :| 2010/03/22  :| Initial Revision
// ============================================================================

module IRDA_RECEIVE_Terasic(
					iCLK,         //clk   50MHz
					iRST_n,       //reset
					
					iIRDA,        //IRDA code input
					iREAD,        //read command
					
					oDATA_REAY,	  //data ready
					oDATA         //decode data output
					);
					
///////////////parameter///////////////
parameter IDLE = 2'b00;           //always high voltage level
parameter GUIDANCE = 2'b01;       //9 ms low voltage and 4.5 ms high voltage
parameter DATAREAD = 2'b10;       //0.6ms low voltage start and with 0.52ms high voltage is 0,with 1.66ms high voltage is 1, 32bit in sum.

parameter IDLE_HIGH_DUR      =  262143;  // data_count    131071*0.02us = 5.24ms, threshold for DATAREAD-----> IDLE
parameter GUIDE_LOW_DUR      =  230000;  // idle_count    230000*0.02us = 4.60ms, threshold for IDLE--------->GUIDANCE
parameter GUIDE_HIGH_DUR     =  210000;  // state_count   210000*0.02us = 4.20ms,  4.5-4.2 = 0.3ms<BIT_AVAILABLE_DUR = 0.4ms,threshold for GUIDANCE------->DATAREAD
parameter DATA_HIGH_DUR      =  41500;	 // data_count    41500 *0.02us = 0.83ms, sample time from the posedge of iIRDA
parameter BIT_AVAILABLE_DUR  = 20000;    // data_count  20000.0.02us = 0.4ms,the sample bit pointer,can inhibit the interference from iIRDA signal
////////port ////////////

input iCLK;    //input clk,50MHz
input iRST_n;  //rst
input iIRDA;   //Irda RX output decoded data
input iREAD;   //read command

output  oDATA_REAY;  //data ready flag
output [31:0] oDATA; //output data ,32bit 

/////////reg or wire/////////////////////

reg DATA_REAY;             //data ready flag

reg [17:0] idle_count;     //idle_count counter work under data_read state
reg idle_count_flag;       //idle_count conter flag

reg [17:0] state_count;    //state_count counter work under guide state
reg state_count_flag;      //state_count conter flag

reg [17:0] data_count;     //data_count counter work under data_read state
reg data_count_flag;       //data_count conter flag


reg [5:0] bitcount;        //sample bit pointer
reg [1:0] state;           //state reg
reg [31:0] DATA;           //data reg
reg [31:0] DATA_BUF;       //data buf
reg [31:0] oDATA;          //data output reg

////////////////////stuctural code//////////////////////////////////
// initial
initial
	begin 
		state =  IDLE;     //state initial
		DATA_REAY = 1'b0;  //set the dataready flag to 0
		bitcount = 0;      //set the data reg pointer to 0
		DATA = 0;          //clear the data reg
		DATA_BUF = 0;      //clear the data buf
		state_count = 0;   //guide high level time counter 0
		data_count = 0;    //dataread state time counter 0
		idle_count = 0;    //start low voltage level time counter 0
	end
	
assign oDATA_REAY = DATA_REAY;

//idle count work on iclk under IDLE  state only
always @(negedge iRST_n or  posedge iCLK )	
   begin
	  if(!iRST_n)
		 idle_count <= 0;   //rst
	  else		 
		 begin
		    if( idle_count_flag )    //the counter start when the  flag is set 1
				idle_count <= idle_count + 1'b1;
			else  
				idle_count <= 0;	  //the counter stop when the  flag is set 0		      		 	
		 end
   end

//idle counter switch when iIRDA is low under IDLE state

always @( negedge iRST_n  or  posedge iCLK)	
   begin
	  if( !iRST_n )
		 idle_count_flag <= 1'b0;   // reset off
	   else
	     
	     begin
			   if((state == IDLE) &&(!iIRDA))       // negedge start
					idle_count_flag <= 1'b1;        //on
				else                                //negedge
					idle_count_flag <= 1'b0;		//off     		 	
		 end	  
   end  
//state count work on iclk under GUIDE  state only
always @(negedge iRST_n or  posedge iCLK )	
   begin
	  if(!iRST_n)
		 state_count <= 0;   //rst
	  else		 
		 begin
		    if( state_count_flag )    //the counter start when the  flag is set 1
				state_count <= state_count + 1'b1;
			else  
				state_count <= 0;	  //the counter stop when the  flag is set 0		      		 	
		 end
   end	

//state counter switch when iIRDA is high under GUIDE state

always @( negedge iRST_n  or  posedge iCLK)	
   begin
	  if( !iRST_n )
		 state_count_flag <= 1'b0; // reset off
	   else
	     
	     begin
			   if((state == GUIDANCE) &&(iIRDA))     // posedge start
					state_count_flag <= 1'b1;       //on
				else   //negedge
					state_count_flag <= 1'b0;		//off     		 	
		 end	  
   end  

//state change between IDLE,GUIDE,DATA_READ according to irda edge or counter
always @(negedge iRST_n or posedge iCLK ) 
   begin
	   if(!iRST_n)	     
	      state <= IDLE;    //RST 
	   else 
	      
	      begin
				if( (state == IDLE) &&(idle_count > GUIDE_LOW_DUR))  // state chang from IDLE to Guidance when detect the negedge and the low voltage last for >2.6ms
				   state <= GUIDANCE;           
				else if ( state == GUIDANCE )      //state change from GUIDANCE to dataread if state_coun>13107 =2.6ms
				       begin 
				         if( state_count > GUIDE_HIGH_DUR )
				             state <= DATAREAD;
				       end
				     else if(state == DATAREAD)    //state change from DATAREAD to IDLE when data_count >IDLE_HIGH_DUR = 5.2ms,or the bit count = 33
				            begin
								if( (data_count >= IDLE_HIGH_DUR ) || (bitcount>= 6'b100001) )
								     state <= IDLE;
	                        end
	                       else
	                          state <= IDLE; //default
			    			
	      end
	       
   end

// data read decode counter based on iCLK
always @(negedge iRST_n or  posedge iCLK)	
   begin
	  if(!iRST_n)
		 data_count <= 1'b0;  //clear
	  else
		 
		 begin
		    if(data_count_flag)
				data_count <= data_count + 1'b1;
			else 
				data_count <= 1'b0;  //stop and clear
		 end
   end
					
//data counter switch
always @(negedge iRST_n  or posedge iCLK  )
	begin
	   if(!iRST_n) 
		    data_count_flag <= 0;		       //reset off the counter
	   else
	     	
	     	begin
			 if(state == DATAREAD)
			   begin
				 if(iIRDA)                 
				     data_count_flag <= 1'b1;  //on when posedge
				 else
				     data_count_flag <= 1'b0;  //off when negedge
			   end
			 else 
			   data_count_flag <= 1'b0;        //off when other state				
	     end
	end	

// data decode base on the value of data_count 	
always @(negedge iRST_n or posedge iCLK )
	begin
	    if( (!iRST_n) )
	        DATA <= 0;      //rst
		else
			
			begin 
	         if (state == DATAREAD )
			  begin
			     if(data_count >= DATA_HIGH_DUR )//2^15 = 32767*0.02us = 0.64us
			        DATA[bitcount-1'b1] <= 1'b1; //>0.52ms  sample the bit 1
				 else					
				    begin
				    if(DATA[bitcount-1'b1]==1)
						DATA[bitcount-1'b1] <= DATA[bitcount-1'b1]; //<=0.52   sample the bit 0
					else
					    DATA[bitcount-1'b1] <= 1'b0;
					end
			  end
			 else
			     DATA <= 0;
		   end	
	end	
	
// data reg pointer counter 
always @(negedge iRST_n or posedge iCLK )
begin
    if (!iRST_n)
      bitcount <= 1'b0;  //rst
	else
	  
	  begin
	    if(state == DATAREAD)
			begin
				if( data_count == 20000 )
					bitcount <= bitcount + 1'b1; //add 1 when iIRDA posedge
			end   
	    else
	       bitcount <= 1'b0;
	  end
end   

// set the data_ready flag 
always @(negedge iRST_n or posedge iCLK) 
begin
	if(!iRST_n)
	   DATA_REAY <=1'b0 ; //rst
    else
       
       begin
		if(bitcount == 6'b100000)   //32bit sample over
		    begin
				if( DATA[31:24]== ~DATA[23:16])
				  begin		
					DATA_BUF <= DATA;   //fetch the value to the databuf from the data reg
				 	DATA_REAY <= 1'b1;  //set the data ready flag
				  end	
				else
				    DATA_REAY <=1'b0 ;  //data error
		    end
		else
		    DATA_REAY <=1'b0 ;          //not ready
	   end	
end	
//read data
always @(negedge iRST_n or posedge iCLK)
begin
	if(!iRST_n)
		oDATA <= 32'b0000; //rst
	 else
	 begin   
	    if(iREAD && DATA_REAY)
	       oDATA <= DATA_BUF;  //output	    
	 end	 
end	
					
endmodule
