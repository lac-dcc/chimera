// This program was cloned from: https://github.com/sanojn/tt06_ttrpg_dice
// License: Apache License 2.0

//`default_nettype none
`timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();

  // Dump the signals to a VCD file. You can view it with gtkwave.
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #1;
  end

  // Wire up the inputs and outputs:
  reg clk;
  reg rst_n;
  reg ena;
  reg [7:0] ui_in;
  reg [7:0] uio_in;
  wire [7:0] uo_out;
  wire [7:0] uio_out;
  wire [7:0] uio_oe;

  tt_um_sanojn_ttrpg_dice user_project (

      // Include power ports for the Gate Level test:
`ifdef GL_TEST
      .VPWR(1'b1),
      .VGND(1'b0),
`endif

      .ui_in  (ui_in),    // Dedicated inputs
      .uo_out (uo_out),   // Dedicated outputs
      .uio_in (uio_in),   // IOs: Input path
      .uio_out(uio_out),  // IOs: Output path
      .uio_oe (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)
      .ena    (ena),      // enable - goes high when design is selected
      .clk    (clk),      // clock
      .rst_n  (rst_n)     // not reset
  );

   
  // The testbench module does some preprocesing of inputs and outputs that
  // simplifies life for the cocotb testbench
  

  // cocotb access points to the config inputs
   wire [2:0] cfg;
   assign uio_in[7:5] = cfg;
   
  // Apply button inputs as active high or low depending on uio_in[5]
  wire btn4, btn6, btn8, btn10, btn12, btn20, btn100;
  assign ui_in[0] = (uio_in[5] ? btn4 : ~btn4);
  assign ui_in[1] = (uio_in[5] ? btn6 : ~btn6);
  assign ui_in[2] = (uio_in[5] ? btn8 : ~btn8);
  assign ui_in[3] = (uio_in[5] ? btn10 : ~btn10);
  assign ui_in[4] = (uio_in[5] ? btn12 : ~btn12);
  assign ui_in[5] = (uio_in[5] ? btn20 : ~btn20);
  assign ui_in[6] = (uio_in[5] ? btn100 : ~btn100);
  assign ui_in[7] = 1'b0;
  wire anyButtonPressed;
  assign anyButtonPressed = btn4 | btn6 | btn8 | btn10 | btn12 | btn20 | btn100;

  // Check which segments are lit
  // common signals are active when equal to uio_in[7]
  wire digit1_active, digit10_active;
  assign digit1_active  = ( uio_out[3] == uio_in[7] ) && uio_oe[3]==1'b1;
  assign digit10_active = ( uio_out[4] == uio_in[7] ) && uio_oe[4]==1'b1;

  // segments are lit when equal to uio_in[6] and when the common
  // signal of either digit1 or digit10 is active
  wire [7:0] litsegments;
  assign litsegments = ( uio_in[6] ? uo_out : ~uo_out );

  // Translate the lit segments to a digit
  reg [3:0] shownDigit;
  always @(litsegments) begin
     #1000 // wait 1 us after signal change to allow all signals to settle
           // this is useful especially for gate level simulations
     case (litsegments)
        8'b00111111: shownDigit <= 4'd0;
        8'b00000110: shownDigit <= 4'd1;
        8'b01011011: shownDigit <= 4'd2;
        8'b01001111: shownDigit <= 4'd3;
        8'b01100110: shownDigit <= 4'd4;
        8'b01101101: shownDigit <= 4'd5;
        8'b01111101: shownDigit <= 4'd6;
        8'b00000111: shownDigit <= 4'd7;
        8'b01111111: shownDigit <= 4'd8;
        8'b01101111: shownDigit <= 4'd9;
        8'b00000000: shownDigit <= 4'd15; // empty display
        default: shownDigit <= 4'd14; // undefined digit
     endcase
  end


  // The testbench also brings out some internal signals from the user design that
  // change names in the gate level netlist so that the cocotb tesbench can reference
  // them consistently
   wire [3:0] digit1, digit10;
  `ifdef GL_TEST
     assign digit1  = { user_project.\digit1[3] , user_project.\digit1[2] , user_project.\digit1[1] , user_project.\digit1[0] };
     assign digit10 = { user_project.\digit10[3] , user_project.\digit10[2] , user_project.\digit10[1] , user_project.\digit10[0] };
  `else
     assign digit1  = user_project.digit1;
     assign digit10 = user_project.digit10;
  `endif


   //////////////////////////////////////////////////////////
   // Excercising the I2C slave
   //////////////////////////////////////////////////////////
   `define delay      150000
   `define longdelay 1000000
   
   reg sda, scl;
   wire sda_bus, scl_bus;
   assign (pull1,strong0) sda_bus = (uio_oe[1] ? uio_out[1] : 1'b1);
   pullup(scl_bus);
   assign sda_bus = sda;
   assign scl_bus = scl;
   // strength reduction to get well-defined inputs
   buf (uio_in[1],sda_bus);
   buf (uio_in[2],scl_bus);

   // registers for received data
   reg rbit, rvalid;
   reg [7:0] rdata;
   
   task i2c_init;
     begin
       #`delay;
       scl <= 1'bz;
       sda <= 1'bz;
       #`delay;
     end
   endtask

   task i2c_start; // also works as restart
     begin
        if (!sda) begin
          sda <= 1'bz;
          #`delay;
       end
        if (!scl) begin
          scl <= 1'bz;
          #`delay;
       end
       sda <= 1'b0;
       #`delay;
       scl <= 1'b0;
       #`delay;
     end
   endtask
   
   task i2c_stop; // call with scl low
     begin
       sda <= 1'b0;
       #`delay;
       scl <= 1'bz;
       #`delay
       sda <= 1'bz;
       #`delay;
     end
   endtask

   task i2c_sendbit(d); // call with scl low
      begin
         sda <= ( d ? 1'bz : 1'b0 ); // assert data
         #`delay;
         scl <= 1'bz; // pulse clock
         #`delay;
         scl <= 1'b0;
         #`delay;
         sda <= 1'bz; // release data
      end
   endtask
         
   task i2c_sendbyte (input [7:0] data);
      begin
         integer i;
         for (i=7; i>=0 ; i = i-1 ) begin
            i2c_sendbit(data[i]);
         end
      end
   endtask

   task i2c_recvbit; // call with scl low
      begin
         sda <= 1'bz; // release data
         #`delay;
         scl <= 1'bz; // pulse clock
         #`delay;
         rbit <= uio_in[1]; // sample data. uio_in[1] is the strength resolved version of sda
         scl <= 1'b0;
         #`delay;
      end
   endtask
         
   task i2c_recvbyte;
      begin
         integer i;
         for (i=7; i>=0 ; i = i-1 ) begin
            i2c_recvbit();
            rdata[i] <= rbit;
         end
      end
   endtask

   task i2c_checkack;
      begin
         sda <= 1'bz;
         #`delay;
         scl <= 1'bz;
         #`delay;
         if (sda) $display("NAK during i2c transaction");
         scl <= 1'b0;
         #`delay;
      end
   endtask

   task i2c_emitack;
      begin
         sda <= 1'b0;
         #`delay;
         rvalid <= 1'b1;
         scl <= 1'bz;
         #`delay;
         rvalid <= 1'b0;
         scl <= 1'b0;
         #`delay;
         sda <= 1'bz;
      end
   endtask


   task i2c_write(input [7:0] i2c_addr, sub_addr, data0, data1);
     begin
        i2c_start();
        i2c_sendbyte(i2c_addr & 8'hfe); // assert write bit
        i2c_checkack();
        i2c_sendbyte(sub_addr);
        i2c_checkack();
        i2c_sendbyte(data0);
        i2c_checkack();
        i2c_sendbyte(data1);
        i2c_checkack();
        i2c_stop();
     end
   endtask

   task i2c_read(input [7:0] i2c_addr, sub_addr, no_of_bytes);
     begin
        integer i;
        i2c_start();
        i2c_sendbyte(i2c_addr & 8'hfe); // assert write bit
        i2c_checkack();
        i2c_sendbyte(sub_addr);
        i2c_checkack();
        i2c_start();                    // emit a restart
        i2c_sendbyte(i2c_addr | 8'h01); // assert read bit
        i2c_checkack();
        for (i=0; i<no_of_bytes; i=i+1) begin
          i2c_recvbyte();
          i2c_emitack();
        end
        i2c_stop();
     end
   endtask
   
   initial begin
      i2c_init;
      #`longdelay;
      i2c_write(8'b11100000, 8'd0, 8'haa, 8'h55);
      #`longdelay;
      i2c_write(8'b11100000, 8'd2, 8'h69, 8'h96);
      #`longdelay;
      i2c_write(8'b11100000, 8'd4, 8'h01, 8'h02);
      #`longdelay;
      i2c_write(8'b11100000, 8'd6, 8'h03, 8'h04);
      #`longdelay;
      i2c_write(8'b11100000, 8'd8, 8'h2b, 8'hff); // ~1/3 duty cycle
      #`longdelay;
      i2c_read(8'b11100000, 8'd0,8'd12);
      #`longdelay;
      i2c_write(8'b11100000, 8'd8, 8'h21, 8'hff); // ~1/4 duty cycle
      #`longdelay;
      i2c_write(8'b11100000, 8'd8, 8'h41, 8'hff); // ~1/2 duty cycle
      #`longdelay;
      i2c_write(8'b11100000, 8'd8, 8'h01, 8'hff); // 1/128 duty cycle
      #`longdelay;
      i2c_write(8'b11100000, 8'd8, 8'h7f, 8'hff); // 127/128 duty cycle
   end
endmodule
