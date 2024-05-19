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

module thymesisflow_32B_64B_routing_compute_ingress (

    input              clock                   // Clock - samples & launches data on rising edge
  , input              reset_n                //  Active Low

  // fifo_in AXI-STREAM 
  , input  [255:0]     route_in_tdata0   
  , input              route_in_tvalid0        
  , output             route_in_tready0

  // fifo_in AXI-STREAM
  , input  [255:0]     route_in_tdata1
  , input              route_in_tvalid1    
  , output             route_in_tready1

  // fifo_out Interface
  , output  [551:0]     route_out_tdata
  , output              route_out_tvalid
  , input               route_out_tready
 
  // Round robin arbiter interface
  , output    [1:0]     arb_req
  , output              arb_req_nxt
  , input     [1:0]     arb_sel                       
 
);

//OCX_RESP flit format that is sent towards P9
`define OCX_RESP_RESPVALID      549   //1
`define OCX_RESP_DATAVALID      548   //1
`define OCX_RESP_OPCODE_BIT7    547
`define OCX_RESP_OPCODE_BIT6    546
`define OCX_RESP_OPCODE_BIT5    545
`define OCX_RESP_OPCODE_BIT4    544
`define OCX_RESP_OPCODE_BIT3    543
`define OCX_RESP_OPCODE_BIT2    542
`define OCX_RESP_OPCODE_BIT1    541
`define OCX_RESP_OPCODE_BIT0    540
`define OCX_RESP_OPCODE       547:540
`define OCX_RESP_CODE         539:536 //4
`define OCX_RESP_DL           535:534 //2
`define OCX_RESP_DP           533:532 //2
`define OCX_RESP_TAG          531:516 //16
`define OCX_RESP_BDI            515   //1
//514 is pad bit
`define OCX_RESP_NUM_FLITS    513:512 //2
`define OCX_RESP_DATA         511:0   //512 

//OCX_FLIT arrives from the network in 2x32B pairs
`define OCX_FLIT_OPCODE_BIT7   255  //511-504 = 255-248
`define OCX_FLIT_OPCODE_BIT6   254
`define OCX_FLIT_OPCODE_BIT5   253
`define OCX_FLIT_OPCODE_BIT4   252
`define OCX_FLIT_OPCODE_BIT3   251
`define OCX_FLIT_OPCODE_BIT2   250
`define OCX_FLIT_OPCODE_BIT1   249
`define OCX_FLIT_OPCODE_BIT0   248
`define OCX_FLIT_OPCODE      255:248
`define OCX_FLIT_RESPCODE    231:228
`define OCX_FLIT_RDL         227:226
`define OCX_FLIT_RDP         225:224
`define OCX_FLIT_RESPTAG      56:41

`define OCX_FLIT_NETID        40:35

// first stage registers
reg [255:0] cmdflit0_q;
reg         cmdflit0_vld;

reg [255:0] dataflit00h_q;
reg         dataflit00h_vld;

reg [255:0] dataflit00l_q;
reg         dataflit00l_vld;

reg [255:0] dataflit01h_q;
reg         dataflit01h_vld;

reg [255:0] dataflit01l_q;
reg         dataflit01l_vld;

reg [255:0] cmdflit1_q;
reg         cmdflit1_vld;

reg [255:0] dataflit10h_q;
reg         dataflit10h_vld;

reg [255:0] dataflit10l_q;
reg         dataflit10l_vld;

reg [255:0] dataflit11h_q;
reg         dataflit11h_vld;

reg [255:0] dataflit11l_q;
reg         dataflit11l_vld;

//Second stage output  registers (ping pong buffer) 
reg [551:0] outdata_ping;
reg         outdata_ping_vld;

reg [551:0] outdata_pong;
reg         outdata_pong_vld;

reg         ping_pong_w; //write ping pong buffer turn
reg         ping_pong_r; //read ping pong buffer turn

wire ping_pong_ready;


parameter PORT0 = 2'b01;
parameter PORT1 = 2'b10;

//first stage state machines
parameter PORT_CMD      = 5'b00001;
parameter PORT_DATA0_H  = 5'b00010;
parameter PORT_DATA0_L  = 5'b00100;
parameter PORT_DATA1_H  = 5'b01000;
parameter PORT_DATA1_L  = 5'b10000;

reg [4:0] portin0_sm;
reg [4:0] portin1_sm;


//second stage (output) opecapi protocol state machines

wire   is_respROK0_in;
assign is_respROK0_in = ((route_in_tdata0[`OCX_FLIT_OPCODE_BIT2] == 1'b1) && (route_in_tdata0[`OCX_FLIT_OPCODE_BIT0] == 1'b0));

wire   is_respROK1_in;
assign is_respROK1_in = ((route_in_tdata1[`OCX_FLIT_OPCODE_BIT2] == 1'b1) && (route_in_tdata1[`OCX_FLIT_OPCODE_BIT0] == 1'b0));

wire   is_respROK0;
assign is_respROK0 = (cmdflit0_q[`OCX_FLIT_OPCODE_BIT0] == 1'b1); //TLx AP Response expected as it has been transcoded. 

wire   is_respROK1;
assign is_respROK1 = (cmdflit1_q[`OCX_FLIT_OPCODE_BIT0] == 1'b1);


reg [2:0] port0_sm;
reg [2:0] port1_sm;

parameter CMD       = 3'b001;
parameter DFLIT0    = 3'b010;
parameter DFLIT1    = 3'b100;


//output port handling
wire [1:0]  outportid_cmd;
reg  [1:0]  outportid_data0;
reg  [1:0]  outportid_data1;


//Ready signals below 
assign route_in_tready0 =  (   ((cmdflit0_vld == 1'b0) && (portin0_sm[0] == 1'b1)) || //Either destination is empty OR 2nd stage is pushing out previous entry in this cycle
                               ((port0_sm[0] == 1'b1) && (portin0_sm[0] == 1'b1) && (outportid_cmd == PORT0) && (outportid_data1 == 2'b00) && (ping_pong_ready == 1'b1) && (cmdflit0_vld == 1'b1))
                           )
                             ||
                           (   ((dataflit00h_vld == 1'b0) && (portin0_sm[1] == 1'b1))|| //Either we have place for it OR we are pushing out previous entry in this cycle.
                               ((port0_sm[1] == 1'b1) && (portin0_sm[1] == 1'b1) && (outportid_data0 == PORT0) && (ping_pong_ready == 1'b1) && (dataflit00l_vld == 1'b1))
                           )
                             ||
                           (   ((dataflit00l_vld == 1'b0) && (portin0_sm[2] == 1'b1)) || //Either we have place for it OR we are pushing out previous entry in this cycle.
                               ((port0_sm[1] == 1'b1) && (portin0_sm[2] == 1'b1) && (outportid_data0 == PORT0) && (ping_pong_ready == 1'b1) && (dataflit00l_vld == 1'b1))
                           )
                             ||
                           (   ((dataflit01h_vld == 1'b0) && (portin0_sm[3] == 1'b1)) || //Either we have place for it OR we are pushing out previous entry in this cycle.
                               ((port0_sm[2] == 1'b1) && (portin0_sm[3] == 1'b1) && (outportid_data0 == PORT0) && (ping_pong_ready == 1'b1) && (dataflit01l_vld == 1'b1))
                           )
                             ||
                           (   ((dataflit01l_vld == 1'b0) && (portin0_sm[4] == 1'b1))  || //Either we have place for it OR we are pushing out previous entry in this cycle.
                               ((port0_sm[2] == 1'b1) && (portin0_sm[4] == 1'b1) && (outportid_data0 == PORT0) && (ping_pong_ready == 1'b1) && (dataflit01l_vld == 1'b1))
                           );
                           
 
assign route_in_tready1 =  (   ((cmdflit1_vld == 1'b0) && (portin1_sm[0] == 1'b1)) || //Either destination is empty OR 2nd stage is pushing out previous entry in this cycle
                               ((portin1_sm[0] == 1'b1) && (port1_sm[0] == 1'b1) && (outportid_cmd == PORT1) && (outportid_data0 == 2'b00) && (ping_pong_ready == 1'b1) && (cmdflit1_vld == 1'b1) )
                           )
                             ||
                           (   ((dataflit10h_vld == 1'b0) && (portin1_sm[1] == 1'b1)) || //Either we have place for it OR we are pushing out previous entry in this cycle.
                               ((port1_sm[1] == 1'b1) && (portin1_sm[1] == 1'b1) && (outportid_data1 == PORT1) && (ping_pong_ready == 1'b1) && (dataflit10l_vld == 1'b1))
                           )
                             ||
                           (   ((dataflit10l_vld == 1'b0) && (portin1_sm[2] == 1'b1)) || //Either we have place for it OR we are pushing out previous entry in this cycle.
                               ((port1_sm[1] == 1'b1) && (portin1_sm[2] == 1'b1) && (outportid_data1 == PORT1) && (ping_pong_ready == 1'b1) && (dataflit10l_vld == 1'b1))
                           )
                             ||
                           (   ((dataflit11h_vld == 1'b0) && (portin1_sm[3] == 1'b1)) || //Either we have place for it OR we are pushing out previous entry in this cycle.
                               ((port1_sm[2] == 1'b1) && (portin1_sm[3] == 1'b1) && (outportid_data1 == PORT1) && (ping_pong_ready == 1'b1) && (dataflit11l_vld == 1'b1))
                           )
                             ||
                           (   ((dataflit11l_vld == 1'b0) && (portin1_sm[4] == 1'b1)) || //Either we have place for it OR we are pushing out previous entry in this cycle.
                               ((port1_sm[2] == 1'b1) && (portin1_sm[4] == 1'b1) && (outportid_data1 == PORT1) && (ping_pong_ready == 1'b1) && (dataflit11l_vld == 1'b1))
                           );
                           
 
//OpenCAPI protocol State machine for port0 input. 
always @(posedge(clock))
begin
   if (reset_n == 1'b0)
    begin
      portin0_sm        <= PORT_CMD;
    end
   else
    case (portin0_sm)
       PORT_CMD:
            begin
              if ((route_in_tvalid0 == 1'b1) && (route_in_tready0 == 1'b1) && 
                    (is_respROK0_in == 1'b1) && //Data write transaction in
                    ( (cmdflit0_vld == 1'b0) || //Either we have place for it OR 2nd stage is pushing out previous entry in this cycle
                      ((cmdflit0_vld == 1'b1) && (port0_sm[0] == 1'b1) && (outportid_cmd == PORT0) && (outportid_data1 == 2'b00) && (ping_pong_ready == 1'b1)) 
                    )
                 )
                 begin
                   portin0_sm      <= PORT_DATA0_H;
                 end
            end
        PORT_DATA0_H:
            begin
              if ((route_in_tvalid0 == 1'b1) && (route_in_tready0 == 1'b1) && 
                    ( (dataflit00h_vld == 1'b0) || //Either we have place for it OR we are pushing out previous entry in this cycle.
                      ((port0_sm[1] == 1'b1) && (outportid_data0 == PORT0) && (ping_pong_ready == 1'b1) && (dataflit00l_vld == 1'b1))
                    )
                 )
                 begin        
                   portin0_sm  <= PORT_DATA0_L;
                 end
            end
        PORT_DATA0_L:
            begin
              if ((route_in_tvalid0 == 1'b1) && (route_in_tready0 == 1'b1) && 
                    ( (dataflit00l_vld == 1'b0) || //Either we have place for it OR we are pushing out previous entry in this cycle.
                      ((dataflit00l_vld == 1'b1) && (port0_sm[1] == 1'b1) && (outportid_data0 == PORT0) && (ping_pong_ready == 1'b1))              
                    )
                 )
                 begin        
                   portin0_sm  <= PORT_DATA1_H;
                 end
            end
        PORT_DATA1_H:
            begin
              if ((route_in_tvalid0 == 1'b1) && (route_in_tready0 == 1'b1) && 
                    ( (dataflit01h_vld == 1'b0) || //Either we have place for it OR we are pushing out previous entry in this cycle.
                      ((port0_sm[2] == 1'b1) && (outportid_data0 == PORT0) && (ping_pong_ready == 1'b1) && (dataflit01l_vld == 1'b1))
                    )
                 ) 
                 begin             
                   portin0_sm  <= PORT_DATA1_L;
                 end
            end
        PORT_DATA1_L:
            begin
              if ((route_in_tvalid0 == 1'b1) && (route_in_tready0 == 1'b1) && 
                    ( (dataflit01l_vld == 1'b0) || //Either we have place for it OR we are pushing out previous entry in this cycle.
                      ((dataflit01l_vld == 1'b1) && (port0_sm[2] == 1'b1) && (outportid_data0 == PORT0) && (ping_pong_ready == 1'b1))              
                    )
                 )
                 begin        
                   portin0_sm      <= PORT_CMD;
                 end 
            end
    endcase
end

//1st stage register loading

//load cmdflit0_q 
/*OCAPI TLx Resp to TL Resp Transcode
  -----------------------------------
  As the network is using OpenCAPI TLx side Opcodes
  this module transcodes the opcodes to TL 
  TLX AP READ OK: 0000 0100
       READ FAIL: 0000 0101
  TL CAPP READOK: 0000 0001
       READ FAIL: 0000 0010
  TLX AP WRITEOK: 0000 1000
         WRITEFA: 0000 1001
  TL CAPP WRITEO: 0000 0100
  TL CAPP WRITEF: 0000 0101  
*/

always @(posedge(clock)) 
begin
   if (reset_n == 1'b0)
     begin
       cmdflit0_q   <= 256'b0;
       cmdflit0_vld <= 1'b0;
     end
   else if ((route_in_tvalid0 == 1'b1) && (portin0_sm[0] == 1'b1) && 
        ((cmdflit0_vld == 1'b0) || //Either destination is empty OR 2nd stage is pushing out previous entry in this cycle
            (cmdflit0_vld == 1'b1) && (ping_pong_ready == 1'b1) && (outportid_cmd == PORT0) &&  (outportid_data1 == 2'b00) && (port0_sm[0] == 1'b1)
        )
      )
    begin
        cmdflit0_q[`OCX_FLIT_OPCODE_BIT7] <=  1'b0;
        cmdflit0_q[`OCX_FLIT_OPCODE_BIT6] <=  1'b0;
        cmdflit0_q[`OCX_FLIT_OPCODE_BIT5] <=  1'b0;
        cmdflit0_q[`OCX_FLIT_OPCODE_BIT4] <=  1'b0;
        cmdflit0_q[`OCX_FLIT_OPCODE_BIT3] <=  1'b0;
        cmdflit0_q[`OCX_FLIT_OPCODE_BIT2] <=  route_in_tdata0[`OCX_FLIT_OPCODE_BIT3];
        cmdflit0_q[`OCX_FLIT_OPCODE_BIT1] <=  route_in_tdata0[`OCX_FLIT_OPCODE_BIT2]  & route_in_tdata0[`OCX_FLIT_OPCODE_BIT0];
        cmdflit0_q[`OCX_FLIT_OPCODE_BIT0] <=  (route_in_tdata0[`OCX_FLIT_OPCODE_BIT2] & ~route_in_tdata0[`OCX_FLIT_OPCODE_BIT0]) |
                                              (route_in_tdata0[`OCX_FLIT_OPCODE_BIT3] & route_in_tdata0[`OCX_FLIT_OPCODE_BIT0]);
        cmdflit0_q[`OCX_FLIT_RESPCODE]    <=  route_in_tdata0[`OCX_FLIT_RESPCODE];
        cmdflit0_q[`OCX_FLIT_RDL]         <=  route_in_tdata0[`OCX_FLIT_RDL];
        cmdflit0_q[`OCX_FLIT_RDP]         <=  route_in_tdata0[`OCX_FLIT_RDP];
        cmdflit0_q[`OCX_FLIT_RESPTAG]     <=  route_in_tdata0[`OCX_FLIT_RESPTAG];
        cmdflit0_vld                      <=  1'b1;
    end
   else if ((cmdflit0_vld == 1'b1) && (ping_pong_ready == 1'b1) && (outportid_cmd == PORT0) &&  (outportid_data1 == 2'b00) && (port0_sm[0] == 1'b1)) 
    begin
        cmdflit0_vld                 <= 1'b0; 
    end
end

//dataflit00h
always @(posedge(clock)) 
begin
   if (reset_n == 1'b0)
     begin
      dataflit00h_q   <= 256'b0;
      dataflit00h_vld <= 1'b0;
     end
  else  if ((route_in_tvalid0 == 1'b1)  && (portin0_sm[1] == 1'b1) &&
        ( (dataflit00h_vld == 1'b0) || //Either we have place for it OR we are pushing out previous entry in this cycle.
          (
             (port0_sm[1] == 1'b1) && (outportid_data0 == PORT0) && (ping_pong_ready == 1'b1) && (dataflit00l_vld == 1'b1)
          )
        )
       )
     begin
        dataflit00h_q   <= route_in_tdata0;
        dataflit00h_vld <= 1'b1;
     end
   else if ((ping_pong_ready == 1'b1) && (outportid_data0 == PORT0) && (port0_sm[1] == 1'b1) 
                                                              && (dataflit00l_vld == 1'b1)) //the flit is getting consumed in this cycle
     begin
        dataflit00h_vld <= 1'b0; 
     end
end

//dataflit00l
always @(posedge(clock)) 
begin
   if (reset_n == 1'b0)
     begin
      dataflit00l_q   <= 256'b0;
      dataflit00l_vld <= 1'b0;
     end
    else if ((route_in_tvalid0 == 1'b1) && (portin0_sm[2] == 1'b1) &&
        ( (dataflit00l_vld == 1'b0) || //Either we have place for it OR we are pushing out previous entry in this cycle.
          (
             (port0_sm[1] == 1'b1) && (outportid_data0 == PORT0) && (ping_pong_ready == 1'b1) && (dataflit00l_vld == 1'b1)
          )
        )
       )
     begin
        dataflit00l_q   <= route_in_tdata0;
        dataflit00l_vld <= 1'b1;
     end
   else if ((ping_pong_ready == 1'b1) && (outportid_data0 == PORT0) && (port0_sm[1] == 1'b1) 
                                                              && (dataflit00l_vld == 1'b1)) //the flit is getting consumed in this cycle
     begin
        dataflit00l_vld <= 1'b0; 
     end
end

//dataflit01h
always @(posedge(clock)) 
begin
   if (reset_n == 1'b0)
     begin
       dataflit01h_q   <= 256'b0;
       dataflit01h_vld <= 1'b0;
     end
    else if ((route_in_tvalid0 == 1'b1) && (portin0_sm[3] == 1'b1) &&
        ( (dataflit01h_vld == 1'b0) || //Either we have place for it OR we are pushing out previous entry in this cycle.
          (
             (port0_sm[2] == 1'b1) && (outportid_data0 == PORT0) && (ping_pong_ready == 1'b1) && (dataflit01l_vld == 1'b1)
          )
        )
       )
     begin
        dataflit01h_q   <= route_in_tdata0;
        dataflit01h_vld <= 1'b1;
     end
   else if ((ping_pong_ready == 1'b1) && (outportid_data0 == PORT0) && (port0_sm[2] == 1'b1) 
                                                              && (dataflit01l_vld == 1'b1)) //the flit is getting consumed in this cycle
     begin
        dataflit01h_vld <= 1'b0; 
     end
end

//dataflit01l
always @(posedge(clock)) 
begin
    if (reset_n == 1'b0)
      begin
        dataflit01l_q   <= 256'b0;
        dataflit01l_vld <= 1'b0;
      end
    else if ((route_in_tvalid0 == 1'b1) && (portin0_sm[4] == 1'b1) && 
             ((dataflit01l_vld == 1'b0) || //Either we have place for it OR we are pushing out previous entry in this cycle.
              (
               (port0_sm[2] == 1'b1) && (outportid_data0 == PORT0) && (ping_pong_ready == 1'b1) && (dataflit01l_vld == 1'b1)
              )
             )
            )
     begin
        dataflit01l_q   <= route_in_tdata0;
        dataflit01l_vld <= 1'b1;
     end
   else if ((ping_pong_ready == 1'b1) && (outportid_data0 == PORT0) && (port0_sm[2] == 1'b1) && (dataflit01l_vld == 1'b1)) //the flit is getting consumed in this cycle
     begin
        dataflit01l_vld <= 1'b0; 
     end
end


//OpenCAPI protocol State machine for port1 input. 
always @(posedge(clock))
begin
   if (reset_n == 1'b0)
    begin
      portin1_sm        <= PORT_CMD;
    end
   else
    case (portin1_sm)
       PORT_CMD:
            begin
              if ((route_in_tvalid1 == 1'b1) && (route_in_tready1 == 1'b1) &&  
                    (is_respROK1_in == 1'b1) && //Data write transaction in
                    ( (cmdflit1_vld == 1'b0) || //Either we have place for it OR 2nd stage is pushing out previous entry in this cycle
                      ((cmdflit1_vld == 1'b1) && (port1_sm[0] == 1'b1) && (outportid_cmd == PORT1) && (outportid_data0 == 2'b00) && (ping_pong_ready == 1'b1)) 
                    )
                 )
                 begin
                   portin1_sm      <= PORT_DATA0_H;  
                 end
            end
        PORT_DATA0_H:
            begin
              if ((route_in_tvalid1 == 1'b1) && (route_in_tready1 == 1'b1) && 
                    ( (dataflit10h_vld == 1'b0) || //Either we have place for it OR we are pushing out previous entry in this cycle.
                      (
                        (port1_sm[1] == 1'b1) && (outportid_data1 == PORT1) && (ping_pong_ready == 1'b1) && (dataflit10l_vld == 1'b1) 
                      )
                    )
                 )
                 begin        
                   portin1_sm  <= PORT_DATA0_L;
                 end
            end
        PORT_DATA0_L:
            begin
              if ((route_in_tvalid1 == 1'b1) && (route_in_tready1 == 1'b1) && 
                    ( (dataflit10l_vld == 1'b0) || //Either we have place for it OR we are pushing out previous entry in this cycle.
                      ((dataflit10l_vld == 1'b1) && (port1_sm[1] == 1'b1) && (outportid_data1 == PORT1) && (ping_pong_ready == 1'b1))              
                    )
                 )
                 begin        
                   portin1_sm  <= PORT_DATA1_H;
                 end
            end
        PORT_DATA1_H:
            begin
              if ((route_in_tvalid1 == 1'b1) && (route_in_tready1 == 1'b1) && 
                    ( (dataflit11h_vld == 1'b0) || //Either we have place for it OR we are pushing out previous entry in this cycle.
                      (
                        (port1_sm[2] == 1'b1) && (outportid_data1 == PORT1) && (ping_pong_ready == 1'b1) && (dataflit11l_vld == 1'b1) 
                      )
                    )
                 ) 
                 begin             
                   portin1_sm  <= PORT_DATA1_L;
                 end
            end
        PORT_DATA1_L:
            begin
              if ((route_in_tvalid1 == 1'b1) && (route_in_tready1 == 1'b1) && 
                    ( (dataflit11l_vld == 1'b0) || //Either we have place for it OR we are pushing out previous entry in this cycle.
                      ((dataflit11l_vld == 1'b1) && (port1_sm[2] == 1'b1) && (outportid_data1 == PORT1) && (ping_pong_ready == 1'b1))              
                    )
                 )
                 begin        
                   portin1_sm  <= PORT_CMD; 
                 end 
            end
    endcase
end

//load cmdflit1_q 
always @(posedge(clock)) 
begin
   if (reset_n == 1'b0)
     begin
        cmdflit1_q   <= 256'b0;
        cmdflit1_vld <= 1'b0;
     end
    else if ((route_in_tvalid1 == 1'b1) && (portin1_sm[0] == 1'b1) && 
        ((cmdflit1_vld == 1'b0) || //Either destination is empty OR 2nd stage is pushing out previous entry in this cycle
                    ((cmdflit1_vld == 1'b1) && (port1_sm[0] == 1'b1) && (outportid_cmd == PORT1) && (outportid_data0 == 2'b00) && (ping_pong_ready == 1'b1))
        )
      )
    begin
        cmdflit1_q[`OCX_FLIT_OPCODE_BIT7] <=  1'b0;
        cmdflit1_q[`OCX_FLIT_OPCODE_BIT6] <=  1'b0;
        cmdflit1_q[`OCX_FLIT_OPCODE_BIT5] <=  1'b0;
        cmdflit1_q[`OCX_FLIT_OPCODE_BIT4] <=  1'b0;
        cmdflit1_q[`OCX_FLIT_OPCODE_BIT3] <=  1'b0;
        cmdflit1_q[`OCX_FLIT_OPCODE_BIT2] <=  route_in_tdata1[`OCX_FLIT_OPCODE_BIT3];
        cmdflit1_q[`OCX_FLIT_OPCODE_BIT1] <=  route_in_tdata1[`OCX_FLIT_OPCODE_BIT2]  & route_in_tdata1[`OCX_FLIT_OPCODE_BIT0];
        cmdflit1_q[`OCX_FLIT_OPCODE_BIT0] <=  (route_in_tdata1[`OCX_FLIT_OPCODE_BIT2] & ~route_in_tdata1[`OCX_FLIT_OPCODE_BIT0]) |
                                              (route_in_tdata1[`OCX_FLIT_OPCODE_BIT3] & route_in_tdata1[`OCX_FLIT_OPCODE_BIT0]);
        cmdflit1_q[`OCX_FLIT_RESPCODE]    <=  route_in_tdata1[`OCX_FLIT_RESPCODE];
        cmdflit1_q[`OCX_FLIT_RDL]         <=  route_in_tdata1[`OCX_FLIT_RDL];
        cmdflit1_q[`OCX_FLIT_RDP]         <=  route_in_tdata1[`OCX_FLIT_RDP];
        cmdflit1_q[`OCX_FLIT_RESPTAG]     <=  route_in_tdata1[`OCX_FLIT_RESPTAG];
        cmdflit1_vld                      <= 1'b1;
    end
   else if ((cmdflit1_vld == 1'b1) && (ping_pong_ready == 1'b1) && (outportid_cmd == PORT1) && (outportid_data0 == 2'b00) && (port1_sm[0] == 1'b1))
    begin
        cmdflit1_vld                      <= 1'b0; 
    end
end

//load dataflit10h
always @(posedge(clock)) 
begin
   if (reset_n == 1'b0)
     begin
       dataflit10h_q   <= 256'b0;
       dataflit10h_vld <= 1'b0;
     end
   else if ((route_in_tvalid1 == 1'b1) && (portin1_sm[1] == 1'b1) && 
        ( (dataflit10h_vld == 1'b0) || //Either we have place for it OR we are pushing out previous entry in this cycle.
          (
             (port1_sm[1] == 1'b1) && (outportid_data1 == PORT1) && (ping_pong_ready == 1'b1) && (dataflit10l_vld == 1'b1)
          )
        )
       )
     begin
        dataflit10h_q   <= route_in_tdata1;
        dataflit10h_vld <= 1'b1;
     end
   else if ((ping_pong_ready == 1'b1) && (outportid_data1 == PORT1) && (port1_sm[1] == 1'b1) && (dataflit10l_vld == 1'b1)) //the flit is getting consumed in this cycle
     begin
        dataflit10h_vld <= 1'b0; 
     end
end

//load dataflit10l
always @(posedge(clock)) 
begin
    if (reset_n == 1'b0)
      begin
        dataflit10l_q   <= 256'b0;
        dataflit10l_vld <= 1'b0;
      end
    else if ((route_in_tvalid1 == 1'b1) && (portin1_sm[2] == 1'b1) && 
        ( (dataflit10l_vld == 1'b0) || //Either we have place for it OR we are pushing out previous entry in this cycle.
          (
             (port1_sm[1] == 1'b1) && (outportid_data1 == PORT1) && (ping_pong_ready == 1'b1) && (dataflit10l_vld == 1'b1)
          )
        )
       )
     begin
        dataflit10l_q   <= route_in_tdata1;
        dataflit10l_vld <= 1'b1;
     end
   else if ((ping_pong_ready == 1'b1) && (outportid_data1 == PORT1) && (port1_sm[1] == 1'b1) && (dataflit10l_vld == 1'b1)) //the flit is getting consumed in this cycle
     begin
        dataflit10l_vld <= 1'b0; 
     end
end

//load dataflit11h
always @(posedge(clock)) 
begin
    if (reset_n == 1'b0)
       begin
          dataflit11h_q   <= 256'b0;
          dataflit11h_vld <= 1'b0;
       end
    else if ((route_in_tvalid1 == 1'b1) && (portin1_sm[3] == 1'b1) && 
        ( (dataflit11h_vld == 1'b0) || //Either we have place for it OR we are pushing out previous entry in this cycle.
          (
             (port1_sm[2] == 1'b1) && (outportid_data1 == PORT1) && (ping_pong_ready == 1'b1) && (dataflit11l_vld == 1'b1)
          )
        )
       )
     begin
        dataflit11h_q   <= route_in_tdata1;
        dataflit11h_vld <= 1'b1;
     end
   else if ((ping_pong_ready == 1'b1) && (outportid_data1 == PORT1) && (port1_sm[2] == 1'b1) && (dataflit11l_vld == 1'b1)) //the flit is getting consumed in this cycle
     begin
        dataflit11h_vld <= 1'b0; 
     end
end

//load dataflit11l
always @(posedge(clock)) 
begin
    if (reset_n == 1'b0)
      begin
        dataflit11l_q   <= 256'b0;
        dataflit11l_vld <= 1'b0;
      end
    else if ((route_in_tvalid1 == 1'b1) && (portin1_sm[4] == 1'b1) && 
        ( (dataflit11l_vld == 1'b0) || //Either we have place for it OR we are pushing out previous entry in this cycle.
          (
             (port1_sm[2] == 1'b1) && (outportid_data1 == PORT1) && (ping_pong_ready == 1'b1) && (dataflit11l_vld == 1'b1)
          )
        )
       )
     begin
        dataflit11l_q   <= route_in_tdata1;
        dataflit11l_vld <= 1'b1;
     end
   else if ((ping_pong_ready == 1'b1) && (outportid_data1 == PORT1) && (port1_sm[2] == 1'b1) && (dataflit11l_vld == 1'b1)) //the flit is getting consumed in this cycle
     begin
        dataflit11l_vld <= 1'b0; 
     end
end


//####################################################################################################
// Arbitration functionality 
//####################################################################################################

/**
  *  Control arbiter request valid (i.e. when arbiter should deliver a decision). 
  *  The arbiter has memory (i.e. remembers what it has previously scheduled so it can avoid starvation) so it should
  *  not be updated when a decision is not needed, as this tampers with the internal state and will affect RR operation.
  *  Arbiter logic receives request vector and responds at the same cycle with a selection (combinational logic). 
  * 
  **/

//Assign to RR arbiter the input request vector
assign arb_req     = {cmdflit1_vld, cmdflit0_vld};
//Assign the request valid to RR arbiter
assign arb_req_nxt = ((cmdflit0_vld == 1'b1) && (ping_pong_ready == 1'b1) && (outportid_cmd == PORT0) &&  (outportid_data1 == 2'b00) && (port0_sm[0] == 1'b1)) ||
                     ((cmdflit1_vld == 1'b1) && (ping_pong_ready == 1'b1) && (outportid_cmd == PORT1) && (outportid_data0 == 2'b00) && (port1_sm[0] == 1'b1)); 
                    
                    
//Output port cmd is a wire as we need the response from the arbiter in the same cycle                  
assign outportid_cmd =  arb_sel; 


//####################################################################################
//PING PONG OUTPUT
//####################################################################################
assign ping_pong_ready = (outdata_ping_vld == 1'b0) | (outdata_pong_vld == 1'b0);


    
//Output OpenCAPI protocol stack state control.

always @(posedge(clock))
begin
   if (reset_n == 1'b0) 
     begin
        port0_sm                  <= CMD;
        outportid_data0           <= 2'b00; //This important to enable the arbiter in the next cycle
     end
   else 
     case(port0_sm)
         CMD: 
             begin
                if ((outportid_cmd == PORT0) && (outportid_data1 == 2'b00) && (ping_pong_ready == 1'b1) && (is_respROK0 == 1'b1) &&  (cmdflit0_vld == 1'b1))
                 begin
                   port0_sm                  <= DFLIT0; 
                   outportid_data0           <= outportid_cmd; //This important to enable the arbiter in the next cycle
                 end
             end
        DFLIT0:
             begin
               if ((outportid_data0 == PORT0) && (ping_pong_ready == 1'b1) && (dataflit00h_vld == 1'b1) && (dataflit00l_vld == 1'b1))
                   port0_sm                  <= DFLIT1;
             end
        DFLIT1:
             begin
               if ((outportid_data0 == PORT0) && (ping_pong_ready == 1'b1) && (dataflit01h_vld == 1'b1)  && (dataflit01l_vld == 1'b1))
                begin
                   port0_sm                  <= CMD; 
                   outportid_data0           <= 2'b00; //This important to enable the arbiter in the next cycle
                end
             end
     endcase 
end 


always @(posedge(clock))
begin
   if (reset_n == 1'b0)
    begin
      port1_sm        <= PORT_CMD;
      outportid_data1 <= 2'b00;
    end
   else 
     case(port1_sm)
        PORT_CMD: 
             begin
                if ((outportid_cmd == PORT1) && (outportid_data0 == 2'b00) && (ping_pong_ready == 1'b1) && (is_respROK1 == 1'b1) &&  (cmdflit1_vld == 1'b1))
                 begin
                   port1_sm        <= DFLIT0; 
                   outportid_data1 <= outportid_cmd;
                 end
             end
        DFLIT0:
             begin
               if ((outportid_data1 == PORT1) && (ping_pong_ready == 1'b1) && (dataflit10h_vld == 1'b1) && (dataflit10l_vld == 1'b1))
                   port1_sm        <= DFLIT1;
             end
        DFLIT1:
             begin
               if ((outportid_data1 == PORT1) && (ping_pong_ready == 1'b1) && (dataflit11h_vld == 1'b1)  && (dataflit11l_vld == 1'b1))
                begin
                   port1_sm        <= PORT_CMD; 
                   outportid_data1 <= 2'b00; 
                end
             end
     endcase 
end 

//output ping-pong buffer write turn and valid handling.
always @(posedge(clock))
begin
   if (reset_n == 1'b0) 
      begin
         outdata_ping      <= 552'b0;
         outdata_pong      <= 552'b0; 
         outdata_ping_vld  <=   1'b0;
         outdata_pong_vld  <=   1'b0;
         ping_pong_w       <=   1'b0;
      end  
   else if ((cmdflit0_vld == 1'b1) && (ping_pong_ready == 1'b1) && (outportid_cmd == PORT0) &&  (outportid_data1 == 2'b00) && (port0_sm[0] == 1'b1)) //forward port0 cmd
      begin          
         outdata_ping[`OCX_RESP_OPCODE]    <= (ping_pong_w == 1'b0) ? cmdflit0_q[`OCX_FLIT_OPCODE ]   : outdata_ping[`OCX_RESP_OPCODE]; 
         outdata_pong[`OCX_RESP_OPCODE]    <= (ping_pong_w == 1'b1) ? cmdflit0_q[`OCX_FLIT_OPCODE ]   : outdata_pong[`OCX_RESP_OPCODE]; 
         outdata_ping[`OCX_RESP_CODE]      <= (ping_pong_w == 1'b0) ? cmdflit0_q[`OCX_FLIT_RESPCODE]  : outdata_ping[`OCX_RESP_CODE]; 
         outdata_pong[`OCX_RESP_CODE]      <= (ping_pong_w == 1'b1) ? cmdflit0_q[`OCX_FLIT_RESPCODE]  : outdata_pong[`OCX_RESP_CODE]; 
         outdata_ping[`OCX_RESP_DL]        <= (ping_pong_w == 1'b0) ? cmdflit0_q[`OCX_FLIT_RDL]       : outdata_ping[`OCX_RESP_DL]; 
         outdata_pong[`OCX_RESP_DL]        <= (ping_pong_w == 1'b1) ? cmdflit0_q[`OCX_FLIT_RDL]       : outdata_pong[`OCX_RESP_DL]; 
         outdata_ping[`OCX_RESP_DP]        <= (ping_pong_w == 1'b0) ? cmdflit0_q[`OCX_FLIT_RDP]       : outdata_ping[`OCX_RESP_DP]; 
         outdata_pong[`OCX_RESP_DP]        <= (ping_pong_w == 1'b1) ? cmdflit0_q[`OCX_FLIT_RDP]       : outdata_pong[`OCX_RESP_DP]; 
         outdata_ping[`OCX_RESP_TAG]       <= (ping_pong_w == 1'b0) ? cmdflit0_q[`OCX_FLIT_RESPTAG]   : outdata_ping[`OCX_RESP_TAG]; //Resp opcode up to DP fields copied as is.
         outdata_pong[`OCX_RESP_TAG]       <= (ping_pong_w == 1'b1) ? cmdflit0_q[`OCX_FLIT_RESPTAG]   : outdata_pong[`OCX_RESP_TAG];  
         outdata_ping[`OCX_RESP_BDI]       <= (ping_pong_w == 1'b0) ? 1'b0                            : outdata_ping[`OCX_RESP_BDI];   
         outdata_pong[`OCX_RESP_BDI]       <= (ping_pong_w == 1'b1) ? 1'b0                            : outdata_pong[`OCX_RESP_BDI];    
         outdata_ping[`OCX_RESP_RESPVALID] <= (ping_pong_w == 1'b0) ? 1'b1                            : outdata_ping[`OCX_RESP_RESPVALID];
         outdata_pong[`OCX_RESP_RESPVALID] <= (ping_pong_w == 1'b1) ? 1'b1                            : outdata_pong[`OCX_RESP_RESPVALID];
         outdata_ping[`OCX_RESP_DATAVALID] <= (ping_pong_w == 1'b0) ? 1'b0                            : outdata_ping[`OCX_RESP_DATAVALID];
         outdata_pong[`OCX_RESP_DATAVALID] <= (ping_pong_w == 1'b1) ? 1'b0                            : outdata_pong[`OCX_RESP_DATAVALID];
         outdata_ping_vld                  <= (ping_pong_w == 1'b0) ? ~is_respROK0                    : outdata_ping_vld & (outdata_ping_vld ^ route_out_tready); 
         outdata_pong_vld                  <= (ping_pong_w == 1'b1) ? ~is_respROK0                    : outdata_pong_vld & (outdata_pong_vld ^ route_out_tready); 
         ping_pong_w                       <= (is_respROK0 == 1'b1) ? ping_pong_w                     : ~ping_pong_w;//go for the other side next time
      end 
   else if ((dataflit00l_vld == 1'b1) && (ping_pong_ready == 1'b1) && (outportid_data0 == PORT0) && (port0_sm[1] == 1'b1)) //forward DFLIT0
      begin
         outdata_ping[`OCX_RESP_DATAVALID]  <= (ping_pong_w == 1'b0)?  1'b1          : outdata_ping[`OCX_RESP_DATAVALID];
         outdata_ping[511:256]              <= (ping_pong_w == 1'b0) ? dataflit00h_q : outdata_ping[511:256]; //upsizing
         outdata_ping[255:0]                <= (ping_pong_w == 1'b0) ? dataflit00l_q : outdata_ping[255:0];
         outdata_pong[`OCX_RESP_DATAVALID]  <= (ping_pong_w == 1'b1)?  1'b1          : outdata_pong[`OCX_RESP_DATAVALID]; 
         outdata_pong[511:256]              <= (ping_pong_w == 1'b1) ? dataflit00h_q : outdata_pong[511:256];
         outdata_pong[255:0]                <= (ping_pong_w == 1'b1) ? dataflit00l_q : outdata_pong[255:0];
         outdata_ping_vld                   <= (ping_pong_w == 1'b0) ? 1'b1          : outdata_ping_vld & (outdata_ping_vld ^ route_out_tready); 
         outdata_pong_vld                   <= (ping_pong_w == 1'b1) ? 1'b1          : outdata_pong_vld & (outdata_pong_vld ^ route_out_tready); 
         ping_pong_w                        <= ~ping_pong_w;
      end   
   else if ((dataflit01l_vld == 1'b1) && (ping_pong_ready == 1'b1) && (outportid_data0 == PORT0) && (port0_sm[2] == 1'b1)) //forward DFLIT1
      begin
         outdata_ping[`OCX_RESP_DATAVALID]  <= (ping_pong_w == 1'b0)?  1'b1          : outdata_ping[`OCX_RESP_DATAVALID]; 
         outdata_ping[`OCX_RESP_RESPVALID]  <= (ping_pong_w == 1'b0) ? 1'b0          : outdata_ping[`OCX_RESP_RESPVALID];
         outdata_ping[511:256]              <= (ping_pong_w == 1'b0) ? dataflit01h_q : outdata_ping[511:256];
         outdata_ping[255:0]                <= (ping_pong_w == 1'b0) ? dataflit01l_q : outdata_ping[255:0];
         outdata_pong[`OCX_RESP_DATAVALID]  <= (ping_pong_w == 1'b1)?  1'b1          : outdata_pong[`OCX_RESP_DATAVALID]; 
         outdata_pong[`OCX_RESP_RESPVALID] <=  (ping_pong_w == 1'b1) ? 1'b0          : outdata_pong[`OCX_RESP_RESPVALID];
         outdata_pong[511:256]              <= (ping_pong_w == 1'b1) ? dataflit01h_q : outdata_pong[511:256];
         outdata_pong[255:0]                <= (ping_pong_w == 1'b1) ? dataflit01l_q : outdata_pong[255:0];
         outdata_ping_vld                   <= (ping_pong_w == 1'b0) ? 1'b1          : outdata_ping_vld & (outdata_ping_vld ^ route_out_tready); 
         outdata_pong_vld                   <= (ping_pong_w == 1'b1) ? 1'b1          : outdata_pong_vld & (outdata_pong_vld ^ route_out_tready); 
         ping_pong_w                        <= ~ping_pong_w;
      end   
   else if ((cmdflit1_vld == 1'b1) && (ping_pong_ready == 1'b1) && (outportid_cmd == PORT1) && (outportid_data0 == 2'b00) && (port1_sm[0] == 1'b1)) //forward port1 cmd
      begin 
         outdata_ping[`OCX_RESP_OPCODE]    <= (ping_pong_w == 1'b0) ? cmdflit1_q[`OCX_FLIT_OPCODE ]   : outdata_ping[`OCX_RESP_OPCODE]; 
         outdata_pong[`OCX_RESP_OPCODE]    <= (ping_pong_w == 1'b1) ? cmdflit1_q[`OCX_FLIT_OPCODE ]   : outdata_pong[`OCX_RESP_OPCODE]; 
         outdata_ping[`OCX_RESP_CODE]      <= (ping_pong_w == 1'b0) ? cmdflit1_q[`OCX_FLIT_RESPCODE]  : outdata_ping[`OCX_RESP_CODE]; 
         outdata_pong[`OCX_RESP_CODE]      <= (ping_pong_w == 1'b1) ? cmdflit1_q[`OCX_FLIT_RESPCODE]  : outdata_pong[`OCX_RESP_CODE]; 
         outdata_ping[`OCX_RESP_DL]        <= (ping_pong_w == 1'b0) ? cmdflit1_q[`OCX_FLIT_RDL]       : outdata_ping[`OCX_RESP_DL]; 
         outdata_pong[`OCX_RESP_DL]        <= (ping_pong_w == 1'b1) ? cmdflit1_q[`OCX_FLIT_RDL]       : outdata_pong[`OCX_RESP_DL]; 
         outdata_ping[`OCX_RESP_DP]        <= (ping_pong_w == 1'b0) ? cmdflit1_q[`OCX_FLIT_RDP]       : outdata_ping[`OCX_RESP_DP]; 
         outdata_pong[`OCX_RESP_DP]        <= (ping_pong_w == 1'b1) ? cmdflit1_q[`OCX_FLIT_RDP]       : outdata_pong[`OCX_RESP_DP]; 
         outdata_ping[`OCX_RESP_TAG]       <= (ping_pong_w == 1'b0) ? cmdflit1_q[`OCX_FLIT_RESPTAG]   : outdata_ping[`OCX_RESP_TAG]; //Resp opcode up to DP fields copied as is.
         outdata_pong[`OCX_RESP_TAG]       <= (ping_pong_w == 1'b1) ? cmdflit1_q[`OCX_FLIT_RESPTAG]   : outdata_pong[`OCX_RESP_TAG];  
         outdata_ping[`OCX_RESP_BDI]       <= (ping_pong_w == 1'b0) ? 1'b0                            : outdata_ping[`OCX_RESP_BDI];   
         outdata_pong[`OCX_RESP_BDI]       <= (ping_pong_w == 1'b1) ? 1'b0                            : outdata_pong[`OCX_RESP_BDI];    
         outdata_ping[`OCX_RESP_RESPVALID] <= (ping_pong_w == 1'b0) ? 1'b1                            : outdata_ping[`OCX_RESP_RESPVALID];
         outdata_pong[`OCX_RESP_RESPVALID] <= (ping_pong_w == 1'b1) ? 1'b1                            : outdata_pong[`OCX_RESP_RESPVALID];
         outdata_ping[`OCX_RESP_DATAVALID] <= (ping_pong_w == 1'b0) ? 1'b0                            : outdata_ping[`OCX_RESP_DATAVALID];
         outdata_pong[`OCX_RESP_DATAVALID] <= (ping_pong_w == 1'b1) ? 1'b0                            : outdata_pong[`OCX_RESP_DATAVALID];
         outdata_ping_vld                  <= (ping_pong_w == 1'b0) ? ~is_respROK1                    : outdata_ping_vld & (outdata_ping_vld ^ route_out_tready); 
         outdata_pong_vld                  <= (ping_pong_w == 1'b1) ? ~is_respROK1                    : outdata_pong_vld & (outdata_pong_vld ^ route_out_tready); 
         ping_pong_w                       <= (is_respROK1 == 1'b1) ? ping_pong_w                     : ~ping_pong_w;//go for the other side next time
      end 
   else if ((dataflit10l_vld == 1'b1) && (ping_pong_ready == 1'b1) && (outportid_data1 == PORT1) && (port1_sm[1] == 1'b1)) //forward DFLIT0
      begin
         outdata_ping[`OCX_RESP_DATAVALID]  <= (ping_pong_w == 1'b0)?  1'b1          : outdata_ping[`OCX_RESP_DATAVALID];
         outdata_ping[511:256]              <= (ping_pong_w == 1'b0) ? dataflit10h_q : outdata_ping[511:256]; //upsizing
         outdata_ping[255:0]                <= (ping_pong_w == 1'b0) ? dataflit10l_q : outdata_ping[255:0];
         outdata_pong[`OCX_RESP_DATAVALID]  <= (ping_pong_w == 1'b1)?  1'b1          : outdata_pong[`OCX_RESP_DATAVALID]; 
         outdata_pong[511:256]              <= (ping_pong_w == 1'b1) ? dataflit10h_q : outdata_pong[511:256];
         outdata_pong[255:0]                <= (ping_pong_w == 1'b1) ? dataflit10l_q : outdata_pong[255:0];
         outdata_ping_vld                   <= (ping_pong_w == 1'b0) ? 1'b1          : outdata_ping_vld & (outdata_ping_vld ^ route_out_tready); 
         outdata_pong_vld                   <= (ping_pong_w == 1'b1) ? 1'b1          : outdata_pong_vld & (outdata_pong_vld ^ route_out_tready); 
         ping_pong_w                        <= ~ping_pong_w;
      end   
   else if ((dataflit11l_vld == 1'b1) && (ping_pong_ready == 1'b1) && (outportid_data1 == PORT1) && (port1_sm[2] == 1'b1)) //forward DFLIT1
      begin
         outdata_ping[`OCX_RESP_DATAVALID]  <= (ping_pong_w == 1'b0)?  1'b1          : outdata_ping[`OCX_RESP_DATAVALID]; 
         outdata_ping[`OCX_RESP_RESPVALID]  <= (ping_pong_w == 1'b0) ? 1'b0          : outdata_ping[`OCX_RESP_RESPVALID];
         outdata_ping[511:256]              <= (ping_pong_w == 1'b0) ? dataflit11h_q : outdata_ping[511:256];
         outdata_ping[255:0]                <= (ping_pong_w == 1'b0) ? dataflit11l_q : outdata_ping[255:0];
         outdata_pong[`OCX_RESP_DATAVALID]  <= (ping_pong_w == 1'b1)?  1'b1          : outdata_pong[`OCX_RESP_DATAVALID]; 
         outdata_pong[`OCX_RESP_RESPVALID]  <= (ping_pong_w == 1'b1) ? 1'b0          : outdata_pong[`OCX_RESP_RESPVALID];
         outdata_pong[511:256]              <= (ping_pong_w == 1'b1) ? dataflit11h_q : outdata_pong[511:256];
         outdata_pong[255:0]                <= (ping_pong_w == 1'b1) ? dataflit11l_q : outdata_pong[255:0];
         outdata_ping_vld                   <= (ping_pong_w == 1'b0) ? 1'b1          : outdata_ping_vld & (outdata_ping_vld ^ route_out_tready); 
         outdata_pong_vld                   <= (ping_pong_w == 1'b1) ? 1'b1          : outdata_pong_vld & (outdata_pong_vld ^ route_out_tready); 
         ping_pong_w                        <= ~ping_pong_w;
      end   
   else 
      begin //nothing in this cycle but we may have to invalidate valids
         outdata_ping_vld      <= (ping_pong_r == 1'b0) ? outdata_ping_vld & (outdata_ping_vld ^ route_out_tready) : outdata_ping_vld;  
         outdata_pong_vld      <= (ping_pong_r == 1'b1) ? outdata_pong_vld & (outdata_pong_vld ^ route_out_tready) : outdata_pong_vld;  
      end
end


//ping pong read 
always @(posedge(clock))
begin
    if (reset_n == 1'b0)
      begin
        ping_pong_r       <= 1'b0;
      end
    else if ((ping_pong_r == 1'b0) && (outdata_ping_vld == 1'b1) && (route_out_tready == 1'b1)) //ping flit is going out.
      begin
        ping_pong_r       <= 1'b1;
      end
    else if  ((ping_pong_r == 1'b1) && (outdata_pong_vld == 1'b1) && (route_out_tready == 1'b1)) //pong flit is going out.
      begin
        ping_pong_r       <= 1'b0;
      end
end

//assign outputs
assign route_out_tdata  = (ping_pong_r == 1'b0) ? outdata_ping      : outdata_pong;
assign route_out_tvalid = (ping_pong_r == 1'b0) ? outdata_ping_vld  : outdata_pong_vld;
  
endmodule 
