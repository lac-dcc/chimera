module trigger_signal_gen( clock, reset, output_trigger_signal );
input clock, reset;
output output_trigger_signal;

reg[15:0] counter;
reg output_trigger_signal_gen;

always @(posedge clock or negedge reset)
begin
    if (!reset)
    begin
        counter <= 8'h00;
        output_trigger_signal_gen <= 1'h0;
    end
    else
    begin
        counter <= counter+1'h1;
        if (counter<=16'hFFF0)
            output_trigger_signal_gen <= 1'h0;
        else if (counter<=16'hFFFE)
            output_trigger_signal_gen <= 1'h1;
        else
        begin
            output_trigger_signal_gen <= 1'h0;
            counter <= 16'h0000;
        end
    end
end

assign output_trigger_signal = output_trigger_signal_gen;

endmodule

