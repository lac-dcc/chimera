//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

`ifdef FROM_FWD_ADAPTER
`include "fwd_adapter.v"
`endif

module fwd_adapter_tb;
    reg clk;
    reg rst;

    integer fd;
    integer dummy;

    initial begin
        $dumpfile("fwd_adapter.vcd");
        $dumpvars;
        $dumplimit(1024000);
            
        clk <= 0;
        rst <= 0;
        
        fd = $fopen("fwd_adapter_drivers.mem", "r");
        if (fd == 0) begin
            $display("Could not open file");
            $finish;
        end
        while($fgetc(fd) != "\n") begin end //Skip first line of comments
        
        #2000 $finish;
    end

    always #5 clk <= ~clk;
    
    always @(posedge clk) begin
        if ($feof(fd)) begin
            $display("Reached end of drivers file");
            #20
            $finish;
        end
        //#0.01
        //dummy = $fscanf(fd, ...);
    end

endmodule
