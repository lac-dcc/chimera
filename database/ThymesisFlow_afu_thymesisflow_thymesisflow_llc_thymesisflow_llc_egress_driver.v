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
// This module features 2 stage pipeline and uses a ping pong buffer at the second stage. This approach stages TREADY signal coming  from the framer and relaxes timing constraints.

module thymesisflow_llc_egress_driver (

    input              clock                   // Clock - samples & launches data on rising edge
  , input              reset_n                //  Active Low

  // 32B incoming data Interface
  , input   [255:0]     driver_in_tdata
  , input               driver_in_tvalid
  , output              driver_in_tready

  // 32B AXI-STREAM 
  , output  [255:0]     driver_out_tdata     
  , output              driver_out_tvalid         
  , input               driver_out_tready

);


reg [255:0]  outdata_s1;
reg          outdata_s1_vld;

reg [255:0]  outdata_ping;
reg          outdata_ping_vld;

reg [255:0]  outdata_pong;
reg          outdata_pong_vld;
  
wire ping_pong_ready;
assign ping_pong_ready = (outdata_ping_vld == 1'b0) || (outdata_pong_vld == 1'b0);

reg pp_turn_w;
reg pp_turn_r;


//Encoding of the various flit cases based on OpenCAPI TL/TLx protocol
reg  [1:0] ocapi_sm;

parameter CMDFLIT     = 2'b01;
parameter DATAFLIT    = 2'b10;

wire   is_cmd;
assign is_cmd = ocapi_sm[0];

wire is_data;
assign is_data = ocapi_sm[1];

assign driver_in_tready = ((ping_pong_ready == 1'b1) || (outdata_s1_vld == 1'b0));  

wire [1:0] cmd_dl;
assign cmd_dl  = driver_in_tdata[167:166]; //according to the mapping

wire [1:0] resp_dl;
assign resp_dl = driver_in_tdata[227:226];

//Check command types
wire   is_writecmd;
assign is_writecmd = driver_in_tdata[253];

wire   is_respRok;
assign is_respRok  = ((driver_in_tdata[250] == 1'b1) && (driver_in_tdata[248] == 1'b0));


reg [1:0] frame_counter;

always @(posedge(clock))
begin
  if (reset_n == 1'b0)
    begin
      frame_counter <= 2'b00;
    end
  else if (((driver_in_tvalid == 1'b1) && (driver_in_tready == 1'b1)) || 
           ((driver_in_tvalid == 1'b0) && (driver_in_tready == 1'b1)  && (is_cmd == 1'b1) && (frame_counter !=2'b00)))
    begin
      frame_counter <= frame_counter + 2'b01;
    end
end


reg [2:0] dflit_size;

always @(posedge(clock))
begin
   if (reset_n == 1'b0)
    begin
      dflit_size     <= 3'b0;
      ocapi_sm       <= CMDFLIT;
    end
   else
    case (ocapi_sm) 
       CMDFLIT:                                   
	    begin
              if ((driver_in_tready == 1'b1) && (driver_in_tvalid == 1'b1) &&
                                              ((is_writecmd == 1'b1) || (is_respRok == 1'b1))) //Commands with dataflits
                 begin
                    ocapi_sm    <= DATAFLIT;
                    dflit_size  <= 3'b100;
                 end
            end
       DATAFLIT:                                   
	    begin
              if ((driver_in_tready == 1'b1) && (driver_in_tvalid == 1'b1) && (dflit_size != 3'b001)) //Commands with dataflits
                     dflit_size <= dflit_size - 3'b001;
                 else if ((driver_in_tready == 1'b1) && (driver_in_tvalid == 1'b1))
                     ocapi_sm  <= CMDFLIT; 
            end
    endcase
end    


//first_stage
always @(posedge(clock))
begin
  if (reset_n  == 1'b0) 
    begin
        outdata_s1                       <=  256'b0;
        outdata_s1_vld                   <=    1'b0;
    end
  else if ((driver_in_tvalid == 1'b1) &&
               (((outdata_s1_vld == 1'b1) &&  (ping_pong_ready == 1'b1)) || (outdata_s1_vld == 1'b0))
     ) //Cmd flit out
     begin
        outdata_s1                       <= driver_in_tdata;//or resp is located at the higher part
        outdata_s1_vld                   <= 1'b1;
     end 
  else if ((driver_in_tvalid == 1'b0) && (is_cmd == 1'b1) && (frame_counter !=2'b00)  &&
             (((outdata_s1_vld == 1'b1) &&  (ping_pong_ready == 1'b1)) || (outdata_s1_vld == 1'b0))
          ) //No flit goes out + expecting cmd => patch with nop if needed
     begin
        outdata_s1[255]                  <=   1'b0;
        outdata_s1[254]                  <=   1'b1;
        outdata_s1[253:248]              <=   6'b0;
        outdata_s1[247:238]              <=  outdata_s1[247:238] + 10'h155;   
        outdata_s1[237:228]              <=  outdata_s1[237:228] + 10'h155;   
        outdata_s1[227:218]              <=  outdata_s1[227:218] + 10'h155;   
        outdata_s1[217:208]              <=  outdata_s1[217:208] + 10'h155;   
        outdata_s1[207:198]              <=  outdata_s1[207:198] + 10'h155;   
        outdata_s1[197:188]              <=  outdata_s1[197:188] + 10'h155;   
        outdata_s1[187:178]              <=  outdata_s1[187:178] + 10'h155;   
        outdata_s1[177:168]              <=  outdata_s1[177:168] + 10'h155;   
        outdata_s1[167:158]              <=  outdata_s1[167:158] + 10'h155;   
        outdata_s1[157:148]              <=  outdata_s1[157:148] + 10'h155;   
        outdata_s1[147:138]              <=  outdata_s1[147:138] + 10'h155;   
        outdata_s1[137:128]              <=  outdata_s1[137:128] + 10'h155;   
        outdata_s1[127:118]              <=  outdata_s1[127:118] + 10'h155;   
        outdata_s1[117:108]              <=  outdata_s1[117:108] + 10'h155;   
        outdata_s1[107:98]               <=  outdata_s1[107:98]  + 10'h155;   
        outdata_s1[97: 88]               <=  outdata_s1[97: 88]  + 10'h155;   
        outdata_s1[87: 78]               <=  outdata_s1[87: 78]  + 10'h155;   
        outdata_s1[77: 68]               <=  outdata_s1[77: 68]  + 10'h155;   
        outdata_s1[67: 58]               <=  outdata_s1[67: 58]  + 10'h155;   
        outdata_s1[57: 48]               <=  outdata_s1[57: 48]  + 10'h155;   
        outdata_s1[47: 38]               <=  outdata_s1[47: 38]  + 10'h155;   
        outdata_s1[37: 28]               <=  outdata_s1[37: 28]  + 10'h155;   
        outdata_s1[27: 18]               <=  outdata_s1[27: 18]  + 10'h155;   
        outdata_s1[17: 8]                <=  outdata_s1[17:  8]  + 10'h155;   
        outdata_s1[7:  0]                <=  outdata_s1[ 7:  0]  + 10'h155;      
        outdata_s1_vld                   <=  1'b1;
     end
  else if ((ping_pong_ready == 1'b1))
     begin
        outdata_s1                       <=  256'b0;
        outdata_s1_vld                   <=    1'b0;
     end
end

//second_stage ping pong buffer
//ping data
always @(posedge(clock))
begin
    if (reset_n == 1'b0)
       begin
         outdata_ping     <= 256'b0;
         outdata_ping_vld <= 1'b0;
       end
    else if ((outdata_s1_vld == 1'b1) && (pp_turn_w == 1'b0) && (outdata_ping_vld == 1'b0))
        begin
           outdata_ping     <= outdata_s1; 
           outdata_ping_vld <= 1'b1;
        end
   else if ((pp_turn_r == 1'b0) && (driver_out_tready == 1'b1)) //ping is being read
        begin
           outdata_ping_vld <= 1'b0;
        end
end

//pong data
always @(posedge(clock))
begin
    if (reset_n == 1'b0)
       begin
         outdata_pong     <= 256'b0;
         outdata_pong_vld <= 1'b0;
       end
    else if ((outdata_s1_vld == 1'b1) && (pp_turn_w == 1'b1) && (outdata_pong_vld == 1'b0))
        begin
           outdata_pong     <= outdata_s1; 
           outdata_pong_vld <= 1'b1;
        end
   else if ((pp_turn_r == 1'b1) && (driver_out_tready == 1'b1)) //ping is being read
        begin
           outdata_pong_vld <= 1'b0;
        end
end


//pp_turn_w
always @(posedge(clock))
begin
   if (reset_n == 1'b0)
       pp_turn_w <= 1'b0; //start from ping
   else if ((ping_pong_ready == 1'b1) && (outdata_s1_vld == 1'b1)) //if ping-pong buffer is ready data available change sides 
       pp_turn_w <= ~pp_turn_w; 
end

//pp_turn_r 
always @(posedge(clock))
begin
   if (reset_n == 1'b0)
       pp_turn_r <= 1'b0; //start from pong
   else if ((outdata_ping_vld == 1'b1) && (driver_out_tready == 1'b1) && (pp_turn_r == 1'b0)) //if ping-pong buffer is ready data available change sides 
       pp_turn_r <= 1'b1; 
   else if ((outdata_pong_vld == 1'b1) && (driver_out_tready == 1'b1) && (pp_turn_r == 1'b1)) //if ping-pong buffer is ready data available change sides 
       pp_turn_r <= 1'b0;
end


assign driver_out_tdata  = (pp_turn_r == 1'b0)? outdata_ping     : outdata_pong;
assign driver_out_tvalid = (pp_turn_r == 1'b0)? outdata_ping_vld : outdata_pong_vld;
                            
endmodule
