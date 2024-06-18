// This program was cloned from: https://github.com/huangxc6/Software_Hardware_Co-Design_24Spring
// License: MIT License


`define CYCLES 100000000

module blinky_choice(
    input  clk,
    input  rst_n,
    input  [3:0] sw,
    output reg led,
    output reg [31:0]  led_count
);

    
    wire [31:0]  counter_choice;
    assign counter_choice = (sw+1) * `CYCLES;
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            led_count <= 0;
            led <= 1'b0;
        end
        else begin
            if(led_count == counter_choice - 1)begin
                led_count <= 32'd0;
                led 	<= 	~led; 
            end
            else begin
                led_count <= led_count + 32'd1;
            end
        end
    end
    

endmodule