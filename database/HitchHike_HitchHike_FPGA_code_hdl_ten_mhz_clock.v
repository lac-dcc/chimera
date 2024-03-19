module ten_mhz_clock( clock_in, reset, clock_out );
input clock_in, reset;
output reg clock_out;

reg[11:0] counter;

always @(posedge clock_in or negedge reset)
begin
    if (!reset)
    begin
        counter <= 0;
        clock_out <= 0;
    end
    else
    begin
        if (counter==12'h004)
        begin
            counter <= 0;
            clock_out <= ~clock_out;
        end
        else
        begin
            counter <= counter+1;
            clock_out <= clock_out;
        end
    end
end

endmodule
