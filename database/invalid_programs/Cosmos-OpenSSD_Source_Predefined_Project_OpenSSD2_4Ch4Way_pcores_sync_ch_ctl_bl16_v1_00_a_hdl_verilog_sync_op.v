//////////////////////////////////////////////////////////////////////////////////
// sync_op.v for Cosmos OpenSSD
// Copyright (c) 2014 Hanyang University ENC Lab.
// Contributed by Taeyeong Huh <tyhuh@enc.hanyang.ac.kr>
//                Kibin Park <kbpark@enc.hanyang.ac.kr>
//                Yong Ho Song <yhsong@enc.hanyang.ac.kr>
//
// This file is part of Cosmos OpenSSD.
//
// Cosmos OpenSSD is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 3, or (at your option)
// any later version.
//
// Cosmos OpenSSD is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
// See the GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Cosmos OpenSSD; see the file COPYING.
// If not, see <http://www.gnu.org/licenses/>.
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Company: ENC Lab. <http://enc.hanyang.ac.kr>
// Engineer: Taeyeong Huh <tyhuh@enc.hanyang.ac.kr>, Kibin Park <kbpark@enc.hanyang.ac.kr>
// 
// Project Name: Cosmos OpenSSD
// Design Name: nand controller
// Module Name: sync_op
// File Name: sync_op.v
//
// Version: v1.1.0
//
// Description:
//   - generate command(read, program, erase) and address control signal in synchronous mode
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
// Revision History:
//
// * v1.2.0
//   - 128GB NAND option board support
//
// * v1.1.0
//   - remove r/b signal check module
//   - status check module replace r/b signal check module
//
// * v1.0.0
//   - first draft
//////////////////////////////////////////////////////////////////////////////////
`include "parameter.vh" 

module sync_op(
    //system
    input wire                               i_nc_clk         ,
    input wire                               i_clk_o          ,
    input wire                               i_nc_rstn        ,
    input wire                               i_enable         ,

    //top => nfc
    input      wire     [`CMD_WD-1:0]        i_command        ,
    input      wire     [`NADDR_WD-1:0]      i_nand_addr      ,
    
    //flag
    input      wire                          i_read_end          ,
    input      wire                          i_prog_end          ,
    input      wire                          i_status_read_end   ,
    output     reg                           o_read_begin        ,
    output     reg                           o_prog_begin        ,
    output     reg                           o_status_read_begin ,
    
    output     reg                           o_prog_start ,
    output     reg                           o_prog_end   ,
    output     reg                           o_read_start ,
    output     reg                           o_read_end   ,
    output     reg                           o_erase_start,
    output     reg                           o_erase_end  ,
    
    //nand interface
    output     reg                           o_op_dq_t           ,
    output     reg                           o_op_dqs_t          ,
    output     wire      [`CIO_WD-1:0]       o_op_dq        ,
    output     reg                           o_op_ce_n      ,
    output     reg                           o_op_cle       ,
    output     reg                           o_op_ale       ,
    output     reg                           o_op_wr_n      ,
    input      wire                          i_sta_rdy      ,
    input      wire                          i_ch_gnt       ,
    output     reg                           o_ch_req       ,
    output     wire                          o_maddr_ack    ,
    output     reg                           o_ready
    );
    //operation part
    reg       [3:0]            r_op_current_state;
    reg       [3:0]            r_op_next_state   ;

    //count
    reg                         count_comm_i     ;
    reg       [2:0]             count_ADD_i      ;
    reg                         count_comm       ;
    reg       [2:0]             count_ADD        ;
    reg       [1:0]             count_wait_i     ;
    reg       [1:0]             count_wait       ;
    reg       [4:0]             r_return_grt_cnt ;
    reg       [2:0]             r_cnt_wait       ;
    reg       [2:0]             r_cnt_wait_i     ;
    reg                         r_maddr_ack      ;
    reg                         r_maddr_ack_1    ;
    reg                         r_cmd_cycle_i    ;
    reg                         r_cmd_cycle      ;
    reg                         r_addr_wait_cnt_i;
    reg                         r_addr_wait_cnt  ;
    reg                         r_addr_cycle_i   ;
    reg                         r_addr_cycle     ;
    
    
    wire                         t_enable            ;
    wire       [`CMD_WD-1:0]     t_CMD               ;
    wire       [`NADDR_WD-1:0]   t_ADDR              ;
    reg        [`IO_WD-1 :0]     r_op_dq             ;
    
    genvar i ;
    generate
      for (i=0 ; i<`CLST ; i=i+1) 
      begin : nand_io
            assign o_op_dq[(`IO_WD*(i+1))-1 : `IO_WD*i] = r_op_dq ;
      end
    endgenerate
    
    parameter   ST_op_IDLE          =  4'b0000;
    parameter   ST_op_wait_grt      =  4'b0001;
    parameter   ST_op_READY         =  4'b0011;
    parameter   ST_op_CMD_wait      =  4'b0010;
    parameter   ST_op_CMD           =  4'b0110;
    parameter   ST_op_ADDR_wait     =  4'b0111;
    parameter   ST_op_ADDR          =  4'b0101;
    parameter   ST_op_datain_wait   =  4'b0100;
    parameter   ST_op_datain        =  4'b1100;
    parameter   ST_op_prog_wait     =  4'b1101;
    parameter   ST_op_status_wait   =  4'b1111;
    parameter   ST_op_status        =  4'b1110;
    parameter   ST_op_return_grt    =  4'b1010;
    parameter   ST_op_end           =  4'b1011;
    parameter   ST_op_dataout       =  4'b1001;
    
    //Operation constants
    parameter   READ                   = 8'h01    ; //1
    parameter   PROGRAM                = 8'h02    ; //2
    parameter   ERASE                  = 8'h03    ; //3
    
    parameter        RETURN_GNT_CNT =    5'b1_0100 ;
    
    parameter hi = 1'b1 ;
    parameter lo = 1'b0 ;
    
    assign  t_enable   = i_enable        ;
    assign  t_ADDR     = i_nand_addr     ;
    assign  t_CMD      = i_command       ;
    
    //performance
    always @ (posedge i_nc_clk)
    begin
         case(r_op_current_state)
             ST_op_IDLE:
             begin
                  o_prog_start <= 'b0;
                  o_read_start <= 'b0;
                  o_erase_start<= 'b0;
                  o_prog_end   <= 'b0;
                  o_read_end   <= 'b0;
                  o_erase_end  <= 'b0;
             end
             
             ST_op_CMD_wait:
             begin
                  case(t_CMD)
                      PROGRAM:
                      begin
                           o_prog_start <= 'b1;
                           o_read_start <= 'b0;
                           o_erase_start<= 'b0;
                           o_prog_end   <= 'b0;
                           o_read_end   <= 'b0;
                           o_erase_end  <= 'b0;
                      end
                      READ:
                      begin
                           o_prog_start <= 'b0;
                           o_read_start <= 'b1;
                           o_erase_start<= 'b0;
                           o_prog_end   <= 'b0;
                           o_read_end   <= 'b0;
                           o_erase_end  <= 'b0;
                      end
                      ERASE:
                      begin
                           o_prog_start <= 'b0;
                           o_read_start <= 'b0;
                           o_erase_start<= 'b1;
                           o_prog_end   <= 'b0;
                           o_read_end   <= 'b0;
                           o_erase_end  <= 'b0;
                      end
                      default:
                      begin
                           o_prog_start <= 'b0;
                           o_read_start <= 'b0;
                           o_erase_start<= 'b0;
                           o_prog_end   <= 'b0;
                           o_read_end   <= 'b0;
                           o_erase_end  <= 'b0;
                      end
                  endcase
             end
             
             ST_op_end:
             begin
                  case(t_CMD)
                      PROGRAM:
                      begin
                           o_prog_start <= 'b0;
                           o_read_start <= 'b0;
                           o_erase_start<= 'b0;
                           o_prog_end   <= 'b1;
                           o_read_end   <= 'b0;
                           o_erase_end  <= 'b0;
                      end
                      READ:
                      begin
                           o_prog_start <= 'b0;
                           o_read_start <= 'b0;
                           o_erase_start<= 'b0;
                           o_prog_end   <= 'b0;
                           o_read_end   <= 'b1;
                           o_erase_end  <= 'b0;
                      end
                      ERASE:
                      begin
                           o_prog_start <= 'b0;
                           o_read_start <= 'b0;
                           o_erase_start<= 'b0;
                           o_prog_end   <= 'b0;
                           o_read_end   <= 'b0;
                           o_erase_end  <= 'b1;
                      end
                      default:
                      begin
                           o_prog_start <= 'b0;
                           o_read_start <= 'b0;
                           o_erase_start<= 'b0;
                           o_prog_end   <= 'b0;
                           o_read_end   <= 'b0;
                           o_erase_end  <= 'b0;
                      end
                  endcase
             end
             
             default:
             begin
                  o_prog_start <= o_prog_start ;
                  o_read_start <= o_read_start ;
                  o_erase_start<= o_erase_start;
                  o_prog_end   <= o_prog_end   ;
                  o_read_end   <= o_read_end   ;
                  o_erase_end  <= o_erase_end  ;
             end
         endcase
    end
    
    assign o_maddr_ack = r_maddr_ack || r_maddr_ack_1;
    
    always @ (posedge i_nc_clk)
    begin
         r_maddr_ack_1 <= r_maddr_ack;
    end
    
    //operation state machine
    always @ (posedge i_nc_clk or negedge i_nc_rstn)
    begin
         if(!i_nc_rstn)
         begin
              r_op_current_state <= ST_op_IDLE ;
         end
         
         else
         begin
              r_op_current_state <= r_op_next_state ;
         end
    end
    
    always @ (*)
    begin
         case(r_op_current_state)
         
             ST_op_IDLE :
             begin
                  if(t_enable)
                       begin
                            r_op_next_state      <= ST_op_wait_grt ;
                       end
                    
                  else
                       begin
                            r_op_next_state      <= ST_op_IDLE  ;
                       end
             end
             
             ST_op_wait_grt :
             begin
                  if(i_ch_gnt)
                  begin
                       r_op_next_state <= ST_op_READY ;
                  end
                  
                  else
                  begin
                       r_op_next_state <= ST_op_wait_grt ;
                  end
             end

             ST_op_READY :
             begin
                  r_op_next_state      <= (i_clk_o) ? ST_op_CMD_wait : ST_op_READY ;
             end

             ST_op_CMD_wait :
             begin
                  r_op_next_state      <= (count_wait_i) ? ST_op_CMD_wait : ST_op_CMD;
             end
             
             ST_op_CMD :
             begin
                  r_op_next_state      <= (!r_cmd_cycle_i) ? ST_op_CMD : (!count_comm_i) ? ST_op_ADDR_wait : ST_op_status_wait ;
             end

             ST_op_ADDR_wait :
             begin
                  r_op_next_state      <= (r_addr_wait_cnt_i) ? ST_op_ADDR_wait: ST_op_ADDR ;
             end

             ST_op_ADDR :
             begin
                  case(t_CMD)
                        
                        READ :
                        begin
                             r_op_next_state      <= (r_addr_cycle_i) ? ST_op_ADDR : (count_ADD_i == 4) ? ST_op_CMD_wait: ST_op_ADDR_wait ;
                        end
                        
                        PROGRAM :
                        begin
                             r_op_next_state      <= (r_addr_cycle_i) ? ST_op_ADDR : (count_ADD_i == 4) ? ST_op_datain_wait : ST_op_ADDR_wait ;
                        end
                        
                        ERASE :
                        begin
                             r_op_next_state      <= (r_addr_cycle_i) ? ST_op_ADDR : (count_ADD_i == 2) ? ST_op_CMD_wait : ST_op_ADDR_wait ;  
                        end

                        default :
                        begin
                             r_op_next_state      <= ST_op_IDLE  ; 

                        end
                  endcase
             end
            
             ST_op_dataout :
             begin
                  r_op_next_state      <= (i_read_end) ? ST_op_end : ST_op_dataout ;
             end
             
             ST_op_datain_wait :
             begin
                  r_op_next_state      <= ST_op_datain ;
             end
             
             ST_op_datain :
             begin
                  r_op_next_state      <= (i_prog_end) ? ST_op_prog_wait : ST_op_datain ;
             end
             //status 
             ST_op_status_wait :
             begin
                  r_op_next_state      <= (r_cnt_wait_i) ? ST_op_status_wait : ST_op_status ;
             end

             ST_op_status :
             begin
                  if(i_status_read_end)
                  begin
                       if (i_sta_rdy)   //ready
                       begin
                            case(t_CMD)
                                READ :
                                begin
                                     r_op_next_state <= ST_op_dataout;
                                end
                                
                                default : //program, erase
                                begin
                                     r_op_next_state <= ST_op_end;
                                end
                            endcase
                       end
                       
                       else    //busy
                       begin
                            r_op_next_state      <= ST_op_return_grt ;
                       end
                  end
                  
                  else
                  begin
                       r_op_next_state      <= ST_op_status ;
                  end
             end
             
             ST_op_return_grt :
             begin
                  r_op_next_state      <= (r_return_grt_cnt)? ST_op_return_grt : ST_op_status ;
             end
             
             ST_op_prog_wait :
             begin
                  r_op_next_state      <= ST_op_READY ;
             end
             
             ST_op_end :
             begin
                  r_op_next_state      <= ST_op_IDLE;
             end

             default :
             begin
                  r_op_next_state      <= ST_op_IDLE  ;
             end
         endcase
    end
    
    always @ (*)
    begin
         case(r_op_current_state)
         
             ST_op_IDLE :
             begin
                  if(t_enable)
                       begin
                            o_read_begin         <= 0   ;
                            o_prog_begin         <= 0   ;
                            o_status_read_begin  <= 0   ;
                            o_ch_req             <= 'b1 ;
                       end
                    
                  else
                       begin
                            o_read_begin         <= 0   ;
                            o_prog_begin         <= 0   ;
                            o_status_read_begin  <= 0   ;
                            o_ch_req             <= 'b0 ;
                       end
                r_maddr_ack          <= 'b0 ;
             end
             
             ST_op_wait_grt :
             begin
                  o_read_begin         <= 0   ;
                  o_prog_begin         <= 0   ;
                  o_status_read_begin  <= 0   ;
                  o_ch_req             <= 'b1 ;
                  r_maddr_ack          <= 'b0 ;
             end

             ST_op_READY :
             begin
                  o_read_begin         <= 0   ;
                  o_prog_begin         <= 0   ;
                  o_status_read_begin  <= 0   ;
                  o_ch_req             <= 'b1 ;
                  r_maddr_ack          <= 'b0 ;
             end

             ST_op_CMD_wait :
             begin
                  o_read_begin         <= 0   ;
                  o_prog_begin         <= 0   ;
                  o_status_read_begin  <= 0   ;
                  o_ch_req             <= 'b1 ;
                  r_maddr_ack          <= 'b0 ;
             end
             
             ST_op_CMD :
             begin
                  o_read_begin         <= 0   ;
                  o_prog_begin         <= 0   ;
                  o_status_read_begin  <= 0   ;
                  o_ch_req             <= 'b1 ;
                  r_maddr_ack          <= 'b0 ;
             end

             ST_op_ADDR_wait :
             begin
                  o_read_begin         <= 0   ;
                  o_prog_begin         <= 0   ;
                  o_status_read_begin  <= 0   ;
                  o_ch_req             <= 'b1 ;
                  r_maddr_ack          <= 'b0 ;
             end

             ST_op_ADDR :
             begin
                  o_read_begin         <= 0   ;
                  o_prog_begin         <= 0   ;
                  o_status_read_begin  <= 0   ;
                  o_ch_req             <= 'b1 ;
                  r_maddr_ack          <= 'b0 ;
             end
            
             ST_op_dataout :
             begin
                  o_read_begin         <= 1   ;
                  o_prog_begin         <= 0   ;
                  o_status_read_begin  <= 0   ;
                  o_ch_req             <= 'b1 ;
                  r_maddr_ack          <= 'b0 ;
             end
             
             ST_op_datain_wait :
             begin
                  o_read_begin         <= 0   ;
                  o_prog_begin         <= 0   ;
                  o_status_read_begin  <= 0   ;
                  o_ch_req             <= 'b1 ;
                  r_maddr_ack          <= 'b1 ;
             end
             
             ST_op_datain :
             begin
                  o_read_begin         <= 0   ;
                  o_prog_begin         <= 1   ;
                  o_status_read_begin  <= 0   ;
                  o_ch_req             <= 'b1 ;  
                  r_maddr_ack          <= 'b0 ;
             end
             //status 
             ST_op_status_wait :
             begin
                  o_read_begin         <= 0   ;
                  o_prog_begin         <= 0   ;
                  o_status_read_begin  <= 0   ;
                  o_ch_req             <= 'b1 ;
                  r_maddr_ack          <= 'b0 ;
             end

             ST_op_status :
             begin
                  if(i_status_read_end)
                  begin
                       if (i_sta_rdy)   //ready
                       begin
                            case(t_CMD)
                                READ :
                                begin
                                     o_ch_req        <= 'b1;
                                     r_maddr_ack     <= 'b1;
                                end
                                
                                default : //program, erase
                                begin
                                     o_ch_req        <= 'b0;
                                     r_maddr_ack     <= 'b0;
                                end
                            endcase
                   
                            o_read_begin         <= 0   ;
                            o_prog_begin         <= 0   ;
                            o_status_read_begin  <= 0   ;
                       end
                       
                       else    //busy
                       begin
                            o_read_begin         <= 0   ;
                            o_prog_begin         <= 0   ;
                            o_status_read_begin  <= 0   ;
                            o_ch_req             <= 'b0 ;
                            r_maddr_ack          <= 'b0 ;
                       end
                  end
                  
                  else
                  begin
                       o_read_begin         <= 0   ;
                       o_prog_begin         <= 0   ;
                       o_status_read_begin  <= (i_ch_gnt) ? 'b1 : 'b0  ;
                       o_ch_req             <= 'b1 ;
                       r_maddr_ack          <= 'b0 ;
                  end
             end
             
             ST_op_return_grt : //return grant
             begin
                  o_read_begin         <= 0   ;
                  o_prog_begin         <= 0   ;
                  o_status_read_begin  <= 0   ;
                  o_ch_req             <= 'b0 ;
                  r_maddr_ack          <= 'b0 ;
             end
             
             ST_op_prog_wait :
             begin
                  o_read_begin         <= 0   ;
                  o_prog_begin         <= 0   ;
                  o_status_read_begin  <= 0   ;
                  o_ch_req             <= 'b1 ;
                  r_maddr_ack          <= 'b0 ;
             end
             
             ST_op_end :
             begin
                  o_read_begin         <= 0   ;
                  o_prog_begin         <= 0   ;
                  o_status_read_begin  <= 0   ;
                  o_ch_req             <= 'b0 ;
                  r_maddr_ack          <= 'b0 ;
             end

             default :
             begin
                  o_read_begin         <= 0   ;
                  o_prog_begin         <= 0   ;
                  o_status_read_begin  <= 0   ;
                  o_ch_req             <= 'b0 ;
                  r_maddr_ack          <= 'b0 ;
             end
         endcase
    end
        
    //counter
    always @ (posedge i_nc_clk or negedge i_nc_rstn)
    begin
         if(!i_nc_rstn)
         begin
              count_comm_i        <= 'b0;
              r_cmd_cycle_i       <= 'b0;
              r_addr_wait_cnt_i   <= 'b1;
              r_addr_cycle_i      <= 'b1;
              count_ADD_i         <= 'b0;
              count_wait_i        <= 'h3;
              r_cnt_wait_i        <= 'h4;
         end
         
         else
         begin
              count_comm_i        <= count_comm  ;
              r_cmd_cycle_i       <= r_cmd_cycle ;
              r_addr_wait_cnt_i   <= r_addr_wait_cnt;
              r_addr_cycle_i      <= r_addr_cycle;
              count_ADD_i         <= count_ADD   ;
              count_wait_i        <= count_wait  ;
              r_cnt_wait_i        <= r_cnt_wait  ;
         end
    end
    
    always @ (*)
    begin
         case(r_op_current_state)
              
             ST_op_IDLE:
             begin
                  count_comm        <= 'b0;
                  r_cmd_cycle       <= 'b0;
                  r_addr_wait_cnt   <= 'b1;
                  r_addr_cycle      <= 'b1;
                  count_ADD         <= 'b0;
                  count_wait        <= 'h3;
                  r_cnt_wait        <= 'h4;
             end
             
             ST_op_CMD_wait  :
             begin
                  count_comm        <= count_comm_i     ;
                  r_cmd_cycle       <= 'b0;
                  r_addr_wait_cnt   <= 'b1;
                  r_addr_cycle      <= 'b1;
                  count_ADD         <= count_ADD_i      ;
                  count_wait        <= count_wait_i-'b1 ; 
                  r_cnt_wait        <= 'h4;
             end
              
             ST_op_CMD :
             begin
                  count_comm        <= (r_cmd_cycle_i) ? count_comm_i+'b1 : count_comm_i;
                  r_cmd_cycle       <= r_cmd_cycle_i+'b1;
                  r_addr_wait_cnt   <= 'b1;
                  r_addr_cycle      <= 'b1;
                  count_ADD         <= count_ADD_i ;
                  count_wait        <= 'h3;
                  r_cnt_wait        <= 'h4;
             end
             
             ST_op_ADDR_wait:
             begin
                  count_comm        <= count_comm_i;
                  r_cmd_cycle       <= 'b0;
                  r_addr_wait_cnt   <= r_addr_wait_cnt_i-'b1;
                  r_addr_cycle      <= 'b1;
                  count_ADD         <= count_ADD_i  ;
                  count_wait        <= 'h3;
                  r_cnt_wait        <= 'h4;
             end
             
             ST_op_ADDR :
             begin
                  count_comm        <= count_comm_i;
                  r_cmd_cycle       <= 'b0;
                  r_addr_wait_cnt   <= 'b1;
                  r_addr_cycle      <= r_addr_cycle_i-'b1;
                  count_ADD         <= (r_addr_cycle_i) ? count_ADD_i : count_ADD_i + 1;
                  count_wait        <= 'h3;
                  r_cnt_wait        <= 'h4;
             end
             
             ST_op_datain_wait :
             begin
                  count_comm        <= count_comm_i;
                  r_cmd_cycle       <= 'b0;
                  r_addr_wait_cnt   <= 'b1;
                  r_addr_cycle      <= 'b1;
                  count_ADD         <= count_ADD_i;
                  count_wait        <= 'h3;
                  r_cnt_wait        <= 'h4;
             end
             
             ST_op_status_wait :
             begin
                  count_comm        <= count_comm_i;
                  r_cmd_cycle       <= 'b0;
                  r_addr_wait_cnt   <= 'b1;
                  r_addr_cycle      <= 'b1;
                  count_ADD         <= count_ADD_i;
                  count_wait        <= 'h3;
                  r_cnt_wait        <= r_cnt_wait_i-'b1;
             end
             
             default :
             begin
                  count_comm        <= count_comm_i;
                  r_cmd_cycle       <= 'b0;
                  r_addr_wait_cnt   <= 'b1;
                  r_addr_cycle      <= 'b1;
                  count_ADD         <= count_ADD_i;
                  count_wait        <= 'h3;
                  r_cnt_wait        <= 'h4;
             end
         endcase
    end
    
    always @ (posedge i_nc_clk)
    begin
         case(r_op_current_state)
             
             ST_op_return_grt : r_return_grt_cnt <= r_return_grt_cnt - 'b1;
             default          : r_return_grt_cnt <= RETURN_GNT_CNT;
         endcase
    end
   
    always @ (posedge i_nc_clk)
    begin
         case(r_op_current_state)
             
             ST_op_IDLE, ST_op_wait_grt, ST_op_end:
             begin
                  o_op_ce_n   <= hi     ;
                  o_op_cle    <= lo     ;
                  o_op_ale    <= lo     ;
                  o_op_wr_n   <= hi     ;
                  r_op_dq     <= 8'h0   ;
                  o_op_dq_t   <= hi     ;
                  o_op_dqs_t  <= hi     ;
             end

             ST_op_CMD :
             begin
                  o_op_ce_n   <= lo     ;
                  o_op_cle    <= hi     ;
                  o_op_ale    <= lo     ;
                  o_op_wr_n   <= hi     ;
                  o_op_dq_t   <= lo     ;
                  o_op_dqs_t  <= hi     ;
                  case(t_CMD)
                      
                      READ :
                      begin
                           r_op_dq <= (!count_comm_i) ? 8'h00 : 8'h30 ;
                      end
                      
                      PROGRAM :
                      begin
                           r_op_dq <= (!count_comm_i) ? 8'h80 : 8'h10 ;
                      end
                      
                      ERASE :
                      begin
                           r_op_dq <= (!count_comm_i) ? 8'h60 : 8'hd0 ;
                      end

                      default :
                      begin
                           r_op_dq <= 8'h00 ;
                      end
                  endcase
             end
             
             ST_op_ADDR :
             begin
                  o_op_ce_n   <= lo     ;
                  o_op_cle    <= lo     ;
                  o_op_ale    <= hi     ;
                  o_op_wr_n   <= hi     ;
                  o_op_dq_t   <= lo     ;
                  o_op_dqs_t  <= hi     ;
                  
                  case(t_CMD)
                  
                      READ, PROGRAM :
                      begin
                           case(count_ADD_i)
                               0:       r_op_dq <= t_ADDR[7:0]              ;
                               1:       r_op_dq <= {2'h0, t_ADDR[13:8]}     ;
                               2:       r_op_dq <= t_ADDR[21:14]            ;
                               3:       r_op_dq <= t_ADDR[29:22]            ;
                               4:       r_op_dq <= {4'b0000,t_ADDR[33:30]} ;
                               default: r_op_dq <= 0                        ;
                           endcase
                      end
                      
                      ERASE :
                      begin
                           case(count_ADD_i)
                               0:       r_op_dq <=t_ADDR[21:14]            ;
                               1:       r_op_dq <=t_ADDR[29:22]            ;
                               2:       r_op_dq <={4'b0000,t_ADDR[33:30]} ;
                               default: r_op_dq <=0                        ;
                           endcase
                      end
                     
                      default :
                      begin
                           r_op_dq <= 0 ;
                      end
                  endcase
             end
             
             ST_op_datain :
             begin
                  o_op_ce_n   <= lo     ;
                  o_op_cle    <= lo     ;
                  o_op_ale    <= lo     ;
                  o_op_wr_n   <= hi     ;
                  r_op_dq     <= 8'h0   ;
                  o_op_dq_t   <= hi     ;
                  o_op_dqs_t  <= hi     ;
                  
             end
             
             ST_op_status, ST_op_return_grt, ST_op_dataout :
             begin
                  o_op_ce_n   <= hi     ;
                  o_op_cle    <= lo     ;
                  o_op_ale    <= lo     ;
                  o_op_wr_n   <= hi     ;
                  r_op_dq     <= 8'h0   ;
                  o_op_dq_t   <= hi ;
                  o_op_dqs_t  <= hi ;
             end
     
             default :
             begin
                  o_op_ce_n   <= lo     ;
                  o_op_cle    <= lo     ;
                  o_op_ale    <= lo     ;
                  o_op_wr_n   <= hi     ;
                  r_op_dq     <= 8'h0   ;
                  o_op_dq_t   <= hi ;
                  o_op_dqs_t  <= hi ;
             end
         endcase
    end
    
    always @ (posedge i_nc_clk)
    begin
         case(r_op_current_state)
             
             ST_op_IDLE: o_ready <= 'b1;
             default   : o_ready <= 'b0;
         endcase
    end
endmodule
