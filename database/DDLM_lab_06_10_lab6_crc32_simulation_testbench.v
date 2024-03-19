`timescale 1ns/1ns
module testbench;

  reg [7:0]   data;
  reg         clk;
  reg         rst_n;
  reg         crc_en;
  wire [31:0] crc32;
  

  crc32 crc_dut
    (
     .crc32  ( crc32[31:0]),
     .clk    ( clk        ),
     .rst_n  ( rst_n      ),
     .data   ( data[7:0]  ),
     .crc_en ( crc_en     )
   );

  initial begin
    clk = 1'b0;
    forever #5 clk = !clk;
  end
  integer    i;
  
  reg [31:0] crc_out;
  reg [63:0] crc_buff;
  reg        crc_err;
  reg [31:0] rnd_data;
  
  
  task send_int(input [31:0] d_in);
    begin
      for(i=4;i>0;i=i-1)begin
        @(negedge clk)begin
          crc_en  = 1'b1;
          data    = d_in[i*8-1-:8];
        end
      end
      @(negedge clk)begin
        crc_en = 1'b0;
        crc_out = crc32;
      end
    end
  endtask // send_data

  task check_crc(input [31:0] pack,input [31:0] crc);
    begin
      for(i=8;i>0;i=i-1)begin
        @(negedge clk)begin
          crc_en  = 1'b1;
          data    = {pack,crc} >> (8*(i-1));
        end
      end
      @(negedge clk)
        crc_en = 1'b0;
      if( crc32 != 32'h0000 ) begin
        $display("Error in current CRC value");
        crc_err = 1'b1;
      end
      else
        crc_err = 1'b0;
    end
  endtask // check_crc
  
  
  
  task async_rst;
    begin
      #11 rst_n = 1'b0;
      #11 rst_n = 1'b1;
    end
  endtask // async_rst
  
  
  initial begin
    $dumpvars();
    
    data     = 32'h00000000;
    rst_n    = 1'b1;
    crc_en   = 1'b0;
    crc_err  = 1'b0;
    crc_out  = 32'h0000;
    
  
    
    repeat(10)begin
      async_rst();
      rnd_data = $urandom;
      send_int(rnd_data);
      async_rst();
      check_crc(rnd_data,crc_out);
      
    end
  #30
    $finish;
  end

endmodule // testbench

  
