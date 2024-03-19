`timescale 1 ns / 100 ps
// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
module testbench;
    parameter WIDTH = 8;
    parameter SHIFT = 3;
    // input and output test signals
    reg  [WIDTH - 1:0] x, y;
    reg  [SHIFT - 1:0] shamt;
    reg  [1:0]         operation;
    wire [WIDTH - 1:0] result;
    wire               zero;
 
    // create the instances of the modules you want to test
    alu
    #(
        .WIDTH(WIDTH),
        .SHIFT(SHIFT)
    )
    alu_dut
    (
        .operation(operation),
        .x        (x        ),
        .y        (y        ),
        .shamt    (shamt    ),
        .result   (result   ),
        .zero     (zero     )
    );
       
    //write test sequence
    initial begin
        x         = 0;
        y         = 0;
        shamt     = 0;
        operation = 0;
        #8;
        $stop;
    end
    
    initial
        forever begin
            #1;
            x     = $urandom_range(0, 2 ** (WIDTH - 1) - 1);
            y     = $urandom_range(0, 2 ** (WIDTH - 1) - 1);
            shamt = $urandom_range(0, 2 ** SHIFT - 1);
            
        end
        
    initial
        forever begin
            #2;
            operation = operation + 1;
	end
            
            
    // do at the beginning of the simulation
    //  print signal values on every change
    initial 
        $monitor("Time:\t%g, operation: %b, x: %b, y: %b, shamt: %b, result: %b, z_f: %b",
                $time,
                operation,
                x,
                y,
                shamt,
                result,
                zero
            );
            
    // do at the beginning of the simulation
    //configure signals dump for waveform's creation
    initial begin 
        $dumpfile("dump.vcd");
        $dumpvars(1);  //iverilog dump init
    end
    
endmodule
