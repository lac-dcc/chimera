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

module thymesisflow_32B_64B_routing_memory_ingress (

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
  , output  [511:0]     route_out_tdata
  , output              route_out_tvalid
  , input               route_out_tready
 
  // Round robin arbiter interface
  , output    [1:0]     arb_req
  , output              arb_req_nxt
  , input     [1:0]     arb_sel                       
 
);


`define OCX_FLIT_NETID        40:35
`define OCX_FLIT_RESP_CREDS   34:27 //RET CREDS piggybacked to RESP flit

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
reg [511:0] outdata_ping;
reg         outdata_ping_vld;

reg [511:0] outdata_pong;
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
wire   is_writecmd0_in;
assign is_writecmd0_in = route_in_tdata0[253];

wire   is_writecmd1_in;
assign is_writecmd1_in = route_in_tdata1[253];

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
assign route_in_tready0 =  (   ((cmdflit0_vld == 1'b0) && (portin0_sm[0] == 1'b1)) || //Either destination is empty OR 2nd stage is pushing out previous entry in this cycle.
                               ((cmdflit0_vld == 1'b1) && (portin0_sm[0] == 1'b1) && (port0_sm[0] == 1'b1) && (outportid_cmd == PORT0) && (outportid_data1 == 2'b00) && (ping_pong_ready == 1'b1))
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
                               ((cmdflit1_vld == 1'b1)  && (portin1_sm[0] == 1'b1) && (port1_sm[0] == 1'b1) && (outportid_cmd == PORT1) && (outportid_data0 == 2'b00) && (ping_pong_ready == 1'b1))
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
                    (is_writecmd0_in == 1'b1) && //Data write transaction in
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
always @(posedge(clock)) 
begin
   if (reset_n == 1'b0)
     begin
       cmdflit0_q   <= 256'b0;
       cmdflit0_vld <= 1'b0;
     end
   else if ((route_in_tvalid0 == 1'b1) && (portin0_sm[0] == 1'b1) && 
        ((cmdflit0_vld == 1'b0) || //Either destination is empty OR 2nd stage is pushing out previous entry in this cycle
            ((cmdflit0_vld == 1'b1) && (port0_sm[0] == 1'b1) && (outportid_cmd == PORT0) && (outportid_data1 == 2'b00) && (ping_pong_ready == 1'b1))
        )
      )
    begin
        cmdflit0_q[255:37]           <= route_in_tdata0[255:37];
        //set the arriving interface as the command port [36:35]=01 - it will be used by the egress path for the response.  
        cmdflit0_q[36]               <= 1'b0;  
        cmdflit0_q[35]               <= 1'b1;
        cmdflit0_q[34:0]             <= route_in_tdata0[34:0];
        cmdflit0_vld                 <= 1'b1;
    end
   else if ((ping_pong_ready == 1'b1) && (outportid_cmd == PORT0) && (outportid_data1 == 2'b00) && (port0_sm[0] == 1'b1)) //the cmd is received
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
                    (is_writecmd1_in == 1'b1) && //Data write transaction in
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
        cmdflit1_q[255:37]           <= route_in_tdata1[255:37];
        //set the arriving interface as the command port [36,35] = 10 - it will be used by the egress path for the response.  
        cmdflit1_q[36]               <= 1'b1;
        cmdflit1_q[35]               <= 1'b0;
        cmdflit1_q[34:0]             <= route_in_tdata1[34:0];
        cmdflit1_vld                 <= 1'b1;
    end
   else if ((ping_pong_ready == 1'b1) && (outportid_cmd == PORT1) && (outportid_data0 == 2'b00) && (port1_sm[0] == 1'b1)) //the cmd is received
    begin
        cmdflit1_vld                 <= 1'b0; 
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
assign arb_req_nxt = ((outportid_cmd == PORT0)  && (outportid_data1 == 2'b00) && (ping_pong_ready == 1'b1) && (cmdflit0_vld == 1'b1) && (port0_sm[0] == 1'b1)) || 
                     ((outportid_cmd == PORT1)  && (outportid_data0 == 2'b00) && (ping_pong_ready == 1'b1) && (cmdflit1_vld == 1'b1) && (port1_sm[0] == 1'b1)); 

//Output port cmd is a wire as we need the response from the arbiter immediately                  
assign outportid_cmd =  arb_sel; 


//####################################################################################
//PING PONG OUTPUT
//####################################################################################
assign ping_pong_ready = (outdata_ping_vld == 1'b0) || (outdata_pong_vld == 1'b0);


wire   is_writecmd0;
assign is_writecmd0 = cmdflit0_q[253];

wire   is_writecmd1;
assign is_writecmd1 = cmdflit1_q[253];

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
                if ((outportid_cmd == PORT0) && (outportid_data1 == 2'b00) && (ping_pong_ready == 1'b1) && (is_writecmd0 == 1'b1) &&  (cmdflit0_vld == 1'b1))
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
                if ((outportid_cmd == PORT1) && (outportid_data0 == 2'b00) && (ping_pong_ready == 1'b1) && (is_writecmd1 == 1'b1) &&  (cmdflit1_vld == 1'b1))
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
         outdata_ping      <= 512'b0;
         outdata_pong      <= 512'b0; 
         outdata_ping_vld  <=   1'b0;
         outdata_pong_vld  <=   1'b0;
         ping_pong_w       <=   1'b0;
      end
   else if ((cmdflit0_vld == 1'b1) && (ping_pong_ready == 1'b1) && (outportid_cmd == PORT0) &&  (outportid_data1 == 2'b00) && (port0_sm[0] == 1'b1)) //forward port0 cmd
      begin 
         outdata_ping[511:256] <= (ping_pong_w == 1'b0) ? cmdflit0_q    : outdata_ping[511:256];
         outdata_pong[511:256] <= (ping_pong_w == 1'b1) ? cmdflit0_q    : outdata_pong[511:256]; 
         outdata_ping_vld      <= (ping_pong_w == 1'b0) ? 1'b1          : outdata_ping_vld & (outdata_ping_vld ^ route_out_tready); 
         outdata_pong_vld      <= (ping_pong_w == 1'b1) ? 1'b1          : outdata_pong_vld & (outdata_pong_vld ^ route_out_tready); 
         ping_pong_w           <= ~ping_pong_w; //go for the other side next time
      end 
   else if ((dataflit00l_vld == 1'b1) && (ping_pong_ready == 1'b1) && (outportid_data0 == PORT0) && (port0_sm[1] == 1'b1)) //forward DFLIT0
      begin
         outdata_ping[511:256] <= (ping_pong_w == 1'b0) ? dataflit00h_q : outdata_ping[511:256]; //upsizing
         outdata_ping[255:0]   <= (ping_pong_w == 1'b0) ? dataflit00l_q : outdata_ping[255:0];
         outdata_pong[511:256] <= (ping_pong_w == 1'b1) ? dataflit00h_q : outdata_pong[511:256];
         outdata_pong[255:0]   <= (ping_pong_w == 1'b1) ? dataflit00l_q : outdata_pong[255:0];
         outdata_ping_vld      <= (ping_pong_w == 1'b0) ? 1'b1          : outdata_ping_vld & (outdata_ping_vld ^ route_out_tready); 
         outdata_pong_vld      <= (ping_pong_w == 1'b1) ? 1'b1          : outdata_pong_vld & (outdata_pong_vld ^ route_out_tready); 
         ping_pong_w           <= ~ping_pong_w;
      end   
   else if ((dataflit01l_vld == 1'b1) && (ping_pong_ready == 1'b1) && (outportid_data0 == PORT0) && (port0_sm[2] == 1'b1)) //forward DFLIT1
      begin
         outdata_ping[511:256] <= (ping_pong_w == 1'b0) ? dataflit01h_q : outdata_ping[511:256];
         outdata_ping[255:0]   <= (ping_pong_w == 1'b0) ? dataflit01l_q : outdata_ping[255:0];
         outdata_pong[511:256] <= (ping_pong_w == 1'b1) ? dataflit01h_q : outdata_pong[511:256];
         outdata_pong[255:0]   <= (ping_pong_w == 1'b1) ? dataflit01l_q : outdata_pong[255:0];
         outdata_ping_vld      <= (ping_pong_w == 1'b0) ? 1'b1          : outdata_ping_vld & (outdata_ping_vld ^ route_out_tready); 
         outdata_pong_vld      <= (ping_pong_w == 1'b1) ? 1'b1          : outdata_pong_vld & (outdata_pong_vld ^ route_out_tready); 
         ping_pong_w           <= ~ping_pong_w;
      end   
   else if ((cmdflit1_vld == 1'b1) && (ping_pong_ready == 1'b1) && (outportid_cmd == PORT1) && (outportid_data0 == 2'b00) && (port1_sm[0] == 1'b1)) //forward port1 cmd
      begin 
         outdata_ping[511:256] <= (ping_pong_w == 1'b0) ? cmdflit1_q    : outdata_ping[511:256];
         outdata_pong[511:256] <= (ping_pong_w == 1'b1) ? cmdflit1_q    : outdata_pong[511:256]; 
         outdata_ping_vld      <= (ping_pong_w == 1'b0) ? 1'b1          : outdata_ping_vld & (outdata_ping_vld ^ route_out_tready); 
         outdata_pong_vld      <= (ping_pong_w == 1'b1) ? 1'b1          : outdata_pong_vld & (outdata_pong_vld ^ route_out_tready); 
         ping_pong_w           <= ~ping_pong_w;
      end 
   else if ((dataflit10l_vld == 1'b1) && (ping_pong_ready == 1'b1) && (outportid_data1 == PORT1) && (port1_sm[1] == 1'b1)) //forward DFLIT0
      begin
         outdata_ping[511:256] <= (ping_pong_w == 1'b0) ? dataflit10h_q : outdata_ping[511:256];
         outdata_ping[255:0]   <= (ping_pong_w == 1'b0) ? dataflit10l_q : outdata_ping[255:0];
         outdata_pong[511:256] <= (ping_pong_w == 1'b1) ? dataflit10h_q : outdata_pong[511:256];
         outdata_pong[255:0]   <= (ping_pong_w == 1'b1) ? dataflit10l_q : outdata_pong[255:0];
         outdata_ping_vld      <= (ping_pong_w == 1'b0) ? 1'b1          : outdata_ping_vld & (outdata_ping_vld ^ route_out_tready); 
         outdata_pong_vld      <= (ping_pong_w == 1'b1) ? 1'b1          : outdata_pong_vld & (outdata_pong_vld ^ route_out_tready); 
         ping_pong_w           <= ~ping_pong_w;
      end   
   else if ((dataflit11l_vld == 1'b1) && (ping_pong_ready == 1'b1) && (outportid_data1 == PORT1) && (port1_sm[2] == 1'b1)) //forward DFLIT1
      begin
         outdata_ping[511:256] <= (ping_pong_w == 1'b0) ? dataflit11h_q : outdata_ping[511:256];
         outdata_ping[255:0]   <= (ping_pong_w == 1'b0) ? dataflit11l_q : outdata_ping[255:0];
         outdata_pong[511:256] <= (ping_pong_w == 1'b1) ? dataflit11h_q : outdata_pong[511:256];
         outdata_pong[255:0]   <= (ping_pong_w == 1'b1) ? dataflit11l_q : outdata_pong[255:0];
         outdata_ping_vld      <= (ping_pong_w == 1'b0) ? 1'b1          : outdata_ping_vld & (outdata_ping_vld ^ route_out_tready); 
         outdata_pong_vld      <= (ping_pong_w == 1'b1) ? 1'b1          : outdata_pong_vld & (outdata_pong_vld ^ route_out_tready); 
         ping_pong_w           <= ~ping_pong_w;
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
