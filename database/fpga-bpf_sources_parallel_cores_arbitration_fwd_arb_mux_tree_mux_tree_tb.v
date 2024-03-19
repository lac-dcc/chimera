//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

/*
mux_tree_tb.v

Replace innards with desired logic
*/

`ifdef FROM_MUX_TREE
`include "mux_tree.v"
`endif

module mux_tree_tb;
	reg clk;
    //Other variables connected to your instance
    
    integer fd, dummy;
    
    initial begin
        $dumpfile("mux_tree.vcd");
        $dumpvars;
        $dumplimit(512000);
        
        clk <= 0;
        //Initial values for your other variables
        
        fd = $fopen("mux_tree_drivers.mem", "r");
        if (fd == 0) begin
            $display("Could not open file");
            $finish;
        end
        
        while ($fgetc(fd) != "\n") begin
            if ($feof(fd)) begin
                $display("Error: file is in incorrect format");
                $finish;
            end
        end
    end
    
    always #5 clk <= ~clk;
    
    always @(posedge clk) begin
        if ($feof(fd)) begin
            $display("Reached end of drivers file");
            #20
            $finish;
        end
        
        //#0.01
        //dummy = $fscanf(fd, "%F%O%R%M%A%T", /* list of variables */);
    end

endmodule
