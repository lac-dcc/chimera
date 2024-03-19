module whitening( clock, reset, input_data, trigger, output_whitening );
input clock, reset;
input trigger;
input input_data;
output reg output_whitening;

reg[15:0] counter;
reg[6:0] state;

always @(posedge clock or negedge reset)
begin
    if (!reset)
    begin
        counter <= 0;
        state[0] <= 0;
        state[1] <= 0;
        state[2] <= 0;
        state[3] <= 0;
        state[4] <= 0;
        state[5] <= 0;
        state[6] <= 0;
    end
    else if (trigger)
    begin
        if (counter==16'd0)
        begin
            counter <= counter+1;
            state[6] <= state[5];
            state[5] <= state[4];
            state[4] <= state[3];
            state[3] <= state[2];
            state[2] <= state[1];
            state[1] <= state[0];
            state[0] <= input_data;
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
        counter <= 0;
        state[0] <= 0;
        state[1] <= 0;
        state[2] <= 0;
        state[3] <= 0;
        state[4] <= 0;
        state[5] <= 0;
        state[6] <= 0;
    end
end

reg[15:0] output_counter;

always @(negedge clock or negedge reset)
begin
    if (!reset)
    begin
        output_whitening <= 0;
        output_counter <= 0;
    end
    else if (trigger)
    begin
        if (output_counter==16'd0)
        begin
            output_counter <= output_counter+1;
            output_whitening <= input_data ^ state[6] ^ state[3];
        end
        else
        begin
            output_counter <= output_counter + 1;
            if (output_counter==16'd49)
                output_counter <= 0;
        end
    end
    else
    begin
        output_whitening <= 0;
    end
end

endmodule

