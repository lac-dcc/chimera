// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

`timescale 1ns/1ns

module testbench;
parameter FIFO_PTR_WIDTH   = 3;
parameter FIFO_DATA_WIDTH  = 8;

  reg                        clk_tb;
  reg                        rst_n_tb;

  reg                        write_tb;
  reg                        read_tb;

  reg  [FIFO_DATA_WIDTH-1:0] write_data_tb;
  wire [FIFO_DATA_WIDTH-1:0] read_data_tb;

  wire                       empty_tb;
  wire                       full_tb;

fifo_1 DUT (
    clk_tb, rst_n_tb, 
    write_tb, read_tb, 
    write_data_tb, read_data_tb, 
    empty_tb, full_tb
);


always #10 clk_tb = ~clk_tb;

task reset();
  begin
    clk_tb        = 1'b0;
    rst_n_tb      = 1'b0;
    write_tb      = 1'b0;
    read_tb       = 1'b0;
    write_data_tb = 0;
    #30; rst_n_tb = 1'b1;
  end
endtask

task read_fifo();
  begin
    read_tb = 1'b1;
    #20;
    read_tb = 1'b0;
  end
endtask
   
task write_fifo([7:0]data_tb);
  begin
    write_tb = 1'b1;
    write_data_tb = data_tb;
    #20 write_tb = 1'b0;
  end
endtask


initial
  begin
    reset();
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