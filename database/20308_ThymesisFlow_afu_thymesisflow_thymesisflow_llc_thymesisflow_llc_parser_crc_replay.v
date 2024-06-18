// This program was cloned from: https://github.com/OpenCAPI/ThymesisFlow
// License: Apache License 2.0

// *!***************************************************************************
// *! Copyright 2019 International Business Machines
// *!
// *! Licensed under the Apache License, Version 2.0 (the "License");
// *! you may not use this file except in compliance with the License.
// *! You may obtain a copy of the License at
// *! http://www.apache.org/licenses/LICENSE-2.0 
// *!
// *! The patent license granted to you in Section 3 of the License, as applied
// *! to the "Work," hereby includes implementations of the Work in physical form.  
// *!
// *! Unless required by applicable law or agreed to in writing, the reference design
// *! distributed under the License is distributed on an "AS IS" BASIS,
// *! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// *! See the License for the specific language governing permissions and
// *! limitations under the License.
// *! 
// *! The background Specification upon which this is based is managed by and available from
// *! the OpenCAPI Consortium.  More information can be found at https://opencapi.org. 
// *!***************************************************************************
// Module designer: Dimitris Syrivelis
// Backup: Christian Pinto, Michele Gazzetti

`timescale 1ns / 10ps
// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================
module thymesisflow_llc_parser (
    input              clock                   // Clock - samples & launches data on rising edge
  , input              reset_n                //  Active Low

  , input crc_valid
    
  , input crc_ok
  
  , output [5:0] resend_frame_id
  , output       resend_frame_id_valid
  
  , output [5:0] resend_remote_frame_id
  , output       resend_remote_frame_id_valid

   // fifo_in AXI4-frame
  , input [255:0]       fifo_in_tdata
  , input [31:0]        fifo_in_tkeep 
  , input               fifo_in_tlast    
  , input               fifo_in_tvalid
  , output              fifo_in_tready  

   // fifo_out AXI-STREAM 
  , output  [255:0]     fifo_out_tdata          
  , output              fifo_out_tvalid        
  , input               fifo_out_tready
 

) ;

reg [31:0]  parser_flit_counter;
reg [31:0]  parser_frame_counter;


// ==============================================================================================================================
// @@@  Implement aurora_parser
// ==============================================================================================================================

reg [255:0] data[1:0][3:0];

reg [1:0] wrptr;
reg [1:0] rdptr;
reg [1:0] read_enable;
reg wrq;
reg rdq;  

reg [5:0] current_frameid;
reg [5:0] frame_id;
reg       frame_id_valid;
reg [5:0] remote_frame_id;
reg       remote_frame_id_valid;


reg [3:0] data_valid[1:0];
reg stall_parser;
reg tready;

wire not_empty[1:0];

assign resend_frame_id       = frame_id;
assign resend_frame_id_valid = frame_id_valid;

assign resend_remote_frame_id_valid = remote_frame_id_valid;
assign resend_remote_frame_id       = remote_frame_id;

assign not_empty[0] = (data_valid[0] == 4'h0) ? 1'b0:1'b1; 
assign not_empty[1] = (data_valid[1] == 4'h0) ? 1'b0:1'b1;

assign fifo_in_tready = tready; //let's not introduce timing unecessary constraints here. Backpressure makes sure this module is always ready.

wire   inband_msg_frame_received;
assign inband_msg_frame_received = ((crc_valid == 1'b1) && (tlast_distance_counter == 2'b00));


always @(posedge(clock))
begin
  if(reset_n == 1'b0) 
      parser_flit_counter <= 32'b0;
  else if (fifo_in_tvalid == 1'b1)
      parser_flit_counter <= parser_flit_counter + 32'b1;
end

always @(posedge(clock))
begin
  if(reset_n == 1'b0) 
      parser_frame_counter <= 32'b0;
  else if ((wrptr == 2'b11) && (crc_valid == 1'b1) && (crc_ok == 1'b1))
      parser_frame_counter <= parser_frame_counter + 32'b1;
end


//current_frameid manager
always @(posedge(clock))
begin
   if (reset_n == 1'b0) 
      begin
         current_frameid <= 6'b0;
      end
   else if ((wrptr == 2'b11) && (crc_valid == 1'b1) && (crc_ok == 1'b1) && (current_frameid != 6'h3f)) //roll over at 63
      begin
         current_frameid <= current_frameid + 6'b01; //this frame id received successfully we go to next one.
      end
   else if ((wrptr == 2'b11) && (crc_valid == 1'b1)  && (crc_ok == 1'b1))
      begin
         current_frameid <= 6'b0;
      end 
end

reg [1:0] tlast_distance_counter;
//detect single flit frames
always @(posedge(clock))
begin
 if (reset_n == 1'b0)
   begin
       tlast_distance_counter <= 2'b0;
   end
 else if (fifo_in_tvalid == 1'b1 && fifo_in_tlast == 1'b0)
   begin
       tlast_distance_counter <= tlast_distance_counter + 2'b01;
   end
 else if (fifo_in_tvalid == 1'b1 && fifo_in_tlast == 1'b1)
   begin
       tlast_distance_counter <= 2'b0; 
   end
end
 
//manage wrq queue pointer
always @(posedge(clock))
begin
  if (reset_n == 1'b0) 
   begin
        tready <= 1'b1;
        wrq    <= 1'b0;
   end
  else if ((wrptr == 2'b11) && (fifo_in_tvalid == 1'b1) && (fifo_in_tlast == 1'b1) && (crc_valid == 1'b1) && (crc_ok == 1'b1))
   begin
        wrq    <= ~wrq; //WQueue will not change sides if error is detected
   end
end

//stall control
always @(posedge(clock))
begin
 if (reset_n == 1'b0) 
  begin
      stall_parser          <= 1'b0; 
      frame_id              <= 6'b0;
      frame_id_valid        <= 1'b0;
      remote_frame_id       <= 6'b0;
      remote_frame_id_valid <= 1'b0;
  end  //we don't care for CRC checks on special messages as multiple copies are sent.
 else if ((crc_valid == 1'b1) && (crc_ok == 1'b0) &&  (fifo_in_tlast == 1'b1) && (wrptr == 2'b11))
  begin
      stall_parser          <= 1'b1;  //error detected...
      //schedule to send a  failure message with the egress path. 
      frame_id_valid        <= 1'b1;
      remote_frame_id_valid <= 1'b0;
      frame_id              <= current_frameid;
  end
 else if ((crc_valid == 1'b1) && (crc_ok == 1'b1) && (fifo_in_tlast == 1'b1) && (tlast_distance_counter == 2'b00)) //inband ctrl message received (one-flit frame)
  begin
        if (fifo_in_tdata[0] == 1'b1) //notify local framer to serve a remote request
             begin 
                remote_frame_id       <= fifo_in_tdata[6:1];
                remote_frame_id_valid <= 1'b1;
                frame_id_valid        <= 1'b0;
             end 
        else if (fifo_in_tdata[7] == 1'b1)//message is preamble of retransmission start, parser has to get out of stall. 
          begin 
                stall_parser          <= 1'b0; 
                frame_id_valid        <= 1'b0;
                remote_frame_id_valid <= 1'b0;
          end
  end
 else
  begin  
       frame_id_valid         <= 1'b0;
       remote_frame_id_valid  <= 1'b0;
  end
end

//Task to be done: disassociate read_enable from stall loop and make sure it updates correctly on every cycle. 
//read_enable hanlding
always @(posedge(clock))
begin
 if (reset_n == 1'b0) 
  begin
      read_enable[0]        <= 1'b0;
      read_enable[1]        <= 1'b0; 
  end
 else if ((crc_valid == 1'b1) && (crc_ok == 1'b1) && (fifo_in_tlast == 1'b1) && (wrptr == 2'b11))
  begin
      read_enable[wrq]      <= 1'b1; //error check passed, enable this frame read.
      if (rdptr == 2'b11) 
          read_enable[rdq]  <= 1'b0; //invalidate the other side
  end
 else if (rdptr == 2'b11)
  begin
      read_enable[rdq]      <= 1'b0;
  end
end


//manage rq queue pointer
always @(posedge(clock))
begin
  if (reset_n == 1'b0) 
   begin
       rdq <= 1'b0;
   end      //If write is ahead then other side read enable will be on, else infer what happened in this cycle and switch read queue or not.                    
  else if ((rdptr == 2'b11)) 
   begin
       rdq <= ~rdq;
   end 
  else 
   begin
       rdq <= rdq;
   end 
end


//manage wrptr
always @(posedge(clock))
begin
 if (reset_n == 1'b0)
  begin
      wrptr <= 2'b00;
  end
 else if (stall_parser == 1'b1)
  begin
     wrptr <= 2'b00;
  end   // fifo_in_tlast should always be low when we are in the middle of a frame or we received an inband msg.
 else if ((fifo_in_tvalid == 1'b1) && (wrptr != 2'b11) && (fifo_in_tlast==1'b0))
  begin 
     wrptr <= wrptr + 2'b01;
  end
 else if ((fifo_in_tvalid == 1'b1) && (fifo_in_tlast == 1'b1))
  begin
     wrptr <= 2'b00;
  end
end

//manage rdptr
always @(posedge(clock))
begin
 if (reset_n == 1'b0)
  begin
     rdptr <= 2'b00;
  end
 else if ((rdptr != 2'b11) && (not_empty[rdq] == 1'b1) && (read_enable[rdq] == 1'b1))
  begin 
     rdptr <= rdptr + 2'b01;
  end      
 else 
  begin
     rdptr <= 2'b00;
  end
end

// Manage valid indicator
always @(posedge(clock))
begin
    if (reset_n == 1'b0)
      begin
        data_valid[0] <= 4'h0;
        data_valid[1] <= 4'h0;
      end
    else if (stall_parser == 1'b1)
       begin
          data_valid[wrq] <= 4'h0;  //clean wrq as CRC failed.    
       end 
    //Read write conditions
    else if ((fifo_in_tvalid == 1'b1) && (stall_parser == 1'b0) && (not_empty[rdq] == 1'b1) 
                                               && (read_enable[rdq] == 1'b1) && (inband_msg_frame_received == 1'b0))
        begin
           data_valid[wrq] <= data_valid[wrq] |  (4'h01 << wrptr);  
           data_valid[rdq] <= data_valid[rdq] & ~(4'h01 << rdptr);
        end 
    //Write condition -- do not accept smaller sized or unaligned frames.
    else if ((fifo_in_tvalid == 1'b1) && (stall_parser == 1'b0) && (inband_msg_frame_received == 1'b0))
        begin
           data_valid[wrq] <= data_valid[wrq] | (4'h01 << wrptr);  
        end
    //Read condition
    else if ((not_empty[rdq] == 1'b1) && (read_enable[rdq] == 1'b1))
        begin
           data_valid[rdq] <= data_valid[rdq] & ~(4'h01 << rdptr);
        end
    else
        begin
           data_valid[1'b0] <= data_valid[1'b0];
           data_valid[1'b1] <= data_valid[1'b1];
        end
end

//Receive data to register
always @(posedge(clock))
begin
  if ((fifo_in_tvalid == 1'b1) && (stall_parser == 1'b0) && (inband_msg_frame_received == 1'b0)) data[wrq][wrptr] <= fifo_in_tdata; 
end

//Data out
assign fifo_out_tdata = ((data_valid[rdq][rdptr] == 1'b1) && (read_enable[rdq] == 1'b1))? data[rdq][rdptr] : {256'b0};
//data valid
assign fifo_out_tvalid = ((data_valid[rdq][rdptr] == 1'b1)  && (read_enable[rdq] == 1'b1))? 1'b1 : 1'b0;

endmodule 
