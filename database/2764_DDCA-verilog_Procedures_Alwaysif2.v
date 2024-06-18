// This program was cloned from: https://github.com/BriceLucifer/DDCA-verilog
// License: MIT License

// synthesis verilog_input_version verilog_2001
module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); //

    always @(*) begin
        if (cpu_overheated)
           shut_off_computer = cpu_overheated;
        else 
            shut_off_computer = 0;
    end

    always @(*) begin
        if (~arrived)
           keep_driving = ~gas_tank_empty;
        else
            keep_driving = ~arrived;
    end

endmodule
