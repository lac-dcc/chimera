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
 *  EMAC remote monitoring control
-*/

module emac_rmon_ctrl (
    input               clk             ,
    input               rst_n           ,
    //interface with rmon address generator
    input               reg_apply_0_i   ,
    input  [4:0]        reg_addr_0_i    ,
    input  [15:0]       reg_data_0_i    ,
    output reg          reg_next_0_o    ,
    input               reg_apply_1_i   ,
    input  [4:0]        reg_addr_1_i    ,
    input  [15:0]       reg_data_1_i    ,
    output reg          reg_next_1_o    ,
    //interface with dual-port ram, port-a for RMON  
    output reg [5:0]    addra_o         ,
    output reg [31:0]   dina_o          ,
    input  [31:0]       douta_i         ,
    output              wea_o           ,
    //Host interface registers I/O
    input  [5:0]        r_MibRdAddr_i   ,
    input               r_MibRdApply_i  ,
    output reg          RstMibRdApply_o ,
    output              r_MibRdGrant_o  ,
    output reg [31:0]   r_MibRdDout_o   
);
    //++
    //internal signals                                                              
    //--

    parameter       STATE_HOST = 4'd00;
    parameter       STATE_MAC0 = 4'd01;
    parameter       STATE_MAC1 = 4'd02;

    reg  [3:0]       current_state /* synthesys syn_keep=1 */;
    reg  [3:0]       next_state;
    reg  [3:0]       current_state_reg;

    reg  [4:0]       step_counter;
    reg              Write;
    reg              Read;
    reg              pipeline;
    reg              MibRdApply_reg    ;

    //++
    //State Machine                                                            
    //--

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            current_state <= STATE_MAC0;
        else
            current_state <= next_state;
    end
        
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)  
            current_state_reg <= STATE_MAC0;
        else if(current_state != STATE_HOST)
            current_state_reg <= current_state;
    end
                
    always @(*) begin
        case(current_state)
            STATE_MAC0:
                if(!reg_apply_0_i && MibRdApply_reg)
                    next_state = STATE_HOST;
                else if(!reg_apply_0_i)
                    next_state = STATE_MAC1;
                else
                    next_state = current_state;

            STATE_MAC1:
                if(!reg_apply_1_i && MibRdApply_reg)
                    next_state = STATE_HOST;
                else if(!reg_apply_1_i)
                    next_state = STATE_MAC0;
                else
                    next_state = current_state;

            STATE_HOST:
                if(step_counter == 3)
                    case(current_state_reg)
                        STATE_MAC0: next_state = STATE_MAC0 ;
                        STATE_MAC1: next_state = STATE_MAC1 ;
                        default   : next_state = STATE_MAC0 ;
                    endcase
                else
                    next_state = current_state;
                
            default:
                    next_state = STATE_MAC0;
        endcase
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            step_counter <= 0;
        else if(next_state != current_state)
            step_counter <= 0;
        else if(step_counter != 4'hf)
            step_counter <= step_counter + 1;
    end

    //++
    //temp signals                                                            
    //--

    always @(*) begin
        if(step_counter == 1 || step_counter == 4 ||
            step_counter == 7 || step_counter == 10)
            Read = 1;
        else
            Read = 0;
    end

    always @(*) begin
        if(step_counter == 2 || step_counter == 5 ||
            step_counter == 8 || step_counter == 11)
            pipeline = 1;
        else
            pipeline = 0;
    end
                
    always @(*) begin
        if(step_counter == 3 || step_counter == 6 ||
            step_counter == 9 || step_counter == 12)
            Write = 1;
        else
            Write = 0;
    end
        
    //++
    //generate output signals                                                        
    //--   

    //addra_o 
    always @(*) begin
        case(current_state)
            STATE_MAC0 :     addra_o = {1'd0 ,reg_addr_0_i };
            STATE_MAC1 :     addra_o = {1'd1 ,reg_addr_1_i };
            STATE_HOST :     addra_o = r_MibRdAddr_i;
            default    :     addra_o = 0;
        endcase
    end
        
    //dina_o
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            dina_o <= 0;
        else begin
            case(current_state)
                STATE_MAC0 :  dina_o <= douta_i + reg_data_0_i ;
                STATE_MAC1 :  dina_o <= douta_i + reg_data_1_i ;
                STATE_HOST :  dina_o <= 0;
                default    :  dina_o <= 0;
            endcase
        end
    end
    
    assign  wea_o = Write;

    //reg_next
    always @(*) begin
        if(current_state == STATE_MAC0) 
            reg_next_0_o = pipeline;
        else
            reg_next_0_o = 0;
    end
    
    always @(*) begin
        if(current_state == STATE_MAC1)
            reg_next_1_o = pipeline;
        else
            reg_next_1_o = 0;     
    end 

    //r_MibRdGrant_o   
    reg     MibRdApply_d1;
    reg     MibRdApply_d2;

    //rising edge
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            MibRdApply_d1 <= 0;
            MibRdApply_d2 <= 0;
        end
        else begin
            MibRdApply_d1 <= r_MibRdApply_i;
            MibRdApply_d2 <= MibRdApply_d1;
        end     
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            MibRdApply_reg <= 0;
        else if(MibRdApply_d1 & !MibRdApply_d2)
            MibRdApply_reg <= 1;
        else if(current_state == STATE_HOST && Write)
            MibRdApply_reg <= 0;
    end

    assign r_MibRdGrant_o = !MibRdApply_reg;

    always @(posedge clk) RstMibRdApply_o <= MibRdApply_reg;

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            r_MibRdDout_o <= 0;
        else if(pipeline && current_state == STATE_HOST)
            r_MibRdDout_o <= douta_i;        
    end

endmodule           

