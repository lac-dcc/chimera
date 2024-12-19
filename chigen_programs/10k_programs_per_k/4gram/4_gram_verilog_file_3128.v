// Seed: 2326966045
module module_0 #(
    parameter id_11 = 32'd86,
    parameter id_12 = 32'd77
) (
    output tri1 id_0,
    input tri id_1,
    input tri id_2,
    input supply1 id_3,
    input wor id_4,
    output supply0 id_5,
    output supply1 id_6,
    input wand module_0,
    output supply1 id_8,
    output wand id_9
);
  initial begin : LABEL_0
    id_8 = 1;
  end
  defparam id_11.id_12 = 1'b0;
  wire id_13, id_14;
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1
);
  assign id_3 = id_3;
  id_4 :
  assert property (@(negedge !id_3[1 : 1]) id_0)
  else $display(1);
  wire id_5;
  wire id_6;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_0,
      id_1,
      id_0,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.type_15 = 0;
endmodule
