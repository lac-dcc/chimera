// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0


`default_nettype none

module user_module_341631485498884690(
  input [7:0] io_in,
  output [7:0] io_out
);

TrainLED LED1 (
    .clk(io_in[0]),
    .rst(io_in[1]),
    .din(io_in[2]),
    .dout(io_out[0]),
    .led1(io_out[1]),
    .led2(io_out[2]),
    .led3(io_out[3])
    );

endmodule


module TrainLED(clk,rst,din,dout,led1,led2,led3);

input clk,rst,din;
output dout;
output led1,led2,led3;

reg [3:0] finecount;
reg outdff;
reg [11:00] shiftregister;
reg [11:00] shiftlatch;
reg [3:0] bitcount;
reg [7:0] resetcount;
reg [3:0] pwmcounter;
reg [1:0] mode;  // 0=receive, 1=forward, 2=reset

PWMEngine PWM1 (.clk(clk),.rst(rst),.counter(pwmcounter),.PW_in(shiftlatch[3:0]),.led(led1));
PWMEngine PWM2 (.clk(clk),.rst(rst),.counter(pwmcounter),.PW_in(shiftlatch[7:4]),.led(led2));
PWMEngine PWM3 (.clk(clk),.rst(rst),.counter(pwmcounter),.PW_in(shiftlatch[11:8]),.led(led3));

    always @(posedge clk)
        if (rst) begin
            finecount <= 0;
            outdff <= 0;
            shiftregister <= 0;
            bitcount <= 0;
            mode <= 0;
            pwmcounter <=0;
            resetcount <=0;
        end
        else begin
            // PWM mastercounter
            pwmcounter <= pwmcounter + 1'b1;

            // data recovery
            if ((finecount < 4'b1011) && (finecount >= 4'b0010))
                    finecount <= finecount + 1'b1;
            else 
                if (din && (finecount < 4'b0010))
                    finecount <= finecount + 1'b1;
                else
                    if (~din)
                        finecount <= 0;

            // state machine
            if (mode == 2'b00) begin          
                // handle data store (mode=0, receive)
                if (finecount == 4'b0110) begin
                    shiftregister <= {shiftregister[10:0], din};
                    bitcount <= bitcount + 1'b1;
                    if (bitcount == 4'b1011)
                        mode <= 2'b01;        
                end
                outdff <= 1'b0;
            end
            else // mode reset
                if ((mode == 2'b10) && (finecount == 4'b0010)) begin
                    mode <= 2'b00;
                    bitcount <= 4'b0000;
                end 
                else begin    
                    // handle data out (forward)        
                    case(finecount)
                        4'b0010: outdff <= 1'b1; 
                        4'b0110: outdff <= din;
                        4'b1010: outdff <= 1'b0;
                    endcase;
                    end

            // Handle reset. 
            // Resetcounter is increased while no bits arrive
            if (finecount <= 4'b0010) begin
                resetcount <= resetcount + 1'b1;
                if (resetcount == 8'd96) begin  // reset after 8 bit times
                    mode <= 2'b10;
                end
            end 
            else 
                resetcount <= 0;
        end

    // Handle PWMlatch
    always@(*)
        if (clk && (pwmcounter == 4'b1111) && (bitcount == 4'b1100) && (mode == 2'b10) ) begin
            shiftlatch <= shiftregister;
        end 

assign dout = outdff;

endmodule

module PWMEngine(clk,rst,PW_in,counter,led);

input [3:0] PW_in;   // 
input [3:0] counter;   // 
input clk;
input rst;
output led;

reg LEDdff;

	always @(posedge clk)
		if (rst) begin
            LEDdff <= 0;
		end
		else begin

            if (counter == PW_in)
                LEDdff <= 1'b0;
            else if (counter == 0)
                LEDdff <= 1'b1;
        end

assign led = LEDdff;

endmodule
