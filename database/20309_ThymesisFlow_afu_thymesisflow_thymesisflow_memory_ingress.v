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
// File Name          :  thymesisflow_64B_2x32B_bonding_ingress
// Project            :  ThymesisFlow disagreggated memory
//                       Module implements the memory ingress tasks: 
//                       stores mastered commands, re-masters retried commands and demultiplexes cmd and data flits.
// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================

module thymesisflow_memory_ingress (


          input                            clock
        , input                            reset_n
        , input  [11:0]                    active_actag


        , input [15:0]                    capptag_fifo_tdata
        , output                          capptag_fifo_tready
        , input                           capptag_fifo_tvalid


        , output [31:0]                   cmdlookup_port_addr
        , output [255:0]                  cmdlookup_port_din
        , input  [255:0]                  cmdlookup_port_dout
        , output                          cmdlookup_port_en
        , output                          cmdlookup_port_rst
        , output [31:0]                   cmdlookup_in_port_we

        , output [31:0]                   d0lookup_port_addr
        , output [511:0]                  d0lookup_port_din
        , input  [511:0]                  d0lookup_port_dout
        , output                          d0lookup_port_en
        , output                          d0lookup_port_rst
        , output [63:0]                   d0lookup_in_port_we

        , output [31:0]                   d1lookup_port_addr
        , output [511:0]                  d1lookup_port_din
        , input  [511:0]                  d1lookup_port_dout
        , output                          d1lookup_port_en
        , output                          d1lookup_port_rst
        , output [63:0]                   d1lookup_in_port_we

        
        , input  [511:0]                  netflit_in_tdata
        
        , input                           netflit_in_tvalid
        , output                          netflit_in_tready 

        , input  [511:0]                  rty_in_tdata
        , input                           rty_in_tvalid
        , output                          rty_in_tready 

        , input                           enable

        , output [199:0]                  tlx_cmd_tdata
        , output                          tlx_cmd_tvalid
        , input                           tlx_cmd_tready 

        , output [519:0]                  tlx_data_tdata
        , output                          tlx_data_tvalid
        , input                           tlx_data_tready

);



//defines for text replacement
`define OCX_FLIT_CMD_DL             423:422
`define OCX_FLIT_RESP_DL            483:482 
`define OCX_FLIT_AFUTAG             439:424
`define OCX_FLIT_LOCAL_AFUTAG       312:297 
`define TLX_CMD_OP_RANGE            198:191
`define TLX_CMD_ACTAG                41:30
`define TLX_CMD_PASID                25:6
`define TLX_CMD_STREAM_ID            29:26
`define TLX_CMD_LOCAL_CAPPTAG       126:111
`define TLX_CMD_STORE_LOCAL_CAPPTAG 214:199
`define TLX_CMD_STORE_ORIG_CAPPTAG  126:111
`define TLX_CMD_STORE_NET_ID          5:0
`define OCX_FLIT_NET_ID             296:291


//defines for True Port BRAM interfaces. Since TP BRAM
//is byte addressable 255 cmd flits and 512 data flit 
//address ranges should take into account respective
//alignment.
`define ADDR_RANGE_CMD_BRAM          20:5
`define ADDR_RANGE_DATA_BRAM         21:6

//Parameters

parameter ACTAG_CMD_OP = 8'h50; 

//Registers 

reg [199:0]   tlx_cmd_q;
reg           tlx_cmd_valid_q; 

reg [519:0]   tlx_data_tdata_q;
reg           tlx_data_valid_q;

reg [31:0]    cmdlookup_port_addr_q;
reg [255:0]   cmdlookup_port_din_q;
reg           cmdlookup_port_en_q;
reg           cmdlookup_port_rst_q;
reg [31:0]    cmdlookup_in_port_we_q;

reg [31:0]    d0lookup_port_addr_q;
reg [511:0]   d0lookup_port_din_q;
reg           d0lookup_port_en_q;
reg           d0lookup_port_rst_q;
reg [63:0]    d0lookup_in_port_we_q;

reg [31:0]    d1lookup_port_addr_q;
reg [511:0]   d1lookup_port_din_q;
reg           d1lookup_port_en_q;
reg           d1lookup_port_rst_q;
reg [63:0]    d1lookup_in_port_we_q;

reg [2:0]     dflit_size_rty;
reg [2:0]     dflit_size; 


//Fixed assignments
assign tlx_cmd_tdata  = tlx_cmd_q;     //  | tlx_cmd_actag ; 
assign tlx_cmd_tvalid  = tlx_cmd_valid_q; //| tlx_cmd_actag_valid;

assign tlx_data_tdata  = tlx_data_tdata_q;
assign tlx_data_tvalid = tlx_data_valid_q;

assign cmdlookup_port_addr  =  cmdlookup_port_addr_q;
assign cmdlookup_port_din   =  cmdlookup_port_din_q;
assign cmdlookup_port_en    =  cmdlookup_port_en_q;
assign cmdlookup_port_rst   =  cmdlookup_port_rst_q;
assign cmdlookup_in_port_we =  cmdlookup_in_port_we_q;

assign  d0lookup_port_addr  =  d0lookup_port_addr_q;
assign  d0lookup_port_din   =  d0lookup_port_din_q;
assign  d0lookup_port_en    =  d0lookup_port_en_q;
assign  d0lookup_port_rst   =  d0lookup_port_rst_q;
assign  d0lookup_in_port_we =  d0lookup_in_port_we_q;

assign  d1lookup_port_addr  =  d1lookup_port_addr_q;
assign  d1lookup_port_din   =  d1lookup_port_din_q;
assign  d1lookup_port_en    =  d1lookup_port_en_q;
assign  d1lookup_port_rst   =  d1lookup_port_rst_q;
assign  d1lookup_in_port_we =  d1lookup_in_port_we_q;

//Determining between Read and Write family of commands
//Please note this module is coded to receive only those
//types and not anything else
wire   is_writecmd;
assign is_writecmd = netflit_in_tdata[509];

wire   is_writecmd_rty;
assign is_writecmd_rty = rty_in_tdata[509];

`ifdef MARK_DEBUG (* mark_debug = "TRUE" *) `endif

wire [1:0] cmd_dl;
assign cmd_dl  =   netflit_in_tdata[`OCX_FLIT_CMD_DL]; //according to the mapping

wire [1:0] cmd_dl_rty;
assign cmd_dl_rty  =  rty_in_tdata[`OCX_FLIT_CMD_DL]; //according to the mapping


//main state machine registers and command
reg [4:0] smstate;
parameter INIT         = 5'b00001;
parameter RECEIVE_CMD  = 5'b00010;
parameter RECEIVE_DATA = 5'b00100;


//CAPPTAG input accepts data  when enabled and can accept data from network.
assign capptag_fifo_tready = enable & smstate[1] & ~rty_in_tvalid & netflit_in_tvalid & tlx_cmd_tready;

//RTY input accepts data when enabled and it is either ready to accept command or ready accept data.
assign rty_in_tready     =  enable & (
                                        (tlx_cmd_tready & smstate[1])  | 
                                        (tlx_data_tready & (dflit_size_rty[1] | dflit_size_rty[0]))
                                     );

//NET input accepts data when enabled, ready to receive and no rty cmd is awaiting OR ready to accept data
assign netflit_in_tready =  enable & (
                                       (tlx_cmd_tready & smstate[1] & ~rty_in_tvalid & capptag_fifo_tvalid) | 
                                       (tlx_data_tready & (dflit_size[1] | dflit_size[0]))
                                     );


//Main State machine handling
always @(posedge(clock)) 
begin
  if ((reset_n == 1'b0)) 
        begin
      //initialize everything 
          tlx_cmd_q               <= 200'b0;
          tlx_cmd_valid_q         <= 1'b0;
          tlx_data_tdata_q        <= 520'b0;
          tlx_data_valid_q        <= 1'b0;
          dflit_size_rty          <= 3'b0;
          dflit_size              <= 3'b0; 
          cmdlookup_port_addr_q   <= 32'b0;
          cmdlookup_port_din_q    <= 256'b0;
          cmdlookup_in_port_we_q  <= 32'b0; 
          d0lookup_port_addr_q    <= 32'b0; 
          d0lookup_port_din_q     <= 512'b0;
          d0lookup_in_port_we_q   <= 64'h0;
          d1lookup_port_addr_q    <= 32'b0; 
          d1lookup_port_din_q     <= 512'b0;
          d1lookup_in_port_we_q   <= 64'h0;
        end
  else if ((smstate == INIT) && (enable == 1'b1))
        begin
          tlx_cmd_q[`TLX_CMD_OP_RANGE]   <= ACTAG_CMD_OP; //8
          tlx_cmd_q[`TLX_CMD_ACTAG]      <= active_actag; 
          tlx_cmd_q[`TLX_CMD_PASID]      <= 20'h0; // should be configurable for more contexts
          tlx_cmd_valid_q                <= 1'b1;
          tlx_data_valid_q               <= 1'b0;
        end
  else if ( (smstate        == RECEIVE_CMD) && //Receive cmd state 
            (rty_in_tvalid  == 1'b1) &&  //Rty cmd in the queue (no capptag required)
            (tlx_cmd_tready == 1'b1)   //tlx_cmd register empties now
          )
        begin
          tlx_cmd_q[198:127]                 <= rty_in_tdata[511:440]; //OPcode + EA
          tlx_cmd_q[`TLX_CMD_LOCAL_CAPPTAG]  <= rty_in_tdata[`OCX_FLIT_LOCAL_AFUTAG]; //local afutag has to be used here.
          tlx_cmd_q[110:0]                   <= rty_in_tdata[423:313]; //dl+pl+be+actag+streamid+pasid+pgsize
          tlx_cmd_valid_q                    <= 1'b1; 
          tlx_data_valid_q                   <= (tlx_data_valid_q == 1'b1)? ~tlx_data_tready : 1'b0; // check if tlx_data_valid can be de-asserted 
          dflit_size_rty[2]                  <= (is_writecmd_rty == 1'b1) ? cmd_dl_rty[1]  & cmd_dl_rty[0]  : 1'b0;
          dflit_size_rty[1]                  <= (is_writecmd_rty == 1'b1) ? cmd_dl_rty[1]  & ~cmd_dl_rty[0] : 1'b0;
          dflit_size_rty[0]                  <= (is_writecmd_rty == 1'b1) ? ~cmd_dl_rty[1]                  : 1'b0;
          d1lookup_in_port_we_q              <= 64'h0; //disable BRAM write in the next cycle
          d0lookup_in_port_we_q              <= 64'h0; //disable BRAM write in the next cycle
          cmdlookup_in_port_we_q             <= 32'h0; //disable BRAM write in the next cycle
       end
  else if ( (smstate             == RECEIVE_CMD) && //Receive cmd state 
            (netflit_in_tvalid   == 1'b1) &&  //Rty cmd in the queue (no capptag required)
            (capptag_fifo_tvalid == 1'b1) &&  //capptag needs to be present
            (tlx_cmd_tready      == 1'b1)   //tlx_cmd register empties now
          )
        begin
          //send command to output
          tlx_cmd_q[198:127]                                 <= netflit_in_tdata[511:440]; // Opcode + EA (8+64) 
          tlx_cmd_q[`TLX_CMD_LOCAL_CAPPTAG]                  <= capptag_fifo_tdata; //Get a local capptag
          tlx_cmd_q[110:42]                                  <= netflit_in_tdata[423:355]; //DL+PL+be
          tlx_cmd_q[`TLX_CMD_ACTAG]                          <= active_actag; //Active actag
          tlx_cmd_q[`TLX_CMD_STREAM_ID]                      <= netflit_in_tdata[342:339];//streamid
          tlx_cmd_q[`TLX_CMD_PASID]                          <= 20'h0;
          tlx_cmd_q[5:0]                                     <= netflit_in_tdata[318:313];//pgsize
          tlx_cmd_valid_q                                    <= 1'b1; 
          tlx_data_valid_q                                   <= (tlx_data_valid_q == 1'b1)? ~tlx_data_tready : 1'b0; // check if tlx_data_valid can be de-asserted
          //send a copy to cmd BRAM store              
          cmdlookup_port_addr_q[`ADDR_RANGE_CMD_BRAM]        <= capptag_fifo_tdata; //use local capptag as the address
          cmdlookup_port_din_q[`TLX_CMD_STORE_LOCAL_CAPPTAG] <= capptag_fifo_tdata; //Get a local capptag to store for patching it back.
          cmdlookup_port_din_q[198:127]                      <= netflit_in_tdata[511:440]; // Opcode + EA (8+64) 
          cmdlookup_port_din_q[`TLX_CMD_STORE_ORIG_CAPPTAG]  <= netflit_in_tdata[`OCX_FLIT_AFUTAG];//16 Original AFUTAG
          cmdlookup_port_din_q[110:42]                       <= netflit_in_tdata[423:355]; //DL+PL+be
          cmdlookup_port_din_q[`TLX_CMD_ACTAG]               <= active_actag; //Active actag
          cmdlookup_port_din_q[29:26]                        <= netflit_in_tdata[342:339];//streamid
          cmdlookup_port_din_q[`TLX_CMD_PASID]               <= 20'h0;
          cmdlookup_port_din_q[`TLX_CMD_STORE_NET_ID]        <= netflit_in_tdata[`OCX_FLIT_NET_ID];
          cmdlookup_in_port_we_q                             <= 32'hffff_ffff; //Write out all bytes in next cycle
          d1lookup_in_port_we_q                              <= 64'h0; //disable BRAM write in the next cycle
          d0lookup_in_port_we_q                              <= 64'h0; //disable BRAM write in the next cycle
          dflit_size[2]                                      <= (is_writecmd == 1'b1) ? cmd_dl[1]  & cmd_dl[0]  : 1'b0;
          dflit_size[1]                                      <= (is_writecmd == 1'b1) ? cmd_dl[1]  & ~cmd_dl[0] : 1'b0;
          dflit_size[0]                                      <= (is_writecmd == 1'b1) ? ~cmd_dl[1]              : 1'b0;
        end
  else if ( (smstate          == RECEIVE_DATA) && //Receive cmd state 
            (rty_in_tvalid    == 1'b1) && //Rty will be given priority..
            (dflit_size_rty   > 3'b00) && //...as long as this are follow up data to rty cmd
            (tlx_data_tready  == 1'b1)   //tlx_cmd register empties now
          )
        begin          
          tlx_data_tdata_q[512]     <= 1'b0;  //BDI - should be controlled in the future. 
          tlx_data_tdata_q[511:0]   <= rty_in_tdata; 
          tlx_data_valid_q          <= 1'b1;  
          tlx_cmd_valid_q           <= (tlx_cmd_valid_q  == 1'b1)? ~tlx_cmd_tready  : 1'b0; //check if tlx_cmd_valid can be de-asserted
          dflit_size_rty            <= dflit_size_rty - 3'b001;
        end
  else if ( (smstate              == RECEIVE_DATA) && //Receive cmd state 
            (netflit_in_tvalid    == 1'b1)  && //net cmd data are pulled in
            (dflit_size   > 3'b00) && //...as long as this are follow up data to net cmd
            (tlx_data_tready      == 1'b1)   //tlx_cmd register empties now
          )
        begin
          tlx_data_tdata_q[512]                           <= 1'b0;  //BDI - should be controlled in the future. 
          tlx_data_tdata_q[511:0]                         <= netflit_in_tdata; 
          tlx_data_valid_q                                <= 1'b1;     
          tlx_cmd_valid_q                                 <= (tlx_cmd_valid_q  == 1'b1)? ~tlx_cmd_tready  : 1'b0; //check if tlx_cmd_valid can be de-asserted
          cmdlookup_in_port_we_q                          <= 32'h0; //do not write anything out to cmd BRAM in this cycle.    
          dflit_size                                      <= dflit_size - 3'b001; 
          d0lookup_port_addr_q[`ADDR_RANGE_DATA_BRAM]     <= (dflit_size[1] == 1'b1) ? cmdlookup_port_addr_q[`ADDR_RANGE_CMD_BRAM] : 16'b0; //Holds the local capptag from preceding header - that will be used as address
          d0lookup_port_din_q                             <= (dflit_size[1] == 1'b1) ? netflit_in_tdata : 512'b0; 
          d0lookup_in_port_we_q                           <= (dflit_size[1] == 1'b1) ? 64'hffff_ffff_ffff_ffff : 64'b0;
          d1lookup_port_addr_q[`ADDR_RANGE_DATA_BRAM]     <= (dflit_size[0] == 1'b1) ? cmdlookup_port_addr_q[`ADDR_RANGE_CMD_BRAM] : 16'b0; //Holds the local capptag from preceding header - that will be used as address
          d1lookup_port_din_q                             <= (dflit_size[0] == 1'b1) ? netflit_in_tdata : 512'b0; 
          d1lookup_in_port_we_q                           <= (dflit_size[0] == 1'b1) ? 64'hffff_ffff_ffff_ffff : 64'b0;
        end  
  else //Nothing came in this cycle - clean up states for next cycle 
      begin 
          tlx_cmd_valid_q          <= (tlx_cmd_valid_q  == 1'b1)? ~tlx_cmd_tready  : 1'b0; //check if tlx_cmd_valid can be de-asserted
          tlx_data_valid_q         <= (tlx_data_valid_q == 1'b1)? ~tlx_data_tready : 1'b0; //check if tlx_data_valid can be de-asserted
          d1lookup_in_port_we_q    <= 64'h0; //disable BRAM write in the next cycle
          d0lookup_in_port_we_q    <= 64'h0; //disable BRAM write in the next cycle
          cmdlookup_in_port_we_q   <= 32'h0; //disable BRAM write in the next cycle
      end 
end


//State machine control
always @(posedge(clock)) 
begin
 if (reset_n == 1'b0)
    begin
      smstate <= INIT; 
      //BRAM enable/reset handling
      cmdlookup_port_en_q     <= 1'b0; 
      cmdlookup_port_rst_q    <= 1'b1;          
      d0lookup_port_en_q      <= 1'b0; 
      d0lookup_port_rst_q     <= 1'b1;
      d1lookup_port_en_q      <= 1'b0; 
      d1lookup_port_rst_q     <= 1'b1;                  
    end
 else 
   case(smstate)
     INIT: 
        if (enable == 1'b1)
          begin
              cmdlookup_port_en_q     <= 1'b1; 
              cmdlookup_port_rst_q    <= 1'b0;          
              d0lookup_port_en_q      <= 1'b1; 
              d0lookup_port_rst_q     <= 1'b0;
              d1lookup_port_en_q      <= 1'b1; 
              d1lookup_port_rst_q     <= 1'b0;                   
              smstate                 <= RECEIVE_CMD;
          end
     RECEIVE_CMD: 
        if ((tlx_cmd_tready == 1'b1) && (rty_in_tvalid  == 1'b1))
          begin
             smstate <= (is_writecmd_rty == 1'b1) ? RECEIVE_DATA : RECEIVE_CMD;
          end 
        else if ((tlx_cmd_tready == 1'b1) && (netflit_in_tvalid == 1'b1) && (capptag_fifo_tvalid == 1'b1))
          begin
             smstate <= (is_writecmd == 1'b1) ? RECEIVE_DATA : RECEIVE_CMD;          
          end
        else if (enable == 1'b0) smstate <= INIT;
     RECEIVE_DATA:
        if ( (tlx_data_tready   == 1'b1)  &&
             ( ((dflit_size     == 3'b01) && (netflit_in_tvalid   == 1'b1)) || // cmd_flit transfer in progress and data will be received now
               ((dflit_size_rty == 3'b01) && (rty_in_tvalid == 1'b1))      // OR rty_flit transfer in progress and data will be received now 
             )
           )
           begin
             smstate <= RECEIVE_CMD;
           end 
   endcase 
end   
  
endmodule 
