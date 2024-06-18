// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`timescale 1ns/1ps

module testbench;

  parameter FIFO_PTR_WIDTH   = 3;
  parameter FIFO_DATA_WIDTH  = 8;

  reg                        clk;
  wire                       clk_enable;
  reg                        reset;

  reg                        write;
  reg                        read;

  reg  [FIFO_DATA_WIDTH-1:0] write_data;
  wire [FIFO_DATA_WIDTH-1:0] read_data;

  wire                       empty;
  wire                       full;

fifo_simple DUT (
    clk, clk_enable, reset, 
    write, read, 
    write_data, read_data, 
    empty, full
);


always #10 clk = ~clk;

assign clk_enable = 1'b1;

task reset_task();
  begin
    clk        = 1'b0;
    reset      = 1'b1;
    write      = 1'b0;
    read       = 1'b0;
    write_data = 0;
    #40; reset = 1'b0;
  end
endtask

task read_fifo();
  begin
    read = 1'b1;
    #20;
    read = 1'b0;
  end
endtask
   
task write_fifo([7:0]data);
  begin
    write = 1'b1;
    write_data = data;
    #20 write = 1'b0;
  end
endtask


initial
  begin
    reset_task();
    #30;
    write_fifo(8'h11);
    #20;
    write_fifo(8'h22);
    #20;
    write_fifo(8'h33);
    #20;
    write_fifo(8'h44);
    #20;
    write_fifo(8'h55);
    #20;
    write_fifo(8'h66);
    #20;

    repeat(6)
      begin
        read_fifo();
        #20;
      end
    #10;
    $finish;
 end

endmodule