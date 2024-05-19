// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    always @(*) begin
        if(fan_on == 1) begin
            fan = 1;
        end
        else begin
            fan = 0;
        end
        if(mode == 1) begin
            heater = mode;
            if(too_cold) begin
                heater = 1;
                fan = 1;
                aircon = 0;
            end
            else begin
                heater = 0;
                aircon = 0;
            end
        end
            else begin 
            if(too_hot) begin
                aircon = 1;
                fan = 1;
                heater = 0;
            end
            else begin
                aircon = 0;
                heater = 0;
            end
        end
    end
endmodule

