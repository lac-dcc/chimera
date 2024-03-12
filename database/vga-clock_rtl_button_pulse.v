`default_nettype none
module button_pulse 
#(
    parameter MAX_COUNT = 8,    // max wait before issue next pulse
    parameter DEC_COUNT = 2,    // every pulse, decrement comparitor by this amount
    parameter MIN_COUNT = 1     // until reaches this wait time
)(
    input wire clk,
    input wire clk_en,
    input wire button,
    input wire reset,
    output wire pulse
);

    reg [$clog2(MAX_COUNT-1):0] comp;
    reg [$clog2(MAX_COUNT-1):0] count;

    assign pulse = (clk_en && button && count == 0);

    always @(posedge clk)
        if(reset) begin
            comp <= MAX_COUNT - 1;
            count <= 0;
        end else
        if(clk_en) begin
            if(button)
                count <= count + 1;

            // if button is held, increase pulse rate by reducing comp
            if(count == 0 && comp > (MIN_COUNT + DEC_COUNT)) begin
                comp <= comp - DEC_COUNT;
            end

            // reset counter
            if(count == comp)
                count <= 0;

            // if button is released, set count and comp to default
            if(!button) begin
                count <= 0;
                comp <= MAX_COUNT - 1;
            end
        end

    /*
    `ifdef FORMAL
        default clocking @(posedge clk); endclocking
        default disable iff (!clk_en);

        cover property (##1 $rose(pulse));
        cover property (comp < MAX_COUNT - 1);
        assert property (button |=> comp <= $past(comp));
        assert property (button && count != comp |=> count >= $past(count));
        assert property (button && count == 0 |-> pulse);
        assert property (pulse |=> !pulse);
    `endif
    */

endmodule
`default_nettype wire
