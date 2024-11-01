// Seed: 2650449670
module module_0;
  logic [7:0] id_2;
  reg id_3;
  task id_4;
    fork
      id_5(id_5, id_2);
      #1
      repeat (1)
      if (id_5[1'b0]) begin
        $display(1);
      end else id_4 <= 1;
      begin
        id_3 <= {id_1, 1, (id_4), id_3};
      end
    join
  endtask
  wand id_6 = 1;
  supply1 id_7 = 1'b0;
endmodule
module module_0 #(
    parameter id_15 = 32'd32,
    parameter id_16 = 32'd94
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  tri0 id_9;
  wire id_10;
  assign id_3 = "";
  assign id_9 = 1;
  wire id_11;
  wire id_12;
  module_0();
  wire id_13;
  wire id_14;
  assign id_4 = id_5 & module_1[1 : 1];
  defparam id_15.id_16 = 1 == id_7;
endmodule
