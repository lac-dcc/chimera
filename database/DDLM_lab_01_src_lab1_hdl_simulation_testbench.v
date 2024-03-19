
// testbench is a module which only task is to test another module
// testbench is for simulation only, not for synthesis
module testbench;

    // input and output test signals
    reg  [1:0] key;
    wire [9:0] led;

    // creating the instance of the module we want to test
    //  lab1 - module name
    //  dut  - instance name ('dut' means 'device under test')
    lab1 dut ( key, led );

    // do at the beginning of the simulation
    initial 
        begin
            key = 2'b00;    // set test signals value
            #10;            // pause
            key = 2'b01;    // set test signals value
            #10;            // pause
            key = 2'b10;    // set test signals value
            #10;            // pause
            key = 2'b11;    // set test signals value
            #10;            // pause
        end

    // do at the beginning of the simulation
    //  print signal values on every change
    initial 
        $monitor("key=%b led=%b", key, led);

    // do at the beginning of the simulation
    initial 
        $dumpvars;  //iverilog dump init

endmodule
