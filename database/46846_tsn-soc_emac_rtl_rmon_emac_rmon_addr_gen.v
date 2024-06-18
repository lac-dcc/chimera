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
 *  EMAC RMON MIB address generator
-*/

module emac_rmon_addr_gen (
    input               clk                 ,
    input               rst_n               ,
    //RMON
    input  [2:0]        pkt_type_rmon_i       ,
    input  [15:0]       pkt_length_rmon_i     ,
    input               apply_rmon_i          , //pulse similar to eop
    input  [2:0]        pkt_err_type_rmon_i   ,
    //emac_rmon_ctrl interface
    output reg          reg_apply_o           ,
    output reg [4:0]    reg_addr_o            ,
    output reg [15:0]   reg_data_o            ,
    input               reg_next_i            
);
    //++
    //internal signals                                                              
    //--
    
    parameter       IDLE        = 4'd0;
    parameter       PKT_LENGTH  = 4'd1;
    parameter       PKT_NUMBER  = 4'd2;
    parameter       PKT_TYPE    = 4'd3;
    parameter       PKT_RANGE   = 4'd4;

    reg  [3:0]      current_state /* synthesys syn_keep=1 */;
    reg  [3:0]      next_state;
         
    reg  [2:0]      pkt_type_reg      ;
    reg  [15:0]     pkt_length_reg    ;
    reg  [2:0]      pkt_err_type_reg  ;
    
    //++
    //latch boundery signals    
    //--
    
    reg              apply_rmon_d1    ;
    reg              apply_rmon_d2    ;
    reg              apply_rmon_d3    ;
    wire             apply_rmon_pulse ;

    reg  [2:0]       pkt_type_rmon_d1       ;
    reg  [15:0]      pkt_length_rmon_d1     ;
    reg  [2:0]       pkt_err_type_rmon_d1   ;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            pkt_type_rmon_d1     <= 0;
            pkt_length_rmon_d1   <= 0;
            pkt_err_type_rmon_d1 <= 0;
        end              
        else begin
            pkt_type_rmon_d1     <= pkt_type_rmon_i     ;   
            pkt_length_rmon_d1   <= pkt_length_rmon_i   ;
            pkt_err_type_rmon_d1 <= pkt_err_type_rmon_i ;
        end 
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            apply_rmon_d1 <= 0;
            apply_rmon_d2 <= 0;
            apply_rmon_d3 <= 0;
        end
        else begin
            apply_rmon_d1 <= apply_rmon_i;
            apply_rmon_d2 <= apply_rmon_d1;
            apply_rmon_d3 <= apply_rmon_d2;
        end 
    end

    assign apply_rmon_pulse = (apply_rmon_d2 & !apply_rmon_d3);
    
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            pkt_type_reg     <= 0;
            pkt_length_reg   <= 0;
            pkt_err_type_reg <= 0;    
        end
        else if(apply_rmon_pulse && current_state==IDLE) begin
            pkt_type_reg     <= pkt_type_rmon_d1     ;
            pkt_length_reg   <= pkt_length_rmon_d1   ;
            pkt_err_type_reg <= pkt_err_type_rmon_d1 ;    
        end     
    end

    //++
    //State Machine                                                             
    //--

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end
        
    always @(*) begin
        case(current_state)
            IDLE:
                if(apply_rmon_pulse)
                    next_state = PKT_LENGTH;
                else
                    next_state = IDLE;

            PKT_LENGTH:
                if(reg_next_i)
                    next_state = PKT_NUMBER;
                else
                    next_state = current_state;

            PKT_NUMBER:
                if(reg_next_i)
                    next_state = PKT_TYPE;
                else             
                    next_state = current_state;

            PKT_TYPE:
                if(reg_next_i)
                    next_state = PKT_RANGE;
                else             
                    next_state = current_state;

            PKT_RANGE:
                if(reg_next_i)
                    next_state = IDLE;
                else             
                    next_state = current_state;

            default:
                    next_state = IDLE;
        endcase 
    end
            
    //++
    //generate output signals                                                            
    //--

    //reg_apply
    always @(*) begin
        if(current_state == PKT_LENGTH || current_state == PKT_NUMBER ||
            current_state == PKT_TYPE || current_state == PKT_RANGE)
            reg_apply_o = 1;
        else
            reg_apply_o = 0;
    end
            
    //reg_addr
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            reg_addr_o <= 0;
        else begin
            case(current_state)
                PKT_LENGTH:
                    reg_addr_o <= 5'd00;

                PKT_NUMBER:
                    reg_addr_o <= 5'd01;

                PKT_TYPE:
                    case(pkt_type_reg)
                        3'b011:
                            reg_addr_o <= 5'd02;    //broadcast
                        3'b001:
                            reg_addr_o <= 5'd03;    //multicast 
                        3'b100:
                            reg_addr_o <= 5'd16;    //pause frame   
                        default:
                            reg_addr_o <= 5'd04;    //unicast
                    endcase

                PKT_RANGE:
                    case(pkt_err_type_reg)
                        3'b001:
                            reg_addr_o <= 5'd05; 
                        3'b010:
                            reg_addr_o <= 5'd06;    
                        3'b011:
                            reg_addr_o <= 5'd07;    
                        3'b100:
                            if(pkt_length_reg < 64)    
                                reg_addr_o <= 5'd08; 
                            else if(pkt_length_reg == 64)
                                reg_addr_o <= 5'd09; 
                            else if(pkt_length_reg < 128)
                                reg_addr_o <= 5'd10; 
                            else if(pkt_length_reg < 256)
                                reg_addr_o <= 5'd11; 
                            else if(pkt_length_reg < 512)
                                reg_addr_o <= 5'd12; 
                            else if(pkt_length_reg < 1024)
                                reg_addr_o <= 5'd13; 
                            else if(pkt_length_reg < 1519)
                                reg_addr_o <= 5'd14; 
                            else
                                reg_addr_o <= 5'd15; 
                        default:
                            reg_addr_o <= 5'd05;
                    endcase

                default:
                        reg_addr_o <= 5'd05;
            endcase
        end
    end
                
    //reg_data
    always @(*) begin
        case(current_state)
            PKT_LENGTH:
                reg_data_o = pkt_length_reg;
            PKT_NUMBER:
                reg_data_o = 1;
            PKT_TYPE:
                reg_data_o = 1;
            PKT_RANGE:
                reg_data_o = 1;
            default:
                reg_data_o = 0;
        endcase
    end
    
endmodule               
            

