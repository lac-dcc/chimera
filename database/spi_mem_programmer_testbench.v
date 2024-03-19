`timescale 1ns / 1ps

module testbench();
    reg clk = 0, rst = 1;
    wire [1:0] status_led;
    
    always begin
        clk = 1; #5;
        clk = 0; #5;
    end

    initial begin
        // Wait for the memory to become fully accessible.
        // According to the N25Q datasheet the interval should be >= 600 us.
        // In the verilog model of N25Q this delay is shorter by default
        // (full_access_power_up_delay in TimingData.h)
        #150;
        rst = 0;
        #10;
        while (!status_led[0]) #10;
        $display("testbench process finished: %s", status_led[1] ? "success" : "failed");
        $finish;
    end

    wire clk_to_mem, S, HOLD_DQ3, Vpp_W_DQ2, DQ1, DQ0;

    top top_inst (
        .status_led(status_led),
        .rst(rst),
        .CLK_100M(clk),
        .clk_to_mem_out(clk_to_mem),
        .S(S),
        .DQio({HOLD_DQ3, Vpp_W_DQ2, DQ1, DQ0})
    );
    
    N25Qxxx mem_inst (
        .S(S),
        .C_(clk_to_mem),
        .HOLD_DQ3(HOLD_DQ3),
        .DQ0(DQ0),
        .DQ1(DQ1),
        .Vcc('d3300),
        .Vpp_W_DQ2(Vpp_W_DQ2)
    );

endmodule
