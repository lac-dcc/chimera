// This program was cloned from: https://github.com/Aman-Pani/PROJECTS
// License: MIT License

module traffic_signal(input clk,rst,output reg [2:0] N,E,S,W);
  reg [4:0] temp;
  parameter s_N = 2'b00, s_E = 2'b01, s_S = 2'b10, s_W = 2'b11;
  always@( posedge clk, rst , temp[2] ) begin
    if (rst) begin
      {N,E,S,W} <= 0 ;
      temp = 5'b00000 ;
    end
  else  begin
    case (temp[4:3])   
      s_N  : begin 
                E  <= 3'b100;   //100 red
                S  <= 3'b100;
                W  <= 3'b100;
       case (temp[2:0])
         0 : begin     N <= 3'b001; temp[2:0] <= 3'b010;end	//001 yellow
         2 : begin  #5 N <= 3'b010; temp[2:0] <= 3'b100;end	//010 green
       endcase
        if (temp[2:0] == 3'b100) temp <= 5'b01001; end

      s_E  : begin 
             #1 N  <= 3'b100;
                S  <= 3'b100;
                W  <= 3'b100;
        case (temp[2:0])
           1 : begin    E <= 3'b001; temp[2:0] <= 3'b010;end
           2 : begin #5 E <= 3'b010; temp[2:0] <= 3'b100;end
        endcase
        if (temp[2:0] == 3'b100) temp <= 5'b10001; end

      s_S : begin  
               N  <= 3'b100;
            #1 E  <= 3'b100;
               W  <= 3'b100;
        case (temp[2:0])
           1 : begin    S <= 3'b001; temp[2:0] <= 3'b010;end
           2 : begin #5 S <= 3'b010; temp[2:0] <= 3'b100;end
        endcase
        if (temp[2:0] == 3'b100) temp <= 5'b11001; end      

      s_W  : begin
                N  <= 3'b100;
             #1 S  <= 3'b100;
                E  <= 3'b100;
        case (temp[2:0])
           1 : begin    W <= 3'b001; temp[2:0] <= 3'b010;end
           2 : begin #5 W <= 3'b010; temp[2:0] <= 3'b100;end
        endcase
        if (temp[2:0] == 3'b100) temp <= 5'b00000; end   
      endcase
  	end
  end
endmodule