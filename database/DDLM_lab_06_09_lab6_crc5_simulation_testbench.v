`timescale 1ns/1ns
module testbench;
  reg         clk;
  reg         rst_n;
  reg         data;
  wire [4:0]  crc5;
  reg         crc_en;
  
  reg [7:0]   buff;
  //integer     i;    
  
  crc_ser crc (/*AUTOINST*/
               // Outputs
               .crc5                    (crc5),
               // Inputs
               .data                    (data),
               .clk                     (clk),
               .rst_n                   (rst_n),
               .crc_en                  (crc_en));
  initial begin
    clk=1'b0;
    forever #5 clk = !clk;
  end

  task async_rst;
    begin
      $display("@%0t_########## Reset start! ##########",$time);
      #11 rst_n = 1'b0;
      #11 rst_n = 1'b1;
      $display("@%0t_########## Reset finish! ##########",$time);
    end
  endtask // async_rst
   
  task send_byte;
    integer i;
    begin
      buff = $urandom%(255);
      
      for(i=0;i<8;i=i+1) begin
        @(negedge clk)begin
          crc_en  = 1'b1;
          data    = buff[7-i];
        end
      end
      @(negedge clk);
      crc_en = 1'b0;
      i = 0;
    end
  endtask // send_byte

  task push_byte(input [7:0] d_byte);
    integer k;
    begin
      buff = d_byte;
      for(k=0;k<=7;k=k+1)begin
        @(negedge clk)begin
          crc_en = 1'b1;
          data = d_byte[7-k];
        end
      end
      @(negedge clk);
      crc_en = 1'b0;
      k=0;
    end

  endtask // testbench
  
  
  initial begin
    $dumpvars(0);
    data    = 1'b0;
    rst_n   = 1'b1;
    crc_en  = 1'b0;
     
    repeat(10)begin
      async_rst();
      push_byte($urandom%(255));
    end
       
    #20
      $finish;
    
    
  end
  
endmodule // crc_ser_tb

