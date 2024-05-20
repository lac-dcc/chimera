// This program was cloned from: https://github.com/mbalestrini/tt06_usb_cdc_devices
// License: Apache License 2.0

`default_nettype none

module input_debouncer #(
    parameter DEBOUNCE_HIST = 2
)(
    input wire clk_i,
    input wire rstn_i,
    input wire beat_1ms_i,
    input wire input_i,
    output reg output_o
);

reg [DEBOUNCE_HIST-1:0] history;


always @(posedge clk_i) begin
    if(~rstn_i) begin
        history <= {DEBOUNCE_HIST{1'b0}};
        output_o <= 0;
    end else begin
        if(beat_1ms_i) begin            
            if(history=={DEBOUNCE_HIST{1'b0}}) 
                output_o <= 0;
            else if(history=={DEBOUNCE_HIST{1'b1}}) 
                output_o <= 1;
            history <= {history[DEBOUNCE_HIST-2:0], input_i};
        end
    end    
end

endmodule
