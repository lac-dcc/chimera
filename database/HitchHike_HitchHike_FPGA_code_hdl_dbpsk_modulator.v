module dbpsk_modulator( clock, reset, input_data, trigger, output_dbpsk);
input clock, reset;
input trigger;
input input_data;
output reg output_dbpsk;

reg[15:0] counter;

always @(posedge clock or negedge reset)
begin
    if (!reset)
    begin
        output_dbpsk <= 0;
        counter <= 0;
    end
    else if (trigger)
    begin
        if (counter==16'd0)
        begin
            counter <= counter+1;
            if (input_data==0)
                output_dbpsk <= output_dbpsk;
            else
                output_dbpsk <= ~output_dbpsk;
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
        output_dbpsk <= 0;
        counter <= 0;
    end
end

endmodule

