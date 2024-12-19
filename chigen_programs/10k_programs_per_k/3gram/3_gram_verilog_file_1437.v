// Seed: 931057823
macromodule module_0 (
    input tri id_0,
    input tri1 id_1,
    output supply1 id_2,
    output supply0 id_3,
    input supply1 id_4,
    input supply1 id_5,
    output wire id_6,
    input supply1 id_7,
    output wand id_8,
    input tri id_9,
    input tri0 id_10,
    output uwire id_11,
    input wor id_12,
    input tri1 id_13,
    input tri id_14,
    input uwire id_15,
    input supply0 id_16,
    output wire id_17,
    input wand id_18,
    output tri id_19,
    output supply1 id_20
);
  wire id_22;
  wire id_23;
  wor  id_24 = id_18 + id_0;
endmodule
module module_1 (
    input supply0 id_0,
    output supply1 id_1,
    output tri1 id_2
);
  always @(posedge 1) $display(1, {{id_0, 1'b0}}, 1 & id_0);
  nor primCall (id_1, id_0, id_4);
  wire id_4;
  supply1 id_5;
  final $display(id_0, id_0, id_5, 1);
  module_0 modCall_1 (
      id_0,
      id_0,
      id_5,
      id_5,
      id_0,
      id_5,
      id_2,
      id_5,
      id_1,
      id_5,
      id_5,
      id_1,
      id_5,
      id_0,
      id_0,
      id_5,
      id_5,
      id_2,
      id_0,
      id_5,
      id_5
  );
  assign modCall_1.type_5 = 0;
endmodule
