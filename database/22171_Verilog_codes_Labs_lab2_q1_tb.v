// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module lab2_1_tb;
    reg Headlight;
    reg Ignition;
    wire Alarm;
    lab2_1 dut2 (.Headlight(Headlight), .Ignition(Ignition), .Alarm(Alarm));
    initial begin
        $monitor("Headlight=%b, Ignition=%b, Alarm=%b", Headlight, Ignition, Alarm);
        Headlight = 0;
        Ignition = 0;
        #10      
        Headlight = 1;
        Ignition = 0;
        #10;
        Headlight = 0;
        Ignition = 1;
        #10;
        Headlight = 1;
        Ignition = 1;
        #10;
        $finish;
    end
endmodule