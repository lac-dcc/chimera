// This program was cloned from: https://github.com/ilaydayaman/CNN_for_SLR
// License: BSD 2-Clause "Simplified" License

`timescale 1ns / 1ps

module MAXPOOL1(
    input  [21:0] y,
    input  clk,
    input  enable,
    input  reset,
    input  read_strobe,
	output reg [3:0]  mx_done,
	output reg [3:0]  BR_count, //BlockRAM count, changed from mx_count
	output reg [5:0]  addr,    //BlockRAM address
    output reg [21:0] z
    );
    
	//wire [21:0] y_reg;
    wire [6:0] count1, count2;
    wire done;
    reg [21:0] temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8; 
    

//reg start = 0;
	//assign y_reg = y;
	 
    Counter_64 counter64 (
        .clk(clk), 
        .start(enable), 
        .reset(reset), 
        .count1(count1), 
        .count2(count2), 
        .done(done)
        );
   // always @ ( posedge read_strobe ) start <= 1;
   // always @ ( posedge clk ) begin if ( done ) start <= 0; end
    
    initial//always @ ( posedge enable )
    begin
        temp1 <= 0; temp2 <= 0; temp3 <= 0; temp4 <= 0;
        temp5 <= 0; temp6 <= 0; temp7 <= 0; temp8 <= 0;
        BR_count <= -1;
        addr <= -1;
    end
    
   /* always @(posedge clk)
    begin
    if(reset)
        BR_count <= 0;
    else if (done)
        BR_count <= BR_count + 1;
    else if((BR_count == 7) && ((count1 == 63) && ((count2 % 8) == 7)))
        begin
             BR_count <= 0;
        end
    end    
      */
    always @(posedge clk)
    begin 
        if(enable && (count2 % 8) == 7)
            case(count1)
                8  : 	begin if(count2 == 7)
                        begin
                            z <= temp1;
                            mx_done <= 1;
                            addr <= 0;
                            if ((BR_count == 7) && (addr == 63)) BR_count <= 0;
                            else if (addr == 63) BR_count <= BR_count + 1;
                            else BR_count <= BR_count;
                         end else
                         begin
                         z <= temp1;
                         mx_done <= 1;
                         addr <= addr + 1;
                         end end
                16 : 	begin z <= temp2; mx_done <= 2; addr <= addr + 1; end
                24 : 	begin z <= temp3; mx_done <= 3; addr <= addr + 1; end
                32 : 	begin z <= temp4; mx_done <= 4; addr <= addr + 1; end
                40 : 	begin z <= temp5; mx_done <= 5; addr <= addr + 1; end
                48 : 	begin z <= temp6; mx_done <= 6; addr <= addr + 1; end
                56 : 	begin z <= temp7; mx_done <= 7; addr <= addr + 1; end
                64 : 	begin z <= temp8; mx_done <= 8; addr <= addr + 1; end
                default begin z <= -1;    mx_done <= 0; addr <= addr; end
            endcase
		else mx_done <= 0;
    end  
    
    always @ (posedge clk)
    begin
		 if(reset || ((count1 == 64) && ((count2 % 8) == 7)))
		 begin 
			//mx_done <= 0;
            temp1 <= 0; temp2 <= 0; temp3 <= 0; temp4 <= 0;
            temp5 <= 0; temp6 <= 0; temp7 <= 0; temp8 <= 0; 
		 end
		 else if(enable && read_strobe) begin
           if(count1 <  8 && temp1 < y)
                temp1 <= y;
           if(count1 >= 8 && count1  < 16 && temp2 < y)
                temp2 <= y;
           if(count1 >= 16 && count1 < 24 && temp3 < y)
                temp3 <= y;
           if(count1 >= 24 && count1 < 32 && temp4 < y)
                temp4 <= y;      
           if(count1 >= 32 && count1 < 40 && temp5 < y)
                temp5 <= y;
           if(count1 >= 40 && count1 < 48 && temp6 < y)
                temp6 <= y;
           if(count1 >= 48 && count1 < 56 && temp7 < y)
                temp7 <= y;  
           if(count1 >= 56 && count1 < 64 && temp8 < y)
                temp8 <= y;
		 end
    end     
        
endmodule
