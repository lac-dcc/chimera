// This program was cloned from: https://github.com/MathBorgess/hardware_studies
// License: MIT License

`timescale 1ms/1ms
`include "./digital_system_lessons/P3/LVL1/LVL2/magnetron/controller.v"

module tb_;
    reg startn, stopn, clearn, door_closed, timer_done;
    wire mag_on;
    
    magnetron dut (
    .startn(startn), .stopn(stopn), .clearn(clearn), .door_closed(door_closed), .timer_done(timer_done), .mag_on(mag_on)
);

    initial
        begin
            $dumpfile("tb.vcd");
            $dumpvars(0, tb_);
            clearn = 1'b0;
            #1;
            startn = 1'b1;
            stopn = 1'b1;
            door_closed = 1'b1;
            timer_done = 1'b0;
            clearn = 1'b1;
            #10;
            startn = 1'b0;
            #10;
            stopn = 1'b0;
            #10;
            startn = 1'b0;
            #10;
            startn = 1'b1;
            stopn = 1'b0;
            #10;
            door_closed = 1'b0;
            #10;
            startn = 1'b0;
            #10;
            startn = 1'b1;
            stopn = 1'b0;
            #10;
            door_closed = 1'b1;
            #10;
            startn = 1'b0;
            #10;
            timer_done = 1'b1;
            #10;
            
            $finish();
        end

endmodule