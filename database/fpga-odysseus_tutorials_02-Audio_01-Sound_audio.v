module audio(
    input clk_25mhz,
    output wifi_gpio0,
    input [6:0] btn,
    output reg [3:0] audio_l,
    output reg [3:0] audio_r);

parameter TONE_A4 = 25000000/440/2;
parameter TONE_A5 = 25000000/880/2;

reg [25:0] counter;
initial 
begin
    audio_l = 0;
    audio_r = 0;  
    counter = 0;
end

reg [23:0] tone;
always @(posedge clk_25mhz) 
    tone <= tone+1;

always @(posedge clk_25mhz) 
    if(counter==26'b0) 
    begin
        counter <= (tone[23] ? TONE_A4-1 : TONE_A5-1 ); 
        audio_l <= ~audio_l;
        audio_r <= ~audio_r;
    end
    else 
        counter <= counter-1;

assign wifi_gpio0 = 1'b1;
endmodule
