// This program was cloned from: https://github.com/zf3/nes260
// License: GNU General Public License v3.0

`timescale 1ns / 100ps

module test_nes;

reg clk;
reg rst;

wire [5:0] color;
wire [8:0] scanline;
wire [8:0] cycle;
wire [15:0] sample;

NES_KV260 nes_kv260(
    clk, rst, clk_ppu,             // 1/4 of clk
    color,         // pixel color from PPU
    scanline,      // current scanline from PPU
    cycle,         // current cycle from PPU
    sample,        // audio sample
    status_led);

wire [31:0] axis_tdata;
wire [15:0] sample;
wire axis_tid, axis_tvalid;
reg axis_tready = 1; 

nes_dp dp(clk_pixel, rst_pixel,     // do not simple pixel clock
        clk, color, scanline, cycle, sample,
        de, vsync, hsync, video, 
        axis_tdata, axis_tid, axis_tvalid, axis_tready, axis_clk);

initial begin
  $display($time, " << Starting the Simulation >>");
    rst = 1'b1;
    clk = 0;
    #70 rst = 1'b0;
end

always #45 clk=~clk;

integer f,y,x;
initial begin
    f = $fopen("output.csv", "w");
    
    // wait for close to 5 second
    #1_000_000_000;
    #1_000_000_000;
    #1_000_000_000;
    #1_000_000_000;
    #1_000_000_000;
    #1_000_000_000;
    #1_000_000_000;
//    #1_000_000_000;
    
    $display("\n");
    $display($time, " Writing output.csv");
    
    // 262 scanlines * 341 cycles
    for (y = 0; y < 240; y=y+1) begin
        for (x = 1; x <= 256; x=x+1) begin
            while (scanline != y || cycle != x)
                @(posedge clk);
            $fwrite(f, "%d", color);
            if (x != 256) $fwrite(f, ",");
        end
        $fwrite(f,"\n");
    end
    
    $fclose(f);
    $display($time, "Done writing output.csv");
end

endmodule
