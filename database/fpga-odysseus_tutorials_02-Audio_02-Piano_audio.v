module audio(
    input clk_25mhz,
    output wifi_gpio0,
    input [6:0] btn,
    output reg [3:0] audio_l,
    output reg [3:0] audio_r);

parameter TONE_A4 = 25000000/440/2;
parameter TONE_B4 = 25000000/494/2;
parameter TONE_C5 = 25000000/523/2;
parameter TONE_D5 = 25000000/587/2;
parameter TONE_E5 = 25000000/659/2;
parameter TONE_F5 = 25000000/698/2;
parameter TONE_G5 = 25000000/783/2;

reg [25:0] counter;
initial 
begin
    audio_l = 0;
    audio_r = 0;  
    counter = 0;
end

always @(posedge clk_25mhz) 
    if(counter==26'b0) counter <= (btn[6] ? TONE_A4-1 : 
                               btn[5] ? TONE_B4-1 : 
                               btn[4] ? TONE_C5-1 : 
                               btn[3] ? TONE_D5-1 : 
                               btn[2] ? TONE_E5-1 : 
                               btn[1] ? TONE_F5-1 : 
                               0); else counter <= counter-1;

always @(posedge clk_25mhz) 
    if(counter==0)
    begin
        audio_l <= ~audio_l;
        audio_r <= ~audio_r;
    end

assign wifi_gpio0 = 1'b1;
endmodule
