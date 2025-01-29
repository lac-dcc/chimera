// Seed: 2045637005
module module_0 (
    input wand  id_0,
    input uwire id_1,
    input tri0  id_2,
    input tri1  id_3,
    input wire  id_4,
    input wor   id_5
);
  assign id_7 = id_4;
endmodule : SymbolIdentifier
module module_1 #(
    parameter id_36 = 32'd69
) (
    input tri0 id_0,
    output uwire id_1,
    input wand id_2,
    output tri0 id_3,
    output wire id_4,
    output uwire id_5,
    output tri0 id_6,
    input supply1 id_7,
    output tri id_8,
    output wor id_9,
    input supply1 id_10,
    output tri0 id_11,
    input tri id_12,
    output tri id_13,
    output supply0 id_14,
    input uwire id_15,
    output tri id_16,
    input wand id_17,
    input uwire id_18,
    input supply1 id_19,
    output tri1 id_20,
    output wor id_21,
    input wand id_22,
    input tri id_23,
    input tri1 id_24,
    input supply1 id_25,
    input wire id_26,
    input tri0 id_27,
    output supply0 id_28,
    output wire id_29,
    input wand id_30,
    output tri0 id_31,
    inout logic id_32
);
  parameter id_34 = id_24 << -1'b0;
  id_35 :
  assert property (@(posedge id_26) id_35) id_32 <= -1;
  module_0 modCall_1 (
      id_19,
      id_27,
      id_2,
      id_22,
      id_18,
      id_10
  );
  assign modCall_1.type_12 = 0;
  defparam id_36 = id_24 - -1;
endmodule
