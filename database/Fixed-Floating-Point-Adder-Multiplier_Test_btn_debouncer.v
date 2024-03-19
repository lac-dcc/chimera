/* ------------------------------------------ *
 * Title       : Button Debouncer             *
 * Project     : Verilog Utility Modules      *
 * ------------------------------------------ *
 * File        : btn_debouncer.v              *
 * Author      : Yigit Suoglu                 *
 * Last Edit   : 23/11/2020                   *
 * ------------------------------------------ *
 * Description : Debouncer module for buttons *
 * ------------------------------------------ */

module debouncer(clk, rst, in_n, out_c);
  input clk, rst, in_n;
  output out_c;

  reg [1:0] mid;

  always@(posedge clk or posedge rst)
    begin
      if(rst)
        begin
          mid <= 2'b0;
        end
      else
        begin
          mid <= {mid[0], in_n};
        end
    end

  assign out_c = (~mid[1]) & mid[0]; //rising edge

endmodule // debouncer rising edge

module debouncer_fe(clk, rst, in_n, out_c);
  input clk, rst, in_n;
  output out_c;

  reg [1:0] mid;

  always@(posedge clk or posedge rst)
    begin
      if(rst)
        begin
          mid <= 2'b0;
        end
      else
        begin
          mid <= {mid[0], in_n};
        end
    end

  assign out_c = mid[1] & (~mid[0]); //falling edge

endmodule // debouncer falling edge