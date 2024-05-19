// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License

module Segdisp(
    input           clk,
    input           rstn,
    input   [4:0]   data_in,
    output  [5:0]   seg_sel,
    output  [7:0]   seg_led
);

wire clk_1ms;
clk_division #(
    .DIVCLK_CNTMAX(24_999)
)
sel_clk_division (
     .clk_in(clk)
    ,.rstn(rstn)
    ,.divclk(clk_1ms)
);

wire [2:0] bit_disp;
counter sel_counter(
     .clk(clk_1ms)
    ,.rstn(rstn)
    ,.cnt(bit_disp)
);

wire [23:0] data_nxt;
wire en;
reg  [23:0] data;

assign data_nxt = {data[19:0],data_in[3:0]};
assign en = data_in[4];
always @(posedge clk) begin
    if (!rstn) begin
        data <= 24'b0;
    end else begin
        if (en) begin
            data <= data_nxt;       
        end        
    end
end

wire [3:0] data_disp;
Mux Mux(
     .sel(bit_disp)
    ,.dina(data[3:0])
    ,.dinb(data[7:4])
    ,.dinc(data[11:8])
    ,.dind(data[15:12])
    ,.dine(data[19:16])
    ,.dinf(data[23:20])
    ,.data_out(data_disp)
);

seg_sel_decoder seg_sel_decoder(
    .bit_disp(bit_disp),
    .seg_sel(seg_sel)
);

seg_led_decoder seg_led_decoder(
    .data_disp(data_disp),
    .seg_led(seg_led)
);
endmodule