// This program was cloned from: https://github.com/lvzhengde/tsn-soc
// License: BSD 3-Clause "New" or "Revised" License

/*+
 * Copyright (c) 2022-2023 Zhengde
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
 *  EMAC receive control
-*/

`include "emac_defines.v"

module emac_rx_ctrl (
    input               rst_n     ,         
    input               clk       ,         
    //GMII/MII interface  
    input               MRxDv_i   ,                                       
    input  [7:0]        MRxD_i    ,                                       
    input               MRxErr_i  ,                                       
    //receive CRC check interface
    output reg          crc_en_o  ,       
    output reg          crc_init_o,       
    input               crc_err_i ,
    //MAC receive address check interface
    output [15:0]       frame_counter_o      ,
    input               mac_rx_add_chk_err_i ,
    output reg          multicast_ptr_o          ,
    //broadcast filter
    output reg          broadcast_ptr_o    ,
    input               broadcast_drop_i   ,
    //flow control signals to TX MAC  
    output reg [15:0]   pause_quanta_o     ,   
    output reg          pause_quanta_val_o ,   
    //MAC RX FIFO interface
    output [7:0]        fifo_data_o     ,
    output reg          fifo_data_en_o  ,
    output reg          fifo_data_err_o ,
    output reg          fifo_data_end_o ,
    input               fifo_full_i     ,
    //RMON interface
    output [15:0]       rx_pkt_length_rmon_o   ,
    output reg          rx_apply_rmon_o        ,
    output reg [2:0]    rx_pkt_err_type_rmon_o ,
    output reg [2:0]    rx_pkt_type_rmon_o     ,
    //Host interface registers
    input               r_RxEn_i          , //receive enable
    input  [5:0]        r_RxIFGSet_i      , //minimum gap between consecutive received frames
    input  [15:0]       r_RxMaxLength_i   , //maximum frame length to be received (1518)
    input  [15:0]       r_RxMinLength_i     //minimum frame length to be received (64)
);
    //++
    //internal signals
    //--
    parameter       StateIdle          = 4'd00;
    parameter       StatePreamble      = 4'd01;
    parameter       StateSFD           = 4'd02;
    parameter       StateData          = 4'd03;
    parameter       StateCheckCRC      = 4'd04;
    parameter       StateOkEnd         = 4'd07;
    parameter       StateDrop          = 4'd08;
    parameter       StateErrEnd        = 4'd09;
    parameter       StateCRCErrEnd     = 4'd10;
    parameter       StateFFFullDrop    = 4'd11;
    parameter       StateFFFullErrEnd  = 4'd12;
    parameter       StateIFG           = 4'd13;

    parameter       PAUSE_IDLE         = 4'd0;   
    parameter       PAUSE_PRE_SYN      = 4'd1;    
    parameter       PAUSE_QUANTA_HI    = 4'd2;   
    parameter       PAUSE_QUANTA_LO    = 4'd3;   
    parameter       PAUSE_SYN          = 4'd4;   
                                                  
    reg  [3:0]      current_state /* synthesis syn_keep=1 */;                          
    reg  [3:0]      next_state; 
    reg  [3:0]      pause_current /* synthesis syn_keep=1 */; 
    reg  [3:0]      pause_next;                             
    reg  [5:0]      IFG_counter;   
    reg             RxDv  ;      
    reg  [7:0]      RxD   ;
    reg  [7:0]      RxD_d1;
    reg             RxErr ;
    reg  [15:0]     frame_counter;
    reg             too_long ;
    reg             too_short;
    reg             rx_apply_rmon_tmp   ;
    reg             rx_apply_rmon_tmp_d1;
    reg  [7:0]      pause_quanta_h      ;
    reg             pause_quanta_val_tmp;
    reg             pause_frame_ptr     ;

    //latch input data signals                                                          
    always @(posedge clk or negedge rst_n) begin                 
        if(!rst_n) begin  
            RxDv  <= 0;
            RxD   <= 0;                                                            
            RxErr <= 0; 
        end
        else begin  
            RxDv  <= MRxDv_i ;
            RxD   <= MRxD_i  ;                                                            
            RxErr <= MRxErr_i; 
        end
    end

    always @(posedge clk or negedge rst_n) begin                 
        if(!rst_n) 
            RxD_d1 <= 0;
        else 
            RxD_d1 <= RxD;
    end

    //++                                       
    //control state machine                                                           
    //--
                                                        
    //control state transition
    always @(posedge clk or negedge rst_n) begin                 
        if(!rst_n)                                          
            current_state <= StateIdle;                   
        else                                   
            current_state <= next_state;                   
    end
                                                        
    //combinational logics for control state machine
    always @(*) begin                                             
        case(current_state)                            
            StateIdle:
                if(RxDv && RxD == 8'h55 && r_RxEn_i)                
                    next_state = StatePreamble;    
                else                               
                    next_state = current_state;     

            StatePreamble:                             
                if(!RxDv)                        
                    next_state = StateErrEnd;      
                else if(RxErr)                     
                    next_state = StateDrop;        
                else if(RxD == 8'hd5)                 
                    next_state = StateSFD;                 
                else if(RxD == 8'h55)                
                    next_state = current_state;     
                else                                
                    next_state = StateDrop;        

            StateSFD:                                  
                if(!RxDv)                        
                    next_state = StateErrEnd;      
                else if(RxErr)                     
                    next_state = StateDrop;        
                else                                
                    next_state = StateData;       

            StateData:                                
                if(!RxDv && !too_short && !too_long)                        
                    next_state = StateCheckCRC;   
                else if(!RxDv && (too_short || too_long))
                    next_state = StateErrEnd;
                else if(fifo_full_i)
                    next_state = StateFFFullErrEnd;
                else if(RxErr || mac_rx_add_chk_err_i || too_long || broadcast_drop_i)                     
                    next_state = StateDrop;        
                else                                
                    next_state = StateData;       

            StateCheckCRC:
                if(crc_err_i)
                   next_state = StateCRCErrEnd;
                else
                   next_state = StateOkEnd; 

            StateDrop:                                 
                if(!RxDv)                        
                    next_state = StateErrEnd;      
                else                                
                    next_state = current_state;     

            StateOkEnd:                                
                next_state = StateIFG;         

            StateErrEnd:                               
                next_state = StateIFG;       
                                                                            
            StateCRCErrEnd:                               
                next_state = StateIFG;   

            StateFFFullDrop:
                if(!RxDv)                        
                    next_state = StateIFG;     
                else                                
                    next_state = current_state;                                                

            StateFFFullErrEnd:
                next_state = StateFFFullDrop;                                        

            StateIFG:                                  
                if(IFG_counter == r_RxIFGSet_i-4)   //remove some additional time     
                    next_state = StateIdle;        
                else                                
                    next_state = current_state;     
                                                    
            default:                                    
                next_state  = StateIdle;        
        endcase                                         
    end
                     
    always @(posedge clk or negedge rst_n ) begin                 
        if(!rst_n)                                          
            IFG_counter <= 0;   
        else if(current_state != StateIFG)
            IFG_counter <= 0;                                
        else 
            IFG_counter <= IFG_counter + 1;
    end

    //++
    //generate fifo interface signals                                                     
    //--
    assign fifo_data_o = RxD_d1;       

    always @(*) begin
        if(current_state == StateData)
            fifo_data_en_o = 1;
        else
            fifo_data_en_o = 0;
    end
        
    always @(*) begin
        if(current_state == StateErrEnd || current_state == StateOkEnd
              || current_state == StateCRCErrEnd || current_state == StateFFFullErrEnd)
            fifo_data_end_o = 1;
        else
            fifo_data_end_o = 0;
    end

    always @(*) begin
        if(current_state == StateErrEnd || current_state == StateCRCErrEnd || current_state == StateFFFullErrEnd)
            fifo_data_err_o = 1;
        else
            fifo_data_err_o = 0;     
    end

    //++
    //CRC check interface                                               
    //--
    
    always @(*) begin
        if(current_state == StateData)
            crc_en_o = 1;
        else
            crc_en_o = 0;
    end
        
    always @(*) begin
        if(current_state == StateSFD)
            crc_init_o = 1;
        else
            crc_init_o = 0;
    end
        
    //++
    //generate RMON signals                                         
    //--

    //for fifo_data_o, frame_counter=1 to frame_counter=6
    //corresponding to MAC destination address
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)  
            frame_counter <= 0;
        else if (current_state == StateSFD)
            frame_counter <= 1;
        else if (current_state == StateData) 
            frame_counter <= frame_counter+ 1'b1;
    end

    assign frame_counter_o = frame_counter;
        
    always @(*) begin
        if(frame_counter < r_RxMinLength_i)
            too_short = 1;
        else
            too_short = 0;
    end
        
    always @(*) begin
        if(frame_counter > r_RxMaxLength_i)
            too_long = 1;
        else
            too_long = 0;
    end
            
    assign rx_pkt_length_rmon = frame_counter - 1'b1;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            rx_apply_rmon_tmp <= 0; 
        else if(current_state == StateOkEnd || current_state == StateErrEnd
             || current_state == StateCRCErrEnd || current_state == StateFFFullErrEnd)
            rx_apply_rmon_tmp <= 1;        
        else
            rx_apply_rmon_tmp <= 0; 
    end
        
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            rx_apply_rmon_tmp_d1 <= 0;
        else
            rx_apply_rmon_tmp_d1 <= rx_apply_rmon_tmp;        
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            rx_apply_rmon_o <= 0; 
        else if(current_state == StateOkEnd || current_state == StateErrEnd
             || current_state == StateCRCErrEnd || current_state == StateFFFullErrEnd)
            rx_apply_rmon_o <= 1;        
        else if(rx_apply_rmon_tmp_d1)
            rx_apply_rmon_o <= 0; 
    end
        
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            rx_pkt_err_type_rmon_o <= 0;
        else if(current_state == StateCRCErrEnd)
            rx_pkt_err_type_rmon_o <= 3'b001;//
        else if(current_state == StateFFFullErrEnd)
            rx_pkt_err_type_rmon_o <= 3'b010;// 
        else if(current_state == StateErrEnd)
            rx_pkt_err_type_rmon_o <= 3'b011;//
        else if(current_state == StateOkEnd)
            rx_pkt_err_type_rmon_o <= 3'b100;
    end
        
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            rx_pkt_type_rmon_o <= 0;
        else if(current_state == StateOkEnd && pause_frame_ptr)
            rx_pkt_type_rmon_o <= 3'b100;//
        else if(current_state == StateSFD && next_state == StateData)
            rx_pkt_type_rmon_o <= {1'b0,RxD[1:0]}; //FIXME, {1'b0,MRxD_i[7:6]}??;
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            broadcast_ptr_o <= 0;
        else if(current_state==StateIFG)
            broadcast_ptr_o <= 0;
        else if(current_state == StateData && frame_counter < 6 && RxD[7:0] != 8'hff)
            broadcast_ptr_o <= 0;
        else if(current_state == StateSFD && next_state == StateData && RxD[7:0] == 8'hff) //FIXME
            broadcast_ptr_o <= 1;
    end
    
    //++
    //MAC address checker signals                                                              
    //--
    
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            multicast_ptr_o <= 0;
        else if(current_state==StateIFG)
            multicast_ptr_o <= 0;
        else if(current_state == StateSFD && next_state == StateData && RxD[0] == 1'b1) //FIXME
            multicast_ptr_o <= 1;
    end

    //++
    //flow control signals--generated by state machine                                                            
    //--
    
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            pause_current <= PAUSE_IDLE;
        else
            pause_current <= pause_next;
    end
        
    always @(*) begin
        case(pause_current)
            PAUSE_IDLE  : 
                if(current_state == StateSFD)
                    pause_next = PAUSE_PRE_SYN;
                else
                    pause_next = pause_current;

            PAUSE_PRE_SYN:
                case(frame_counter)
                    16'd1:  if(RxD_d1 == 8'h01)
                                pause_next = pause_current;
                            else
                                pause_next = PAUSE_IDLE;

                    16'd2:  if(RxD_d1 == 8'h80)
                                pause_next = pause_current;
                            else
                                pause_next = PAUSE_IDLE;            

                    16'd3:  if(RxD_d1 == 8'hc2)
                                pause_next = pause_current;
                            else
                                pause_next = PAUSE_IDLE;

                    16'd4:  if(RxD_d1 == 8'h00)
                                pause_next = pause_current;
                            else
                                pause_next = PAUSE_IDLE;

                    16'd5:  if(RxD_d1 == 8'h00)
                                pause_next = pause_current;
                            else
                                pause_next = PAUSE_IDLE;

                    16'd6:  if(RxD_d1 == 8'h01)
                                pause_next = pause_current;
                            else
                                pause_next = PAUSE_IDLE;

                    16'd13: if(RxD_d1 == 8'h88)
                                pause_next = pause_current;
                            else
                                pause_next = PAUSE_IDLE;

                    16'd14: if(RxD_d1 == 8'h08)
                                pause_next = pause_current;
                            else
                                pause_next = PAUSE_IDLE;

                    16'd15: if(RxD_d1==8'h00)
                                pause_next = pause_current;
                            else
                                pause_next = PAUSE_IDLE;

                    16'd16: if(RxD_d1 == 8'h01)
                                pause_next = PAUSE_QUANTA_HI;
                            else
                                pause_next = PAUSE_IDLE;

                    default:    pause_next = pause_current;
                endcase

            PAUSE_QUANTA_HI :
                pause_next = PAUSE_QUANTA_LO;

            PAUSE_QUANTA_LO :
                pause_next = PAUSE_SYN; 

            PAUSE_SYN       :
                if (current_state == StateIFG)
                    pause_next = PAUSE_IDLE;
                else
                    pause_next = pause_current;

            default
                pause_next = PAUSE_IDLE;
        endcase
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            pause_quanta_h <= 0;
        else if(pause_current == PAUSE_QUANTA_HI)
            pause_quanta_h <= RxD_d1;
    end
        
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            pause_quanta_o <= 0;
        else if(pause_current == PAUSE_QUANTA_LO)
            pause_quanta_o <= {pause_quanta_h,RxD_d1};
    end
        
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)      
            pause_quanta_val_tmp <= 0;
        else if(current_state == StateOkEnd && pause_current == PAUSE_SYN)
            pause_quanta_val_tmp <= 1;
        else
            pause_quanta_val_tmp <= 0;
    end
        
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)      
            pause_quanta_val_o <= 0;
        else if(current_state == StateOkEnd && pause_current == PAUSE_SYN || pause_quanta_val_tmp)
            pause_quanta_val_o <= 1;
        else
            pause_quanta_val_o <= 0;        
    end
    
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)  
            pause_frame_ptr <= 0;
        else if(pause_current == PAUSE_SYN)
            pause_frame_ptr <= 1;
        else
            pause_frame_ptr <= 0;
    end
                
endmodule
                
                                                

