// This program was cloned from: https://github.com/huangxc6/Software_Hardware_Co-Design_24Spring
// License: MIT License

module blinky_choice#
(
    parameter CLK_FREQ  = 100000000,
    parameter SW_WIDTH  = 4,
    parameter LED_WIDTH = 1
)(
    input  clk,
    input  rst_n,
    input  [SW_WIDTH-1:0] sw,
    output reg [LED_WIDTH-1:0] led,
    output reg [31:0]  led_count
);

    
    wire [31:0]  counter_choice;
    assign counter_choice = (sw+1) * CLK_FREQ;
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            led_count <= 0;
            led <= 0;
        end
        else begin
            if(led_count == counter_choice - 1)begin
                led_count <= 32'd0;
                led 	<= 	led + 1; 
            end
            else begin
                led_count <= led_count + 32'd1;
            end
        end
    end
    

endmodule