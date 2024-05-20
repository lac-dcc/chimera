// This program was cloned from: https://github.com/HUZAIFA-TARIQ/GIKI-TapeOut-2
// License: Apache License 2.0

`timescale 1ns / 1ps



module DigitalClock(
    input clk, rst,
//  input up_down,
    output [7:0] ssd_display,//uo_out
    output reg [5:0] anode,//uio_out[7:2]
    input wire [7:0] value_set_register,          // Value set register input             
    input wire [1:0] value_set_selection    //uio_in[0] and uio_in[1]
);

/* 
output wire [7:0] uio_oe,
uio_oe = 8'b11111100;
*/


//    reg [6:0] counter_99;
    wire CLK_1hz;
    wire CLK_1000hz;
    slow_clock uut(
        .clk(clk),
        .clk_1hz(CLK_1hz),
        .clk_1000hz(CLK_1000hz)
    );

    reg [3:0] BCD;
    reg [3:0] sec_right;
    reg [3:0] sec_left;
    reg [3:0] min_right;
    reg [3:0] min_left;
    reg [3:0] hour_right;
    reg [3:0] hour_left;
    
    always@(posedge CLK_1hz or negedge rst)
    begin 
        if (!rst)
        begin
            sec_right           <=0;
            sec_left            <=0;
            min_right           <=0;
            min_left            <=0;
            hour_right          <=0;
            hour_left           <=0;
        end
        else if (value_set_selection == 2'b01) begin
            if (value_set_register[7:4] > 5 && value_set_register[3:0] > 9)begin
            min_left <= 0;
            min_right <= 0; 
            end
            else if (value_set_register[7:4] <= 5 && value_set_register[3:0] > 9)begin
            min_left <= value_set_register[7:4];
            min_right <= 0; 
            end
            else if (value_set_register[7:4] > 5 && value_set_register[3:0] <= 9)begin
            min_left <= 0;
            min_right <= value_set_register[3:0]; 
            end
            else
            min_left <= value_set_register[7:4];
            min_right <= value_set_register[3:0]; 
        end 
        else if (value_set_selection == 2'b10) 
        begin
            if (value_set_register[7:4] > 2 && value_set_register[3:0] > 4)begin
            hour_left <= 0;
            hour_right <= 0;
            end
           // else if (value_set_register[7:4] <= 2 && value_set_register[3:0] > 9)begin
           // hour_left <= value_set_register[7:4];
           // hour_right <= 0;
           // end
            else if (value_set_register[7:4] > 2 && value_set_register[3:0] <= 4)begin
            hour_left <= 0;
            hour_right <= value_set_register[3:0];
            end
            else if (value_set_register[7:4] <= 2 && value_set_register[3:0] > 4)begin
            hour_left <= value_set_register[7:4];
            hour_right <= 0;
            end                    
            else
                hour_left <= value_set_register[7:4];
                hour_right <= value_set_register[3:0];
        // If no condition of "Set hours and minutes based on value_set_selection" is met, then increment hours, minutes, and seconds
        end
        else if (value_set_selection == 2'b11) 
        begin
            if (value_set_register[7:4] > 5 && value_set_register[3:0] > 9)begin
            sec_left <= 0;
            sec_right <= 0;
            end
            else if (value_set_register[7:4] <= 5 && value_set_register[3:0] >9)begin
            sec_left <= value_set_register[7:4];
            sec_right <= 0;
            end
            else if (value_set_register[7:4] > 5 && value_set_register[3:0] <= 9)begin
            sec_left <= 0;
            sec_right <= value_set_register[3:0];
            end
            else
            sec_left <= value_set_register[7:4];
            sec_right <= value_set_register[3:0];
        // If no condition of "Set hours and minutes based on value_set_selection" is met, then increment hours, minutes, and seconds
        end        
        else begin
                if (sec_right >= 9) begin
                    sec_right <= 0;
                    if (sec_left >= 5) begin
                        sec_left <= 0;
                        if (min_right >= 9) begin
                            min_right <= 0;
                            if (min_left >= 5) begin
                                min_left <= 0;
                                if (hour_right >= 9 && hour_left >= 0 && hour_right >= 9) begin
                                    hour_right <= 0;
                                    hour_left <= 1;
                                end
                                else if (hour_left == 1 && hour_right >= 9) begin
                                    hour_right <= 0;
                                    hour_left <= 2;
                                end
                                else if (hour_left >= 2 && hour_right >= 3) begin
                                    hour_right <= 0;
                                    hour_left <= 0;
                                end
                                else begin
                                    hour_right <= hour_right + 1;
                                end
                            end
                            else begin
                                min_left <= min_left + 1;
                            end
                        end
                        else begin
                            min_right <= min_right + 1;
                        end
                    end
                    else begin
                        sec_left <= sec_left + 1;
                    end
                end
                else begin
                    if(sec_right >= 9) 
                    sec_right <=0;
                    else
                    sec_right <= sec_right + 1;
                end
            end
        end     
 /*      else if(sec_right == 9)
        begin
            sec_right           <= 0;
            sec_left            <= sec_left + 1;
        end
        else if(sec_left > 5)
        begin
            sec_left           <= 0;
            min_right          <= min_right + 1;
        end


        else if(min_right == 9)
        begin
            min_right           <= 0;
            min_left            <= min_left + 1;
        end
        else if(min_left > 5)
        begin
            min_left            <= 0;
            hour_right          <= hour_right + 1;
        end       


        else if(hour_right == 9)
        begin
            hour_right          <= 0;
            hour_left           <= hour_left + 1;
        end  
        else if(hour_left == 2 & hour_right > 3)
        begin
            hour_left           <= 0;
            hour_right          <= 0;                
        end  

            
        else
            sec_right           <= sec_right + 1;
    end
*/    
    reg [17:0]clk_1000hz;
    always @ (posedge clk or negedge rst)
    begin
      if (!rst)
            clk_1000hz <= 0;
      else
            clk_1000hz <= clk_1000hz + 1;
   end

    always@(*)
    begin
        case(clk_1000hz[17:15])
        0: begin 
           BCD <= sec_right; 
           anode <= 8'b11111110; 
           end
        1: begin 
           BCD <= sec_left; 
           anode <= 8'b11111101; 
           end
        2: begin 
           BCD <= min_right; 
           anode <= 8'b11111011; 
           end
        3: begin 
           BCD <= min_left; 
           anode <= 8'b11110111; 
           end
        4: begin 
           BCD <= hour_right; 
           anode <= 8'b11101111; 
           end
        5: begin 
           BCD <= hour_left; 
           anode <= 8'b11011111; 
           end
        6: begin 
           BCD <= 10; 
           anode <= 8'b10111111; 
           end                               
        7: begin 
           BCD <= 10; 
           anode <= 8'b0111111; 
           end
        
        endcase
    end
    
    bcd_to_SSG dut(
        .BCD(BCD),
        .SSD(ssd_display)
    );

endmodule
