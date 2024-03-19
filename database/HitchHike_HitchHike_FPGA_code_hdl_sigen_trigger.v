module sigen_trigger( clock, reset, trigger_input, trigger_output );
input clock, reset, trigger_input;
output reg trigger_output;

reg[15:0] clock_counter;
reg trigger_flag;

always @(posedge clock or negedge reset or posedge trigger_input)
begin
    if (~reset)
    begin
        trigger_output <= 0;
        clock_counter <= 0;
        trigger_flag <= 0;
    end
    else if (trigger_input)
    begin
        clock_counter <= 0;
        trigger_flag <= 1;
        trigger_output <= 1;
    end
    else
    begin
        if (trigger_flag==1'b1)
        begin
            clock_counter <= clock_counter+1;
            if (clock_counter==16'h0FA0)
            begin
                trigger_output <= 0;
                trigger_flag <= 0;
                clock_counter <= 0;
            end
        end
    end    
end

endmodule

