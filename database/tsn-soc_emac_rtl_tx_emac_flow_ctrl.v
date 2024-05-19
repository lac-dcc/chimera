// This program was cloned from: https://github.com/lvzhengde/tsn-soc
// License: BSD 3-Clause "New" or "Revised" License

/*+
 * Copyright (c) 2022-2023 Zhengde
 *
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
 * EMAC flow control 
-*/

module emac_flow_ctrl (
    input           rst_n            ,
    input           clk              ,
    //host interface    
    input           r_TxPauseEn_i  ,
    input           r_TxPauseRq_i    , //Write 1 to start Tx pause frame sending, automatically cleared to zero.
    //from MAC RX flow control       
    input  [15:0]   pause_quanta_i          ,
    input           pause_quanta_val_i      ,
    //MAC TX flow control      
    output reg      pause_apply_o           ,
    input           pause_quanta_sub_i      ,
    output reg      TxPauseRq_gen_o         ,
    input           TxPauseRq_gen_complete_i
);
    //++
    //internal signals                                                              
    //--
    reg             TxPauseRq_d1           ;
    reg             TxPauseRq_d2           ;
    reg             TxPauseRq_d3           ;
    reg [15:0]      pause_quanta_d1        ;
    reg             pause_quanta_val_d1    ;
    reg             pause_quanta_val_d2    ;       
    reg             pause_quanta_val_d3    ;       
    reg [15:0]      pause_quanta_counter    ;
    reg             TxPauseEn_d1         ;
    reg             TxPauseEn_d2         ;
    
    //++
    //latch boundery signals                                                                
    //--
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            TxPauseRq_d1  <= 0;
            TxPauseRq_d2  <= 0;
            TxPauseRq_d3  <= 0;
        end
        else begin
            TxPauseRq_d1  <= r_TxPauseRq_i;
            TxPauseRq_d2  <= TxPauseRq_d1;
            TxPauseRq_d3  <= TxPauseRq_d2;
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            pause_quanta_d1 <= 16'h0;
        end
        else begin
            pause_quanta_d1 <= pause_quanta_i;
        end  
    end
       
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            pause_quanta_val_d1 <= 0;
            pause_quanta_val_d2 <= 0;
            pause_quanta_val_d3 <= 0;
        end
        else begin
            pause_quanta_val_d1 <= pause_quanta_val_i;
            pause_quanta_val_d2 <= pause_quanta_val_d1;
            pause_quanta_val_d3 <= pause_quanta_val_d2;
        end                      
    end
        
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin           
            TxPauseEn_d1 <= 0;
            TxPauseEn_d2 <= 0; 
        end
        else begin        
            TxPauseEn_d1 <= r_TxPauseEn_i;
            TxPauseEn_d2 <= TxPauseEn_d1; 
        end     
    end
    
    //++        
    //generate output signals                                                            
    //--
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            TxPauseRq_gen_o <= 0;
        else if(TxPauseRq_gen_complete_i)
            TxPauseRq_gen_o <= 0;
        else if(TxPauseRq_d2 && !TxPauseRq_d3) 
            TxPauseRq_gen_o <= 1;
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            pause_quanta_counter <= 0;
        else if(pause_quanta_val_d2 && !pause_quanta_val_d3) //1 cycle pulse
            pause_quanta_counter <= pause_quanta_d1; 
        else if(pause_quanta_sub_i && pause_quanta_counter != 0)
            pause_quanta_counter <= pause_quanta_counter - 1;
    end
        
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            pause_apply_o <= 0;
        else if(pause_quanta_counter == 0) //froze in 0 until next pause frame received
            pause_apply_o <= 0;
        else if(TxPauseEn_d2)
            pause_apply_o <= 1;
    end
        
endmodule

