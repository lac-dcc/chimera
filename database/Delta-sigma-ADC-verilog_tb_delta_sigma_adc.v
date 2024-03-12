//~ `New testbench
`timescale  1ns / 1ps

module tb_delta_sigma_adc;

// delta_sigma_adc Parameters
parameter PERIOD = 10;
parameter W  = 16;
parameter N  = 1024;//量化位数

// delta_sigma_adc Inputs
reg   clk                                  = 0 ;
reg   rst_n                                = 0 ;
reg   signed [W-1:0]  din                  = -32768 ;

// delta_sigma_adc Outputs
wire  dout                                 ;
initial
begin
    forever #(PERIOD/2)  clk=~clk;
end
reg [31:0]cnt=0;
always@(posedge clk)begin
    
    if(cnt == N-1)
        cnt <= 'd0;
    else
        cnt <= cnt + 1;
    if(cnt == N-1)
        din <= din + 1000;
end
delta_sigma_adc #(
    .W ( W ))
 u_delta_sigma_adc (
    .clk                     ( clk            ),
    .rst_n                   ( rst_n          ),
    .din                     ( din    [W-1:0] ),

    .dout                    ( dout           )
);
initial
begin
    $dumpfile("wave.vcd");
    $dumpvars(0,tb_delta_sigma_adc);
    #(PERIOD*2) rst_n  =  1;
    #(PERIOD*N*80)//65536
    $finish;
end

endmodule
