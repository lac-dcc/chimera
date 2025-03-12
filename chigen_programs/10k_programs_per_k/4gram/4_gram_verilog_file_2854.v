// Seed: 4169823590
module module_0 (
    output tri0 id_0,
    input wand id_1,
    output supply0 id_2,
    input tri id_3,
    input wire id_4
    , id_22,
    output supply1 id_5,
    output wire id_6,
    input supply0 id_7,
    input uwire id_8,
    input supply1 id_9,
    input supply0 id_10,
    output wor id_11,
    input wire id_12,
    input wor id_13,
    input wor id_14,
    output tri0 id_15,
    input tri1 id_16,
    input supply1 id_17,
    output tri id_18,
    input wire id_19,
    output tri id_20
);
  logic id_23;
  id_24 :
  assert property (@(posedge id_7) id_22)
  else $clog2(35);
  ;
  wire id_25, id_26, id_27;
  assign id_20 = 1 & 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd28
) (
    output tri0 id_0,
    input  wand _id_1,
    input  wand id_2,
    input  wor  id_3
);
  wire [id_1 : id_1] id_5, id_6, id_7;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_0,
      id_2,
      id_3,
      id_0,
      id_0,
      id_3,
      id_3,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_3,
      id_0,
      id_2,
      id_0
  );
endmodule
