// Seed: 4276663869
module module_0 #(
    parameter id_29 = 32'd84,
    parameter id_30 = 32'd76
) (
    output supply1 id_0,
    input uwire id_1,
    input tri id_2,
    input supply0 id_3,
    input tri1 id_4,
    input tri0 id_5,
    input supply1 id_6,
    input tri1 id_7,
    output supply1 id_8,
    input tri1 id_9,
    input wor id_10,
    input tri id_11,
    input tri1 id_12,
    input supply0 id_13,
    output tri1 id_14,
    output wand id_15,
    input uwire id_16,
    input tri1 id_17,
    input supply0 id_18,
    input wor id_19,
    input wor id_20,
    input supply0 id_21,
    input wor id_22
    , id_24
);
  wire id_25;
  wor  id_26 = id_10;
  wire id_27;
  wire id_28;
  defparam id_29.id_30 = id_20 && id_20 < "";
endmodule
module module_1 (
    input  tri0 id_0,
    input  wor  id_1,
    input  tri1 id_2,
    input  tri  id_3,
    output wor  id_4,
    input  tri1 id_5
);
  id_7 :
  assert property (@(posedge 1 == 1) id_7 || 1)
  else $display;
  module_0(
      id_4,
      id_5,
      id_5,
      id_2,
      id_5,
      id_0,
      id_1,
      id_1,
      id_4,
      id_5,
      id_3,
      id_2,
      id_2,
      id_0,
      id_4,
      id_4,
      id_1,
      id_3,
      id_2,
      id_3,
      id_1,
      id_3,
      id_2
  );
  assign id_4 = id_5 > 1 ? 1'b0 : 1;
endmodule
