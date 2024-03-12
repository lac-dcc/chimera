//---------------------------------------------------------------------------
//--  Copyright 2015 - 2017 Systems Group, ETH Zurich
//-- 
//--  This hardware module is free software: you can redistribute it and/or
//--  modify it under the terms of the GNU General Public License as published
//--  by the Free Software Foundation, either version 3 of the License, or
//--  (at your option) any later version.
//-- 
//--  This program is distributed in the hope that it will be useful,
//--  but WITHOUT ANY WARRANTY; without even the implied warranty of
//--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//--  GNU General Public License for more details.
//-- 
//--  You should have received a copy of the GNU General Public License
//--  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//---------------------------------------------------------------------------


module zookeeper_tcp_top_parallel_nkv #(
      parameter IS_SIM = 0
      )
      (

			  input 	    aclk,
			  input 	    aresetn,

			  output 	    m_axis_open_connection_TVALID,
			  input 	    m_axis_open_connection_TREADY,
			  output [47:0]     m_axis_open_connection_TDATA,

			  input 	    s_axis_open_status_TVALID,
			  output 	    s_axis_open_status_TREADY,
			  input [23:0] 	    s_axis_open_status_TDATA,

			  output 	    m_axis_close_connection_TVALID,
			  input 	    m_axis_close_connection_TREADY,
			  output [15:0]     m_axis_close_connection_TDATA,

			  output 	    m_axis_listen_port_TVALID,
			  input 	    m_axis_listen_port_TREADY,
			  output [15:0]     m_axis_listen_port_TDATA,

			  input 	    s_axis_listen_port_status_TVALID,
			  output 	    s_axis_listen_port_status_TREADY,
			  input [7:0] 	    s_axis_listen_port_status_TDATA,

			  input 	    s_axis_notifications_TVALID,
			  output 	    s_axis_notifications_TREADY,
			  input [87:0] 	    s_axis_notifications_TDATA,

			  output 	    m_axis_read_package_TVALID,
			  input 	    m_axis_read_package_TREADY,
			  output [31:0]     m_axis_read_package_TDATA,

			  output 	    m_axis_tx_data_TVALID,
			  input 	    m_axis_tx_data_TREADY,
			  output [63:0]     m_axis_tx_data_TDATA,
			  output [7:0] 	    m_axis_tx_data_TKEEP,
			  output [0:0] 	    m_axis_tx_data_TLAST,

			  output  	    m_axis_tx_metadata_TVALID,
			  input 	    m_axis_tx_metadata_TREADY,
			  output  [15:0] m_axis_tx_metadata_TDATA,

			  input 	    s_axis_tx_status_TVALID,
			  output 	    s_axis_tx_status_TREADY,
			  input [63:0] 	    s_axis_tx_status_TDATA,

			  input 	    s_axis_rx_data_TVALID,
			  output 	    s_axis_rx_data_TREADY,
			  input [63:0] 	    s_axis_rx_data_TDATA,
			  input [7:0] 	    s_axis_rx_data_TKEEP,
			  input [0:0] 	    s_axis_rx_data_TLAST,

			  input 	    s_axis_rx_metadata_TVALID,
			  output 	    s_axis_rx_metadata_TREADY,
			  input [15:0] 	    s_axis_rx_metadata_TDATA,
			  
			  
			  
			  input [511:0] ht_dramRdData_data,
              input          ht_dramRdData_empty,
              input         ht_dramRdData_almost_empty,
              output          ht_dramRdData_read,
        
        
              output [63:0] ht_cmd_dramRdData_data,
              output        ht_cmd_dramRdData_valid,
              input        ht_cmd_dramRdData_stall,
        
        
              output [511:0] ht_dramWrData_data,
              output          ht_dramWrData_valid,
              input          ht_dramWrData_stall,
        
        
              output [63:0] ht_cmd_dramWrData_data,
              output        ht_cmd_dramWrData_valid,
              input        ht_cmd_dramWrData_stall,

			  input [511:0] upd_dramRdData_data,
              input          upd_dramRdData_empty,
              input         upd_dramRdData_almost_empty,
              output         upd_dramRdData_read,
        
        
              output [63:0] upd_cmd_dramRdData_data,
              output        upd_cmd_dramRdData_valid,
              input        upd_cmd_dramRdData_stall,
        
        
              output [511:0] upd_dramWrData_data,
              output          upd_dramWrData_valid,
              input          upd_dramWrData_stall,
        
        
              output [63:0] upd_cmd_dramWrData_data,
              output        upd_cmd_dramWrData_valid,
              input        upd_cmd_dramWrData_stall,


              output [63:0] ptr_rdcmd_data,
              output          ptr_rdcmd_valid,
              input           ptr_rdcmd_ready,

              input  [512-1:0]  ptr_rd_data,
              input          ptr_rd_valid,
              output           ptr_rd_ready, 

              output  [512-1:0] ptr_wr_data,
              output          ptr_wr_valid,
              input           ptr_wr_ready,

              output  [63:0] ptr_wrcmd_data,
              output          ptr_wrcmd_valid,
              input           ptr_wrcmd_ready,


              output  [63:0] bmap_rdcmd_data,
              output          bmap_rdcmd_valid,
              input           bmap_rdcmd_ready,

              input  [512-1:0]  bmap_rd_data,
              input          bmap_rd_valid,
              output           bmap_rd_ready, 

              output  [512-1:0] bmap_wr_data,
              output          bmap_wr_valid,
              input           bmap_wr_ready,

              output  [63:0] bmap_wrcmd_data,
              output          bmap_wrcmd_valid,
              input           bmap_wrcmd_ready,
            
              input[63:0]   para0_in_tdata,
              input         para0_in_tvalid,
              input         para0_in_tlast,
              output        para0_in_tready,
              
              input[63:0]   para1_in_tdata,
              input         para1_in_tvalid,
              input         para1_in_tlast,
              output        para1_in_tready,

              input[63:0]   para2_in_tdata,
              input         para2_in_tvalid,
              input         para2_in_tlast,
              output        para2_in_tready,                                          

              output[63:0]  para0_out_tdata,
              output        para0_out_tvalid,
              output        para0_out_tlast,
              input         para0_out_tready,
			  
              output[63:0]  para1_out_tdata,
              output        para1_out_tvalid,
              output        para1_out_tlast,
              input         para1_out_tready,

              output[63:0]  para2_out_tdata,
              output        para2_out_tvalid,
              output        para2_out_tlast,
              input         para2_out_tready,
              
              input [63:0] hadretransmit,
              input[161:0] toedebug

			  );

   assign m_axis_close_connection_TVALID = 0;
   assign s_axis_listen_port_status_TREADY = 1;
   assign s_axis_rx_metadata_TREADY = 1;
   assign s_axis_tx_status_TREADY = 1;      
   
   assign para2_in_tready = 1;
   assign para2_out_tvalid = 0;


   reg 					    port_opened;
   reg 					    axis_listen_port_valid;
   reg [15:0] 				    axis_listen_port_data;
   reg 					    reset;
   wire [63:0] 				    meta_output;

   wire 				    s_axis_rx_data_TFULL;

   wire 				    packbufEmpty;
   wire 				    packbufValid;
   wire [64:0] 				    packbufData;
   wire 				    packbufRead;

   wire 				    sesspackValid;
   wire 				    sesspackReady;
   wire 				    sesspackLast;
   wire [63:0] 				    sesspackData;
   wire [63:0] 				    sesspackMeta;

   wire 				    cmdInReady;
   wire 				    cmdInValid;
   wire [127:0] 			    cmdInData;
   wire 				    cmdInBufReady;
   wire 				    cmdInBufValid;
   wire [127:0] 			    cmdInBufData;

   wire 				    cmdOutReady;
   wire 				    cmdOutValid;
   wire [127:0] 			    cmdOutData;

   wire 				    cmdOutBufdReady;
   wire 				    cmdOutBufdValid;
   wire [127:0] 			    cmdOutBufdData;

   wire 				    payloadValid;
   wire 				    payloadReady;
   wire 				    payloadLast;
   wire [511:0] 			    payloadData;
   
   wire 				    payloadValid_b;
   wire                     payloadReady_b;
   wire                     payloadLast_b;
   wire [511:0]                 payloadData_b;   

   wire 				    bypassValid;
   wire 				    bypassReady;
   wire 				    bypassLast;
   wire [63:0] 				    bypassData;
   wire [63:0] 				    bypassMeta;

   wire 				    bypassBufdValid;
   wire 				    bypassBufdReady;
   wire 				    bypassBufdLast;
   wire [127:0] 			    bypassBufdData;


   wire 				    toAppValid;
   wire 				    toAppReady;
   wire 				    toAppLast;
   wire [63:0] 				    toAppData;
   wire [63:0] 				    toAppMeta;

   wire 				    toNetValid;
   wire 				    toNetReady;
   wire 				    toNetLast;
   wire [63:0] 				    toNetData;
   wire [63:0] 				    toNetMeta;
   
   wire 				    toNetBufdValid;
   wire                     toNetBufdReady;
   wire                     toNetBufdLast;
   wire [127:0]                     toNetBufdData;
      

   wire 				    toPifValid;
   wire 				    toPifReady;
   wire 				    toPifLast;
   wire [63:0] 				    toPifData;
   wire [63:0] 				    toPifMeta;

   
   wire                     para_valid;
   wire                     para_ready;
   wire                     para_last;
   wire [63:0]              para_data;   


   wire 				    toKvsValid;
   wire 				    toKvsReady;
   wire 				    toKvsLast;
   wire [127:0] 			    toKvsData;
   
   wire 				    fromKvsValid;
   wire                     fromKvsReady;
   wire                     fromKvsLast;
   wire [127:0]             fromKvsData;

   wire 				    finalOutValid;
   wire 				    finalOutReady;
   wire 				    finalOutLast;
   wire [127:0] 			    finalOutData;

   wire 				    log_addreq_valid;
   wire [31:0] 				    log_addreq_size;
   wire [31:0] 				    log_addreq_zxid;
   wire                         log_addreq_drop;

   wire 				    log_addresp_valid;
   wire [31:0] 				    log_addresp_size;
   wire [31:0] 				    log_addresp_pos;
   

   wire 				    log_findreq_valid;
   wire 				    log_findreq_since;
   wire [31:0] 				    log_findreq_zxid;

   wire 				    log_findresp_valid;
   wire [31:0] 				    log_findresp_size;
   wire [31:0] 				    log_findresp_pos;
   
   wire                     log_user_reset;

   wire 				    errorValid;
   wire [7:0] 				    errorOpcode;

   wire 				    mem_readcmd_valid;
   wire 				    mem_readcmd_stall;
   wire [63:0] 				    mem_readcmd_data;
   wire             mem_readcmd_multiplexedready;


   wire 				    mem_writecmd_valid;
   wire 				    mem_writecmd_stall;
   wire [63:0] 				    mem_writecmd_data;

   wire 				    mem_read_empty;
   wire 				    mem_read_read;
   wire [511:0] 			    mem_read_data;
   wire             mem_read_multiplexedvalid;

   wire 				    mem_write_valid;
   wire 				    mem_write_stall;
   wire [511:0] 			    mem_write_data;


   wire 				    splitPreValid;
   wire 				    splitPreLast;
   wire 				    splitPreReady;
   wire [128:0] 			    splitPreDataMerged;

   wire 				    splitInValid;
   wire 				    splitInLast;
   wire 				    splitInReady;
   wire [63:0] 				    splitInData;
   wire [63:0] 				    splitInMeta;
   wire [128:0] 			    splitInDataMerged;


   wire [35:0] 				    control0, control1;
   reg [255:0] 			    data;
   reg [255:0] 				    debug_r;
   reg [255:0] 				    debug_r2;
   wire [63:0] 				    vio_cmd;
   reg [63:0] 				    vio_cmd_r;

   reg 					    dbg_capture;
   reg 					    dbg_capture_valid;
   reg [80:0] 				    dbg_capture_data;
   reg [15:0] 				    dbg_capture_count;
   reg [15:0] 				    dbg_capture_pos;
   reg [15:0] 				    dbg_replay_pos;
   reg [15:0] 				    dbg_replay_left;
   wire [80:0] 				    dbg_replay_data;  
   reg 					    dbg_replay;
   reg 					    dbg_replay_valid;
   reg 					    dbg_replay_prevalid;
   wire 				    dbg_replay_ready;
   reg 					    replay_mode;
 
   
   reg [31:0] myClock;
   
   wire clk;
   
   /*BUFG clk156_bufg_inst 
   (
       .I                              (aclk),
       .O                              (clk) 
   );*/
   assign clk = aclk;


   assign m_axis_listen_port_TDATA = axis_listen_port_data;
   assign m_axis_listen_port_TVALID = axis_listen_port_valid;


   //open up server port (2888)
   always @(posedge clk) 
     begin
	reset <= !aresetn;
	
	if (aresetn == 0) begin
           port_opened <= 1'b0;
           axis_listen_port_valid <= 1'b0;
           myClock <= 0;        
	end
	else begin
           axis_listen_port_valid <= 1'b0;
           
           if (port_opened==0 && m_axis_listen_port_TREADY==1) begin
              axis_listen_port_valid <= 1'b1;
              axis_listen_port_data <= 16'h0B48;
              port_opened <= 1;
           end
           
           
           myClock <= myClock+1;
	end
     end


   wire            syncPrepare;

   reg [1:0]             syncModeForRead;
   reg [15:0]       toBeSynced;
   reg              allSynced;
   reg [1:0]             nextSyncMode;

   wire [1:0]            syncModeCtrl;

  always @(posedge aclk) begin
    if (aresetn == 0) begin

       syncModeForRead <= 0;
       nextSyncMode <= 0;
       toBeSynced <= 0;
       allSynced <= 0;

    end else begin
        
        if (syncModeCtrl!=syncModeForRead && toBeSynced==0) begin
          syncModeForRead <= syncModeCtrl;
          if (syncModeForRead==0 && syncModeCtrl==1) begin
            toBeSynced <= 0;
          end
        end

        if (syncModeForRead>0 && toBeSynced==0) begin
          allSynced <= 1;
        end else begin
          allSynced <= 0;
        end

        if (syncModeForRead>0 && mem_readcmd_valid==1 && mem_readcmd_multiplexedready==1) begin
          if (mem_read_multiplexedvalid==1 && mem_read_read==1) begin
            toBeSynced <= toBeSynced+7;
          end else begin
            toBeSynced <= toBeSynced+8;
          end          
        end else if (syncModeForRead>0 && mem_read_multiplexedvalid==1 && mem_read_read==1) begin
          toBeSynced <= toBeSynced - 1;
        end

        if (nextSyncMode!=syncModeCtrl) begin
          nextSyncMode <= syncModeCtrl;
        end

    end
  end


//wire timerValid;
//wire timerReady;
//wire[31:0] timerData;
//nukv_fifogen #(
//            .DATA_SIZE(32),
//            .ADDR_BITS(10)
//        ) fifo_arrivaltime (
//                .aclk(clk),
//                .rst(reset),
//                .s_axis_tvalid(sesspackValid & sesspackLast & sesspackReady),
//                .s_axis_tready(),
//                .s_axis_tdata(myClock),  
//                .m_axis_tvalid(timerValid),
//                .m_axis_tready(timerReady),
//                .m_axis_tdata(timerData)
//                ); 

   //assign s_axis_rx_data_TREADY = !s_axis_rx_data_TFULL;
   //assign packbufValid = !packbufEmpty;


        nukv_fifogen #(
            .DATA_SIZE(65),
            .ADDR_BITS(5)
        ) input_firstword_fifo_inst (
                .clk(clk),
                .rst(reset),
                .s_axis_tvalid(s_axis_rx_data_TVALID),
                .s_axis_tready(s_axis_rx_data_TREADY),
                .s_axis_tdata({s_axis_rx_data_TLAST[0], s_axis_rx_data_TDATA}),  
                .m_axis_tvalid(packbufValid),
                .m_axis_tready(packbufRead),
                .m_axis_tdata(packbufData)
                ); 




reg is_first_input_cycle;
reg[7:0] inpcountdown;
reg error_inputpacket;
   
always @(posedge clk) 
     begin
       if (aresetn == 0) begin
          is_first_input_cycle <= 1;
          inpcountdown <= 0;
          error_inputpacket <= 0;
       end
       else begin

          error_inputpacket <= 0;

          if (sesspackValid==1 && sesspackReady==1 && is_first_input_cycle==1) begin
              if (inpcountdown!=0) begin
                error_inputpacket <= 1;
              end

             inpcountdown <= sesspackData[32 +: 8]+1;
             is_first_input_cycle <= 0;         

          end else begin

            if (sesspackValid==1 && sesspackReady==1) begin
               inpcountdown <= inpcountdown-1;     

               if (inpcountdown==0 && sesspackData[15:0]==16'hFFFF) begin
                inpcountdown <= sesspackData[32 +: 8]+1;
               end 
               else if (inpcountdown==0) begin
                error_inputpacket <= 1;
               end
            end

            if (sesspackValid==1 && sesspackReady==1 && sesspackLast==1) begin
               is_first_input_cycle <= 1;
            end

          end
       end
     end

//   zk_fifo_fwft_16x65 input_firstword_fifo_inst (
//						 .clk(clk),      // input wire clk
//						 .rst(reset),      // input wire rst
//						 .din({s_axis_rx_data_TLAST[0], s_axis_rx_data_TDATA}),      // input wire [64 : 0] din
//						 .wr_en(s_axis_rx_data_TVALID),  // input wire wr_en
//						 .rd_en(packbufRead),  // input wire rd_en
//						 .dout(packbufData),    // output wire [64 : 0] dout
//						 .full(s_axis_rx_data_TFULL),    // output wire full
//						 .empty(packbufEmpty)  // output wire empty
//						 );
						 
    assign para_valid = 0;
    assign para_last = 0;
    assign para_data = 0;

/*
    axis_para_in_interconnect parallel_if_merger (
      .aclk(clk),                                          // input wire clk
      .ARESETN(aresetn),                                    // input wire ARESETN
      .S00_AXIs_aclk(clk),                        // input wire S00_AXIs_aclk
      .S01_AXIs_aclk(clk),                        // input wire S01_AXIs_aclk
      .S00_AXIS_ARESETN(aresetn),                  // input wire S00_AXIS_ARESETN
      .S01_AXIS_ARESETN(aresetn),                  // input wire S01_AXIS_ARESETN
      .S00_AXIS_TVALID(para0_in_tvalid),                    // input wire S00_AXIS_TVALID
      .S01_AXIS_TVALID(para1_in_tvalid),                    // input wire S01_AXIS_TVALID
      .S00_AXIS_TREADY(para0_in_tready),                    // output wire S00_AXIS_TREADY
      .S01_AXIS_TREADY(para1_in_tready),                    // output wire S01_AXIS_TREADY
      .S00_AXIS_TDATA(para0_in_tdata),                      // input wire [63 : 0] S00_AXIS_TDATA
      .S01_AXIS_TDATA(para1_in_tdata),                      // input wire [63 : 0] S01_AXIS_TDATA
      .S00_AXIS_TLAST(para0_in_tlast),                      // input wire S00_AXIS_TLAST
      .S01_AXIS_TLAST(para1_in_tlast),                      // input wire S01_AXIS_TLAST
      .M00_AXIs_aclk(clk),                        // input wire M00_AXIs_aclk
      .M00_AXIS_ARESETN(aresetn),                  // input wire M00_AXIS_ARESETN
      .M00_AXIS_TVALID(para_valid),                    // output wire M00_AXIS_TVALID
      .M00_AXIS_TREADY(para_ready),                    // input wire M00_AXIS_TREADY
      .M00_AXIS_TDATA(para_data),                      // output wire [63 : 0] M00_AXIS_TDATA
      .M00_AXIS_TLAST(para_last),                      // output wire M00_AXIS_TLAST
      .S00_ARB_REQ_SUPPRESS(1'b0),          // input wire S00_ARB_REQ_SUPPRESS
      .S01_ARB_REQ_SUPPRESS(1'b0),          // input wire S01_ARB_REQ_SUPPRESS      
      .M00_SPARSE_TKEEP_REMOVED()  // output wire M00_SPARSE_TKEEP_REMOVED
  );*/
  
   wire[127:0] debug_sess;
   zk_session_top_wpara  parallel_session_manager_inst (
					    .clk(clk),
					    .rst(reset),
					    .rstn(aresetn),

					    .stop(1'b0),
      
					    .event_valid(s_axis_notifications_TVALID),
					    .event_ready(s_axis_notifications_TREADY),
					    .event_data(s_axis_notifications_TDATA),
      
					    .readreq_valid(m_axis_read_package_TVALID),
					    .readreq_ready(m_axis_read_package_TREADY),
					    .readreq_data(m_axis_read_package_TDATA),
      
					    .packet_valid(packbufValid),
					    .packet_ready(packbufRead),
					    .packet_data({packbufData[63:0]}),    
					    .packet_keep(8'b11111111),
					    .packet_last(packbufData[64]),	
					    
                        .para0_valid(para_valid),
                        .para0_ready(para_ready),
                        .para0_data(para_data),    
                        .para0_keep(8'b11111111),
                        .para0_last(para_last),
         
					    .out_valid(sesspackValid),
					    .out_ready(sesspackReady),
					    .out_last(sesspackLast),
					    .out_data(sesspackData),
					    .out_meta(sesspackMeta),
      
					    .debug_out()
					    );



 /*  zk_dbg_replay_81x1024 debug_replaymem_inst (
					       .aclka(clk),
					       .wea({dbg_capture_valid}),
					       .addra(dbg_capture_pos[9:0]),
					       .dina(dbg_capture_data),
					       .aclkb(clk),
					       .addrb(dbg_replay_pos[9:0]),
					       .doutb(dbg_replay_data)
					       );
*/
   /*zk_axis_combine_2x128 input_infs_combine (
					     .aclk(clk),
					     .ARESETN(aresetn),
      
					     .S00_AXIs_aclk(clk),
					     .S00_AXIS_ARESETN(aresetn),	
					     .S00_AXIS_TVALID(sesspackValid),
					     .S00_AXIS_TREADY(sesspackReady),
					     .S00_AXIS_TDATA({sesspackMeta, sesspackData}),
					     .S00_AXIS_TLAST(sesspackLast),
      
					     .S01_AXIs_aclk(clk),
					     .S01_AXIS_ARESETN(aresetn),		
					     .S01_AXIS_TVALID(dbg_replay_valid),
					     .S01_AXIS_TREADY(dbg_replay_ready),
					     .S01_AXIS_TDATA({48'hffffffffffff,dbg_replay_data[79:0]}),
					     .S01_AXIS_TLAST(dbg_replay_data[80]),
      
					     .M00_AXIs_aclk(clk),
					     .M00_AXIS_ARESETN(aresetn),	
					     .M00_AXIS_TVALID(splitPreValid),
					     .M00_AXIS_TREADY(splitPreReady),
					     .M00_AXIS_TDATA(splitPreDataMerged[127:0]),
					     .M00_AXIS_TLAST(splitPreDataMerged[128]),
      
					     .S00_ARB_REQ_SUPPRESS(1'b0),
					     .S01_ARB_REQ_SUPPRESS(1'b0)					
					     );
*/

    assign splitPreValid = sesspackValid;
    assign sesspackReady = splitPreReady;
    assign splitPreDataMerged[127:0] = {sesspackMeta, sesspackData};
    assign splitPreDataMerged[128] = sesspackLast;
       
   nukv_fifogen #(
            .DATA_SIZE(129),
            .ADDR_BITS(6)
        ) fifo_splitprepare (
						    .clk(clk),
						    .rst(reset),
						    .s_axis_tvalid(splitPreValid),
						    .s_axis_tready(splitPreReady),
						    .s_axis_tdata(splitPreDataMerged),	
						    .m_axis_tvalid(splitInValid),
						    .m_axis_tready(splitInReady),
						    .m_axis_tdata(splitInDataMerged)
						    ); 
   

   assign splitInData = splitInDataMerged[63:0];
   assign splitInMeta = splitInDataMerged[127:64];
   assign splitInLast = splitInDataMerged[128];
   
   wire ignoreWrites;
   wire ignoreProps;

   zk_data_splitter data_splitter_inst (
					.clk(clk),
					.rst(reset),
      
					.net_valid(splitInValid),
					.net_last(splitInLast),
					.net_data(splitInData),
					.net_meta(splitInMeta),
					.net_ready(splitInReady),
					
					.cmd_valid(cmdInBufValid),
					.cmd_data(cmdInBufData),
					.cmd_ready(cmdInBufReady),
      
					.payload_valid(payloadValid_b),
					.payload_last(payloadLast_b),
					.payload_data(payloadData_b),
					.payload_ready(payloadReady_b),
      
					.bypass_valid(bypassValid),
					.bypass_ready(bypassReady),
					.bypass_last(bypassLast),
					.bypass_data(bypassData),
					.bypass_meta(bypassMeta),
					
					.no_writes(syncPrepare || syncModeForRead || ignoreWrites),
					.no_proposals(ignoreProps)

					);
					
    nukv_fifogen #(
               .DATA_SIZE(513),
               .ADDR_BITS(9)
         ) fifo_payloadprebuf (
                    .clk(clk),
                    .rst(reset),
                    
            .s_axis_tvalid(payloadValid_b),
            .s_axis_tready(payloadReady_b),
            .s_axis_tdata({payloadLast_b,payloadData_b}),
            

            .m_axis_tvalid(payloadValid),
            .m_axis_tready(payloadReady),
            .m_axis_tdata({payloadLast,payloadData})
                   
            );            					   

   reg waitingNewPayl;

   reg [1:0] syncModeForWrite;

   reg [31:0] syncWriteCount;

   always @(posedge clk) begin
     if(aresetn==0) begin
        waitingNewPayl <= 1;
        syncModeForWrite <= 0;
        syncWriteCount <= 0;

     end else begin

        if (syncModeForWrite>0 && mem_writecmd_valid==1 && mem_writecmd_stall==0) begin
          syncWriteCount <= syncWriteCount+8;

          if (payloadValid==1 && payloadReady==1) begin
            syncWriteCount <= syncWriteCount+7;
          end

        end else if (syncModeForWrite>0 && payloadValid==1 && payloadReady==1) begin
          syncWriteCount <= syncWriteCount-1;
        end


        if (syncModeCtrl==1 && syncModeForWrite==0) begin
          syncModeForWrite <= 1;
          waitingNewPayl <= 1;
          syncWriteCount <= 0;
        end

        if (payloadValid==1) begin    
          if (mem_writecmd_valid==1 || (syncWriteCount>0 && syncModeCtrl==0)) begin    
            waitingNewPayl <= 0;
          end

          if (payloadLast==1 && payloadReady==1) begin
            waitingNewPayl <= syncModeCtrl==0 ? 0 : 1;
            
            if (syncModeCtrl!=0 || syncWriteCount==0) begin
              syncModeForWrite <= syncModeCtrl;
            end
          end
        end

        if (mem_writecmd_valid==0 && syncModeForWrite!=syncModeCtrl) begin
          if (syncModeCtrl!=0 || syncWriteCount==0) begin
              syncModeForWrite <= syncModeCtrl;
          end
        end
     end
   end

   wire paylReadyMux;
   assign paylReadyMux = syncModeForWrite==1 ? !ht_dramWrData_stall : bmap_wr_ready;

   assign mem_write_valid = payloadValid & payloadReady;
   assign payloadReady = syncModeForWrite==0 ? !mem_write_stall  : (paylReadyMux & (mem_writecmd_valid | ~waitingNewPayl));
   assign mem_write_data = payloadData;

   
   wire cmdInMidBufValid;
   reg cmdInMidBufReady;
   wire[127:0] cmdInMidBufData;

   reg cmdInMidBufValid_r;
   wire cmdInMidBufReady_r;
   reg[127:0] cmdInMidBufData_r;

  nukv_fifogen #(
          .DATA_SIZE(128),
          .ADDR_BITS(6)
  ) fifo_cmdinbuf (
               .clk(clk),
               .rst(reset),
               
       .s_axis_tvalid(cmdInBufValid),
       .s_axis_tready(cmdInBufReady),
       .s_axis_tdata(cmdInBufData),
       

       .m_axis_tvalid(cmdInValid),//cmdInMidBufValid),
       .m_axis_tready(cmdInReady),//cmdInMidBufReady),
       .m_axis_tdata(cmdInData)//cmdInMidBufData)
              
       );  

  /*always @(posedge clk) begin
    if(reset) begin
       cmdInMidBufValid_r <= 0;
       cmdInMidBufReady <= 0; 
    end else begin
      cmdInMidBufReady <= 0;

      if (cmdInMidBufValid_r==0 && cmdInMidBufReady_r==1 && cmdInMidBufReady==0 && cmdInMidBufValid==1) begin                
          cmdInMidBufValid_r <= 1;
          cmdInMidBufData_r <= cmdInMidBufData;        
          cmdInMidBufReady <= 1;
        
      end

      if (cmdInMidBufValid_r==1 && cmdInMidBufReady_r==1) begin
        cmdInMidBufValid_r <= 0;
      end
    end
  end

   nukv_fifogen #(
          .DATA_SIZE(128),
          .ADDR_BITS(4)
    ) fifo_cmdinbuf0 (
               .clk(clk),
               .rst(reset),
               
       .s_axis_tvalid(cmdInMidBufValid_r),
       .s_axis_tready(cmdInMidBufReady_r),
       .s_axis_tdata(cmdInMidBufData_r),       

       .m_axis_tvalid(cmdInValid),
       .m_axis_tready(cmdInReady),
       .m_axis_tdata(cmdInData)
              
       );     
*/
   wire [87:0] debugger;
  
  assign mem_readcmd_multiplexedready = syncModeCtrl==1 ? !ht_cmd_dramRdData_stall : (syncModeCtrl==2 ? bmap_rdcmd_ready : !mem_readcmd_stall);

   zk_control_CentralSM control_central_inst (
					      .clk(clk),
					      .rst(reset),
      
					      .cmd_in_valid(cmdInValid),
					      .cmd_in_ready(cmdInReady),
					      .cmd_in_data(cmdInData),
      
					      .cmd_out_valid(cmdOutValid),
					      .cmd_out_ready(cmdOutReady),
					      .cmd_out_data(cmdOutData),
      
					      .write_valid(mem_writecmd_valid),
					      .write_cmd(mem_writecmd_data),
					      .write_ready(syncModeCtrl==1 ? !ht_cmd_dramWrData_stall : (syncModeCtrl==2 ? bmap_wrcmd_ready : !mem_writecmd_stall)),
      
					      .read_valid(mem_readcmd_valid),
					      .read_cmd(mem_readcmd_data),
					      .read_ready(mem_readcmd_multiplexedready),
      
					      .open_conn_req_valid(m_axis_open_connection_TVALID),
					      .open_conn_req_ready(m_axis_open_connection_TREADY),
					      .open_conn_req_data(m_axis_open_connection_TDATA),
      
					      .open_conn_resp_valid(s_axis_open_status_TVALID),
					      .open_conn_resp_ready(s_axis_open_status_TREADY),
					      .open_conn_resp_data(s_axis_open_status_TDATA[16:0]),
                            
                          .log_user_reset(log_user_reset),
      
					      .log_add_valid(log_addreq_valid),
					      .log_add_size(log_addreq_size),
					      .log_add_zxid(log_addreq_zxid),
					      .log_add_drop(log_addreq_drop),
      
					      .log_added_done(log_addresp_valid),
					      .log_added_pos(log_addresp_pos),
					      .log_added_size(log_addresp_size),
      
					      .log_search_valid(log_findreq_valid),
					      .log_search_since(log_findreq_since),
					      .log_search_zxid(log_findreq_zxid),
      
					      .log_found_valid(log_findresp_valid),
					      .log_found_pos(log_findresp_pos),
					      .log_found_size(log_findresp_size),
      
					      .error_valid(errorValid),
					      .error_opcode(errorOpcode),
					      
					      .sync_dram(syncModeCtrl),                
					      .sync_getready(syncPrepare),
                .sync_noinflight(allSynced),
					      .not_leader(ignoreWrites),
					      .dead_mode(ignoreProps),
      
					      .debug_out(debug_sess)
      
					      );

   zk_control_LogManager control_logmanager_inst (
						  .clk(clk),
						  .rst(reset),
						  
						  .log_user_reset(log_user_reset),
      
						  .log_add_valid(log_addreq_valid),
						  .log_add_size(log_addreq_size),
						  .log_add_zxid(log_addreq_zxid),
						  .log_add_drop(log_addreq_drop),
      
						  .log_added_done(log_addresp_valid),
						  .log_added_pos(log_addresp_pos),
						  .log_added_size(log_addresp_size),
      
						  .log_search_valid(log_findreq_valid),
						  .log_search_since(log_findreq_since),
						  .log_search_zxid(log_findreq_zxid),
      
						  .log_found_valid(log_findresp_valid),
						  .log_found_pos(log_findresp_pos),
						  .log_found_size(log_findresp_size)
						  );

   kvs_tbDRAMHDLNode #(.DRAM_ADDR_WIDTH(10)) memory_localmem_inst( // TODO : adjust size to be correct

					  .clk(clk),
					  .rst(reset),
      
					  .cmd_dramRdData_valid(syncModeCtrl>0 ? 1'b0 : mem_readcmd_valid),
					  .cmd_dramRdData_stall(mem_readcmd_stall),
					  .cmd_dramRdData_data(mem_readcmd_data),
      
					  .cmd_dramWrData_valid(syncModeCtrl>0 ? 1'b0: mem_writecmd_valid),
					  .cmd_dramWrData_stall(mem_writecmd_stall),
					  .cmd_dramWrData_data(mem_writecmd_data),
      
					  .dramRdData_empty(mem_read_empty),
					  .dramRdData_read(syncModeForRead>0 ? 1'b0 : mem_read_read),
					  .dramRdData_data(mem_read_data),
      
					  .dramWrData_valid(syncModeForWrite>0 ? 1'b0 : mem_write_valid),
					  .dramWrData_stall(mem_write_stall),
					  .dramWrData_data(mem_write_data)
					  );


zk_fifo_128x16 cmdoutbuf_inst (
     .s_aclk(clk),                // input wire s_aclk
     .s_aresetn(aresetn),          // input wire s_aresetn
     .s_axis_tvalid(cmdOutValid),  // input wire s_axis_tvalid
     .s_axis_tready(cmdOutReady),  // output wire s_axis_tready
     .s_axis_tdata(cmdOutData),    // input wire [127 : 0] s_axis_tdata
     .m_axis_tvalid(cmdOutBufdValid),  // output wire m_axis_tvalid
     .m_axis_tready(cmdOutBufdReady),  // input wire m_axis_tready
     .m_axis_tdata(cmdOutBufdData)    // output wire [127 : 0] m_axis_tdata
   );
/*   assign cmdOutBufdValid = cmdOutValid;
   assign cmdOutReady = cmdOutBufdReady;
   assign cmdOutBufdData = cmdOutData;
  */ 

    assign mem_read_multiplexedvalid = syncModeForRead==1 ? !ht_dramRdData_empty : (syncModeForRead==2 ? bmap_rd_valid :!mem_read_empty);

   zk_data_Recombine data_recombine_inst (
					  .clk(clk),
					  .rst(reset),
      
					  .cmd_valid(cmdOutBufdValid),
					  .cmd_data(cmdOutBufdData),
					  .cmd_ready(cmdOutBufdReady),
      
					  .payload_valid(mem_read_multiplexedvalid),
					  .payload_last(1'b0),
					  .payload_data(syncModeForRead==1 ? ht_dramRdData_data : (syncModeForRead==2 ? bmap_rd_data : mem_read_data)),
					  .payload_ready(mem_read_read),
      
					  .net_valid(toNetValid),
					  .net_last(toNetLast),
					  .net_data(toNetData),
					  .net_meta(toNetMeta),
					  .net_ready(toNetReady),
      
					  .pif_valid(toPifValid),
					  .pif_last(toPifLast),
					  .pif_data(toPifData),
					  .pif_meta(toPifMeta),
					  .pif_ready(toPifReady),
      
					  .app_valid(toAppValid),
					  .app_ready(toAppReady),
					  .app_last(toAppLast),
					  .app_data(toAppData),
					  .app_meta(toAppMeta)

					  );
					  
  assign toPifReady = 1;					  
/*
  axis_para_out_interconnect parallel_if_splitter (
  .aclk(clk),                                          // input wire clk
  .ARESETN(aresetn),                                    // input wire ARESETN
  .S00_AXIs_aclk(clk),                        // input wire S00_AXIs_aclk
  .S00_AXIS_ARESETN(aresetn),                  // input wire S00_AXIS_ARESETN
  .S00_AXIS_TVALID(toPifValid),                    // input wire S00_AXIS_TVALID
  .S00_AXIS_TREADY(toPifReady),                    // output wire S00_AXIS_TREADY
  .S00_AXIS_TDATA(toPifData),                      // input wire [7 : 0] S00_AXIS_TDATA
  .S00_AXIS_TLAST(toPifLast),                      // input wire S00_AXIS_TLAST
  .S00_AXIS_TDEST(toPifMeta[1]),                      // input wire [0 : 0] S00_AXIS_TDEST
  .M00_AXIs_aclk(clk),                        // input wire M00_AXIs_aclk
  .M01_AXIs_aclk(clk),                        // input wire M01_AXIs_aclk
  .M00_AXIS_ARESETN(aresetn),                  // input wire M00_AXIS_ARESETN
  .M01_AXIS_ARESETN(aresetn),                  // input wire M01_AXIS_ARESETN
  .M00_AXIS_TVALID(para0_out_tvalid),                    // output wire M00_AXIS_TVALID
  .M01_AXIS_TVALID(para1_out_tvalid),                    // output wire M01_AXIS_TVALID
  .M00_AXIS_TREADY(para0_out_tready),                    // input wire M00_AXIS_TREADY
  .M01_AXIS_TREADY(para1_out_tready),                    // input wire M01_AXIS_TREADY
  .M00_AXIS_TDATA(para0_out_tdata),                      // output wire [7 : 0] M00_AXIS_TDATA
  .M01_AXIS_TDATA(para1_out_tdata),                      // output wire [7 : 0] M01_AXIS_TDATA
  .M00_AXIS_TLAST(para0_out_tlast),                      // output wire M00_AXIS_TLAST
  .M01_AXIS_TLAST(para1_out_tlast),                      // output wire M01_AXIS_TLAST
  .M00_AXIS_TDEST(),                      // output wire [0 : 0] M00_AXIS_TDEST
  .M01_AXIS_TDEST(),                      // output wire [0 : 0] M01_AXIS_TDEST
  .S00_DECODE_ERR(),                      // output wire S00_DECODE_ERR
  .M00_SPARSE_TKEEP_REMOVED(),  // output wire M00_SPARSE_TKEEP_REMOVED
  .M01_SPARSE_TKEEP_REMOVED()  // output wire M01_SPARSE_TKEEP_REMOVED
);
  */
  assign para0_out_tkeep = 8'b11111111;
  assign para1_out_tkeep = 8'b11111111;
  
					  
					  
   zk_fifo_128x512 tonet_axis_fifo (
                    .s_aclk(clk),
                    .s_aresetn(aresetn),
     
                    .s_axis_tvalid(toNetValid),
                    .s_axis_tready(toNetReady),
                    .s_axis_tdata({toNetData, toNetMeta}),
                    .s_axis_tlast(toNetLast),
     
                    .m_axis_tvalid(toNetBufdValid),
                    .m_axis_tready(toNetBufdReady),
                    .m_axis_tdata(toNetBufdData),
                    .m_axis_tlast(toNetBufdLast)       
                    );					 

   zk_fifo_128x512 bypass_axis_fifo (
				     .s_aclk(clk),
				     .s_aresetn(aresetn),
      
				     .s_axis_tvalid(bypassValid),
				     .s_axis_tready(bypassReady),
				     .s_axis_tdata({bypassData, bypassMeta}),
				     .s_axis_tlast(bypassLast),
      
				     .m_axis_tvalid(bypassBufdValid),
				     .m_axis_tready(bypassBufdReady),
				     .m_axis_tdata(bypassBufdData),
				     .m_axis_tlast(bypassBufdLast)		
				     );

   zk_axis_combine_2x128 app_axis_combine (
					   .ACLK(clk),
					   .ARESETN(aresetn),
      
					   .S00_AXIS_ACLK(clk),
					   .S00_AXIS_ARESETN(aresetn),
					   .S00_AXIS_TVALID(bypassBufdValid),
					   .S00_AXIS_TREADY(bypassBufdReady),
					   .S00_AXIS_TDATA(bypassBufdData),
					   .S00_AXIS_TLAST(bypassBufdLast),

					   .S01_AXIS_ACLK(clk),
					   .S01_AXIS_ARESETN(aresetn),	
					   .S01_AXIS_TVALID(toAppValid),
					   .S01_AXIS_TREADY(toAppReady),
					   .S01_AXIS_TDATA({toAppData, toAppMeta}),
					   .S01_AXIS_TLAST(toAppLast),
      
					   .M00_AXIS_ACLK(clk),
					   .M00_AXIS_ARESETN(aresetn),	
					   .M00_AXIS_TVALID(toKvsValid),
					   .M00_AXIS_TREADY(toKvsReady),
					   .M00_AXIS_TDATA(toKvsData),
					   .M00_AXIS_TLAST(toKvsLast),
      
					   .S00_ARB_REQ_SUPPRESS(1'b0),
					   .S01_ARB_REQ_SUPPRESS(1'b0)				
					   );


         
     
   wire kvs_is_stuck;          
   
   
   
  wire          ht_dramRdData_read_r;

  wire [63:0] ht_cmd_dramRdData_data_r;
  wire        ht_cmd_dramRdData_valid_r;

  wire [511:0] ht_dramWrData_data_r;
  wire          ht_dramWrData_valid_r;


  wire [63:0] ht_cmd_dramWrData_data_r;
  wire        ht_cmd_dramWrData_valid_r;


  wire  [63:0] bmap_rdcmd_data_r;
  wire          bmap_rdcmd_valid_r;

  wire  [512-1:0]  bmap_rd_data_r;
  wire          bmap_rd_valid_r;
  wire           bmap_rd_ready_r;

  wire  [512-1:0] bmap_wr_data_r;
  wire          bmap_wr_valid_r;

  wire  [63:0] bmap_wrcmd_data_r;
  wire          bmap_wrcmd_valid_r;
   
   
  assign     ht_dramRdData_read = syncModeForRead==1 ? mem_read_read : ht_dramRdData_read_r;
  assign     ht_cmd_dramRdData_data = syncModeCtrl==1? mem_readcmd_data : ht_cmd_dramRdData_data_r;
  assign     ht_cmd_dramRdData_valid = syncModeCtrl==1 ? mem_readcmd_valid : ht_cmd_dramRdData_valid_r;
  assign     ht_cmd_dramWrData_data = syncModeCtrl==1? mem_writecmd_data : ht_cmd_dramWrData_data_r;
  assign     ht_cmd_dramWrData_valid = syncModeCtrl==1 ? mem_writecmd_valid : ht_cmd_dramWrData_valid_r;
  assign     ht_dramWrData_data = syncModeForWrite==1? mem_write_data : ht_dramWrData_data_r;
  assign     ht_dramWrData_valid = syncModeForWrite==1 ? mem_write_valid : ht_dramWrData_valid_r;


  assign     bmap_rdcmd_valid = syncModeCtrl==2 ? mem_readcmd_valid : bmap_rdcmd_valid_r;
  assign     bmap_rdcmd_data = syncModeCtrl==2 ? mem_readcmd_data : bmap_rdcmd_data_r;
  assign     bmap_wrcmd_valid = syncModeCtrl==2 ? mem_writecmd_valid : bmap_wrcmd_valid_r;
  assign     bmap_wrcmd_data = syncModeCtrl==2 ? mem_writecmd_data : bmap_wrcmd_data_r;
  assign     bmap_wr_valid = syncModeForWrite==2 ? mem_write_valid : bmap_wr_valid_r;
  assign     bmap_wr_data = syncModeForWrite==2 ? mem_write_data : bmap_wr_data_r;
  assign     bmap_rd_ready = syncModeForRead==2 ? mem_read_read : bmap_rd_ready_r;
  assign     bmap_rd_valid_r = syncModeForRead==2 ? 1'b0 : bmap_rd_valid;


  reg reset2;
  always @(posedge clk) begin
    reset2 <= reset;
  end
					   
   nukv_Top_Module_v2
   #(.IS_SIM(IS_SIM)) nukvs_instance (
        .clk(clk),
        .rst(reset2),
        .s_axis_tvalid(toKvsValid),
        .s_axis_tready(toKvsReady),
        .s_axis_tdata({toKvsData[63:0],toKvsData[127:64]}),
        .s_axis_tlast(toKvsLast),
        .m_axis_tvalid(fromKvsValid),
        .m_axis_tready(fromKvsReady),
        .m_axis_tdata(fromKvsData),
        .m_axis_tlast(fromKvsLast),
        
          .ht_rd_data(ht_dramRdData_data),
          .ht_rd_empty(syncModeForRead==0 ? ht_dramRdData_empty : 1),
          .ht_rd_almost_empty(ht_dramRdData_almost_empty),
          .ht_rd_read(ht_dramRdData_read_r),
          
          .ht_rd_cmd_data(ht_cmd_dramRdData_data_r),
          .ht_rd_cmd_valid(ht_cmd_dramRdData_valid_r),
          .ht_rd_cmd_stall(ht_cmd_dramRdData_stall),
        
          .ht_wr_data(ht_dramWrData_data_r),
          .ht_wr_valid(ht_dramWrData_valid_r),
          .ht_wr_stall(ht_dramWrData_stall),
          
          .ht_wr_cmd_data(ht_cmd_dramWrData_data_r),
          .ht_wr_cmd_valid(ht_cmd_dramWrData_valid_r),
          .ht_wr_cmd_stall(ht_cmd_dramWrData_stall),
        
          // Update DRAM Connection  
          .upd_rd_data(upd_dramRdData_data),
          .upd_rd_empty(upd_dramRdData_empty),
          .upd_rd_almost_empty(upd_dramRdData_almost_empty),
          .upd_rd_read(upd_dramRdData_read),
          
          .upd_rd_cmd_data(upd_cmd_dramRdData_data),
          .upd_rd_cmd_valid(upd_cmd_dramRdData_valid),
          .upd_rd_cmd_stall(upd_cmd_dramRdData_stall),
          
          .upd_wr_data(upd_dramWrData_data),
          .upd_wr_valid(upd_dramWrData_valid),
          .upd_wr_stall(upd_dramWrData_stall),
        
          .upd_wr_cmd_data(upd_cmd_dramWrData_data),
          .upd_wr_cmd_valid(upd_cmd_dramWrData_valid),
          .upd_wr_cmd_stall(upd_cmd_dramWrData_stall),

          .p_rdcmd_data(ptr_rdcmd_data),
          .p_rdcmd_valid(ptr_rdcmd_valid),
          .p_rdcmd_ready(ptr_rdcmd_ready),

          .p_rd_data(ptr_rd_data),
          .p_rd_valid(ptr_rd_valid),
          .p_rd_ready(ptr_rd_ready),  

          .p_wr_data(ptr_wr_data),
          .p_wr_valid(ptr_wr_valid),
          .p_wr_ready(ptr_wr_ready),

          .p_wrcmd_data(ptr_wrcmd_data),
          .p_wrcmd_valid(ptr_wrcmd_valid),
          .p_wrcmd_ready(ptr_wrcmd_ready),


          .b_rdcmd_data(bmap_rdcmd_data_r),
          .b_rdcmd_valid(bmap_rdcmd_valid_r),
          .b_rdcmd_ready(bmap_rdcmd_ready),

          .b_rd_data(bmap_rd_data),
          .b_rd_valid(bmap_rd_valid_r),
          .b_rd_ready(bmap_rd_ready_r),  

          .b_wr_data(bmap_wr_data_r),
          .b_wr_valid(bmap_wr_valid_r),
          .b_wr_ready(bmap_wr_ready),

          .b_wrcmd_data(bmap_wrcmd_data_r),
          .b_wrcmd_valid(bmap_wrcmd_valid_r),
          .b_wrcmd_ready(bmap_wrcmd_ready),
          
          .debug(kvs_is_stuck)
   );
   
   wire[63:0] maxis_tx_data;
   wire maxis_tx_last;
   wire maxis_tx_ready;
   wire maxis_tx_valid;
   
   wire[15:0] maxis_meta_data;   
   wire maxis_meta_ready;
   wire maxis_meta_valid;
   
    

   zk_axis_combine_2x128 final_axis_combine (
					     .ACLK(clk),
					     .ARESETN(aresetn),
      
					     .S00_AXIS_ACLK(clk),
					     .S00_AXIS_ARESETN(aresetn),	
					     .S00_AXIS_TVALID(fromKvsValid),
					     .S00_AXIS_TREADY(fromKvsReady),
					     .S00_AXIS_TDATA({fromKvsData[63:0],fromKvsData[127:64]}),
					     .S00_AXIS_TLAST(fromKvsLast),
      
					     .S01_AXIS_ACLK(clk),
					     .S01_AXIS_ARESETN(aresetn),		
					     .S01_AXIS_TVALID(toNetBufdValid),
					     .S01_AXIS_TREADY(toNetBufdReady),
					     .S01_AXIS_TDATA(toNetBufdData),
					     .S01_AXIS_TLAST(toNetBufdLast),
      
					     .M00_AXIS_ACLK(clk),
					     .M00_AXIS_ARESETN(aresetn),	
					     .M00_AXIS_TVALID(finalOutValid),
					     .M00_AXIS_TREADY(finalOutReady),
					     .M00_AXIS_TDATA(finalOutData),
					     .M00_AXIS_TLAST(finalOutLast),
      
					     .S00_ARB_REQ_SUPPRESS(1'b0),
					     .S01_ARB_REQ_SUPPRESS(1'b0),
					     .M00_SPARSE_TKEEP_REMOVED()					
					     );

   assign   maxis_tx_valid = finalOutValid & finalOutReady;
   assign   maxis_tx_data = finalOutData[127:64];
   assign   m_axis_tx_data_TKEEP = 8'b11111111;
   assign   maxis_tx_last = finalOutValid & finalOutLast;
   
   assign   finalOutReady = maxis_meta_ready & maxis_tx_ready;
   
   assign   maxis_meta_data = finalOutData[15:0];
   assign   maxis_meta_valid = finalOutValid & finalOutReady & finalOutLast;

   
   
   nukv_fifogen #(
                 .DATA_SIZE(65),
                 .ADDR_BITS(8)
             ) output_net_data_buffer (
                     .clk(clk),
                     .rst(reset),
                     .s_axis_tvalid(maxis_tx_valid),
                     .s_axis_tready(maxis_tx_ready),
                     .s_axis_tdata({maxis_tx_data, maxis_tx_last}),  
                     .m_axis_tvalid(m_axis_tx_data_TVALID),
                     .m_axis_tready(m_axis_tx_data_TREADY),
                     .m_axis_tdata({m_axis_tx_data_TDATA,m_axis_tx_data_TLAST})
                     ); 
                     
   nukv_fifogen #(
              .DATA_SIZE(16),
              .ADDR_BITS(4)
          ) output_net_meta_buffer (
                  .clk(clk),
                  .rst(reset),
                  .s_axis_tvalid(maxis_meta_valid),
                  .s_axis_tready(maxis_meta_ready),
                  .s_axis_tdata(maxis_meta_data),  
                  .m_axis_tvalid(m_axis_tx_metadata_TVALID),
                  .m_axis_tready(m_axis_tx_metadata_TREADY),
                  .m_axis_tdata(m_axis_tx_metadata_TDATA)
                  ); 

reg is_first_output_cycle;
reg[7:0] outcountdown;
reg error_outputpacket;
   
always @(posedge clk) 
     begin
       if (aresetn == 0) begin
          is_first_output_cycle <= 1;
          outcountdown <= 0;
          error_outputpacket <= 0;
       end
       else begin

          error_outputpacket <= 0;

          if (m_axis_tx_data_TVALID==1 && m_axis_tx_data_TREADY==1 && is_first_output_cycle==1) begin
              if (outcountdown!=0) begin
                error_outputpacket <= 1;
              end

             outcountdown <= m_axis_tx_data_TDATA[32 +: 8]+1;
             is_first_output_cycle <= 0;         

          end else begin

            if (m_axis_tx_data_TVALID==1 && m_axis_tx_data_TREADY==1) begin
               outcountdown <= outcountdown-1;     

               if (outcountdown==0 && m_axis_tx_data_TDATA[15:0]==16'hFFFF) begin
                outcountdown <= m_axis_tx_data_TDATA[32 +: 8]+1;
               end 
               else if (outcountdown==0) begin
                error_outputpacket <= 1;
               end
            end

            if (m_axis_tx_data_TVALID==1 && m_axis_tx_data_TREADY==1 && m_axis_tx_data_TLAST==1) begin
               is_first_output_cycle <= 1;
            end

          end
       end
     end



   reg[31:0] clock_reg;

   reg [31:0] saxis_count;
   reg [31:0] recv_count;
   reg [31:0] split_count;
   reg [31:0] cmd_count;

   reg [7:0]  diff_saxis_split;
   reg [7:0]  diff_saxis_cmd;
   
   reg [31:0] position_consumed;   


   reg [31:0] outp_count;   
   reg [31:0] sent_count;
   reg [7:0] sent_diff;
   reg [15:0] sent_waiting;
/* */
always @(posedge clk) 
begin
	if (aresetn == 0) begin
     saxis_count <= 0;
     recv_count <= 0;      
     
     outp_count <= 0;
     sent_count <= 0;
     sent_diff <= 0;
     sent_waiting <= 0;
	end
	else 
  begin
    if (s_axis_rx_data_TVALID==1 && s_axis_rx_data_TREADY==1 && s_axis_rx_data_TDATA[15:0]==16'hFFFF) begin
      saxis_count <= saxis_count+1;
    end

    if (sesspackValid==1 && sesspackReady==1 && sesspackData[15:0]==16'hFFFF) begin
      recv_count <= recv_count+1;
    end    

    if (splitInValid==1 && splitInReady==1 && splitInData[15:0]==16'hFFFF) begin
      split_count <= split_count+1;
    end        

    if (cmdInValid==1 && cmdInReady==1) begin
      cmd_count <= cmd_count+1;
    end            
	

    diff_saxis_split <= saxis_count - split_count;
    diff_saxis_cmd <= saxis_count - cmd_count;
    
  


    sent_diff <= outp_count - sent_count;

    if (sent_diff>0) begin
      sent_waiting <= sent_waiting+1;
    end
    
    if (maxis_tx_valid == 1 && maxis_tx_last==1 && maxis_tx_ready==1 && maxis_meta_valid==1 && maxis_meta_ready==1) begin
      outp_count <= outp_count+1;
    end

    if (s_axis_tx_status_TVALID==1 && s_axis_tx_status_TREADY==1 && s_axis_tx_status_TDATA[31:28]==0) begin
      sent_count <= sent_count+1;
      sent_waiting <= 0;
    end


  end
end
  /*   */
    reg[15:0] diff_front;
    reg[15:0] diff_sm;
    reg[15:0] diff_kvs;
    reg[15:0] diff_smkvs;
    
    reg[63:0] delayed_input_data;
    reg[63:0] delayed_memread_data;
    reg[63:0] delayed_misc;
    reg[63:0]  delayed_first;
    
    reg[161:0] toedebug_reg;


  /*  
     always @(posedge clk) 
     begin
      delayed_first[0] <= s_axis_notifications_TREADY; 
      delayed_first[1] <= s_axis_notifications_TVALID;
      delayed_first[2] <= hadretransmit[0];
      delayed_first[3] <= errorValid | error_outputpacket | error_inputpacket | ((s_axis_tx_status_TDATA[31:28]>0) ? 1'b1 : 1'b0);
      delayed_first[4] <= s_axis_tx_status_TVALID;
      delayed_first[5] <= m_axis_tx_data_TLAST;
      delayed_first[6] <= m_axis_tx_data_TREADY;
      delayed_first[7] <= m_axis_tx_data_TVALID;
      delayed_first[8] <= (sent_diff>4) ? 1'b1 : 1'b0;
      delayed_first[9] <= s_axis_rx_data_TVALID;
      delayed_first[10] <= s_axis_rx_data_TREADY;
      delayed_first[11] <= s_axis_rx_data_TLAST;
      delayed_first[12] <= sesspackReady;
      delayed_first[13] <= sesspackValid;
      
      delayed_first[14] <= splitInReady;
      delayed_first[15] <= splitInValid;

      delayed_misc[0] <= syncPrepare;
      delayed_misc[1] <= allSynced;
      delayed_misc[3:2] <= syncModeCtrl;
      delayed_misc[5:4] <= syncModeForRead;
      delayed_misc[7:6] <= syncModeForWrite;
      delayed_misc[8+:16] <= toBeSynced[15:0];
      delayed_misc[24] <= mem_read_read;
      delayed_misc[25] <= mem_read_multiplexedvalid;

      delayed_misc[26] <= bmap_wrcmd_valid;
      delayed_misc[27] <= bmap_wrcmd_ready;
      delayed_misc[28] <= bmap_wr_valid;
      delayed_misc[29] <= bmap_wr_ready;

      delayed_misc[30] <= cmdInBufValid;
      delayed_misc[31] <= cmdInBufReady;

      delayed_misc[32] <= payloadValid_b;
      delayed_misc[33] <= payloadReady_b;
      
      delayed_misc[63:34] <= 0;

      debug_r[15:0] <= delayed_first;
      debug_r[16 +: 64] <= delayed_misc;

      delayed_memread_data <= bmap_wrcmd_data; //m_axis_tx_data_TDATA;
      debug_r[64+64+16 +: 64] <= delayed_memread_data;
      
         //                                    49:34               33                           32
      //delayed_misc <= {s_axis_tx_status_TDATA[63:48],  m_axis_tx_metadata_TVALID, m_axis_tx_metadata_TREADY,
        //31                   30                                                                                31:24               23                 22                21              20           19          18             17          16    
      //error_inputpacket,error_outputpacket, fromKvsValid, fromKvsReady, toNetBufdValid, toNetBufdReady ,toNetValid, toNetReady, cmdOutBufdValid, cmdOutBufdReady, cmdInBufValid, cmdInBufReady, payloadValid, payloadReady, payloadValid_b, payloadReady_b};
      //debug_r[16 +: 50] <= delayed_misc;
      /*
      delayed_input_data <= s_axis_tx_status_TDATA; //s_axis_rx_data_TDATA;
      debug_r[16+64 +:64] <= delayed_input_data;        
      
      delayed_memread_data <= m_axis_tx_data_TDATA;
      debug_r[64+64+16 +: 64] <= delayed_memread_data;
      */  
      /* 
      
      toedebug_reg <= toedebug;
      debug_r[80 +: 138] <= toedebug_reg[137:0];

      delayed_memread_data[15:0] <= s_axis_tx_status_TDATA[27:12];
      debug_r[218 +: 16] <= delayed_memread_data[15:0];


      delayed_input_data[35:0] <= hadretransmit[36:1];
      debug_r[66 +: 14] <= delayed_input_data[13:0];
      debug_r[234 +: 22] <= delayed_input_data[35:14];
      
      
      debug_r2 <= debug_r;
      data <= debug_r2;
   end

   

   
  // assign vio_cmd[63:2] = 64'h0000000000000020;
  //  assign vio_cmd[1] = (dbg_capture_count<vio_cmd[2+15:2]) ? 0 : 1;
  //  assign vio_cmd[0] = 1;  

   icon icon_inst(
		  .CONTROL0(control0),
		  .CONTROL1(control1)
		  );
   
   vio vio_inst(
		.CONTROL(control1),
		.CLK(clk),
		.SYNC_OUT(vio_cmd)
		//     .SYNC_OUT()
		);
   
   ila_256 ila_256_inst(
			.CONTROL(control0),
			.CLK(clk),
			.TRIG0(data)
			);

   /* */

endmodule
