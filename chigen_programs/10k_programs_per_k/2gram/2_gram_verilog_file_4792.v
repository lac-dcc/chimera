// Seed: 2391901273
module module_0 (
    input tri id_0,
    output uwire id_1,
    output tri1 id_2,
    input wor id_3,
    input uwire id_4,
    output tri0 id_5,
    input tri id_6,
    output supply0 id_7,
    output wire id_8,
    input wor id_9,
    output supply1 id_10,
    input tri1 id_11,
    output wor id_12,
    input wire id_13,
    output tri id_14,
    input wand id_15,
    input wire id_16,
    output wand id_17,
    input supply1 id_18,
    input tri1 id_19,
    output tri id_20,
    output wire id_21
);
  id_23 :
  assert property (@(id_3 or posedge 1'b0) id_9)
  else;
  assign id_21 = -1;
endmodule
module module_1 #(
    parameter id_7 = 32'd95
) (
    output tri1 id_0,
    output tri0 id_1,
    output logic id_2,
    output wand id_3,
    output supply0 id_4,
    input tri0 id_5
);
  _id_7 :
  assert property (@(posedge id_7 or id_5) id_5 * id_5)
  else;
  wire [-1 : id_7] id_8;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_4,
      id_5,
      id_5,
      id_0,
      id_5,
      id_1,
      id_0,
      id_5,
      id_3,
      id_5,
      id_4,
      id_5,
      id_1,
      id_5,
      id_5,
      id_3,
      id_5,
      id_5,
      id_1,
      id_3
  );
  assign modCall_1.id_3 = 0;
  always forever @(id_5 or posedge -1) id_2 = ~"";
endmodule
