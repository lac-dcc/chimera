module phaser_modulator( clock, reset, trigger_signal, state_input, phase_signal_output );
input clock, reset;
input trigger_signal;
input[1:0] state_input;
output reg[3:0] phase_signal_output;

reg state;
reg tag_test;


always @(posedge clock or negedge reset)
begin
    if (!reset)
    begin
        phase_signal_output <= 0;
        state <= 0;
        tag_test <= 1;
    end
    else
    begin
        if (trigger_signal==1'b0)
        begin
            if (state==1'b0)
            begin
                if (tag_test==0)
                    //phase_signal_output <= 4'h0;
                    phase_signal_output <= 4'h2;
                else
                    phase_signal_output <= 4'h1;
                state <= 1'b1;
            end
            else if (state==1'b1)
            begin
                if (tag_test==0)
                    //phase_signal_output <= 4'h8;
                    phase_signal_output <= 4'hA;
                else
                    phase_signal_output <= 4'h5;
                state <= 1'b0;
            end
        end
        else if (trigger_signal==1'b1)
        begin
            if (state_input==2'h0)
            begin
                if (state==1'b0)
                begin
                    if (tag_test==0)
                        //phase_signal_output <= 4'h0;
                        phase_signal_output <= 4'h2;
                    else
                        phase_signal_output <= 4'h1;
                    state <= 1'b1;
                end
                else if (state==1'b1)
                begin
                    if (tag_test==0)
                        //phase_signal_output <= 4'h8;
                        phase_signal_output <= 4'hA;
                    else
                        phase_signal_output <= 4'h5;
                    state <= 1'b0;
                end
            end
            else if (state_input==2'h1)
            begin
                if (state==1'b0)
                begin
                    if (tag_test==0)
                        //phase_signal_output <= 4'h4;
                        phase_signal_output <= 4'h6;
                    else
                        phase_signal_output <= 4'h3;
                    state <= 1'b1;
                end
                else if (state==1'b1)
                begin
                    if (tag_test==0)
                        //phase_signal_output <= 4'hC;
                        phase_signal_output <= 4'hE;
                    else
                        phase_signal_output <= 4'h7;
                    state <= 1'b0;
                end
            end
            else if (state_input==2'h2)
            begin
                if (state==1'b0)
                begin
                    if (tag_test==0)
                        //phase_signal_output <= 4'h8;
                        phase_signal_output <= 4'hA;
                    else
                        phase_signal_output <= 4'h5;
                    state <= 1'b1;
                end
                else if (state==1'b1)
                begin
                    if (tag_test==0)
                        //phase_signal_output <= 4'h0;
                        phase_signal_output <= 4'h2;
                    else
                        phase_signal_output <= 4'h1;
                    state <= 1'b0;
                end
            end
            else if (state_input==2'h3)
            begin
                if (state==1'b0)
                begin
                    if (tag_test==0)
                        //phase_signal_output <= 4'hC;
                        phase_signal_output <= 4'hE;
                    else
                        phase_signal_output <= 4'h7;
                    state <= 1'b1;
                end
                else if (state==1'b1)
                begin
                    if (tag_test==0)
                        //phase_signal_output <= 4'h4;
                        phase_signal_output <= 4'h6;
                    else
                        phase_signal_output <= 4'h3;
                    state <= 1'b0;
                end
            end
        end
    end
end

endmodule