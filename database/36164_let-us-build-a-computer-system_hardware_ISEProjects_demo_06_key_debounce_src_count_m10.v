// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
//                                                                              //
//  Author: meisq                                                               //
//          msq@qq.com                                                          //
//          ALINX(shanghai) Technology Co.,Ltd                                  //
//          heijin                                                              //
//     WEB: http://www.alinx.cn/                                                //
//     BBS: http://www.heijin.org/                                              //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
// Copyright (c) 2017,ALINX(shanghai) Technology Co.,Ltd                        //
//                    All rights reserved                                       //
//                                                                              //
// This source file may be used and distributed without restriction provided    //
// that this copyright statement is not removed from the file and that any      //
// derivative work contains the original copyright notice and the associated    //
// disclaimer.                                                                  //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

//==========================================================================
//  Revision History:
//  Date          By            Revision    Change Description
//--------------------------------------------------------------------------
//  2017/6/19     meisq         1.0         Original
//*************************************************************************/

module count_m10(
                 input          clk,
                 input          rst_n,
                 input          en,    //Counter enable
                 input          clr,   //Counter synchronous reset   
                 output reg[3:0]data,  //counter value
                 output reg     t      // carry enable signal
                );
always@(posedge clk or negedge rst_n) 
begin
    if(rst_n==0)
    begin
        data <= 4'd0;
        t <= 1'd0;
    end
    else if(clr)
    begin
        data <= 4'd0;
        t <= 1'd0;      
    end
    else if(en)
    begin
        if(data==4'd9)
        begin
            t<= 1'b1;    //Counter to 9 to generate carry
            data <= 4'd0;//Counter to 9 reset
        end
        else
        begin
            t <= 1'b0;
            data <= data + 4'd1;
        end
    end
    else
        t <= 1'b0;
end

endmodule