// Seed: 2987822361
module module_0 (
    input tri1 id_0,
    output wire id_1,
    input wand id_2,
    input uwire id_3,
    output wor id_4,
    output tri0 id_5,
    input tri1 id_6,
    input supply0 id_7,
    output tri0 id_8,
    input supply1 id_9,
    input uwire id_10,
    output tri1 id_11,
    input supply1 id_12,
    input tri1 id_13,
    input supply0 id_14,
    input supply1 id_15,
    output supply0 id_16
);
  assign id_11 = 1;
  wand id_18;
  wire id_19;
  wire id_20;
  assign id_18 = id_6;
endmodule
module module_1 #(
    parameter id_5 = 32'd37,
    parameter id_6 = 32'd35
) (
    input tri0 id_0,
    input tri1 id_1,
    output supply1 id_2,
    input wand id_3
);
  defparam id_5.id_6 = (id_6); id_7 :
  assert property (@(~1'b0 <-> 1 or 1) id_3)
  else;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_7,
      id_0,
      id_7,
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_3,
      id_2,
      id_7,
      id_0,
      id_1,
      id_7,
      id_2
  );
  assign modCall_1.type_11 = 0;
endmodule
