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
 * EMAC TX FIFO to data user interface 
-*/

module emac_tx_fifo ( 
    input               rst_n                 ,
    input               clk_mac               ,
    input               clk_sys               ,
    //emac_tx_ctrl interface
    output reg [7:0]    fifo_data_o           ,//FIFO data output (4 octets --> 1 octets)
    input               fifo_rd_i             ,//FIFO read enable (every 4 octets, address increase 1)
    input               fifo_rd_finish_i      ,
    input               fifo_rd_retry_i       ,
    output reg          fifo_eop_o            ,//end of packet, aligned to last valid data byte
    output reg          fifo_da_o             ,//FIFO data output valid (Not Used in fact)
    output reg          fifo_ra_o             ,//FIFO data read available
    output reg          fifo_data_err_empty_o ,
    output              fifo_data_err_full_o  ,
    //user interface 
    output reg          tx_mac_wa_o           ,//FIFO write data available
    input               tx_mac_wr_i           ,//MAC data write enable
    input  [31:0]       tx_mac_data_i         ,//MAC data input
    input  [1:0]        tx_mac_be_i           ,//byte enable, little endian
    input               tx_mac_sop_i          ,//Start of Packet input
    input               tx_mac_eop_i          ,//End of Packet input
    //host interface 
    input               r_FullDuplex_i        ,
    input  [4:0]        r_txHwMark_i          ,
    input  [4:0]        r_txLwMark_i            
);
    //++
    //internal signals                                                              
    //--
    //MAC side state machine parameters and signals
    parameter       MAC_BYTE0             = 4'd00;     
    parameter       MAC_BYTE1             = 4'd01;
    parameter       MAC_BYTE2             = 4'd02; 
    parameter       MAC_BYTE3             = 4'd03; 
    parameter       MAC_WAIT_FINISH       = 4'd04;
    parameter       MAC_RETRY             = 4'd08;
    parameter       MAC_IDLE              = 4'd09;
    parameter       MAC_FFEMPTY           = 4'd10;
    parameter       MAC_FFEMPTY_DROP      = 4'd11;
    parameter       MAC_PKT_SUB           = 4'd12;
    parameter       MAC_FF_ERR            = 4'd13;

    reg [3:0]       current_state_mac           /* synthesis syn_preserve =1 */ ;   
    reg [3:0]       current_state_mac_d1        /* synthesis syn_preserve =1 */ ;     
    reg [3:0]       next_state_mac              ;

    //SYS side state machine parameters and signals
    parameter       SYS_IDLE              = 4'd0;
    parameter       SYS_WAITSOP           = 4'd1;
    parameter       SYS_SOP               = 4'd2;
    parameter       SYS_MOP               = 4'd3;
    parameter       SYS_DROP              = 4'd4;
    parameter       SYS_EOP_OK            = 4'd5;  
    parameter       SYS_FFEMPTY           = 4'd6;         
    parameter       SYS_EOP_ERR           = 4'd7;
    parameter       SYS_SOP_ERR           = 4'd8;
    
    reg [3:0]       current_state_sys   /* synthesis syn_preserve =1 */;
    reg [3:0]       next_state_sys;

    reg  [`EMAC_TXFF_AWIDTH-1:0]       add_wr          ;
    reg  [`EMAC_TXFF_AWIDTH-1:0]       add_wr_ungray   ;
    reg  [`EMAC_TXFF_AWIDTH-1:0]       add_wr_gray     ;
    reg  [`EMAC_TXFF_AWIDTH-1:0]       add_wr_gray_reg ;

    reg  [`EMAC_TXFF_AWIDTH-1:0]       add_rd          ;
    reg  [`EMAC_TXFF_AWIDTH-1:0]       add_rd_reg      ;
    reg  [`EMAC_TXFF_AWIDTH-1:0]       add_rd_gray     ;
    reg  [`EMAC_TXFF_AWIDTH-1:0]       add_rd_gray_reg ;
    reg  [`EMAC_TXFF_AWIDTH-1:0]       add_rd_ungray   ;

    wire [35:0]      din     ;
    wire [35:0]      dout    ;
    reg              wr_en   ;

    reg             full            /* synthesis syn_keep=1 */;
    reg             almost_full     /* synthesis syn_keep=1 */;
    reg             empty           /* synthesis syn_keep=1 */;

    reg             tx_mac_wr_d1    ;
    reg  [31:0]     tx_mac_data_d1  ;
    reg  [1:0]      tx_mac_be_d1    ;
    reg             tx_mac_sop_d1   ;
    reg             tx_mac_eop_d1   ;
    reg             fifo_full_err   ;

    wire [1:0]      dout_be         ;
    wire            dout_eop        ;
    wire            dout_err        ;
    wire [31:0]     dout_data       ;     
    reg  [35:0]     dout_reg        /* synthesis syn_preserve=1 */;

    reg [4:0]       fifo_data_count   ;
    reg             fifo_ra_tmp       ;      

    reg [5:0]       packet_number_in_fifo      /* synthesis syn_keep=1 */;   
    reg [5:0]       packet_number_in_fifo_reg  /* synthesis syn_preserve=1 */;
    reg             pkt_sub_apply_tmp       ;
    reg             pkt_sub_apply           ;

    reg             add_rd_reg_rdy_tmp  ;
    reg             add_rd_reg_rdy      ;   

    reg             add_rd_jump_tmp    ;
    reg             add_rd_jump_tmp_d1 ;
    reg             add_rd_jump        ;

    //++
    //write data to FIFO 
    //clock domain clk_sys
    //--

    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n)
            current_state_sys <= SYS_IDLE;
        else
            current_state_sys <= next_state_sys;
    end
        
    always @(*) begin
        case(current_state_sys)
            SYS_IDLE:
                if(tx_mac_wr_i && tx_mac_sop_i && !full)
                    next_state_sys = SYS_SOP;
                else
                    next_state_sys = current_state_sys ;

            SYS_SOP:
                    next_state_sys = SYS_MOP;

            SYS_MOP:
                if(almost_full)
                    next_state_sys = SYS_DROP;
                else if(tx_mac_wr_i && tx_mac_sop_i)
                    next_state_sys = SYS_SOP_ERR;
                else if(tx_mac_wr_i && tx_mac_eop_i)
                    next_state_sys = SYS_EOP_OK;
                else
                    next_state_sys = current_state_sys ;

            SYS_EOP_OK:
                if(tx_mac_wr_i && tx_mac_sop_i)
                    next_state_sys = SYS_SOP;
                else
                    next_state_sys = SYS_IDLE;

            SYS_EOP_ERR:
                if(tx_mac_wr_i && tx_mac_sop_i)
                    next_state_sys = SYS_SOP;
                else
                    next_state_sys = SYS_IDLE;

            SYS_SOP_ERR:
                    next_state_sys = SYS_DROP;

            SYS_DROP: //FIFO overflow           
                if(tx_mac_wr_i && tx_mac_eop_i)
                    next_state_sys = SYS_EOP_ERR;
                else 
                    next_state_sys = current_state_sys ;

            default:
                    next_state_sys = SYS_IDLE;
        endcase
    end
    
    //delay signals 
    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n) begin       
            tx_mac_wr_d1   <= 0;
            tx_mac_data_d1 <= 0;
            tx_mac_be_d1   <= 0;
            tx_mac_sop_d1  <= 0;
            tx_mac_eop_d1  <= 0;
        end  
        else begin       
            tx_mac_wr_d1   <= tx_mac_wr_i     ;
            tx_mac_data_d1 <= tx_mac_data_i   ;
            tx_mac_be_d1   <= tx_mac_be_i     ;
            tx_mac_sop_d1  <= tx_mac_sop_i    ;
            tx_mac_eop_d1  <= tx_mac_eop_i    ;
        end 
    end

    always @(*) begin 
        if(current_state_sys == SYS_EOP_ERR)
            fifo_full_err = 1;
        else
            fifo_full_err = 0; 
    end

    reg     tx_mac_eop_gen;

    always @(*) begin
        if (current_state_sys == SYS_EOP_ERR || current_state_sys == SYS_EOP_OK)
            tx_mac_eop_gen = 1;
        else
            tx_mac_eop_gen = 0; 
    end
                
    //data to be written to FIFO RAM
    assign  din={tx_mac_eop_gen,fifo_full_err,tx_mac_be_d1,tx_mac_data_d1};

    //FIFO RAM write enable
    always @(*) begin
        if((current_state_sys == SYS_SOP || current_state_sys == SYS_EOP_OK ||
            current_state_sys==SYS_MOP || current_state_sys == SYS_EOP_ERR) && tx_mac_wr_d1)
            wr_en = 1;
        else
            wr_en = 0;
    end

    //FIFO RAM write address
    always @(posedge clk_sys or negedge rst_n) begin
        if (!rst_n)
            add_wr <= 0;
        else if (wr_en && !full)
            add_wr <= add_wr + 1;
    end
            
    //binary to Gray address--write address
    always @(*) begin : GRAY_WRITE
        integer i;

        add_wr_gray[`EMAC_TXFF_AWIDTH-1] = add_wr[`EMAC_TXFF_AWIDTH-1];

        for(i = `EMAC_TXFF_AWIDTH-2; i >= 0; i = i-1)
            add_wr_gray[i] = add_wr[i+1] ^ add_wr[i];
    end

    always @(posedge clk_sys) add_wr_gray_reg <= add_wr_gray;

    //synchronize read Gray address to clk_sys domain
    reg  [`EMAC_TXFF_AWIDTH-1:0]       add_rd_gray_d1  ;
    reg  [`EMAC_TXFF_AWIDTH-1:0]       add_rd_gray_d2;

    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n)
            {add_rd_gray_d1, add_rd_gray_d2} <= 0;
        else
            {add_rd_gray_d1, add_rd_gray_d2} <= {add_rd_gray_reg, add_rd_gray_d1};
    end
                    
    reg             add_rd_jump_wr_d1, add_rd_jump_wr_d2;

    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n)
            {add_rd_jump_wr_d1, add_rd_jump_wr_d2} <= 0;
        else        
            {add_rd_jump_wr_d1, add_rd_jump_wr_d2} <= {add_rd_jump, add_rd_jump_wr_d1};
    end

    reg  [`EMAC_TXFF_AWIDTH-1:0]       add_rd_ungray_reg;

    always @(*) begin : UNGRAY_READ
        integer i;

        add_rd_ungray = add_rd_ungray_reg;

        if(!add_rd_jump_wr_d2) begin
            add_rd_ungray[`EMAC_TXFF_AWIDTH-1] = add_rd_gray_d2[`EMAC_TXFF_AWIDTH-1];   

            for(i = `EMAC_TXFF_AWIDTH-2; i >= 0; i = i-1)
                add_rd_ungray[i] = add_rd_ungray[i+1]^add_rd_gray_d2[i];  
        end    
    end

    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n)
            add_rd_ungray_reg <= 0;
        else        
            add_rd_ungray_reg <= add_rd_ungray;
    end

    //generate fifo full and almostfull flags
    wire [`EMAC_TXFF_AWIDTH-1:0]       add_wr_plus1    ;
    wire [`EMAC_TXFF_AWIDTH-1:0]       add_wr_plus4;

    assign  add_wr_plus1 = add_wr + 1;
    assign  add_wr_plus4 = add_wr + 4;

    always @(*) begin
        if(add_wr_plus1 == add_rd_ungray)
            full = 1;
        else
            full = 0;
    end

    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n)
            almost_full <= 0;
        else if(add_wr_plus4 == add_rd_ungray)
            almost_full <= 1;
        else
            almost_full <= 0;
    end
        
    //calculate packet available in TX FIFO
    reg             packet_number_sub_d1   ;
    reg             packet_number_sub_d2   ;
    reg             packet_number_sub_d3   ;
    reg             packet_number_sub_edge  /* synthesis syn_preserve=1 */;
    reg             packet_number_add       /* synthesis syn_preserve=1 */;

    always @(posedge clk_sys or negedge rst_n) begin
        if (!rst_n) begin
            packet_number_sub_d1 <= 0;
            packet_number_sub_d2 <= 0;
            packet_number_sub_d3 <= 0;
        end
        else begin
            packet_number_sub_d1 <= pkt_sub_apply;
            packet_number_sub_d2 <= packet_number_sub_d1;
            packet_number_sub_d3 <= packet_number_sub_d2;
        end
    end
        
    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n)
            packet_number_sub_edge <= 0;
        else if(packet_number_sub_d2 & !packet_number_sub_d3)
            packet_number_sub_edge <= 1;
        else
            packet_number_sub_edge <= 0;
    end

    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n)
            packet_number_add <= 0;    
        else if(current_state_sys == SYS_EOP_OK || current_state_sys == SYS_EOP_ERR)
            packet_number_add <= 1;
        else
            packet_number_add <= 0;    
    end
        
    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n)
            packet_number_in_fifo <= 0;
        else if(packet_number_add && !packet_number_sub_edge)
            packet_number_in_fifo <= packet_number_in_fifo + 1'b1;
        else if(!packet_number_add && packet_number_sub_edge)
            packet_number_in_fifo <= packet_number_in_fifo - 1'b1;
    end
    
    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n)
            packet_number_in_fifo_reg <= 0;
        else
            packet_number_in_fifo_reg <= packet_number_in_fifo;
    end

    //generate control signals for TX FIFO read and write
    reg             add_rd_reg_rdy_d1   ;   
    reg             add_rd_reg_rdy_d2   ;
    reg             add_rd_reg_rdy_d3   ;

    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n) begin
            add_rd_reg_rdy_d1  <= 0;
            add_rd_reg_rdy_d2  <= 0;
            add_rd_reg_rdy_d3  <= 0;
        end
        else begin
            add_rd_reg_rdy_d1  <= add_rd_reg_rdy;
            add_rd_reg_rdy_d2  <= add_rd_reg_rdy_d1;
            add_rd_reg_rdy_d3  <= add_rd_reg_rdy_d2;
        end     
    end

    reg  [`EMAC_TXFF_AWIDTH-1:0]       add_rd_reg_d1  ;

    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n)
            add_rd_reg_d1 <= 0;
        else if(add_rd_reg_rdy_d2 & !add_rd_reg_rdy_d3)
            add_rd_reg_d1 <= add_rd_reg;
    end

    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n)
            fifo_data_count <= 0;
        else if(r_FullDuplex_i)
            fifo_data_count <= add_wr[`EMAC_TXFF_AWIDTH-1:`EMAC_TXFF_AWIDTH-5] - add_rd_ungray[`EMAC_TXFF_AWIDTH-1:`EMAC_TXFF_AWIDTH-5];
        else //for half duplex backoff requirement
            fifo_data_count <= add_wr[`EMAC_TXFF_AWIDTH-1:`EMAC_TXFF_AWIDTH-5] - add_rd_reg_d1[`EMAC_TXFF_AWIDTH-1:`EMAC_TXFF_AWIDTH-5]; 
    end
            
    //fifo read available
    always @(*) begin
        if(packet_number_in_fifo_reg >= 1 || fifo_data_count >= r_txLwMark_i)
            fifo_ra_tmp = 1;        
        else 
            fifo_ra_tmp = 0;
    end

    //fifo write available
    always @(posedge clk_sys or negedge rst_n) begin
        if(!rst_n)
            tx_mac_wa_o <= 0;  
        else if (fifo_data_count >= r_txHwMark_i)
            tx_mac_wa_o <= 0;
        else if (fifo_data_count < r_txLwMark_i)
            tx_mac_wa_o <= 1;
    end

    //++
    //read data from FIFO
    //clk_mac clock domain
    //-- 

    reg  [35:0]   dout_d1;
    reg           dout_reg_en /* synthesis syn_keep=1 */;

    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n)
            dout_d1 <= 0;
        else
            dout_d1 <= dout;
    end

    always @(*) begin
        if((current_state_mac == MAC_IDLE || current_state_mac == MAC_BYTE3) && next_state_mac == MAC_BYTE0)
            dout_reg_en = 1;
        else
            dout_reg_en = 0; 
    end
            
    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n)
            dout_reg <= 0;
        else if(dout_reg_en)
            dout_reg <= dout_d1;     
    end
        
    assign {dout_eop, dout_err, dout_be, dout_data} = dout_reg;

    //state transition
    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n)
            current_state_mac <= MAC_IDLE;
        else
            current_state_mac <= next_state_mac;       
    end
            
    //combinational logic for state machine
    always @(*) begin
        case(current_state_mac)
            MAC_IDLE:
                if((!empty) && fifo_rd_i)
                    next_state_mac = MAC_BYTE0;
                else
                    next_state_mac = current_state_mac;

            MAC_BYTE0:
                if(fifo_rd_retry_i)
                    next_state_mac = MAC_RETRY;           
                else if(fifo_eop_o)
                    next_state_mac = MAC_WAIT_FINISH;
                else if(fifo_rd_i && !fifo_eop_o)
                    next_state_mac = MAC_BYTE1;
                else
                    next_state_mac = current_state_mac;

            MAC_BYTE1:
                if(fifo_rd_retry_i)
                    next_state_mac = MAC_RETRY;
                else if(fifo_eop_o)
                    next_state_mac = MAC_WAIT_FINISH;
                else if(fifo_rd_i && !fifo_eop_o)
                    next_state_mac = MAC_BYTE2;
                else
                    next_state_mac = current_state_mac;       
                
            MAC_BYTE2:
                if(fifo_rd_retry_i)
                    next_state_mac = MAC_RETRY;
                else if(fifo_eop_o)
                    next_state_mac = MAC_WAIT_FINISH;
                else if(fifo_rd_i && !fifo_eop_o)
                    next_state_mac = MAC_BYTE3;
                else
                    next_state_mac = current_state_mac; 

            MAC_BYTE3:
                if(empty && fifo_rd_i && !fifo_eop_o)
                    next_state_mac = MAC_FFEMPTY;
                else if(fifo_rd_retry_i)
                    next_state_mac = MAC_RETRY;
                else if(fifo_eop_o)
                    next_state_mac = MAC_WAIT_FINISH;     
                else if(fifo_rd_i && !fifo_eop_o)
                    next_state_mac = MAC_BYTE0;
                else
                    next_state_mac = current_state_mac;   

            MAC_RETRY:
                    next_state_mac = MAC_IDLE;

            MAC_WAIT_FINISH:
                if(fifo_rd_finish_i)
                    next_state_mac = MAC_PKT_SUB;
                else
                    next_state_mac = current_state_mac;

            MAC_PKT_SUB:
                    next_state_mac = MAC_IDLE;

            MAC_FFEMPTY:
                if(!empty)
                    next_state_mac = MAC_BYTE0;
                else
                    next_state_mac = current_state_mac;

            default
                    next_state_mac = MAC_IDLE;    
        endcase
    end

    //binary to Gray address--read address
    always @(*) begin : GRAY_READ
        integer i;

        add_rd_gray[`EMAC_TXFF_AWIDTH-1] = add_rd[`EMAC_TXFF_AWIDTH-1];
        for(i =`EMAC_TXFF_AWIDTH-2; i >= 0; i = i-1)
            add_rd_gray[i] = add_rd[i+1] ^ add_rd[i];
    end

    always @(posedge clk_mac) add_rd_gray_reg <= add_rd_gray;

    //synchronize write Gray address to clk_mac domain
    reg  [`EMAC_TXFF_AWIDTH-1:0]       add_wr_gray_d1  ;
    reg  [`EMAC_TXFF_AWIDTH-1:0]       add_wr_gray_d2  ;

    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n)
            {add_wr_gray_d1, add_wr_gray_d2} <= 0;
        else
            {add_wr_gray_d1, add_wr_gray_d2} <= {add_wr_gray_reg, add_wr_gray_d1};
    end
            
    always @(*) begin : UNGRAY_WRITE
        integer i;

        add_wr_ungray[`EMAC_TXFF_AWIDTH-1] = add_wr_gray_d2[`EMAC_TXFF_AWIDTH-1];   
        for(i = `EMAC_TXFF_AWIDTH-2; i >= 0; i = i-1)
            add_wr_ungray[i] =add_wr_ungray[i+1] ^ add_wr_gray_d2[i];  
    end

    //empty     
    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n)      
            empty <= 1;
        else if(add_rd == add_wr_ungray)
            empty <= 1;
        else
            empty <= 0;    
    end
        
    //fifo read available (ra)
    reg  fifo_ra_sync1;

    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n)
            {fifo_ra_o, fifo_ra_sync1} <= 0;
        else
            {fifo_ra_o, fifo_ra_sync1} <= {fifo_ra_sync1, fifo_ra_tmp};
    end
    
    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n)  
            pkt_sub_apply_tmp <= 0;
        else if(current_state_mac == MAC_PKT_SUB)
            pkt_sub_apply_tmp <= 1;
        else
            pkt_sub_apply_tmp <= 0;
    end
    
    always @(*)  begin
        if((current_state_mac == MAC_PKT_SUB) || pkt_sub_apply_tmp)
            pkt_sub_apply <= 1;
        else              
            pkt_sub_apply <= 0;
    end

    //reg add_rd for collison retry
    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n)
            add_rd_reg <= 0;
        else if (fifo_rd_finish_i)
            add_rd_reg  <= add_rd;
    end

    always @(posedge clk_mac or negedge rst_n) begin
        if (!rst_n)
            add_rd_reg_rdy_tmp <= 0;
        else if(fifo_rd_finish_i)
            add_rd_reg_rdy_tmp <= 1;
        else
            add_rd_reg_rdy_tmp <= 0;
    end
        
    always @(*) begin
        if(fifo_rd_finish_i || add_rd_reg_rdy_tmp)
            add_rd_reg_rdy = 1;
        else
            add_rd_reg_rdy = 0;         
    end

    reg add_rd_add /* synthesis syn_keep=1 */;
    
    always @(*) begin
        if((current_state_mac == MAC_IDLE || current_state_mac == MAC_BYTE3) && next_state_mac== MAC_BYTE0)
            add_rd_add = 1;
        else
            add_rd_add = 0;
    end
            
    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n)
            add_rd <= 0;
        else if(current_state_mac == MAC_RETRY)
            add_rd <= add_rd_reg;
        else if(add_rd_add)
            add_rd <= add_rd + 1;  
    end
                    
    //FIFO read address jump backoff
    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n)
            add_rd_jump_tmp <= 0;
        else if(current_state_mac == MAC_RETRY)
            add_rd_jump_tmp <= 1;
        else
            add_rd_jump_tmp <= 0;
    end

    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n)
            add_rd_jump_tmp_d1 <= 0;
        else
            add_rd_jump_tmp_d1 <= add_rd_jump_tmp;   
    end 
            
    reg   add_rd_jump_reg;

    always @(posedge clk_mac or negedge rst_n) begin
        if (!rst_n)
            add_rd_jump_reg  <= 0;
        else
            add_rd_jump_reg  <= add_rd_jump;    
    end

    always @(*) begin
        add_rd_jump = add_rd_jump_reg;
        if(current_state_mac == MAC_RETRY)
            add_rd_jump = 1;
        else if(add_rd_jump_tmp_d1)
            add_rd_jump = 0;    
    end

    //generate fifo data output 
    always @(*) begin
        case(current_state_mac)
            MAC_BYTE3:
                fifo_data_o = dout_data[31:24];
            MAC_BYTE2:
                fifo_data_o = dout_data[23:16];
            MAC_BYTE1:
                fifo_data_o = dout_data[15:8];
            MAC_BYTE0:
                fifo_data_o = dout_data[7:0];
            default:
                fifo_data_o = 0;     
        endcase
    end

    //generate fifo_da_o           
    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n)
            fifo_da_o <= 0;
        else if((current_state_mac == MAC_BYTE3 || current_state_mac == MAC_BYTE2 ||
                  current_state_mac == MAC_BYTE1 || current_state_mac == MAC_BYTE0) && fifo_rd_i && !fifo_eop_o)
            fifo_da_o <= 1;
        else
            fifo_da_o <= 0;
    end

    //gen fifo_data_err_full_o
    assign  fifo_data_err_full_o = dout_err;

    //gen fifo_data_err_empty_o
    always @(posedge clk_mac or negedge rst_n) begin
        if(!rst_n)
            current_state_mac_d1   <= 0;
        else
            current_state_mac_d1   <= current_state_mac;
    end
        
    always @(posedge clk_mac or negedge rst_n) begin
        if (!rst_n)
            fifo_data_err_empty_o <= 0;
        else if (current_state_mac_d1 == MAC_FFEMPTY)
            fifo_data_err_empty_o <= 1;
        else
            fifo_data_err_empty_o <= 0;
    end

    //gen fifo_eop_o aligned to last valid data byte。            
    always @(*) begin
        if ((current_state_mac == MAC_BYTE3 && dout_be == 2'b00 ||
             current_state_mac == MAC_BYTE2 && dout_be == 2'b11 ||
             current_state_mac == MAC_BYTE1 && dout_be == 2'b10 ||
             current_state_mac == MAC_BYTE0 && dout_be == 2'b01) && dout_eop)
            fifo_eop_o = 1; 
        else
            fifo_eop_o = 0;         
    end

    //++
    //instantiate dual port block ram
    //--
    dpram #(36, `EMAC_TXFF_AWIDTH, 2**(`EMAC_TXFF_AWIDTH)) u_dpram
    (
        .data_a         (din        ), 
        .wren_a         (wr_en      ), 
        .address_a      (add_wr     ), 
        .clock_a        (clk_sys    ), 
        .q_a            (           ),

        .data_b         (36'b0      ),
        .wren_b         (1'b0       ),
        .address_b      (add_rd     ), 
        .clock_b        (clk_mac    ), 
        .q_b            (dout       )
    );   

endmodule

