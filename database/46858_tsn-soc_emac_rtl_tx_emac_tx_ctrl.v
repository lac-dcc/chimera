// This program was cloned from: https://github.com/lvzhengde/tsn-soc
// License: BSD 3-Clause "New" or "Revised" License

/*+
 * Copyright (c) 2022-2023 Zhengde
 *
 * Copyright (c) 2001 Jon Gao (gaojon@yahoo.com) 
 *
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 
 * 1 Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * 
 * 2 Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 * 
 * 3 Neither the name of the copyright holder nor the names of its
 *   contributors may be used to endorse or promote products derived from
 *   this software without specific prior written permission.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-*/

/*+
 * EMAC transmit control 
-*/

module emac_tx_ctrl (  
    input               rst_n                 ,
    input               clk                   ,
    input               xmt_en_i              , //transmit enable
    //CRC generator Interface 
    output reg          crc_init_o            ,
    output [7:0]        frame_data_o          ,
    output reg          data_en_o             ,
    output reg          crc_rd_o              ,
    input               crc_end_i             ,
    input  [7:0]        crc_out_i             ,
    //random generator interface
    output reg          random_init_o         ,
    output reg [3:0]    retry_cnt_o           ,
    input               random_time_meet_i    ,//levle hight indicate random time passed away
    //flow control
    input               pause_apply_i         ,
    output reg          pause_quanta_sub_o    ,
    input               TxPauseRq_gen_i         ,
    output reg          TxPauseRq_gen_complete_o,
    //MAC TX FIFO interface
    input  [7:0]        fifo_data_i           ,
    output reg          fifo_rd_o             ,
    input               fifo_eop_i            ,
    output reg          fifo_rd_finish_o      ,
    output reg          fifo_rd_retry_o       ,
    input               fifo_ra_i             ,
    input               fifo_data_err_empty_i ,
    input               fifo_data_err_full_i  ,
    //GMII/MII
    output reg[7:0]     TxD_o                 ,
    output reg          TxEn_o                ,   
    output reg          TxErr_o               ,
    input               CRS_i                 ,  //carrier sense
    input               COL_i                 ,  //collision
    //RMON
    output reg [2:0]    tx_pkt_type_rmon_o    ,
    output reg [15:0]   tx_pkt_length_rmon_o  ,
    output reg          tx_apply_rmon_o       ,
    output reg [2:0]    tx_pkt_err_type_rmon_o,   
    //Host interface
    input               r_CrcEn_i              , //Enable Tx MAC appends the CRC to every frame
    input               r_PauseFrameSendEn_i   ,               
    input   [15:0]      r_TxPauseTV_i          , //Tx pause timer value that is sent in the pause control frame
    input               r_txMacAddrEn_i        ,               
    input   [47:0]      r_txMacAddr_i          , 
    input               r_FullDuplex_i         ,
    input  [3:0]        r_MaxRetry_i           ,
    input  [5:0]        r_IFGSet_i             
);
    //++
    //parameters defined for state machine
    //--
    parameter       StateIdle           = 4'd00;
    parameter       StatePreamble       = 4'd01;
    parameter       StateSFD            = 4'd02;
    parameter       StateData           = 4'd03;
    parameter       StatePause          = 4'd04;
    parameter       StatePAD            = 4'd05;
    parameter       StateFCS            = 4'd06;
    parameter       StateIFG            = 4'd07;
    parameter       StateJam            = 4'd08;
    parameter       StateBackOff        = 4'd09;
    parameter       StateJamDrop        = 4'd10;
    parameter       StateFFEmptyDrop    = 4'd11;
    parameter       StateSwitchNext     = 4'd12;
    parameter       StateDefer          = 4'd13;
    parameter       StateSendPauseFrame = 4'd14;

    //internal signals                                                              
    reg [3:0]       current_state   /*synthesis syn_keep=1 */;
    reg [3:0]       next_state;
    reg [5:0]       IFG_counter;
    reg [4:0]       preamble_counter;
    reg [7:0]       TxD_tmp             ;   
    reg             TxEn_tmp            ;   
    reg             TxErr_tmp           ;
    reg             tx_apply_rmon_tmp   ;
    reg             tx_apply_rmon_tmp_pl1;
    reg             mac_header_slot     ;
    reg             mac_header_slot_tmp ;
    reg             src_mac_ptr         ;
    reg [7:0]       FrameLengthCounter  ;//for pad append
    reg [7:0]       JamCounter          ;
    reg             PktDrpEvenPtr       ;
    reg [7:0]       pause_counter       ;

    //++
    //boundery signal processing, synchronization between clock domains                                                             
    //--
    reg      crs_d1, crs_d2;
    reg      col_d1, col_d2;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin  
            {crs_d1, crs_d2} <= 2'b0;
            {col_d1, col_d2} <= 2'b0;
        end
        else begin  
            {crs_d1, crs_d2} <= {CRS_i, crs_d1};
            {col_d1, col_d2} <= {COL_i, col_d1};
        end     
    end

    wire carrier_sense = crs_d2;
    wire collision     = col_d2;

    //++
    //state machine                                                             
    //--
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            pause_counter <= 0;
        else if(current_state != StatePause)
            pause_counter <= 0;
        else 
            pause_counter <= pause_counter + 1;
    end
            
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            FrameLengthCounter <= 0;
        else if(current_state == StateDefer)
            FrameLengthCounter <= 0;    
        else if(FrameLengthCounter != 8'hff && (current_state == StateData 
            || current_state == StateSendPauseFrame || current_state == StatePAD))
            FrameLengthCounter <=FrameLengthCounter + 1;
    end

    //state transition
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            current_state <= StateDefer;
        else 
            current_state <= next_state;    
    end
        
    //state combinational logic
    always @ (*) begin
        case (current_state)   
            StateDefer:
                if((r_FullDuplex_i || (!r_FullDuplex_i && !carrier_sense)) && xmt_en_i)
                    next_state = StateIFG;
                else
                    next_state = current_state;   

            StateIFG:
                if(!r_FullDuplex_i && carrier_sense)
                    next_state = StateDefer;
                else if((r_FullDuplex_i && IFG_counter == (r_IFGSet_i-4)) || 
                    (!r_FullDuplex_i && !carrier_sense && IFG_counter == (r_IFGSet_i-4)))//remove some additional time
                    next_state = StateIdle;
                else
                    next_state = current_state;           

            StateIdle:   //if no data to be sent, normally in IDLE state
                if(!r_FullDuplex_i && carrier_sense)
                    next_state = StateDefer;
                else if(pause_apply_i)
                    next_state = StatePause;          
                else if((r_FullDuplex_i && fifo_ra_i) || (!r_FullDuplex_i && !carrier_sense && fifo_ra_i) 
                    ||(r_PauseFrameSendEn_i && TxPauseRq_gen_i))
                    next_state = StatePreamble;
                else
                    next_state = current_state;   

            StatePause:
                if(pause_counter == 512/8)
                    next_state = StateDefer;
                else
                    next_state = current_state;               

            StatePreamble:
                if(!r_FullDuplex_i && collision)
                    next_state = StateJam;
                else if((r_FullDuplex_i || (!r_FullDuplex_i && !collision)) && preamble_counter == 6)
                    next_state = StateSFD;
                else
                    next_state = current_state;

            StateSFD:
                if(!r_FullDuplex_i && collision)
                    next_state = StateJam;
                else if(r_PauseFrameSendEn_i && TxPauseRq_gen_i)
                    next_state = StateSendPauseFrame;
                else 
                    next_state = StateData;

            StateSendPauseFrame:
                if (FrameLengthCounter == 17)
                    next_state = StatePAD;
                else
                    next_state = current_state;

            StateData:
                if(!r_FullDuplex_i && collision)
                    next_state = StateJam;
                else if(fifo_data_err_empty_i)
                    next_state = StateFFEmptyDrop;                
                else if((!r_CrcEn_i) && fifo_eop_i)  //do not append CRC
                    next_state = StateSwitchNext;
                else if(fifo_eop_i && FrameLengthCounter >= 59) //IP+MAC+TYPE=60 ,start from 0
                    next_state = StateFCS;
                else if (fifo_eop_i)
                    next_state = StatePAD;
                else 
                    next_state = current_state;       

            StatePAD:
                if (!r_FullDuplex_i && collision)
                    next_state = StateJam; 
                else if (FrameLengthCounter >= 59)
                    next_state = StateFCS;        
                else 
                    next_state = current_state;

            StateJam:
                if(retry_cnt_o <= r_MaxRetry_i && JamCounter == 16) 
                    next_state = StateBackOff;
                else if(retry_cnt_o > r_MaxRetry_i)
                    next_state = StateJamDrop;
                else
                    next_state = current_state;

            StateBackOff:
                if(random_time_meet_i)
                    next_state = StateDefer;
                else 
                    next_state = current_state;

            StateFCS:
                if(!r_FullDuplex_i && collision)
                    next_state = StateJam;
                else if(crc_end_i)
                    next_state = StateSwitchNext;
                else
                    next_state = current_state;

            StateFFEmptyDrop:
                if(fifo_eop_i)
                    next_state = StateSwitchNext;
                else
                    next_state = current_state;             

            StateJamDrop:
                if(fifo_eop_i)
                    next_state = StateSwitchNext;
                else
                    next_state = current_state;

            StateSwitchNext:
                    next_state  =StateDefer;            

            default:
                next_state  =StateDefer;
        endcase
    end
        
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            JamCounter <= 0;
        else if (current_state != StateJam)
            JamCounter <= 0;
        else if(current_state == StateJam)
            JamCounter <= JamCounter+1;
    end
             
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            retry_cnt_o <= 0;
        else if(current_state == StateSwitchNext)
            retry_cnt_o <= 0;
        else if(current_state == StateJam && next_state == StateBackOff)
            retry_cnt_o <= retry_cnt_o + 1;
    end
                
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            IFG_counter <= 0;
        else if (current_state != StateIFG)
            IFG_counter <= 0;
        else 
            IFG_counter <= IFG_counter + 1;
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            preamble_counter <= 0;
        else if(current_state != StatePreamble)
            preamble_counter <= 0;
        else
            preamble_counter <= preamble_counter + 1;
    end
        
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)      
            PktDrpEvenPtr <= 0;
        else if(current_state == StateJamDrop || current_state == StateFFEmptyDrop)
            PktDrpEvenPtr <= ~PktDrpEvenPtr;
    end

    //++
    //generate output signals                                                           
    //--

    //CRC related
    always @(*) begin
        if(current_state == StateSFD)
            crc_init_o = 1;
        else
            crc_init_o = 0;
    end
            
    assign frame_data_o = TxD_tmp;

    always @(*) begin
        if(current_state == StateData || current_state == StateSendPauseFrame || current_state == StatePAD)
            data_en_o = 1;
        else
            data_en_o = 0;
    end
        
    always @(*) begin
        if(current_state == StateFCS)
            crc_rd_o = 1;
        else
            crc_rd_o = 0;     
    end
    
    //random generator interface
    always @(*) begin
        if(current_state == StateJam && next_state == StateBackOff)
            random_init_o = 1;
        else
            random_init_o = 0; 
    end

    //MAC TX FIFO interface
    //data have one cycle delay after fifo read signals  
    always @(*) begin
        if(current_state == StateData ||
            current_state == StateSFD && !(r_PauseFrameSendEn_i && TxPauseRq_gen_i) ||
            current_state == StateJamDrop && PktDrpEvenPtr ||
            current_state == StateFFEmptyDrop && PktDrpEvenPtr)
            fifo_rd_o = 1;
        else
            fifo_rd_o = 0; 
    end
        
    always @(*) begin
        if(current_state == StateSwitchNext)     
            fifo_rd_finish_o = 1;
        else
            fifo_rd_finish_o = 0;
    end
        
    always @(*) begin
        if(current_state == StateJam)        
            fifo_rd_retry_o = 1;
        else
            fifo_rd_retry_o = 0;     
    end

    //GMII/MII
    always @(*) begin
        if(current_state == StatePreamble || current_state == StateSFD ||
            current_state == StateData || current_state == StateSendPauseFrame||
            current_state == StateFCS || current_state == StatePAD || current_state == StateJam)
            TxEn_tmp = 1;
        else
            TxEn_tmp = 0;
    end

    always @(*) begin
        if(current_state == StateData && (fifo_data_err_empty_i || fifo_data_err_full_i))
            TxErr_tmp = 1;
        else
            TxErr_tmp = 0;
    end

    //generate TXD data      
    reg  [7:0]  tx_mac_src_addr;

    always @(*) begin
        case (current_state)
            StatePreamble:
                TxD_tmp = 8'h55;

            StateSFD:
                TxD_tmp = 8'hd5;

            StateData:
                if (src_mac_ptr && r_txMacAddrEn_i)       
                    TxD_tmp = tx_mac_src_addr;
                else
                    TxD_tmp = fifo_data_i;

            StateSendPauseFrame:
                if (src_mac_ptr && r_txMacAddrEn_i)       
                    TxD_tmp = tx_mac_src_addr;
                else 
                    case (FrameLengthCounter)
                        7'd0:   TxD_tmp = 8'h01;
                        7'd1:   TxD_tmp = 8'h80;
                        7'd2:   TxD_tmp = 8'hc2;
                        7'd3:   TxD_tmp = 8'h00;
                        7'd4:   TxD_tmp = 8'h00;
                        7'd5:   TxD_tmp = 8'h01;
                        7'd12:  TxD_tmp = 8'h88;//type
                        7'd13:  TxD_tmp = 8'h08;//
                        7'd14:  TxD_tmp = 8'h00;//opcode
                        7'd15:  TxD_tmp = 8'h01;
                        7'd16:  TxD_tmp = r_TxPauseTV_i[15:8];
                        7'd17:  TxD_tmp = r_TxPauseTV_i[7:0];
                        default:TxD_tmp = 0;
                    endcase
            
            StatePAD:
                    TxD_tmp = 8'h00; 

            StateJam:
                    TxD_tmp = 8'h01; //jam sequence

            StateFCS:
                TxD_tmp = crc_out_i;

            default:
                TxD_tmp = 2'b0;
        endcase
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            TxD_o   <= 0;
            TxEn_o  <= 0;
            TxErr_o <= 0;
        end
        else begin
            TxD_o   <= TxD_tmp;
            TxEn_o  <= TxEn_tmp;
            TxErr_o <= TxErr_tmp;
        end     
    end
    
    //++
    //RMON MIB counter logics
    //--

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            tx_pkt_length_rmon_o <= 0;
        else if(current_state == StateSFD)
            tx_pkt_length_rmon_o <= 0;
        else if(current_state == StateData || current_state == StateSendPauseFrame ||
                current_state == StatePAD || current_state == StateFCS)
            tx_pkt_length_rmon_o <= tx_pkt_length_rmon_o + 1;
    end
        
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            tx_apply_rmon_tmp <= 0;
        else if((fifo_eop_i && current_state == StateJamDrop) ||
                 (fifo_eop_i && current_state == StateFFEmptyDrop) || crc_end_i)
            tx_apply_rmon_tmp <= 1;
        else
            tx_apply_rmon_tmp <= 0; 
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            tx_apply_rmon_tmp_pl1 <= 0;
        else
            tx_apply_rmon_tmp_pl1 <= tx_apply_rmon_tmp;
    end
        
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            tx_apply_rmon_o <= 0;
        else if((fifo_eop_i && current_state == StateJamDrop) ||
                 (fifo_eop_i && current_state == StateFFEmptyDrop) || crc_end_i)
            tx_apply_rmon_o <= 1;
        else if (tx_apply_rmon_tmp_pl1)
            tx_apply_rmon_o <= 0;
    end
        
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            tx_pkt_err_type_rmon_o <= 0;    
        else if(fifo_eop_i && current_state==StateJamDrop)
            tx_pkt_err_type_rmon_o <= 3'b001;//
        else if(fifo_eop_i && current_state == StateFFEmptyDrop)
            tx_pkt_err_type_rmon_o <= 3'b010;//underflow
        else if(fifo_eop_i && fifo_data_err_full_i)
            tx_pkt_err_type_rmon_o <= 3'b011;//overflow
        else if(crc_end_i)
            tx_pkt_err_type_rmon_o <= 3'b100;//normal
    end
        
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            mac_header_slot_tmp <= 0;
        else if(current_state == StateSFD && next_state==StateData)
            mac_header_slot_tmp <= 1;    
        else
            mac_header_slot_tmp <= 0;
    end
        
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            mac_header_slot <= 0;
        else 
            mac_header_slot <= mac_header_slot_tmp;
    end
    
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            tx_pkt_type_rmon_o <= 0;
        else if(current_state == StateSendPauseFrame)
            tx_pkt_type_rmon_o <= 3'b100;
        else if(mac_header_slot)
            tx_pkt_type_rmon_o <= {1'b0,TxD_o[1:0]};  //FIXME.
    end
       
    always @(*) begin
        if(tx_pkt_length_rmon_o >= 6 && tx_pkt_length_rmon_o <= 11)
            src_mac_ptr = 1;
        else
            src_mac_ptr = 0;  
    end      

    always @(*) begin
        case (tx_pkt_length_rmon_o)
            16'd6:  tx_mac_src_addr = r_txMacAddr_i[47:40];
            16'd7:  tx_mac_src_addr = r_txMacAddr_i[39:32];
            16'd8:  tx_mac_src_addr = r_txMacAddr_i[31:24];
            16'd9:  tx_mac_src_addr = r_txMacAddr_i[23:16];
            16'd10: tx_mac_src_addr = r_txMacAddr_i[15:8];
            16'd11: tx_mac_src_addr = r_txMacAddr_i[7:0];
            default:tx_mac_src_addr = 0;
        endcase
    end

    //++
    //flow control
    //--

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            pause_quanta_sub_o <= 0;
        else if(pause_counter == 512/8)
            pause_quanta_sub_o <= 1;
        else
            pause_quanta_sub_o <= 0;
    end
 
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) 
            TxPauseRq_gen_complete_o <=0;
        else if(current_state == StateDefer && TxPauseRq_gen_i)
            TxPauseRq_gen_complete_o <=1;
        else
            TxPauseRq_gen_complete_o <=0;
    end

endmodule

