module data_dqpsk_generator( clock, reset, trigger, data_output );
input clock, reset, trigger;
output reg[1:0] data_output;

reg preamble;
reg[7:0] counter;

always @(posedge clock or negedge reset)
begin
    if (!reset)
    begin
        data_output <= 0;
        preamble <= 1;
        counter <= 0;
    end
    else
    begin
        if (trigger==1'b1)
        begin
            if (preamble==1)
            begin
                counter <= counter+1;
                if (counter==8'hA)
                begin
                    data_output <= 2'h1;
                    preamble <= 0;
                    counter <= 0;
                end
                else
                    data_output <= 2'h1;
            end
            else
            begin
                counter <= counter+1;
                if (counter==8'h0)
                    data_output <= 2'h3;
                else if (counter==8'h1)
                    data_output <= 2'h3;
                else if (counter==8'h2)
                    data_output <= 2'h3;
                else if (counter==8'h3)
                begin
                    data_output <= 2'h3;
                    counter <= 0;
                end
            end
        end
        else
        begin
            preamble <= 1;
            counter <= 0;
            data_output <= 2'h0;
        end
    end
end

endmodule

