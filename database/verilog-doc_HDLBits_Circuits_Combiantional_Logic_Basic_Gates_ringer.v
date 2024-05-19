// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
    always @(*) begin
        ringer = 0;
        motor = 0;
        if(ring == 1) begin
            if(vibrate_mode == 1) begin
                motor = 1;
            end
            else begin
                ringer = 1;
                motor = 0;
            end
        end
        else begin
            ringer = 0;
            motor = 0;
        end
    end
endmodule

