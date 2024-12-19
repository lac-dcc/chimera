// Seed: 2288303932
module module_0;
  wire id_2;
  wire id_3;
  wire id_4;
  wire id_5;
  assign module_1.id_0 = 0;
endmodule
module module_1 #(
    parameter id_10 = 32'd73,
    parameter id_11 = 32'd62,
    parameter id_12 = 32'd70,
    parameter id_13 = 32'd96,
    parameter id_8  = 32'd81,
    parameter id_9  = 32'd5
) (
    input supply1 id_0,
    input logic   id_1
);
  initial begin : LABEL_0
    wait (1);
    id_3 <= id_1 | 1;
    $display;
    id_3 = id_1;
  end
  assign id_4[1] = id_0;
  module_0 modCall_1 ();
  wire id_5;
  id_6(
      1
  );
  wire id_7;
  defparam id_8.id_9 = id_5, id_10.id_11 = 1'b0, id_12.id_13 = (id_5);
endmodule
