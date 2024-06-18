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
module thymesisflow_llc_framer (
    input              clock                   // Clock - samples & launches data on rising edge
  , input              reset_n                //  Active Low

  // fifo_in AXI-STREAM 
  , input  [255:0]       fifo_in_tdata          
  , input                fifo_in_tvalid         
  , output               fifo_in_tready
  // fifo_out AXI4-frame
  , output [255:0]       fifo_out_tdata
  , output [31:0]        fifo_out_tkeep 
  , output               fifo_out_tlast 
     
  , output               fifo_out_tvalid
  , input                fifo_out_tready 

  , output[7:0]          reada  
  , input [255:0]        read_data 

  , output               wen 
  , output [7:0]         writea
  , output [255:0]       write_data 

  /*
   * Retransmission signals below. These come from the aurora parser that receives data. 
   * There are two different types of signals, and since parser handles serially the frames
   * they will never co-incident. 
  */

  //Local retransmission request i.e. local Rx crc error detected and the other side should receive a failure message.
  , input [5:0]          resend_frame_id
  , input                resend_frame_id_valid
   
  //Remote retransmission request i.e. Remote Rx crc error detected and this side should retransmit frames.
  , input [5:0]          remote_resend_frame_id
  , input                remote_resend_frame_id_valid
  
) ;


// ==============================================================================================================================
// @@@  Implement thymesisflow_llc_framer
// ==============================================================================================================================

reg [1:0] wrptr; //4 flits
reg [1:0] rdptr; //4 flits

reg [5:0] wrq;  //64 queues
reg [5:0] rdq;  //64 queues

reg         datarvalid;
reg [255:0] wd_stage2; // BRAM read/write collision bypass 

reg [255:0]   wd;
reg [7:0]     wa;
reg           we;

reg [3:0]     data_valid[63:0]; //64 4 flit valid masks one per queue

wire full[63:0];     //64 full signals one per queue
wire all_full;       //all queues full signal

wire not_empty[63:0]; //64 not empty signals one per queue
wire all_not_empty;   //when zero all not empty guarantees all queues are empty

//generating full and empty signal assignments
parameter SIZE = 63;
genvar idx;
generate 
 for (idx = 0; idx <= SIZE; idx=idx+1) 
  begin
   assign full[idx]      = (data_valid[idx] == 4'hF)? 1'b1:1'b0;
   assign not_empty[idx] = (data_valid[idx] == 4'h0)? 1'b0:1'b1; 
  end
endgenerate 


//assigning all empty - needs to get revisited with generare or reduce operators
assign all_not_empty =  ((not_empty[0] == 1'b1)  || (not_empty[1] == 1'b1)  || (not_empty[2] == 1'b1)  || (not_empty[3] == 1'b1)  ||
                        (not_empty[4] == 1'b1)  || (not_empty[5] == 1'b1)  || (not_empty[6] == 1'b1)  || (not_empty[7] == 1'b1)  ||
                        (not_empty[8] == 1'b1)  || (not_empty[9] == 1'b1)  || (not_empty[10] == 1'b1) || (not_empty[11] == 1'b1) ||
                        (not_empty[12] == 1'b1) || (not_empty[13] == 1'b1) || (not_empty[14] == 1'b1) || (not_empty[15] == 1'b1) ||
                        (not_empty[16] == 1'b1) || (not_empty[17] == 1'b1) || (not_empty[18] == 1'b1) || (not_empty[19] == 1'b1) ||
                        (not_empty[20] == 1'b1) || (not_empty[21] == 1'b1) || (not_empty[22] == 1'b1) || (not_empty[23] == 1'b1) ||
                        (not_empty[24] == 1'b1) || (not_empty[25] == 1'b1) || (not_empty[26] == 1'b1) || (not_empty[27] == 1'b1) ||
                        (not_empty[28] == 1'b1) || (not_empty[29] == 1'b1) || (not_empty[30] == 1'b1) || (not_empty[31] == 1'b1) ||
                        (not_empty[32] == 1'b1) || (not_empty[33] == 1'b1) || (not_empty[34] == 1'b1) || (not_empty[35] == 1'b1) ||
                        (not_empty[36] == 1'b1) || (not_empty[37] == 1'b1) || (not_empty[38] == 1'b1) || (not_empty[39] == 1'b1) ||
                        (not_empty[40] == 1'b1) || (not_empty[41] == 1'b1) || (not_empty[42] == 1'b1) || (not_empty[43] == 1'b1) ||
                        (not_empty[44] == 1'b1) || (not_empty[45] == 1'b1) || (not_empty[46] == 1'b1) || (not_empty[47] == 1'b1) ||
                        (not_empty[48] == 1'b1) || (not_empty[49] == 1'b1) || (not_empty[50] == 1'b1) || (not_empty[51] == 1'b1) ||
                        (not_empty[52] == 1'b1) || (not_empty[53] == 1'b1) || (not_empty[54] == 1'b1) || (not_empty[55] == 1'b1) ||
                        (not_empty[56] == 1'b1) || (not_empty[57] == 1'b1) || (not_empty[58] == 1'b1) || (not_empty[59] == 1'b1) ||
                        (not_empty[60] == 1'b1) || (not_empty[61] == 1'b1) || (not_empty[62] == 1'b1) || (not_empty[63] == 1'b1)) ? 1'b1:1'b0;

assign all_full = ((full[0]  == 1'b0)  || (full[1] == 1'b0)   || (full[2] == 1'b0)   || (full[3] == 1'b0)  ||
                   (full[4]  == 1'b0)  || (full[5] == 1'b0)   || (full[6] == 1'b0)   || (full[7] == 1'b0)  ||
                   (full[8]  == 1'b0)  || (full[9] == 1'b0)   || (full[10] == 1'b0)  || (full[11] == 1'b0) ||
                   (full[12] == 1'b0)  || (full[13] == 1'b0)  || (full[14] == 1'b0)  || (full[15] == 1'b0) ||
                   (full[16] == 1'b0)  || (full[17] == 1'b0)  || (full[18] == 1'b0)  || (full[19] == 1'b0) ||
                   (full[20] == 1'b0)  || (full[21] == 1'b0)  || (full[22] == 1'b0)  || (full[23] == 1'b0) ||
                   (full[24] == 1'b0)  || (full[25] == 1'b0)  || (full[26] == 1'b0)  || (full[27] == 1'b0) ||
                   (full[28] == 1'b0)  || (full[29] == 1'b0)  || (full[30] == 1'b0)  || (full[31] == 1'b0) ||
                   (full[32] == 1'b0)  || (full[33] == 1'b0)  || (full[34] == 1'b0)  || (full[35] == 1'b0) ||
                   (full[36] == 1'b0)  || (full[37] == 1'b0)  || (full[38] == 1'b0)  || (full[39] == 1'b0) ||
                   (full[40] == 1'b0)  || (full[41] == 1'b0)  || (full[42] == 1'b0)  || (full[43] == 1'b0) ||
                   (full[44] == 1'b0)  || (full[45] == 1'b0)  || (full[46] == 1'b0)  || (full[47] == 1'b0) ||
                   (full[48] == 1'b0)  || (full[49] == 1'b0)  || (full[50] == 1'b0)  || (full[51] == 1'b0) ||
                   (full[52] == 1'b0)  || (full[53] == 1'b0)  || (full[54] == 1'b0)  || (full[55] == 1'b0) ||
                   (full[56] == 1'b0)  || (full[57] == 1'b0)  || (full[58] == 1'b0)  || (full[59] == 1'b0) ||
                   (full[60] == 1'b0)  || (full[61] == 1'b0)  || (full[62] == 1'b0)  || (full[63] == 1'b0)) ? 1'b0 : 1'b1;


/* rdptr should always closely chase wrptr for this approach to work and perform. In case aurora does not accept
   data (during cc cycles) we need to propagate the stall with wrptr only a one or two frame slots ahead of rdptr, 
   else as clock compensation stalls continue, the wptr will end up rollovering the buffer and chase the 
   rdptr. If this happens there will not be a large enough sent data log for retransmission in case of failure.
   The frame_distance housekeeping and it's association with in_tready makes sure that wrptr cannot get far away.
 */
 
reg [5:0] frame_distance;
assign fifo_in_tready = ((frame_distance <= 6'b000001) && (rdy_lock == 1'b0))? 1'b1 : 1'b0;                          

//frame distance process makes sure that wrptr is just a frame slot away from rdptr.
always @(posedge(clock))
begin
  if (reset_n == 1'b0)
    begin
       frame_distance <= 6'b0;
    end
  else if (wrq < rdq) 
           frame_distance <= (6'h3f - rdq) + wrq + 6'b01; //when rdq == 3f if here then wrq is already 1 frame ahead   
  else if ((wrq >= rdq) && (all_full == 1'b0)) //if all_full is 1 then frame distance is the whole buffer - should never happen
       frame_distance <= wrq - rdq;
  else frame_distance <= 6'h3f;   
end


//Write to regs below and push data in next cycle to BRAM for timing closure.
assign  wen         =  we;
assign  writea      =  wa;
assign  write_data  =  wd;

//Read always data from BRAM address produced by current rdq/rdptr combo
assign reada = {rdq,rdptr};

//Process to write incoming data to BRAM. 
always @(posedge(clock))
begin
   if (reset_n == 1'b0)
     begin
       we <= 1'b0;
       wa <= 4'b0;
       wd <= 256'b0;
     end
   else begin
       we <= fifo_in_tready & fifo_in_tvalid;
       wa <= {wrq,wrptr};
       wd <= fifo_in_tdata;
     end
end


/*
  Processes to receive and remember requests issued.
  The framer receives 2 types of requests from the local 
  parser counterpart:

  1. Remote side retransmission request. Means that the other
     side identified errors and requires a retransmission of stored frames. 
     Once a new request is received is latched until it is served and all 
     subsequent requests of this type are ignored. The rationale is that 
     the first request will cover retransmission of all subsequent failures
     anyway. After the request is served, it is safe to serve others that 
     come in. 

  2. Local side retransmission request. Means that CRC errors have been
     detected by local parser. This request transmits a single message as
     soon as the current frame is sent. 

*/


//capturing remote_retransmission request
reg         remote_retrans_req_valid;
reg [255:0] remote_retrans_frame;

always @(posedge(clock)) 
begin
   if (reset_n == 1'b0) 
     begin
        remote_retrans_req_valid   <=    1'b0;
        remote_retrans_frame       <=  256'b0;
     end
   //this approach ignores also a possible request that comes in in the same cycle as 
   //when this finishes, but it is safe to be ignored as it will be covered by the older one.
   else if ((remote_resend_frame_id_valid == 1'b1) && (remote_retrans_req_valid == 1'b0)) 
     begin
        remote_retrans_req_valid   <=  1'b1;
        remote_retrans_frame[0]    <=  1'b1;
        remote_retrans_frame[6:1]  <=  remote_resend_frame_id;
        remote_retrans_frame[7]    <=  1'b0;
     end 
   else if ((smstate == SM_RM_SEND_PREAMBLE) && (inband_msg_sent == 1'b1))
     begin
        remote_retrans_req_valid    <=  1'b0;
        remote_retrans_frame[7]     <=  1'b1;
        remote_retrans_frame[255:8] <= 248'b0;
        remote_retrans_frame[6:0]   <= 7'b0;        
     end
end

//capturing local_retransmission request
reg         retrans_req_valid;
reg [255:0] retrans_frame;

always @(posedge(clock)) 
begin
   if (reset_n == 1'b0) 
     begin
        retrans_req_valid <=  1'b0;
        retrans_frame     <=  256'b0;
     end
   //this approach ignores also a possible request that comes in in the same cycle as 
   //when this finishes, but it is safe to be ignored as it will be covered by retransmissions initiated by the older one.
   else if ((resend_frame_id_valid == 1'b1)  &&  (retrans_req_valid == 1'b0)) 
     begin
        retrans_req_valid   <= 1'b1;
        retrans_frame[0]    <= 1'b1;
        retrans_frame[6:1]  <= resend_frame_id;
     end 
   else if ((smstate == SM_RETRANS_MSG_XMIT) && (inband_msg_sent == 1'b1))
     begin
        retrans_req_valid    <= 1'b0;
        retrans_frame        <= 256'b0;
     end
end

reg [3:0] smstate;

wire   resend_req_active;
assign resend_req_active = smstate[0];

wire   activate_patching;
assign activate_patching = smstate[2];

wire   activate_resend_msg_xmit;
assign activate_resend_msg_xmit = smstate[1];

wire   resend_preamble_active;
assign resend_preamble_active = smstate[3];

reg [1:0]  send_state_selector;
reg        lock_valid_mask_updates;

parameter SM_IDLE                 = 4'b0000;
parameter SM_RETRANS_REQ          = 4'b0001;
parameter SM_RETRANS_MSG_XMIT     = 4'b0011;
parameter SM_RM_ACTIVATE_PATCHING = 4'b0101;
parameter SM_RM_SEND_PREAMBLE     = 4'b1001; 


always @(posedge(clock))
begin 
   if (reset_n == 1'b0)
      begin
         smstate                 <= 4'b0;
         send_state_selector     <= 2'b0;
         lock_valid_mask_updates <= 1'b0;
      end
   else begin
        case (smstate)
           SM_IDLE: 
               if (remote_retrans_req_valid == 1'b1)
                  begin
                      smstate             <= SM_RETRANS_REQ;
                      send_state_selector <= 2'b10;
                  end
               else if (retrans_req_valid == 1'b1)
                  begin
                      smstate             <= SM_RETRANS_REQ;
                      send_state_selector <= 2'b01;
                  end
           SM_RETRANS_REQ:
                 /*wait a possible frame in transit to complete in order to activate safely the patching
                   that will tamper with the masks. */
                 if((datarvalid == 1'b0) && (ping_pong_valid == 1'b0)  && (resend_rptr_lock == 1'b1))
                      smstate <= smstate | (4'b01 << send_state_selector);  //selects the flow from here onwards either msg xmit or activate patching
           SM_RM_ACTIVATE_PATCHING:
                 //Just wait for bitmask patching -- in next refactoring it should  be merged with the state below
                 if (valid_patch_done == 1'b1) 
                      smstate <= SM_RM_SEND_PREAMBLE;
           SM_RM_SEND_PREAMBLE:
                 //Just wait for preamble to be sent. 
                 if (inband_msg_sent == 1'b1) 
                      smstate <= SM_IDLE;
           SM_RETRANS_MSG_XMIT:
                //Just wait for the whole process to 
                 if (inband_msg_sent == 1'b1)
                      smstate <= SM_IDLE;
        endcase
      end
end


//manage wrq queue pointer
always @(posedge(clock))
begin
  if (reset_n == 1'b0) 
   begin
        wrq      <= 6'b0;
   end
  else if ((wrptr == 2'b11) && (fifo_in_tvalid == 1'b1) && (fifo_in_tready == 1'b1) && (wrq != 6'h3f)) //rolls over at 63
   begin
        wrq      <= wrq + 6'b000001;
   end 
  else if ((wrptr == 2'b11) && (fifo_in_tvalid == 1'b1) && (fifo_in_tready == 1'b1))
   begin
        wrq      <= 6'b0;
   end
   
end

//manage rq queue pointer
always @(posedge(clock))
begin
  if (reset_n == 1'b0) 
   begin
        rdq <= 6'b0;
   end
  else if ((valid_patch_done == 1'b1) && (resend_preamble_active == 1'b0))  //rdq is forced to resend a frames.
   begin
        rdq <= resend_rdq_set; //the frame id from which retransmission needs to start.
   end
  else if ((rdptr == 2'b11) && (ping_pong_buffer_ready == 1'b1) && (rdq != 6'h3f) && (all_not_empty == 1'b1) && (resend_rptr_lock == 1'b0)) //rolls over at 63
   begin
        rdq <= rdq + 6'b000001;
   end 
  else if ((rdptr == 2'b11) && (ping_pong_buffer_ready == 1'b1) && (all_not_empty == 1'b1) && (resend_rptr_lock == 1'b0))
   begin
        rdq <= 6'b0;
   end 
end

reg rdy_lock;
wire write_lock;

assign write_lock = ((wrptr == 2'b0) && (resend_req_active == 1'b1)) ? 1'b1 : 1'b0;

//manage wrptr of current buffer
always @(posedge(clock))
begin
 if (reset_n == 1'b0)
  begin
       wrptr <= 2'b00;
       rdy_lock <= 1'b0;
  end
 else if ((fifo_in_tready == 1'b1) && (fifo_in_tvalid == 1'b1) && (wrptr != 2'b11))
  begin 
       wrptr <= wrptr + 2'b01;
  end
 else if ((fifo_in_tready == 1'b1) && (fifo_in_tvalid == 1'b1))
  begin
       rdy_lock <= resend_req_active; 
       wrptr <= 2'b00;
  end
 else  rdy_lock <= write_lock;  
end

reg read_wb;
//manage BRAM read bypass in case of read/write address collision
//when WRITE_FIRST approach is required.
always @(posedge(clock))
begin
  if (reset_n == 1'b0)
   begin
     read_wb <= 1'b0;
   end 
  else if ((reada == wa) && (all_full == 1'b0))
     read_wb <= 1'b1;
   else
     read_wb <= 1'b0;
end

reg resend_rptr_lock;
//manage rdptr
always @(posedge(clock))
begin
 if (reset_n == 1'b0)
  begin
         rdptr            <= 2'b00;
         resend_rptr_lock <= 1'b0;
         datarvalid       <= 1'b0;
  end
  else if ((ping_pong_buffer_ready == 1'b1) && (rdptr != 2'b11) && (all_not_empty == 1'b1) && (resend_rptr_lock == 1'b0))
  begin 
         rdptr      <= rdptr + 2'b01;
         wd_stage2  <= wd; 
         datarvalid <= data_valid[rdq][rdptr]; //let ping pong buffer capture the output in the next cycle if valid
  end
 else if ((ping_pong_buffer_ready == 1'b1) && (all_not_empty == 1'b1) && (rdptr == 2'b11) && (resend_rptr_lock == 1'b0))
  begin
         resend_rptr_lock <= resend_req_active; //next cycle will deliver a new frame. If resend_req is active don't let that happen
         rdptr            <= 2'b00;
         wd_stage2        <= wd;
         datarvalid       <= data_valid[rdq][rdptr]; //let ping pong buffer capture the output in the next cycle if valid and not blocked
  end
 else if (rdptr == 2'b00) 
    begin   
         datarvalid       <= 1'b0; //ping pong output should not capture anything.
         resend_rptr_lock <= resend_req_active; // lift the lock only if rdptr is 0.
    end
 else    datarvalid       <= 1'b0;
end

integer i,j; //for-loops to init and copy arrays
// Manage valid indicators
always @(posedge(clock))
begin
    if (reset_n == 1'b0)
      begin
         for (i = 0; i <= SIZE; i = i+1)
             data_valid[i] <= 4'h0;
      end   

    else if ((valid_patch_done == 1'b1) && (resend_preamble_active == 1'b0) ) //custom update of valids due to resend.
      begin
         for (j = 0; j <= SIZE; j = j+1)
             data_valid[j] <= data_valid[j] | data_valid_resend[j]; //OR to not mask a possibly half full wrptr queue
             
      end          //fifo_in_tready protects updates in case retransmission is active
    else if ((fifo_in_tvalid == 1'b1) && (fifo_in_tready == 1'b1) &&   
                                                  ((ping_pong_buffer_ready == 1'b0) || (all_not_empty == 1'b0) || (resend_rptr_lock == 1'b1)))   
            data_valid[wrq] <= data_valid[wrq] | (4'h01 << wrptr); 
    
    else if (((fifo_in_tvalid == 1'b0) || (fifo_in_tready == 1'b0)) && (ping_pong_buffer_ready == 1'b1) && (resend_rptr_lock == 1'b0))
            data_valid[rdq] <= data_valid[rdq] & ~(4'h01 << rdptr); 
    else if ((all_full == 1'b0)  && (wrq == rdq) && (fifo_in_tvalid == 1'b1) && (ping_pong_buffer_ready == 1'b1) && (fifo_in_tready == 1'b1)) 
            data_valid[rdq] <= (data_valid[rdq] | (4'h01 << wrptr)) & ~(4'h01 << rdptr);  // Both set
            //same as above but rdq wrq do not overlap
    else if ((all_full == 1'b0) && (fifo_in_tready == 1'b1) && (fifo_in_tvalid == 1'b1) && (ping_pong_buffer_ready == 1'b1)) 
         begin
            data_valid[rdq] <= (data_valid[rdq] & ~(4'h01 << rdptr));  // Both set and clear a bit 
            data_valid[wrq] <= (data_valid[wrq] | (4'h01 << wrptr));  // Both set and clear a bit 
         end
end


//resend  registers
reg [3:0] data_valid_resend[63:0];
reg [5:0] resend_rdq;
reg [5:0] resend_rdq_set;
reg [5:0] resend_rdq_one_ahead;
reg       fix_valids;

reg       valid_once;
reg       valid_patch_done;

wire fix_valids_done;
assign fix_valids_done = ((resend_rdq_one_ahead == wrq) && (valid_once == 1'b1)) ? 1'b1 : 1'b0; 

integer k; //for loop reset
//Fix valids
always @(posedge(clock)) 
begin
  if (reset_n == 1'b0)
     begin 
         valid_patch_done     <= 1'b0;
         valid_once           <= 1'b0;
         fix_valids           <= 1'b0;
         resend_rdq           <= 6'b0;
         resend_rdq_set       <= 6'b0;
         resend_rdq_one_ahead <= 6'b0;
         for (k = 0; k <= SIZE; k=k+1)
                 data_valid_resend[k] <= 4'b0; 
     end
  else if ((fix_valids == 1'b1) && ((resend_rdq != wrq) || (valid_once == 1'b0)))
     begin
         
         valid_patch_done              <= fix_valids_done; 
         valid_once                    <= 1'b1;
         data_valid_resend[resend_rdq] <= 4'hF;
         if (resend_rdq != 6'h3f)
            resend_rdq                    <= resend_rdq + 6'b01;
         else resend_rdq                  <= 6'b0;
         if (resend_rdq_one_ahead != 6'h3f)
            resend_rdq_one_ahead          <= resend_rdq_one_ahead + 6'b01; 
         else resend_rdq_one_ahead        <= 6'b0;
     end
  else if (activate_patching == 1'b1 && valid_patch_done == 1'b0)  //resend is activated fire the patching of valids
     begin
         if (remote_retrans_frame[6:1] != 6'h3f)
            resend_rdq_one_ahead       <= remote_retrans_frame[6:1] + 6'b01; //used to signal end of patching process
         else 
            resend_rdq_one_ahead       <= 6'b0; //used to signal end of patching process one ahead is zero
         resend_rdq                 <= remote_retrans_frame[6:1]; // used for fixing valid masks
         resend_rdq_set             <= remote_retrans_frame[6:1]; // used for resetting rdq pointer
         fix_valids                 <= 1'b1;
         valid_once                 <= 1'b0; //in the unlikely event that resend_rdq = wrq need to resend the whole storage.
         for (k = 0; k <= SIZE; k=k+1)
             data_valid_resend[k] <= 4'b0; 
     end                       
  else if (activate_patching == 1'b0) 
     begin
         valid_patch_done <= 1'b0;//signals the control state machine that patching of valids is complete
         fix_valids       <= 1'b0;
         valid_once       <= 1'b0;
     end
end


//inband command send SMC (state machine command)
reg         cmdrvalid;
reg [255:0] cmdframe;
reg         smcstate;
reg [1:0]   counter;
reg         inband_msg_sent;
parameter SMC_IDLE = 1'b0;
parameter SMC_SEND = 1'b1;

always @(posedge(clock))
  if (reset_n == 1'b0) 
    begin
      smcstate          <= 1'b0;
      cmdrvalid         <= 1'b0;
      cmdframe          <= 256'b0;
      inband_msg_sent   <= 1'b0;
    end
  else
    begin
      case (smcstate)
          SMC_IDLE: 
               if ((resend_preamble_active == 1'b1) && (ping_pong_buffer_ready == 1'b1) && (inband_msg_sent == 1'b0))
                  begin
                    inband_msg_sent    <= 1'b0;
                    counter            <= 2'b10; //number of retransmits
                    cmdrvalid          <= 1'b1; 
                    cmdframe[7]        <= 1'b1;
                    cmdframe[255:8]    <= 248'b0;
                    cmdframe[6:0]      <= 7'b0;  
                    smcstate           <= SMC_SEND;
                  end
		       else if ((activate_resend_msg_xmit == 1'b1) && (ping_pong_buffer_ready == 1'b1) && (inband_msg_sent == 1'b0))
                  begin
                    inband_msg_sent    <= 1'b0;
                    counter            <= 2'b10;
                    cmdrvalid          <= 1'b1;
                    cmdframe           <= retrans_frame;
                    smcstate           <= SMC_SEND;
                  end
               else
                  begin
                    counter            <= 2'b00;
                    cmdrvalid          <= 1'b0;
                    cmdframe           <= 256'b0;
                    inband_msg_sent    <= 1'b0;
                  end
           SMC_SEND:
               if ((counter == 2'b0) && (ping_pong_buffer_ready == 1'b1))
                 begin
                    cmdrvalid          <= 1'b0;
                    cmdframe           <= 256'b0;
                    smcstate           <= SMC_IDLE;
                    inband_msg_sent    <= 1'b1;
                 end
               else if (ping_pong_buffer_ready == 1'b1)
                 begin
                    cmdrvalid          <= 1'b1;
                    counter            <= counter - 2'b01;
                 end
              else
                  cmdrvalid            <= 1'b0; 
      endcase 
    end


//Tlast handling to designate frame boundary
reg tlast;
always @(posedge(clock))
begin
    if(reset_n == 1'b0)
      begin
        tlast <= 1'b0;
      end
    else if ((ping_pong_buffer_ready == 1'b1) && (rdptr == 2'b11) && (data_valid[rdq][rdptr] == 1'b1))
       begin
         tlast <= 1'b1;
       end
    else
       begin
         tlast <= 1'b0;
       end
end


reg [255:0] data_out_ping;
reg [255:0] data_out_pong;
reg ping_valid;
reg pong_valid;
reg read_turn;
reg write_turn;
reg tlast_out_ping;
reg tlast_out_pong;

//2nd pipeline stage ping pong buffer input control signals 
//when both slots empty there is room to accept data in this cycle even if we fail to push in the next cycle
wire   both_out_empty;
assign both_out_empty = ((ping_valid == 1'b0) && (pong_valid == 1'b0)) ? 1'b1 : 1'b0; 

//one or none outputs are empty. We should accept only if we are pushing out in this cycle.
wire   one_or_none_out_empty;
assign one_or_none_out_empty   =  ((ping_valid == 1'b1) || (pong_valid == 1'b1)) ? 1'b1 : 1'b0;

wire   ping_pong_buffer_ready;
assign ping_pong_buffer_ready = ((both_out_empty == 1'b1) || ((one_or_none_out_empty == 1'b1) && (fifo_out_tready == 1'b1))) ? 1'b1 : 1'b0;
//end of 2nd pipeline stage

//Load ping pong buffer
always @(posedge(clock))
begin
 if (reset_n == 1'b0)
   begin
      data_out_ping  <= 256'b0;
      data_out_pong  <= 256'b0;
      tlast_out_ping <=   1'b0;
      tlast_out_pong <=   1'b0;
      pong_valid     <=   1'b0;
      ping_valid     <=   1'b0;
      write_turn     <=   1'b0;
   end
 else if (((datarvalid == 1'b1) || (cmdrvalid == 1'b1)) && (write_turn == 1'b0))
   begin
      if (cmdrvalid == 1'b1)
          data_out_ping <= cmdframe;
      else if (read_wb == 1'b1)
          data_out_ping <= wd_stage2;
      else  
          data_out_ping <= read_data;      
      ping_valid      <= 1'b1;
      tlast_out_ping  <= tlast | cmdrvalid;
      write_turn      <= 1'b1;
      if (fifo_out_tready == 1'b1)
       begin
         data_out_pong  <= 256'b0;
         tlast_out_pong <= 1'b0;
         pong_valid     <= 1'b0;
       end
   end
else if (((datarvalid == 1'b1) || (cmdrvalid == 1'b1)) && (write_turn == 1'b1))
   begin
      if (cmdrvalid)
          data_out_pong <= cmdframe;
      else if (read_wb == 1'b1)
          data_out_pong <= wd_stage2;
      else if (datarvalid == 1'b1)   
          data_out_pong <= read_data; 
      pong_valid     <= 1'b1;
      tlast_out_pong <= tlast | cmdrvalid;
      write_turn     <= 1'b0;
      if (fifo_out_tready == 1'b1)
       begin
        data_out_ping  <= 256'b0;
        tlast_out_ping <= 1'b0;
        ping_valid     <= 1'b0;
       end
   end
else if ((fifo_out_tready == 1'b1) && (read_turn == 1'b0))
   begin
       data_out_ping   <= 256'b0;
       ping_valid      <= 1'b0;
       tlast_out_ping  <= 1'b0;
   end
else if (fifo_out_tready == 1'b1)
   begin
       data_out_pong   <= 256'b0;
       pong_valid      <= 1'b0;
       tlast_out_pong  <= 1'b0;
   end
end

//Ping-pong buffer read_turn control
always @(posedge(clock))
begin
if (reset_n == 1'b0)
 begin
     read_turn <= 1'b0;
 end
else if ((ping_pong_valid == 1'b1) && (fifo_out_tready == 1'b1))
 begin
     read_turn <= ~read_turn;
 end
else read_turn <= read_turn;
end


//Output signals start
wire ping_pong_valid;
assign ping_pong_valid = ping_valid | pong_valid;

//Ping pong out
assign fifo_out_tdata = (read_turn == 1'b0) ? data_out_ping : data_out_pong;
//
assign fifo_out_tvalid =  ping_valid | pong_valid;
//wlast out
assign fifo_out_tlast = (read_turn == 1'b0) ? tlast_out_ping : tlast_out_pong;
//tkeep hardcoded
assign fifo_out_tkeep = 32'hffffffff;
//Output signals end

endmodule 
