`include "top_tb_header.vh"
    VgaSyncGen dut( .clk(clk_12mhz));

    initial begin

    # 1
    `assert("video off", dut.activevideo, 1'b0);
    `assert("hsync start", dut.hsync, 1'b1);
    `assert("vsync start", dut.vsync, 1'b1);
    `assert("x_px start", dut.x_px, 10'd0);
    `assert("y_px start", dut.y_px, 10'd0);


    // wait till hsync
    wait(dut.hc > dut.hfp); 
    `assert("hsync", dut.hsync, 1'b0);

    // wait till vsync
    wait(dut.vc > dut.vfp);
    `assert("vsync", dut.vsync, 1'b0);

    // wait for valid video signal
    wait(dut.hc >= dut.blackH && dut.vc >= dut.blackV);
    # 1
    `assert("video on", dut.activevideo, 1'b1);
    
    // wait 5 clocks, so x pix should be 5 (10 cycles)
    # 10

    // wait a cycle for clock for reg assignment
    # 2
    `assert("x_px", dut.x_px, 10'd5);
    `assert("y_px", dut.y_px, 10'd0);

    // wait for end of the line and video blank
    # 1270
    `assert("video off", dut.activevideo, 1'b0);

    // wait a line
    wait(dut.x_px == 1);
    `assert("y_px", dut.y_px, 10'd1);

    // wait for end 
    dut.vc <= dut.vlines - 2;
    wait(dut.y_px == dut.activeVvideo -1 && dut.x_px == dut.activeHvideo -1)
    # 2
    `assert("video off", dut.activevideo, 1'b0);

    $finish(0);
    end

`include "top_tb_footer.vh"
