module data_rate( clock, reset, trigger, output_data_rate );
input clock, reset;
input trigger;
output reg output_data_rate;

reg[399:0] state;
reg[15:0] counter;
reg[7:0] data1;
reg[7:0] data2;
reg[7:0] data3;
reg[7:0] data4;
reg[7:0] data5;
reg[7:0] data6;
reg[7:0] data7;
reg[7:0] data8;
reg[7:0] data9;
reg[7:0] data10;

always @(posedge clock or negedge reset)
begin
    if (!reset)
    begin
        output_data_rate <= 0;
        
        data1 <= #1 8'b10000000;
        data2 <= #1 8'b00000000;
        data3 <= #1 8'b00010001;
        data4 <= #1 8'b10011101;
        data5 <= #1 8'b01111000;
        data6 <= #1 8'b10010000;
        data7 <= #1 8'b10111101;
        data8 <= #1 8'b11011011;
        data9 <= #1 8'b11010011;
        data10 <= #1 8'b10001101;
 
        state[399:0] <= {data2,data2,data2,data2,data2, data1,data2,data2,data2,data2, data2,data2,data2,data2,data2, data2,data2,data2,data2,data2, data2,data2,data2,data2,data2, data2,data2,data2,data2,data2, data2,data2,data2,data2,data2, data2,data2,data2,data2,data2, data2,data2,data2,data2,data2, data2,data2,data2,data2,data2}; 
        
        counter <= 0;
    end
    else if (trigger)
    begin
        if (counter==16'd0)
        begin
            counter <= counter+1;
            state <= {state[398:0],state[399]};
            output_data_rate <= state[399];
        end
        else
        begin
            counter <= counter + 1;
            if (counter==16'd49)
                counter <= 0;
        end
    end
    else
    begin
        output_data_rate <= 0;

        state[399:0] <= {data1,data2,data2,data2,data2, data2,data2,data2,data2,data2, data2,data2,data2,data2,data2, data2,data2,data2,data2,data2, data2,data2,data2,data2,data2, data2,data2,data2,data2,data2, data2,data2,data2,data2,data2, data2,data2,data2,data2,data2, data2,data2,data2,data2,data2, data2,data2,data2,data2,data2}; 
        
        counter <= 0;
    end
end

endmodule