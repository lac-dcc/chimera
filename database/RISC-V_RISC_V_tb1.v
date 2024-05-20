// This program was cloned from: https://github.com/MihVuongNguyen/RISC-V
// License: Apache License 2.0

module RISC_V_tb1();

 reg clk;
 reg reset;
 wire [31:0] WriteData, DataAdr;
 wire MemWrite;

 // instantiate device to be tested
 RISC_V dut(clk, reset, WriteData, DataAdr, MemWrite);

 // initialize test
 initial begin
    reset <= 0; #5; reset <= 1;
 end
 // generate clock to sequence tests
 always begin
    clk <= 1; #5; clk <= 0; # 5;
 end
 // check results
 always @(negedge clk) begin
    if(MemWrite) begin
        if(DataAdr === 100 & WriteData === 25) begin
            $display("Simulation succeeded");
            $stop;
        end 
        else if (DataAdr !== 96) begin
            $display("Simulation failed");
            $stop;
        end
    end
 end

endmodule