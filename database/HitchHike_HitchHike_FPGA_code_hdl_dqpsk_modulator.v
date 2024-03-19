module dqpsk_modulator( clock, reset, data_input, state);
input clock, reset;
input[1:0] data_input;
output reg[1:0] state;

always @(posedge clock or negedge reset)
begin
    if (!reset)
    begin
        state <= 0;
    end
    else
    begin
        if (data_input==2'h0)
        begin
            if (state==2'h0)
                state <= 2'h0;
            else if (state==2'h1)
                state <= 2'h1;
            else if (state==2'h2)
                state <= 2'h2;
            else if (state==2'h3)
                state <= 2'h3;
        end
        else if (data_input==2'h1)
        begin
            if (state==2'h0)
                state <= 2'h1;
            else if (state==2'h1)
                state <= 2'h2;
            else if (state==2'h2)
                state <= 2'h3;
            else if (state==2'h3)
                state <= 2'h0;
        end
        else if (data_input==2'h2)
        begin
            if (state==2'h0)
                state <= 2'h2;
            else if (state==2'h1)
                state <= 2'h3;
            else if (state==2'h2)
                state <= 2'h0;
            else if (state==2'h3)
                state <= 2'h1;
        end
        else if (data_input==2'h3)
        begin
            if (state==2'h0)
                state <= 2'h3;
            else if (state==2'h1)
                state <= 2'h0;
            else if (state==2'h2)
                state <= 2'h1;
            else if (state==2'h3)
                state <= 2'h2;
        end
    end
end

endmodule

