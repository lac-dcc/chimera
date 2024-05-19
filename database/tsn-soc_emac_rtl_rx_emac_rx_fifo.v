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
 *  EMAC RX FIFO to data user interface
-*/

`include "emac_defines.v"

module emac_rx_fifo (
    input               rst_n       ,
    input               clk_mac     ,
    input               clk_sys     ,
    //emac_rx_ctrl interface 
    input  [7:0]        fifo_data_i     ,
    input               fifo_data_en_i  ,
    output              fifo_full_o     ,
    input               fifo_data_err_i ,
    input               fifo_data_end_i ,
    //Host interface
    input               r_RxAppendCrc_i , //retain FCS of received ethernet frame when hand up
    input  [4:0]        r_rxHwMark_i    , //RX FIFO high water mark
    input  [4:0]        r_rxLwMark_i    , //RX FIFO low water mark
    //user interface 
    output reg          rx_mac_ra_o   ,   //RX FIFO read data available
    input               rx_mac_rd_i   ,   //RX FIFO read enable
    output [31:0]       rx_mac_data_o ,   //Read data output, aligned with rx_mac_pa_o
    output [1:0]        rx_mac_be_o   ,   //Byte enable for the last word, little endian
    output reg          rx_mac_pa_o   ,   //packet data valid
    output reg          rx_mac_sop_o  ,   //start of packet
    output              rx_mac_eop_o      //end of packet
);
    //++
    //internal signals                                                              
    //--
    parameter       MAC_BYTE0     = 4'd0;      
    parameter       MAC_BYTE1     = 4'd1;
    parameter       MAC_BYTE2     = 4'd2;      
    parameter       MAC_BYTE3     = 4'd3;
    parameter       MAC_BE0       = 4'd4;
    parameter       MAC_BE3       = 4'd5;
    parameter       MAC_BE2       = 4'd6;
    parameter       MAC_BE1       = 4'd7;
    parameter       MAC_ERR_END   = 4'd8;
    parameter       MAC_IDLE      = 4'd9;

    parameter       SYS_READ      = 3'd0;
    parameter       SYS_PAUSE     = 3'd1;
    parameter       SYS_WAIT_END  = 3'd2;
    parameter       SYS_IDLE      = 3'd3;
    parameter       FF_EMPTY_ERR  = 3'd4;

    reg [`EMAC_RXFF_AWIDTH-1:0]       add_wr;
    reg [`EMAC_RXFF_AWIDTH-1:0]       add_wr_reg;
    reg [`EMAC_RXFF_AWIDTH-1:0]       add_wr_ungray;
    reg [`EMAC_RXFF_AWIDTH-1:0]       add_wr_gray;
    reg [`EMAC_RXFF_AWIDTH-1:0]       add_wr_gray_reg;
    
    reg [`EMAC_RXFF_AWIDTH-1:0]       add_rd;
    reg [`EMAC_RXFF_AWIDTH-1:0]       add_rd_gray;
    reg [`EMAC_RXFF_AWIDTH-1:0]       add_rd_gray_reg;
    reg [`EMAC_RXFF_AWIDTH-1:0]       add_rd_ungray;

    reg  [35:0]      din;
    reg  [35:0]      din_tmp;
    reg  [35:0]      din_tmp_reg;
    wire [35:0]      dout;
    reg              wr_en;
    reg              wr_en_tmp;
    reg              wr_en_ptr;

    reg              full;
    reg              almost_full;
    reg              empty /* synthesis syn_keep=1 */;
    reg  [3:0]       current_state /* synthesis syn_keep=1 */;
    reg  [3:0]       next_state;
    reg              rx_mac_sop_tmp  ;

    reg  [2:0]       current_state_sys /* synthesis syn_keep=1 */;
    reg  [2:0]       next_state_sys ;
    reg  [5:0]       packet_number_in_fifo /* synthesis syn_keep=1 */;
    reg              packet_number_sub ;

    reg              rx_mac_sop_tmp_d1;
    reg  [35:0]      dout_d1;
    reg  [4:0]       fifo_data_count;
    reg              rx_mac_pa_tmp       ;
    reg              add_wr_jump_tmp     ;
    reg              add_wr_jump_tmp_d1 ;
    reg              add_wr_jump         ;
    reg              addr_freshed_ptr    ;

    //++
    //clk_mac domain, write data to dual port RAM.
    //a-port for write
    //--    
    
    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n)
            current_state <= MAC_IDLE;
        else
            current_state <= next_state;
    end
        
    always @(*) begin
        case(current_state)
            MAC_IDLE:
                    if(fifo_data_en_i)
                        next_state = MAC_BYTE0;
                    else
                        next_state = current_state;                 

            MAC_BYTE0:
                    if(fifo_data_en_i)
                        next_state = MAC_BYTE1;
                    else if(fifo_data_err_i)
                        next_state = MAC_ERR_END;
                    else if(fifo_data_end_i)
                        next_state = MAC_BE1; 
                    else
                        next_state = current_state;                 

            MAC_BYTE1:
                    if(fifo_data_en_i)
                        next_state = MAC_BYTE2;
                    else if(fifo_data_err_i)
                        next_state = MAC_ERR_END;
                    else if(fifo_data_end_i)
                        next_state = MAC_BE2; 
                    else
                        next_state = current_state;         

            MAC_BYTE2:
                    if(fifo_data_en_i)
                        next_state = MAC_BYTE3;
                    else if(fifo_data_err_i)
                        next_state = MAC_ERR_END;
                    else if(fifo_data_end_i)
                        next_state = MAC_BE3; 
                    else
                        next_state = current_state;         

            MAC_BYTE3:
                    if(fifo_data_en_i)
                        next_state = MAC_BYTE0;
                    else if(fifo_data_err_i)
                        next_state = MAC_ERR_END;
                    else if(fifo_data_end_i)
                        next_state = MAC_BE0; 
                    else
                        next_state = current_state; 

            MAC_BE1:
                    next_state = MAC_IDLE;

            MAC_BE2:
                    next_state = MAC_IDLE;

            MAC_BE3:
                    next_state = MAC_IDLE;

            MAC_BE0:
                    next_state = MAC_IDLE;

            MAC_ERR_END:
                    next_state = MAC_IDLE;

            default:
                    next_state = MAC_IDLE;                
        endcase
    end

    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n)
            add_wr_reg <= 0;
        else if(current_state == MAC_IDLE)                 
            add_wr_reg <= add_wr;
    end
            
    //binary to Gray address--write address
    always @(*) begin : GRAY_WRITE
        integer i;

        add_wr_gray[`EMAC_RXFF_AWIDTH-1] = add_wr[`EMAC_RXFF_AWIDTH-1];
        for(i = `EMAC_RXFF_AWIDTH-2; i >= 0; i = i-1)
            add_wr_gray[i] = add_wr[i+1] ^ add_wr[i];
    end

    always @(posedge clk_mac) add_wr_gray_reg <= add_wr_gray;
    
    //synchronize read Gray address to clk_mac domain
    reg [`EMAC_RXFF_AWIDTH-1:0]       add_rd_gray_d1;
    reg [`EMAC_RXFF_AWIDTH-1:0]       add_rd_gray_d2;

    always @(posedge clk_mac or negedge rst_n) begin
        if (!rst_n)
            {add_rd_gray_d1, add_rd_gray_d2} <= 0;
        else
            {add_rd_gray_d1, add_rd_gray_d2} <= {add_rd_gray_reg, add_rd_gray_d1};
    end
                        
    //Gray to binary address--read address
    always @(posedge clk_mac or negedge rst_n) begin : UNGRAY_READ
        integer i;

        add_rd_ungray[`EMAC_RXFF_AWIDTH-1] = add_rd_gray_d2[`EMAC_RXFF_AWIDTH-1];   
        for(i = `EMAC_RXFF_AWIDTH-2; i >= 0;i = i-1)
            add_rd_ungray[i] = add_rd_ungray[i+1] ^ add_rd_gray_d2[i]; 
    end

    wire[`EMAC_RXFF_AWIDTH-1:0]       add_wr_plus;
    wire[`EMAC_RXFF_AWIDTH-1:0]       add_wr_plus4;
    wire[`EMAC_RXFF_AWIDTH-1:0]       add_wr_plus3;
    wire[`EMAC_RXFF_AWIDTH-1:0]       add_wr_plus2;

    assign add_wr_plus  = add_wr + 1;
    assign add_wr_plus4 = add_wr + 4;
    assign add_wr_plus3 = add_wr + 3;
    assign add_wr_plus2 = add_wr + 2;

    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n)
            full <= 0;
        else if(add_wr_plus == add_rd_ungray)
            full <= 1;
        else
            full <= 0;
    end
    
    always @ (posedge clk_mac or negedge rst_n) begin
        if(!rst_n)
            almost_full <= 0;
        else if(add_wr_plus4 == add_rd_ungray || add_wr_plus3 == add_rd_ungray ||
                 add_wr_plus2 == add_rd_ungray || add_wr_plus == add_rd_ungray)
            almost_full <= 1;
        else
            almost_full <= 0;        
    end
    
    assign fifo_full_o = almost_full;

    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n)
            add_wr <= 0;
        else if(current_state == MAC_ERR_END)
            add_wr <= add_wr_reg;
        else if (wr_en && !full)
            add_wr <= add_wr + 1;
    end
        
    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n)
            add_wr_jump_tmp <= 0;
        else if(current_state == MAC_ERR_END)
            add_wr_jump_tmp <= 1;
        else
            add_wr_jump_tmp <= 0;
    end

    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n)
            add_wr_jump_tmp_d1 <= 0;
        else
            add_wr_jump_tmp_d1 <= add_wr_jump_tmp;   
    end
            
    reg   add_wr_jump_reg;

    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n)
            add_wr_jump_reg <= 0;
        else
            add_wr_jump_reg <= add_wr_jump;
    end

    always @(*) begin
        add_wr_jump = add_wr_jump_reg;
        if(current_state == MAC_ERR_END)
            add_wr_jump = 1;
        else if(add_wr_jump_tmp_d1)
            add_wr_jump = 0;                
    end
            
    reg              fifo_data_en_d1;
    reg  [7:0]       fifo_data_d1;

    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n)
            fifo_data_en_d1 <= 0;
        else 
            fifo_data_en_d1 <= fifo_data_en_i;
    end
            
    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n)
            fifo_data_d1 <= 0;
        else 
            fifo_data_d1 <= fifo_data_i;
    end
        
    reg  [7:0]       fifo_data_byte0;
    reg  [7:0]       fifo_data_byte1;
    reg  [7:0]       fifo_data_byte2;
    reg  [7:0]       fifo_data_byte3;

    always @(posedge clk_mac or negedge rst_n) begin
        if (!rst_n)
            fifo_data_byte0 <= 0;
        else if (current_state == MAC_BYTE0 && fifo_data_en_d1)
            fifo_data_byte0 <= fifo_data_d1;
    end

    always @(posedge clk_mac or negedge rst_n) begin
        if (!rst_n)
            fifo_data_byte1 <= 0;
        else if (current_state == MAC_BYTE1 && fifo_data_en_d1)
            fifo_data_byte1 <= fifo_data_d1;
    end

    always @(posedge clk_mac or negedge rst_n) begin
        if (!rst_n)
            fifo_data_byte2 <= 0;
        else if(current_state == MAC_BYTE2 && fifo_data_en_d1)
            fifo_data_byte2 <= fifo_data_d1;
    end

    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n)
            fifo_data_byte3 <= 0;
        else if(current_state == MAC_BYTE3 && fifo_data_en_d1)
            fifo_data_byte3 <= fifo_data_d1;
    end

    always @(* ) begin
        case (current_state)
            MAC_BE0:
                din_tmp = {4'b1000, fifo_data_byte3, fifo_data_byte2, fifo_data_byte1, fifo_data_byte0}; //FIXME      
            MAC_BE1:
                din_tmp = {4'b1001, 24'h0, fifo_data_byte0};
            MAC_BE2:
                din_tmp = {4'b1010, 16'h0, fifo_data_byte1, fifo_data_byte0};
            MAC_BE3:
                din_tmp = {4'b1011, 8'h0,  fifo_data_byte2, fifo_data_byte1, fifo_data_byte0};
            default:
                din_tmp = {4'b0000, fifo_data_d1, fifo_data_byte2,fifo_data_byte1,fifo_data_byte0};
        endcase
    end

    always @(*) begin
        if(current_state == MAC_BE0 || current_state==MAC_BE1 ||
           current_state == MAC_BE2 || current_state==MAC_BE3 ||
          (current_state == MAC_BYTE3 && fifo_data_en_i))
            wr_en_tmp = 1;
        else 
            wr_en_tmp = 0; 
    end

    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n)
            din_tmp_reg <= 0;
        else if(wr_en_tmp) 
            din_tmp_reg <= din_tmp;  
    end
            
    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n)
            wr_en_ptr <= 0;
        else if(current_state == MAC_IDLE)
            wr_en_ptr <= 0;    
        else if(wr_en_tmp)
            wr_en_ptr <= 1;
    end

    //if not append FCS,delay one cycle write data and wr_en signal to drop FCS
    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n) begin
            wr_en <= 0;
            din   <= 0;
        end
        else if(r_RxAppendCrc_i) begin
            wr_en <= wr_en_tmp;
            din   <= din_tmp;
        end         
        else begin
            wr_en <= wr_en_tmp && wr_en_ptr;
            din   <= {din_tmp[35:32],din_tmp_reg[31:0]};
        end                                 
    end
            
    //signals for read side to handle the packet number in fifo
    reg              packet_number_add ;
    reg              packet_number_add_tmp    ;
    reg              packet_number_add_tmp_d1;
    reg              packet_number_add_tmp_d2;

    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n)
            packet_number_add_tmp <= 0;
        else if(current_state == MAC_BE0 || current_state == MAC_BE1 ||
                 current_state == MAC_BE2 || current_state == MAC_BE3)
            packet_number_add_tmp <= 1;
        else 
            packet_number_add_tmp <= 0;
    end
        
    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n) begin
            packet_number_add_tmp_d1 <= 0;
            packet_number_add_tmp_d2 <= 0;
        end
        else begin
            packet_number_add_tmp_d1 <= packet_number_add_tmp;
            packet_number_add_tmp_d2 <= packet_number_add_tmp_d1;
        end  
    end   
        
    //packet_number_add delay to din[35] is needed to make sure the data have been wroten to ram.       
    //expand to three cycles long almost=24 ns
    //if the clk_sys period less than 24 ns ,this signal need to expand to more clock cycles       
    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n)
            packet_number_add <= 0;
        else if(packet_number_add_tmp || packet_number_add_tmp_d1 || packet_number_add_tmp_d2)
            packet_number_add <= 1;
        else 
            packet_number_add <= 0;
    end
     

    //++
    //clk_sys domain,read data from dual port RAM.
    //b-port for read
    //

    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n)
            current_state_sys <= SYS_IDLE;
        else 
            current_state_sys <= next_state_sys;
    end
        
    always @(*) begin
        case(current_state_sys)
            SYS_IDLE:
                if(rx_mac_rd_i && rx_mac_ra_o && !empty)
                    next_state_sys = SYS_READ;
                else if(rx_mac_rd_i && rx_mac_ra_o && empty)
                    next_state_sys = FF_EMPTY_ERR;
                else
                    next_state_sys = current_state_sys;

            SYS_READ:
                if(dout[35])                
                    next_state_sys = SYS_WAIT_END;
                else if(!rx_mac_rd_i)
                    next_state_sys = SYS_PAUSE;
                else if(empty)
                    next_state_sys = FF_EMPTY_ERR;
                else
                    next_state_sys = current_state_sys;

            SYS_PAUSE:
                if(rx_mac_rd_i)                            
                    next_state_sys = SYS_READ;         
                else                                   
                    next_state_sys = current_state_sys;

            FF_EMPTY_ERR:
                if(!empty)
                    next_state_sys = SYS_READ;
                else
                    next_state_sys = current_state_sys;

            SYS_WAIT_END:
                if(!rx_mac_rd_i)
                    next_state_sys = SYS_IDLE;
                else
                    next_state_sys = current_state_sys;

            default:
                    next_state_sys = SYS_IDLE;
        endcase
    end
    
    //generate rx_mac_ra 
    reg              packet_number_add_d1;
    reg              packet_number_add_d2;
    reg              packet_number_add_d3;
    wire             packet_number_add_edge;

    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n) begin
            packet_number_add_d1 <= 0;
            packet_number_add_d2 <= 0;
            packet_number_add_d3 <= 0;
        end
        else begin
            packet_number_add_d1 <= packet_number_add;
            packet_number_add_d2 <= packet_number_add_d1;
            packet_number_add_d3 <= packet_number_add_d2;
        end
    end

    assign  packet_number_add_edge = packet_number_add_d2 & !packet_number_add_d3;

    always @(*) begin
        if(current_state_sys == SYS_READ && next_state_sys == SYS_WAIT_END)
            packet_number_sub = 1;
        else
            packet_number_sub = 0;
    end
        
    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n)
            packet_number_in_fifo <= 0;
        else if(packet_number_add_edge && !packet_number_sub)
            packet_number_in_fifo <= packet_number_in_fifo + 1;
        else if(!packet_number_add_edge && packet_number_sub && packet_number_in_fifo != 0)
            packet_number_in_fifo <= packet_number_in_fifo - 1;
    end

    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n)                                                                                      
            fifo_data_count <= 0;                                                                    
        else                                                                                         
            fifo_data_count <= add_wr_ungray[`EMAC_RXFF_AWIDTH-1:`EMAC_RXFF_AWIDTH-5] - add_rd[`EMAC_RXFF_AWIDTH-1:`EMAC_RXFF_AWIDTH-5]; 
    end
        
    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n)  
            rx_mac_ra_o <= 0;
        else if(packet_number_in_fifo == 0 && fifo_data_count <= r_rxLwMark_i)
            rx_mac_ra_o <= 0;
        else if(packet_number_in_fifo >= 1 || fifo_data_count >= r_rxHwMark_i)
            rx_mac_ra_o <= 1;
    end
        
    //control add_rd signal;
    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n)
            add_rd <= 0;
        else if(current_state_sys == SYS_READ && !(dout[35] && addr_freshed_ptr))  
            add_rd <= add_rd + 1;
    end

    reg [`EMAC_RXFF_AWIDTH-1:0]       add_rd_z1;

    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n)
            add_rd_z1  <= 0;
        else
            add_rd_z1  <= add_rd; 
    end
            
    always @(*) begin
        if(add_rd_z1 == add_rd)
            addr_freshed_ptr = 0;
        else
            addr_freshed_ptr = 1;
    end

    //binary address to Gray address--read
    always @(posedge clk_sys or negedge rst_n) begin : GRAY_READ
        integer i;

        add_rd_gray[`EMAC_RXFF_AWIDTH-1] = add_rd[`EMAC_RXFF_AWIDTH-1];
        for(i = `EMAC_RXFF_AWIDTH-2; i >= 0; i = i-1)
            add_rd_gray[i] = add_rd[i+1] ^ add_rd[i];
    end

    always @(posedge clk_sys) add_rd_gray_reg <= add_rd_gray;

    //write Gray address synchronized to clk_sys domain
    reg [`EMAC_RXFF_AWIDTH-1:0]       add_wr_gray_d1;
    reg [`EMAC_RXFF_AWIDTH-1:0]       add_wr_gray_d2;

    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n) begin
            add_wr_gray_d1 <= 0;
            add_wr_gray_d2 <= 0;
        end
        else begin
            add_wr_gray_d1 <= add_wr_gray_reg;
            add_wr_gray_d2 <= add_wr_gray_d1;
        end
    end
            
    reg    add_wr_jump_rd_d1  ;
    reg    add_wr_jump_rd_d2  ;
    
    always @(posedge clk_sys or negedge rst_n) begin
        if (!rst_n) begin
            add_wr_jump_rd_d1 <= 0;
            add_wr_jump_rd_d2 <= 0;
        end
        else begin        
            add_wr_jump_rd_d1 <= add_wr_jump;  
            add_wr_jump_rd_d2 <= add_wr_jump_rd_d1;  
        end
    end
            
    reg [`EMAC_RXFF_AWIDTH-1:0]       add_wr_ungray_reg;

    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n)
            add_wr_ungray_reg  <= 0;
        else
            add_wr_ungray_reg  <= add_wr_ungray; 
    end

    always @(posedge clk_sys or negedge rst_n) begin : UNGRAY_WRITE
        integer i;

        add_wr_ungray = add_wr_ungray_reg;
        
        if(!add_wr_jump_rd_d2) begin       
            add_wr_ungray[`EMAC_RXFF_AWIDTH-1] = add_wr_gray_d2[`EMAC_RXFF_AWIDTH-1];   
            for (i = `EMAC_RXFF_AWIDTH-2; i >= 0; i = i-1)
                add_wr_ungray[i] = add_wr_ungray[i+1] ^ add_wr_gray_d2[i]; 
        end
    end

    //generate empty signal   
    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n)      
            empty <= 1;
        else if(add_rd == add_wr_ungray)
            empty <= 1;
        else
            empty <= 0;
    end

    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n)
            dout_d1 <= 0;
        else
            dout_d1 <= dout; 
    end

    assign  rx_mac_data_o  = dout_d1[31:0];
    assign  rx_mac_be_o    = dout_d1[33:32];
    assign  rx_mac_eop_o   = dout_d1[35];

    //aligned to addr_rd 
    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n)
            rx_mac_pa_tmp   <= 0;    
        else if(current_state_sys == SYS_READ && !(dout[35] && addr_freshed_ptr))         
            rx_mac_pa_tmp   <= 1;
        else
            rx_mac_pa_tmp   <= 0;
    end

    always @(posedge clk_sys or negedge rst_n) begin 
        if(!rst_n)
            rx_mac_pa_o <= 0;
        else 
            rx_mac_pa_o <= rx_mac_pa_tmp;
    end
    
    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n)
            rx_mac_sop_tmp  <= 0;
        else if(current_state_sys == SYS_IDLE && next_state_sys == SYS_READ)
            rx_mac_sop_tmp  <= 1;
        else
            rx_mac_sop_tmp  <= 0;
    end
        
    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n) begin
            rx_mac_sop_tmp_d1 <= 0;
            rx_mac_sop_o      <= 0;
        end
        else begin
            rx_mac_sop_tmp_d1 <= rx_mac_sop_tmp;
            rx_mac_sop_o      <= rx_mac_sop_tmp_d1;
        end
    end

    //++
    //instantiate dual port RAM
    //--

    dpram #(36, `EMAC_RXFF_AWIDTH, 2**(`EMAC_RXFF_AWIDTH)) u_dpram
    (
        .data_a         (din        ), 
        .wren_a         (wr_en      ), 
        .address_a      (add_wr     ), 
        .clock_a        (clk_mac    ), 
        .q_a            (           ),
        
        .data_b         (36'b0      ),
        .wren_b         (1'b0       ),
        .address_b      (add_rd     ), 
        .clock_b        (clk_sys    ), 
        .q_b            (dout       )
    );
    
endmodule

