
`timescale 1 ns / 1 ps

module testbench;

    reg osc_clk;
    reg idt_clk1;

    wire audio_sclk, audio_sdin;

    pullup(audio_sclk);
    pullup(audio_sdin);

    pano_pins u_pano_pins(
        .osc_clk(osc_clk),
        .idt_clk1(idt_clk1),
        .audio_sclk(audio_sclk),
        .audio_sdin(audio_sdin)
    );

    initial begin
        osc_clk     = 0;
        forever begin
            #5 osc_clk  = ~osc_clk;
        end
    end

    initial begin
        idt_clk1     = 0;
        forever begin
            #2 idt_clk1  = ~idt_clk1;
        end
    end

    initial begin
        $display("%t: Start of simulation!", $time);
        $dumpfile("waves.vcd");
        $dumpvars(0, testbench);

        repeat(100000) @(posedge osc_clk);
        $display("%t: Simulation complete...", $time);
        $finish;
    end


endmodule

