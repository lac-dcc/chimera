`timescale 1ns / 1ps

module tb_cookie #(
	parameter C_S_AXIS_DATA_WIDTH = 512,
	parameter C_S_AXIS_TUSER_WIDTH = 128
)
();
reg				                        clk;
reg				                        rst_n;

reg  [95:0]                             time_stamp;
wire [31:0]                             c_val;


//clk signal
localparam CYCLE = 10;

always begin
    #(CYCLE/2) clk = ~clk;
end

//reset signal
initial begin
    clk = 0;
    rst_n = 1;
    #(10);
    rst_n = 0; //reset all the values
    #(10);
    rst_n = 1;
end

initial begin
    #(2*CYCLE+CYCLE/2)
    
    time_stamp <= 96'hfff12423131243214f234f;
    #CYCLE
    time_stamp <= 96'hfff12423131243214f234e;
    #CYCLE
    time_stamp <= 96'hfff12423131243214f2332;
    #CYCLE
    time_stamp <= 96'hfff12423131243214f2312;
    #CYCLE
    time_stamp <= 96'hfff12423131243214f2332;
    #CYCLE
    time_stamp <= 96'hfff12423131243214f2312;
    #CYCLE
    time_stamp <= 96'hfff12423131243214f2343;
    #CYCLE
    time_stamp <= 96'hfff12423121243214f234e;


    #(40*CYCLE);
end


cookie #(
    .COOKIE_LEN()
)cookie(
    .clk(clk),
    .rst_n(rst_n),

    .time_stamp(time_stamp),
    .c_val(c_val)
);

endmodule