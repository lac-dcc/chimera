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
 *  Generate CRC for ethernet frame transmitting 
-*/

module emac_crc_gen (
    input              rst_n         ,
    input              clk           ,
    input              init_i        ,
    input  [7:0]       frame_data_i  ,
    input              data_en_i     ,
    input              crc_rd_i      ,
    output reg [7:0]   crc_out_o     ,
    output reg         crc_end_o     
);
    //++
    //internal signals                                                              
    //--
    reg [31:0]      crc_reg;
    reg [3:0]       counter;

    //++
    //function to calculate CRC
    //input data width is 8bit, and the first bit is bit[0]
    //--

    function [31:0]  NextCRC;
        input [7:0]      D;
        input [31:0]     C;
        reg   [31:0]     NewCRC;
    begin
        NewCRC[0]=C[24]^C[30]^D[1]^D[7];
        NewCRC[1]=C[25]^C[31]^D[0]^D[6]^C[24]^C[30]^D[1]^D[7];
        NewCRC[2]=C[26]^D[5]^C[25]^C[31]^D[0]^D[6]^C[24]^C[30]^D[1]^D[7];
        NewCRC[3]=C[27]^D[4]^C[26]^D[5]^C[25]^C[31]^D[0]^D[6];
        NewCRC[4]=C[28]^D[3]^C[27]^D[4]^C[26]^D[5]^C[24]^C[30]^D[1]^D[7];
        NewCRC[5]=C[29]^D[2]^C[28]^D[3]^C[27]^D[4]^C[25]^C[31]^D[0]^D[6]^C[24]^C[30]^D[1]^D[7];
        NewCRC[6]=C[30]^D[1]^C[29]^D[2]^C[28]^D[3]^C[26]^D[5]^C[25]^C[31]^D[0]^D[6];
        NewCRC[7]=C[31]^D[0]^C[29]^D[2]^C[27]^D[4]^C[26]^D[5]^C[24]^D[7];
        NewCRC[8]=C[0]^C[28]^D[3]^C[27]^D[4]^C[25]^D[6]^C[24]^D[7];
        NewCRC[9]=C[1]^C[29]^D[2]^C[28]^D[3]^C[26]^D[5]^C[25]^D[6];
        NewCRC[10]=C[2]^C[29]^D[2]^C[27]^D[4]^C[26]^D[5]^C[24]^D[7];
        NewCRC[11]=C[3]^C[28]^D[3]^C[27]^D[4]^C[25]^D[6]^C[24]^D[7];
        NewCRC[12]=C[4]^C[29]^D[2]^C[28]^D[3]^C[26]^D[5]^C[25]^D[6]^C[24]^C[30]^D[1]^D[7];
        NewCRC[13]=C[5]^C[30]^D[1]^C[29]^D[2]^C[27]^D[4]^C[26]^D[5]^C[25]^C[31]^D[0]^D[6];
        NewCRC[14]=C[6]^C[31]^D[0]^C[30]^D[1]^C[28]^D[3]^C[27]^D[4]^C[26]^D[5];
        NewCRC[15]=C[7]^C[31]^D[0]^C[29]^D[2]^C[28]^D[3]^C[27]^D[4];
        NewCRC[16]=C[8]^C[29]^D[2]^C[28]^D[3]^C[24]^D[7];
        NewCRC[17]=C[9]^C[30]^D[1]^C[29]^D[2]^C[25]^D[6];
        NewCRC[18]=C[10]^C[31]^D[0]^C[30]^D[1]^C[26]^D[5];
        NewCRC[19]=C[11]^C[31]^D[0]^C[27]^D[4];
        NewCRC[20]=C[12]^C[28]^D[3];
        NewCRC[21]=C[13]^C[29]^D[2];
        NewCRC[22]=C[14]^C[24]^D[7];
        NewCRC[23]=C[15]^C[25]^D[6]^C[24]^C[30]^D[1]^D[7];
        NewCRC[24]=C[16]^C[26]^D[5]^C[25]^C[31]^D[0]^D[6];
        NewCRC[25]=C[17]^C[27]^D[4]^C[26]^D[5];
        NewCRC[26]=C[18]^C[28]^D[3]^C[27]^D[4]^C[24]^C[30]^D[1]^D[7];
        NewCRC[27]=C[19]^C[29]^D[2]^C[28]^D[3]^C[25]^C[31]^D[0]^D[6];
        NewCRC[28]=C[20]^C[30]^D[1]^C[29]^D[2]^C[26]^D[5];
        NewCRC[29]=C[21]^C[31]^D[0]^C[30]^D[1]^C[27]^D[4];
        NewCRC[30]=C[22]^C[31]^D[0]^C[28]^D[3];
        NewCRC[31]=C[23]^C[29]^D[2];
        NextCRC=NewCRC;
    end
    endfunction

    wire [31:0] next_crc = NextCRC(frame_data_i,crc_reg);

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            crc_reg   <= 32'hffffffff;
            crc_out_o <= 0;
        end
        else if(init_i) begin
            crc_reg   <= 32'hffffffff;
            crc_out_o <= 0;
        end
        else if(data_en_i) begin
            crc_reg   <= next_crc;
            crc_out_o <= ~{next_crc[24], next_crc[25], next_crc[26], next_crc[27],
                           next_crc[28], next_crc[29], next_crc[30], next_crc[31]};
        end
        else if(crc_rd_i) begin
            crc_reg   <= {crc_reg[23:0],8'hff};
            crc_out_o <= ~{crc_reg[16], crc_reg[17], crc_reg[18], crc_reg[19],
                           crc_reg[20], crc_reg[21], crc_reg[22], crc_reg[23]};

        end
    end
        
    //always @(*) begin
    //    if(crc_rd_i)
    //        crc_out_o = ~{crc_reg[24], crc_reg[25], crc_reg[26], crc_reg[27],
    //                     crc_reg[28], crc_reg[29], crc_reg[30], crc_reg[31]};
    //    else
    //        crc_out_o = 0;
    //end
            
    //caculate CRC out length ,4 cycles     
    //crc_end_o aligned to last CRC checksum data
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            counter <= 0;
        else if(!crc_rd_i)
            counter <= 0;
        else 
            counter <= counter + 1;
    end
            
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)
            crc_end_o <= 0;
        else if(counter == 2)
            crc_end_o <= 1;
        else 
            crc_end_o <= 0;
    end

    //always @(*) begin
    //    if(counter == 3)
    //        crc_end_o = 1;
    //    else
    //        crc_end_o = 0;
    //end

endmodule



