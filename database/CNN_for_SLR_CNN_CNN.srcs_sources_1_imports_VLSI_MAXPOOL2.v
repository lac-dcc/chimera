// This program was cloned from: https://github.com/ilaydayaman/CNN_for_SLR
// License: BSD 2-Clause "Simplified" License

`timescale 1ns / 1ps

module MAXPOOL2(
    input  [35:0] mx2_input,
    input  clk,
    input  enable,
    input  reset,
    input  read_strobe,
	output reg [1:0]  mx2_done,
	output reg [3:0]  mx2_count =1'b0, // muhtemelen degismesi gerekecek
    output reg [35:0] mx2_output
    );
    
	wire [35:0] mx2_input_reg;
    wire [3:0] count1, count2; //bitleri degisecek
    wire done;
    reg [35:0] temp1 = 35'd0, temp2 = 35'd0;
    //reg start = 1'b0;
	 
	assign mx2_input_reg = mx2_input;
	 
    counter_8 counter8 ( // 8 e çevirilecek
        .clk(clk), 
        .start(enable), 
        .reset(reset), 
        .count1(count1), 
        .count2(count2), 
        .done(done)
        );
        
    //always @ ( posedge read_strobe ) if(enable) start <= 1;
    //always @ ( posedge clk ) begin if ( done ) start <= 0; end

    always @(posedge clk)
    begin
    if(reset)
        mx2_count <= 0;
    else if (done)
        mx2_count <= mx2_count + 1;
    else if((mx2_count % 4) == 0 )
        mx2_count <= 0;
    end    
      
    always @(posedge clk)
    begin 
        if(enable && (( count2 == 3 )|( count2 == 7 )))
			begin
			if(count1 == 4)
				begin mx2_output <= temp1; mx2_done <= 1; end
			else if(count1 == 8)
				begin mx2_output <= temp2; mx2_done <= 2; end
			else 
				begin mx2_output <= -1;    mx2_done <= 0; end
			end
		else  mx2_done <= 0;
    end  
    
    always @ (posedge clk)
    begin
		 if(reset || (mx2_done == 2))
		 begin 
			//mx_done <= 0;
            temp1 <= 0; temp2 <= 0;  
		 end
		 else if(read_strobe && enable) begin
           if(count1 <  4 && temp1 < mx2_input_reg)
                temp1 <= mx2_input_reg;
           if(count1 >= 4 && count1  < 8 && temp2 < mx2_input_reg)
                temp2 <= mx2_input_reg;
		 end
    end     
        
endmodule
