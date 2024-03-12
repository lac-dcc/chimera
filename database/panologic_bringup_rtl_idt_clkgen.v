


module idt_clkgen(
    input wire      osc_clk,
    input wire      osc_reset_,

    output wire     idt_iclk,

    output reg      idt_sclk,     
    output reg      idt_data,     
    output reg      idt_strobe     
    );

    reg [6:0] idt_cntr;
    always @(posedge osc_clk) begin
        if (&idt_cntr != 1'b1) begin
            idt_cntr <= idt_cntr + 1;
        end

        if (!osc_reset_)
            idt_cntr <= 0;
    end

    wire [2:0] idt_s;
    wire [1:0] idt_f;
    wire       idt_ttl;
    wire [1:0] idt_c;

`include "video_timings.v"

    assign idt_s   = 3'b001;    // CLK1 output divide = 2

    assign idt_f   = 2'b10;     // CLK2 = OFF
    assign idt_ttl = 1'b1;      // Measure duty cycles at VDD/2
    assign idt_c   = 2'b00;     // Use clock as ref instead of Xtal

    wire [23:0] idt_config;
    assign idt_config = { idt_c, idt_ttl, idt_f, idt_s, idt_v, idt_r };

    reg [23:0] idt_config_reverse;
    integer i;
    always @(*)
        for(i=0;i<24;i=i+1)
            idt_config_reverse[23-i] = idt_config[i];

    always @(posedge osc_clk or negedge osc_reset_) 
    begin
        idt_sclk    <= (idt_cntr < 48) & idt_cntr[0];
        idt_data    <= idt_cntr < 48 ? idt_config_reverse[idt_cntr[5:1]] : 1'b0;
        idt_strobe  <= idt_cntr[5:1] == 31;

        if (!osc_reset_) begin
            idt_sclk    <= 1'b0;
            idt_data    <= 1'b0;
            idt_strobe  <= 1'b0;
        end
    end

    assign idt_iclk = osc_clk;

endmodule
