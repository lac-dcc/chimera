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
// ******************************************************************************************************************************
// File Name          :  thymesisflow_64B_32B_routing_egress
// Project            :  ThymesisFlow disagreggated memory
//                       Receives Compute or Memory multiplexed cmd-data traffic and routes towards the proper pipeline based on 
//                       the netid field. It also downsizes 64B to 32B and may also bond channels by mastering complete transactions
//                         in a round robin fashion.
// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================

module thymesisflow_64B_32B_routing_egress (

    input              clock                   // Clock - samples & launches data on rising edge
  , input              reset_n                //  Active Low

  // 64B incoming data Interface
  , input   [511:0]     egr_route_in_tdata
  , input               egr_route_in_tvalid
  
  , output              egr_route_in_tready

  // 32B AXI-STREAM 
  , output  [255:0]     egr_route_out_tdata0     
  , output              egr_route_out_tvalid0         
  , input               egr_route_out_tready0

  // 32B AXI-STREAM
  , output   [255:0]    egr_route_out_tdata1          
  , output              egr_route_out_tvalid1         
  , input               egr_route_out_tready1

);

`define OCX_FLIT_NET_ID 296:291 
`define OCX_SELECT_PORT0 291
`define OCX_SELECT_PORT1 292  

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


reg [255:0] pingdata0_q; 
reg         pingdata0_valid;

reg [255:0] pongdata0_q; 
reg         pongdata0_valid;

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

reg [255:0] pingdata1_q; 
reg         pingdata1_valid;

reg [255:0] pongdata1_q; 
reg         pongdata1_valid;


//Assignments

reg output_turn;//used for bonding.

wire next_cmd_interface_id;//used for determining next interface

wire ping_pong_ready0;
wire ping_pong_ready1;

//OpenCAPI main state machine

wire   is_writecmd;
assign is_writecmd = egr_route_in_tdata[509];

wire   is_respRok;
assign is_respRok  = ((egr_route_in_tdata[506] == 1'b1) && (egr_route_in_tdata[504] == 1'b0));

//TLCmd
wire [1:0] cmd_dl;
assign cmd_dl  = egr_route_in_tdata[423:422]; //according to the mapping

//TLResp
wire [1:0] resp_dl;
assign resp_dl = egr_route_in_tdata[483:482];


reg  [1:0] ocapi_sm;
parameter INPUT_CMD_RESP = 2'b01;
parameter INPUT_DATAFLIT = 2'b10;

reg [2:0] dflit_size;
reg       next_data_interface_id;


wire input_is_data;
assign input_is_data = ocapi_sm[1];

wire input_is_data0;
assign input_is_data0 = dflit_size[1]; //for 128B flits only as dl is 2'b10; 

wire input_is_data1; 
assign input_is_data1 = dflit_size[0]; //for 128B flits only as dl is 2'b01;

wire input_is_cmd;
assign input_is_cmd = ocapi_sm[0];

wire is_cmd_p0;
wire is_data0_high_p0;
wire is_data0_low_p0;
wire is_data1_high_p0;
wire is_data1_low_p0; 

wire is_cmd_p1;
wire is_data0_high_p1;
wire is_data0_low_p1;
wire is_data1_high_p1;
wire is_data1_low_p1; 


//Determine which is the next interface and what type of opencapi flit is expected next. 
//If ping pong buffer is ready the previous flits should get propagated unless a downsize stall
//happens for dataflits (i.e. conversion of 1x64B -> 2x32B)
assign egr_route_in_tready = ((next_cmd_interface_id ==  1'b0) && (input_is_cmd == 1'b1) &&  //next interface0 this is a command and it can be consumed
                                                    ((cmdflit0_vld == 1'b0) ||  ((is_cmd_p0 == 1'b1) && (ping_pong_ready0 == 1'b1)))  
                             ) ||
                             ((next_cmd_interface_id ==  1'b1) && (input_is_cmd == 1'b1) &&  //next interface1 this is a command and it can be consumed
                                                    ((cmdflit1_vld == 1'b0) ||  ((is_cmd_p1 == 1'b1) && (ping_pong_ready1 == 1'b1)))  
                             ) ||
                             ((next_data_interface_id == 1'b0) && (input_is_data0 == 1'b1) &&  //next data interface is zero and data0 low side is delivered now
                                                    ((dataflit00l_vld == 1'b0) ||  ((is_data0_low_p0 == 1'b1) && (ping_pong_ready0 == 1'b1)))  
                             ) ||                     
                             ((next_data_interface_id == 1'b1) && (input_is_data0 == 1'b1) &&  //next data interface is zero and data0 low side is delivered now
                                                    ((dataflit10l_vld == 1'b0) ||  ((is_data0_low_p1 == 1'b1) && (ping_pong_ready1 == 1'b1)))  
                             ) ||
                              ((next_data_interface_id == 1'b0) && (input_is_data1 == 1'b1) &&  //next data interface is zero and data0 low side is delivered now
                                                    ((dataflit01l_vld == 1'b0) ||  ((is_data1_low_p0 == 1'b1) && (ping_pong_ready0 == 1'b1)))  
                             ) ||                     
                             ((next_data_interface_id == 1'b1) && (input_is_data1 == 1'b1) &&  //next data interface is zero and data0 low side is delivered now
                                                    ((dataflit11l_vld == 1'b0) ||  ((is_data1_low_p1 == 1'b1) && (ping_pong_ready1 == 1'b1)))  
                             );
 

always @(posedge(clock))
begin
       if (reset_n == 1'b0)
    begin
      ocapi_sm               <= INPUT_CMD_RESP;
      dflit_size             <= 2'b00;
      next_data_interface_id <= 1'b0;
    end
   else
    case (ocapi_sm) 
       INPUT_CMD_RESP:                                   
	    begin
              if ((egr_route_in_tready == 1'b1) && (egr_route_in_tvalid == 1'b1) && //if the cmd is 128B write or Read resp OK there is special handling.
                                               ((is_writecmd == 1'b1) || (is_respRok == 1'b1))
                 ) //Commands with dataflits
                begin
                   dflit_size[2]                   <= (is_writecmd == 1'b1) ? cmd_dl[1]  & cmd_dl[0]  : resp_dl[1] &  resp_dl[0];
                   dflit_size[1]                   <= (is_writecmd == 1'b1) ? cmd_dl[1]  & ~cmd_dl[0] : resp_dl[1] & ~resp_dl[0];
                   dflit_size[0]                   <= (is_writecmd == 1'b1) ? ~cmd_dl[1] : ~resp_dl[1];
                   ocapi_sm                        <= INPUT_DATAFLIT;//next at input is cmd1
                   next_data_interface_id          <= next_cmd_interface_id;
                end
            end
	INPUT_DATAFLIT:
            begin  
              if ((egr_route_in_tready == 1'b1) && (egr_route_in_tvalid == 1'b1)) 
                begin
                   dflit_size         <= dflit_size - 3'b001;   
                   ocapi_sm           <= (dflit_size == 3'b001)? INPUT_CMD_RESP : INPUT_DATAFLIT;      //next at input is  cmd0   
                end 
            end         
    endcase
end    


//determining the next output for bonding. Each output gets a full command in (with data as well)
always @(posedge(clock))
begin
   if (reset_n == 1'b0)
    begin
      output_turn <= 1'b0;
    end
   else if ((egr_route_in_tready == 1'b1) && (egr_route_in_tvalid == 1'b1) && (input_is_cmd == 1'b1))
    begin
          output_turn <=  ~output_turn;
    end
end

//needs revisit as it only considers only 2 interfaces (which are available on the AD9V3 card)
//output turn is selected for channel bonding and if this is not the case, if outport0 is not selected we assume 1 is.
assign next_cmd_interface_id = (( egr_route_in_tdata[`OCX_SELECT_PORT0] == 1'b1) && ( egr_route_in_tdata[`OCX_SELECT_PORT1] == 1'b1)) ? output_turn : ~egr_route_in_tdata[`OCX_SELECT_PORT0];

//Processes that pull data from stage 1 to ping pong buffer.

//Cmdflit0
always @(posedge(clock))
begin
   if (reset_n == 1'b0)
     begin
        cmdflit0_q <= 256'b0;
        cmdflit0_vld <= 1'b0;
     end
   else if ((next_cmd_interface_id ==  1'b0) && //0 is the next interface 
            (input_is_cmd == 1'b1) &&           //first stage input is cmd
            (egr_route_in_tvalid == 1'b1) &&    //there is a cmd at the first stage input
            ( (cmdflit0_vld == 1'b0) ||        //first stage is empty or second stage is pulling the other flit in this cycle.
                   ((ping_pong_ready0 == 1'b1) && (is_cmd_p0 == 1'b1)) 
            )                      
           )
     begin
        cmdflit0_q   <= egr_route_in_tdata[511:256]; 
        cmdflit0_vld <= 1'b1;
     end
   else if ((cmdflit0_vld == 1'b1) && (is_cmd_p0 == 1'b1) && (ping_pong_ready0 == 1'b1))
     begin
        cmdflit0_vld <= 1'b0;
     end 
end

//dataflit00h_q
always @(posedge(clock))
begin
   if (reset_n == 1'b0)
     begin
        dataflit00h_q   <= 512'b0;
        dataflit00h_vld <= 1'b0;
     end
   else if ((next_data_interface_id ==  1'b0) && //0 is the next interface 
            (input_is_data0 == 1'b1) &&         //first stage input is dataflit0
            (egr_route_in_tvalid == 1'b1) &&    //there is a dataflit at the first stage input
            ( (dataflit00h_vld == 1'b0) ||        //first stage is empty or second stage is pulling the lower flit in this cycle.
                 ((ping_pong_ready0 == 1'b1) && (is_data0_high_p0 == 1'b1)) 
            )                      
           )
     begin
        dataflit00h_q   <= egr_route_in_tdata[511:256]; 
        dataflit00h_vld <= 1'b1;
     end
   else if ((dataflit00h_vld == 1'b1) && (is_data0_high_p0 == 1'b1) && (ping_pong_ready0 == 1'b1))
     begin
        dataflit00h_vld <= 1'b0;
     end 
end

//dataflit00l_q
always @(posedge(clock))
begin
   if (reset_n == 1'b0)
     begin
        dataflit00l_q   <= 512'b0;
        dataflit00l_vld <= 1'b0;
     end
   else if ((next_data_interface_id ==  1'b0) && //0 is the next interface 
            (input_is_data0 == 1'b1) &&         //first stage input is dataflit0
            (egr_route_in_tvalid == 1'b1) &&    //there is a dataflit at the first stage input
            ( (dataflit00l_vld == 1'b0) ||        //first stage is empty or second stage is pulling the lower flit in this cycle.
                 ((ping_pong_ready0 == 1'b1) && (is_data0_low_p0 == 1'b1)) 
            )                      
           )
     begin
        dataflit00l_q   <= egr_route_in_tdata[255:0]; 
        dataflit00l_vld <= 1'b1;
     end
   else if ((dataflit00l_vld == 1'b1) && (is_data0_low_p0 == 1'b1) && (ping_pong_ready0 == 1'b1))
     begin
        dataflit00l_vld <= 1'b0;
     end 
end

//dataflit01h_q
always @(posedge(clock))
begin
   if (reset_n == 1'b0)
     begin
        dataflit01h_q   <= 512'b0;
        dataflit01h_vld <= 1'b0;
     end
   else if ((next_data_interface_id ==  1'b0) && //0 is the next interface 
            (input_is_data1 == 1'b1) &&         //first stage input is dataflit0
            (egr_route_in_tvalid == 1'b1) &&    //there is a dataflit at the first stage input
            ( (dataflit01h_vld == 1'b0) ||        //first stage is empty or second stage is pulling the lower flit in this cycle.
                 ((ping_pong_ready0 == 1'b1) && (is_data1_high_p0 == 1'b1)) 
            )                      
           )
     begin
        dataflit01h_q   <= egr_route_in_tdata[511:256]; 
        dataflit01h_vld <= 1'b1;
     end
   else if ((dataflit01h_vld == 1'b1) && (is_data1_high_p0 == 1'b1) && (ping_pong_ready0 == 1'b1))
     begin
        dataflit01h_vld <= 1'b0;
     end 
end

//dataflit00l_q
always @(posedge(clock))
begin
   if (reset_n == 1'b0)
     begin
        dataflit01l_q <= 512'b0;
        dataflit01l_vld <= 1'b0;
     end
   else if ((next_data_interface_id ==  1'b0) && //0 is the next interface 
            (input_is_data1 == 1'b1) &&         //first stage input is dataflit0
            (egr_route_in_tvalid == 1'b1) &&    //there is a dataflit at the first stage input
            ( (dataflit01l_vld == 1'b0) ||        //first stage is empty or second stage is pulling the lower flit in this cycle.
                 ((ping_pong_ready0 == 1'b1) && (is_data1_low_p0 == 1'b1)) 
            )                      
           )
     begin
        dataflit01l_q   <= egr_route_in_tdata[255:0]; 
        dataflit01l_vld <= 1'b1;
     end
   else if ((dataflit01l_vld == 1'b1) && (is_data1_low_p0 == 1'b1) && (ping_pong_ready0 == 1'b1))
     begin
        dataflit01l_vld <= 1'b0;
     end 
end

//Cmdflit1
always @(posedge(clock))
begin
   if (reset_n == 1'b0)
     begin
        cmdflit1_q   <= 256'b0;
        cmdflit1_vld <= 1'b0;
     end
   else if ((next_cmd_interface_id ==  1'b1) && //1 is the next interface 
            (input_is_cmd == 1'b1) &&           //first stage input is cmd
            (egr_route_in_tvalid == 1'b1) &&    //there is a cmd at the first stage input
            ( (cmdflit1_vld == 1'b0) ||        //first stage is empty or second stage is pulling the other flit in this cycle.
                   ((ping_pong_ready1 == 1'b1) && (is_cmd_p1 == 1'b1)) 
            )                      
           )
     begin
        cmdflit1_q   <= egr_route_in_tdata[511:256]; 
        cmdflit1_vld <= 1'b1;
     end
   else if ((cmdflit1_vld == 1'b1) && (is_cmd_p1 == 1'b1) && (ping_pong_ready1 == 1'b1))
     begin
        cmdflit1_vld <= 1'b0;
     end 
end

//dataflit10h_q
always @(posedge(clock))
begin
   if (reset_n == 1'b0)
     begin
        dataflit10h_q   <= 512'b0;
        dataflit10h_vld <= 1'b0;
     end
   else if ((next_data_interface_id ==  1'b1) && //1 is the next interface 
            (input_is_data0 == 1'b1) &&         //first stage input is dataflit0
            (egr_route_in_tvalid == 1'b1) &&    //there is a dataflit at the first stage input
            ( (dataflit10h_vld == 1'b0)  ||  //first stage is _completely_ empty  or second stage is pulling the lower flit in this cycle.
                 ((ping_pong_ready1 == 1'b1) && (is_data0_high_p1 == 1'b1)) 
            )                      
           )
     begin
        dataflit10h_q   <= egr_route_in_tdata[511:256]; 
        dataflit10h_vld <= 1'b1;
     end
   else if ((dataflit10h_vld == 1'b1) && (is_data0_high_p1 == 1'b1) && (ping_pong_ready1 == 1'b1))
     begin
        dataflit10h_vld <= 1'b0;
     end 
end

//dataflit10l_q
always @(posedge(clock))
begin
   if (reset_n == 1'b0)
     begin
        dataflit10l_q   <= 512'b0;
        dataflit10l_vld <= 1'b0;
     end
   else if ((next_data_interface_id ==  1'b1) && //1 is the next interface 
            (input_is_data0 == 1'b1) &&         //first stage input is dataflit0
            (egr_route_in_tvalid == 1'b1) &&    //there is a dataflit at the first stage input
            ( (dataflit10l_vld == 1'b0) ||        //first stage is empty or second stage is pulling the lower flit in this cycle.
                 ((ping_pong_ready1 == 1'b1) && (is_data0_low_p1 == 1'b1)) 
            )                      
           )
     begin
        dataflit10l_q   <= egr_route_in_tdata[255:0]; 
        dataflit10l_vld <= 1'b1;
     end
   else if ((dataflit10l_vld == 1'b1) && (is_data0_low_p1 == 1'b1) && (ping_pong_ready1 == 1'b1))
     begin
        dataflit10l_vld <= 1'b0;
     end 
end

//dataflit11h_q
always @(posedge(clock))
begin
   if (reset_n == 1'b0)
     begin
        dataflit11h_q   <= 512'b0;
        dataflit11h_vld <= 1'b0;
     end
   else if ((next_data_interface_id ==  1'b1) && //1 is the next interface 
            (input_is_data1 == 1'b1) &&         //first stage input is dataflit0
            (egr_route_in_tvalid == 1'b1) &&    //there is a dataflit at the first stage input
            ( (dataflit11h_vld == 1'b0) ||        //first stage is empty or second stage is pulling the lower flit in this cycle.
                 ((ping_pong_ready1 == 1'b1) && (is_data1_high_p1 == 1'b1)) 
            )                      
           )
     begin
        dataflit11h_q   <= egr_route_in_tdata[511:256]; 
        dataflit11h_vld <= 1'b1;
     end
   else if ((dataflit11h_vld == 1'b1) && (is_data1_high_p1 == 1'b1) && (ping_pong_ready1 == 1'b1))
     begin
        dataflit11h_vld <= 1'b0;
     end 
end

//dataflit11l_q
always @(posedge(clock))
begin
   if (reset_n == 1'b0)
     begin
        dataflit11l_q <= 512'b0;
        dataflit11l_vld <= 1'b0;
     end
   else if ((next_data_interface_id ==  1'b1) && //1 is the next interface 
            (input_is_data1 == 1'b1) &&         //first stage input is dataflit0
            (egr_route_in_tvalid == 1'b1) &&    //there is a dataflit at the first stage input
            ( (dataflit11l_vld == 1'b0) ||        //first stage is empty or second stage is pulling the lower flit in this cycle.
                 ((ping_pong_ready1 == 1'b1) && (is_data1_low_p1 == 1'b1)) 
            )                      
           )
     begin
        dataflit11l_q   <= egr_route_in_tdata[255:0]; 
        dataflit11l_vld <= 1'b1;
     end
   else if ((dataflit11l_vld == 1'b1) && (is_data1_low_p1 == 1'b1) && (ping_pong_ready1 == 1'b1))
     begin
        dataflit11l_vld <= 1'b0;
     end 
end



//OUTPUT PORT0 PING PONG BUFFER LOGIC

wire   is_writecmd_p0;
assign is_writecmd_p0 = cmdflit0_q[253];

wire   is_respRok_p0;
assign is_respRok_p0  = ((cmdflit0_q[250] == 1'b1) && (cmdflit0_q[248] == 1'b0));

wire [1:0] cmd_dl_p0;
assign cmd_dl_p0  = cmdflit0_q[167:166]; //according to the mapping

wire [1:0] resp_dl_p0;
assign resp_dl_p0 = cmdflit0_q[227:226];


parameter PORT0_CMD        = 5'b00001;
parameter PORT0_DATA0_HIGH = 5'b00010;
parameter PORT0_DATA0_LOW  = 5'b00100;
parameter PORT0_DATA1_HIGH = 5'b01000;
parameter PORT0_DATA1_LOW  = 5'b10000;

reg [4:0] port0_sm;

assign is_cmd_p0         = port0_sm[0];
assign is_data0_high_p0  = port0_sm[1];
assign is_data0_low_p0   = port0_sm[2];
assign is_data1_high_p0  = port0_sm[3];
assign is_data1_low_p0   = port0_sm[4];

always @(posedge(clock))
begin
   if (reset_n == 1'b0)
    begin
      port0_sm        <= PORT0_CMD;
    end
   else
    case (port0_sm) 
       PORT0_CMD:                                   
	    begin
              if ((ping_pong_ready0 == 1'b1) && (cmdflit0_vld == 1'b1) && 
                      ((is_writecmd_p0 == 1'b1) || (is_respRok_p0 == 1'b1))) 
                   port0_sm <= PORT0_DATA0_HIGH;
            end
	PORT0_DATA0_HIGH:
            begin  
              if ((ping_pong_ready0 == 1'b1) && (dataflit00h_vld == 1'b1)) 
                   port0_sm  <= PORT0_DATA0_LOW;  
            end         
        PORT0_DATA0_LOW:
            begin
              if ((ping_pong_ready0 == 1'b1) && (dataflit00l_vld == 1'b1)) 
                   port0_sm  <= PORT0_DATA1_HIGH;   
            end
        PORT0_DATA1_HIGH:
            begin
              if ((ping_pong_ready0 == 1'b1) && (dataflit01h_vld == 1'b1)) 
                   port0_sm  <= PORT0_DATA1_LOW;   
            end
        PORT0_DATA1_LOW:
            begin
              if ((ping_pong_ready0 == 1'b1) && (dataflit01l_vld == 1'b1)) 
                   port0_sm  <= PORT0_CMD;   
            end
    endcase
end    


assign ping_pong_ready0 = ((pongdata0_valid == 1'b0) || (pingdata0_valid == 1'b0));

reg pp0_turn_w;
reg pp0_turn_r; //ping pong buffer write-read regs
//fill in ping data q register
always @(posedge(clock))
begin
   if (reset_n == 1'b0)
    begin
       pingdata0_q <= 256'b0;
    end
   else if ((is_cmd_p0 == 1'b1) && (cmdflit0_vld == 1'b1) && (pingdata0_valid == 1'b0) && (pp0_turn_w == 1'b0))
    begin
       pingdata0_q  <= cmdflit0_q;
    end
   else if ((is_data0_high_p0 == 1'b1) && (dataflit00h_vld == 1'b1) && (pingdata0_valid == 1'b0) && (pp0_turn_w == 1'b0))
    begin
       pingdata0_q  <= dataflit00h_q;
    end
   else if ((is_data0_low_p0 == 1'b1) && (dataflit00l_vld == 1'b1) && (pingdata0_valid == 1'b0) && (pp0_turn_w == 1'b0))
    begin
       pingdata0_q  <= dataflit00l_q;
    end
   else if ((is_data1_high_p0 == 1'b1) && (dataflit01h_vld == 1'b1) && (pingdata0_valid == 1'b0) && (pp0_turn_w == 1'b0))
    begin
       pingdata0_q  <= dataflit01h_q;
    end
   else if ((is_data1_low_p0 == 1'b1) && (dataflit01l_vld == 1'b1) && (pingdata0_valid == 1'b0) && (pp0_turn_w == 1'b0))
    begin
       pingdata0_q  <= dataflit01l_q;
    end
end

always @(posedge(clock))
begin
   if (reset_n == 1'b0)
    begin
       pongdata0_q <= 256'b0;
    end
   else if ((is_cmd_p0 == 1'b1) && (cmdflit0_vld == 1'b1) && (pongdata0_valid == 1'b0) && (pp0_turn_w == 1'b1))
    begin
       pongdata0_q  <= cmdflit0_q;
    end
   else if ((is_data0_high_p0 == 1'b1) && (dataflit00h_vld == 1'b1) && (pongdata0_valid == 1'b0) && (pp0_turn_w  == 1'b1))
    begin
       pongdata0_q  <= dataflit00h_q;
    end
   else if ((is_data0_low_p0 == 1'b1) && (dataflit00l_vld == 1'b1) && (pongdata0_valid == 1'b0) && (pp0_turn_w  == 1'b1))
    begin
       pongdata0_q  <= dataflit00l_q;
    end
   else if ((is_data1_high_p0 == 1'b1) && (dataflit01h_vld == 1'b1) && (pongdata0_valid == 1'b0) && (pp0_turn_w  == 1'b1))
    begin
       pongdata0_q  <= dataflit01h_q;
    end
   else if ((is_data1_low_p0 == 1'b1) && (dataflit01l_vld == 1'b1) && (pongdata0_valid == 1'b0) && (pp0_turn_w  == 1'b1))
    begin
       pongdata0_q  <= dataflit01l_q;
    end
end

//ping pong turn_write andi valid  handling
always @(posedge(clock))
begin
   if (reset_n == 1'b0)
    begin
       pongdata0_valid  <= 1'b0;
       pingdata0_valid  <= 1'b0;
       pp0_turn_w       <= 1'b0;
    end
   else if ((is_cmd_p0 == 1'b1) && (cmdflit0_vld == 1'b1) && (ping_pong_ready0 == 1'b1) )
    begin
       pp0_turn_w       <= ~pp0_turn_w;
       pingdata0_valid  <= (pp0_turn_w  == 1'b0) ? 1'b1 : pingdata0_valid & (pingdata0_valid ^ egr_route_out_tready0);
       pongdata0_valid  <= (pp0_turn_w  == 1'b1) ? 1'b1 : pongdata0_valid & (pongdata0_valid ^ egr_route_out_tready0); 
    end
   else if ((is_data0_high_p0 == 1'b1) && (dataflit00h_vld == 1'b1) && (ping_pong_ready0 == 1'b1))
    begin
       pp0_turn_w       <= ~pp0_turn_w; 
       pingdata0_valid  <= (pp0_turn_w  == 1'b0) ? 1'b1 : pingdata0_valid & (pingdata0_valid ^ egr_route_out_tready0);
       pongdata0_valid  <= (pp0_turn_w  == 1'b1) ? 1'b1 : pongdata0_valid & (pongdata0_valid ^ egr_route_out_tready0); 
    end
   else if ((is_data0_low_p0 == 1'b1) && (dataflit00l_vld == 1'b1) && (ping_pong_ready0 == 1'b1))
    begin
       pp0_turn_w       <= ~pp0_turn_w; 
       pingdata0_valid  <= (pp0_turn_w  == 1'b0) ? 1'b1 : pingdata0_valid & (pingdata0_valid ^ egr_route_out_tready0);
       pongdata0_valid  <= (pp0_turn_w  == 1'b1) ? 1'b1 : pongdata0_valid & (pongdata0_valid ^ egr_route_out_tready0); 
   end
   else if ((is_data1_high_p0 == 1'b1) && (dataflit01h_vld == 1'b1) && (ping_pong_ready0 == 1'b1))
    begin
       pp0_turn_w       <= ~pp0_turn_w; 
       pingdata0_valid  <= (pp0_turn_w  == 1'b0) ? 1'b1 : pingdata0_valid & (pingdata0_valid ^ egr_route_out_tready0);
       pongdata0_valid  <= (pp0_turn_w  == 1'b1) ? 1'b1 : pongdata0_valid & (pongdata0_valid ^ egr_route_out_tready0); 
   end
   else if ((is_data1_low_p0 == 1'b1) && (dataflit01l_vld == 1'b1) && (ping_pong_ready0 == 1'b1))
    begin
       pp0_turn_w       <= ~pp0_turn_w; 
       pingdata0_valid  <= (pp0_turn_w  == 1'b0) ? 1'b1 : pingdata0_valid & (pingdata0_valid ^ egr_route_out_tready0);
       pongdata0_valid  <= (pp0_turn_w  == 1'b1) ? 1'b1 : pongdata0_valid & (pongdata0_valid ^ egr_route_out_tready0);    
    end
  else 
    begin
       pingdata0_valid  <= (pp0_turn_r  == 1'b0) ? pingdata0_valid & (pingdata0_valid ^ egr_route_out_tready0) : pingdata0_valid;
       pongdata0_valid  <= (pp0_turn_r  == 1'b1) ? pongdata0_valid & (pongdata0_valid ^ egr_route_out_tready0) : pongdata0_valid;   
    end 
end

always @(posedge(clock))
begin
    if (reset_n == 1'b0)
      begin
        pp0_turn_r       <= 1'b0;
      end
    else if ((pp0_turn_r == 1'b0) && (pingdata0_valid == 1'b1) && (egr_route_out_tready0 == 1'b1)) //ping flit is going out.
      begin
        pp0_turn_r      <= 1'b1;
      end
    else if  ((pp0_turn_r == 1'b1) && (pongdata0_valid == 1'b1) && (egr_route_out_tready0 == 1'b1)) //pong flit is going out.
      begin
       pp0_turn_r       <= 1'b0; 
      end 
end

//assign outputs.
assign egr_route_out_tdata0  = (pp0_turn_r == 1'b0) ? pingdata0_q     : pongdata0_q;  
assign egr_route_out_tvalid0 = (pp0_turn_r == 1'b0) ? pingdata0_valid : pongdata0_valid;

//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//OUTPUT PORT1 PING PONG BUFFER LOGIC
//*******************************************************
//*******************************************************
wire   is_writecmd_p1;
assign is_writecmd_p1 = cmdflit1_q[253];

wire   is_respRok_p1;
assign is_respRok_p1  = ((cmdflit1_q[250] == 1'b1) && (cmdflit1_q[248] == 1'b0));

wire [1:0] cmd_dl_p1;
assign cmd_dl_p1  = cmdflit1_q[167:166]; //according to the mapping

wire [1:0] resp_dl_p1;
assign resp_dl_p1 = cmdflit1_q[227:226];


parameter PORT1_CMD        = 5'b00001;
parameter PORT1_DATA0_HIGH = 5'b00010;
parameter PORT1_DATA0_LOW  = 5'b00100;
parameter PORT1_DATA1_HIGH = 5'b01000;
parameter PORT1_DATA1_LOW  = 5'b10000;

reg [4:0] port1_sm;

assign is_cmd_p1         = port1_sm[0];
assign is_data0_high_p1  = port1_sm[1];
assign is_data0_low_p1   = port1_sm[2];
assign is_data1_high_p1  = port1_sm[3];
assign is_data1_low_p1   = port1_sm[4];

always @(posedge(clock))
begin
   if (reset_n == 1'b0)
    begin
      port1_sm        <= PORT1_CMD;
    end
   else
    case (port1_sm) 
       PORT1_CMD:                                   
	        begin
              if ((ping_pong_ready1 == 1'b1) && (cmdflit1_vld == 1'b1) && 
                         ((is_writecmd_p1 == 1'b1) || (is_respRok_p1 == 1'b1))) 
                   port1_sm <= PORT0_DATA0_HIGH;
            end
	    PORT1_DATA0_HIGH:
            begin  
              if ((ping_pong_ready1 == 1'b1) && (dataflit10h_vld == 1'b1)) 
                   port1_sm  <= PORT1_DATA0_LOW;  
            end         
        PORT1_DATA0_LOW:
            begin
              if ((ping_pong_ready1 == 1'b1) && (dataflit10l_vld == 1'b1)) 
                   port1_sm  <= PORT1_DATA1_HIGH;   
            end
        PORT1_DATA1_HIGH:
            begin
              if ((ping_pong_ready1 == 1'b1) && (dataflit11h_vld == 1'b1)) 
                   port1_sm  <= PORT1_DATA1_LOW;   
            end
        PORT1_DATA1_LOW:
            begin
              if ((ping_pong_ready1 == 1'b1) && (dataflit11l_vld == 1'b1)) 
                   port1_sm  <= PORT1_CMD;   
            end
    endcase
end    

assign ping_pong_ready1 = ((pongdata1_valid == 1'b0) || (pingdata1_valid == 1'b0));

reg pp1_turn_w;
reg pp1_turn_r; //ping pong buffer write-read regs
//fill in ping data q register
always @(posedge(clock))
begin
   if (reset_n == 1'b0)
    begin
       pingdata1_q <= 256'b0;
    end
   else if ((is_cmd_p1 == 1'b1) && (cmdflit1_vld == 1'b1) && (pingdata1_valid == 1'b0) && (pp1_turn_w == 1'b0))
    begin
       pingdata1_q  <= cmdflit1_q;
    end
   else if ((is_data0_high_p1 == 1'b1) && (dataflit10h_vld == 1'b1) && (pingdata1_valid == 1'b0) && (pp1_turn_w == 1'b0))
    begin
       pingdata1_q  <= dataflit10h_q;
    end
   else if ((is_data0_low_p1 == 1'b1) && (dataflit10l_vld == 1'b1) && (pingdata1_valid == 1'b0) && (pp1_turn_w == 1'b0))
    begin
       pingdata1_q  <= dataflit10l_q;
    end
   else if ((is_data1_high_p1 == 1'b1) && (dataflit11h_vld == 1'b1) && (pingdata1_valid == 1'b0) && (pp1_turn_w == 1'b0))
    begin
       pingdata1_q  <= dataflit11h_q;
    end
   else if ((is_data1_low_p1 == 1'b1) && (dataflit11l_vld == 1'b1) && (pingdata1_valid == 1'b0) && (pp1_turn_w == 1'b0))
    begin
       pingdata1_q  <= dataflit11l_q;
    end
end

always @(posedge(clock))
begin
   if (reset_n == 1'b0)
    begin
       pongdata1_q <= 256'b0;
    end
   else if ((is_cmd_p1 == 1'b1) && (cmdflit1_vld == 1'b1) && (pongdata1_valid == 1'b0) && (pp1_turn_w == 1'b1))
    begin
       pongdata1_q  <= cmdflit1_q;
    end
   else if ((is_data0_high_p1 == 1'b1) && (dataflit10h_vld == 1'b1) && (pongdata1_valid == 1'b0) && (pp1_turn_w  == 1'b1))
    begin
       pongdata1_q  <= dataflit10h_q;
    end
   else if ((is_data0_low_p1 == 1'b1) && (dataflit10l_vld == 1'b1) && (pongdata1_valid == 1'b0) && (pp1_turn_w  == 1'b1))
    begin
       pongdata1_q  <= dataflit10l_q;
    end
   else if ((is_data1_high_p1 == 1'b1) && (dataflit11h_vld == 1'b1) && (pongdata1_valid == 1'b0) && (pp1_turn_w  == 1'b1))
    begin
       pongdata1_q  <= dataflit11h_q;
    end
   else if ((is_data1_low_p1 == 1'b1) && (dataflit11l_vld == 1'b1) && (pongdata1_valid == 1'b0) && (pp1_turn_w  == 1'b1))
    begin
       pongdata1_q  <= dataflit11l_q;
    end
end

//ping pong turn_write andi valid  handling
always @(posedge(clock))
begin
   if (reset_n == 1'b0)
    begin
       pongdata1_valid  <= 1'b0;
       pingdata1_valid  <= 1'b0;
       pp1_turn_w       <= 1'b0;
    end
   else if ((is_cmd_p1 == 1'b1) && (cmdflit1_vld == 1'b1) && (ping_pong_ready1 == 1'b1) )
    begin
       pp1_turn_w       <= ~pp1_turn_w;
       pingdata1_valid  <= (pp1_turn_w  == 1'b0) ? 1'b1 : pingdata1_valid & (pingdata1_valid ^ egr_route_out_tready1);
       pongdata1_valid  <= (pp1_turn_w  == 1'b1) ? 1'b1 : pongdata1_valid & (pongdata1_valid ^ egr_route_out_tready1); 
    end
   else if ((is_data0_high_p1 == 1'b1) && (dataflit10h_vld == 1'b1) && (ping_pong_ready1 == 1'b1))
    begin
       pp1_turn_w       <= ~pp1_turn_w; 
       pingdata1_valid  <= (pp1_turn_w  == 1'b0) ? 1'b1 : pingdata1_valid & (pingdata1_valid ^ egr_route_out_tready1);
       pongdata1_valid  <= (pp1_turn_w  == 1'b1) ? 1'b1 : pongdata1_valid & (pongdata1_valid ^ egr_route_out_tready1); 
    end
   else if ((is_data0_low_p1 == 1'b1) && (dataflit10l_vld == 1'b1) && (ping_pong_ready1 == 1'b1))
    begin
       pp1_turn_w       <= ~pp1_turn_w; 
       pingdata1_valid  <= (pp1_turn_w  == 1'b0) ? 1'b1 : pingdata1_valid & (pingdata1_valid ^ egr_route_out_tready1);
       pongdata1_valid  <= (pp1_turn_w  == 1'b1) ? 1'b1 : pongdata1_valid & (pongdata1_valid ^ egr_route_out_tready1); 
   end
   else if ((is_data1_high_p1 == 1'b1) && (dataflit11h_vld == 1'b1) && (ping_pong_ready1 == 1'b1))
    begin
       pp1_turn_w       <= ~pp1_turn_w; 
       pingdata1_valid  <= (pp1_turn_w  == 1'b0) ? 1'b1 : pingdata1_valid & (pingdata1_valid ^ egr_route_out_tready1);
       pongdata1_valid  <= (pp1_turn_w  == 1'b1) ? 1'b1 : pongdata1_valid & (pongdata1_valid ^ egr_route_out_tready1); 
   end
   else if ((is_data1_low_p1 == 1'b1) && (dataflit11l_vld == 1'b1) && (ping_pong_ready1 == 1'b1))
    begin
       pp1_turn_w       <= ~pp1_turn_w; 
       pingdata1_valid  <= (pp1_turn_w  == 1'b0) ? 1'b1 : pingdata1_valid & (pingdata1_valid ^ egr_route_out_tready1);
       pongdata1_valid  <= (pp1_turn_w  == 1'b1) ? 1'b1 : pongdata1_valid & (pongdata1_valid ^ egr_route_out_tready1);    
    end
  else 
    begin
       pingdata1_valid  <= (pp1_turn_r  == 1'b0) ? pingdata1_valid & (pingdata1_valid ^ egr_route_out_tready1) : pingdata1_valid;
       pongdata1_valid  <= (pp1_turn_r  == 1'b1) ? pongdata1_valid & (pongdata1_valid ^ egr_route_out_tready1) : pongdata1_valid;   
    end 
end

always @(posedge(clock))
begin
    if (reset_n == 1'b0)
      begin
        pp1_turn_r       <= 1'b0;
      end
    else if ((pp1_turn_r == 1'b0) && (pingdata1_valid == 1'b1) && (egr_route_out_tready1 == 1'b1)) //ping flit is going out.
      begin
        pp1_turn_r      <= 1'b1;
      end
    else if  ((pp1_turn_r == 1'b1) && (pongdata1_valid == 1'b1) && (egr_route_out_tready1 == 1'b1)) //pong flit is going out.
      begin
        pp1_turn_r       <= 1'b0; 
      end 
end

//assign outputs.
assign egr_route_out_tdata1  = (pp1_turn_r == 1'b0) ? pingdata1_q     : pongdata1_q;  
assign egr_route_out_tvalid1 = (pp1_turn_r == 1'b0) ? pingdata1_valid : pongdata1_valid;

 
endmodule
