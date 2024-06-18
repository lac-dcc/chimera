// This program was cloned from: https://github.com/anik-m/hdlbits_for_verilog
// License: GNU General Public License v3.0

module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    parameter A=4'b0000,B=4'b0010,C=4'b0011,D=4'b0110,E=4'b0111,F=4'b1111;//(A,B..,F)=(0,1,..,5)
    reg [3:0] state, next_state;
    //reg [3:1] prev_values;
    always @(*) begin
        if(s==3'd7)
            next_state <= A;
        else if(s==3'd0)
            next_state <= F;
        else begin
            if(state ==A) next_state <= (s[2])? C:E;
            else if(state ==B) next_state <= (s[2])?B:E;
            else if(state ==C) next_state = (s==3)?C:E;
            else if(state ==D) next_state <= (s[2])?B:D;
            else if(state ==E) next_state = (s==3)?B:E;
            else if(state ==F) next_state = (s==3)?B:D;
        end
            
        //next_state[3] = ~(s[1]|s[2]|s[3]);
        //next_state[2] = ~(s[2]|s[3]);
        //next_state[1] = ~(s[1]&s[2]&s[3]);
        //next_state[0] = (prev_values>s)?1:0;
        //prev_values = s;
    end
    always @(posedge clk) begin    // This is a sequential always block
        // State flip-flops with synchronous reset
        if(reset) begin
            //s<=3'b000;
            state<=F;
            //prev_values<=3'b0;
        end else begin 
            //prev_values<=s;
            state<=next_state;
        end
    end
    assign {fr3,fr2,fr1,dfr} = state;    

endmodule
