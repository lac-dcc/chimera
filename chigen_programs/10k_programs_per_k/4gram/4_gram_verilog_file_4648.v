// Seed: 1115567040
module module_0 (
    output tri id_0,
    input uwire id_1,
    input supply1 id_2,
    output supply1 id_3,
    output wand id_4,
    output wire id_5,
    input uwire id_6,
    output tri1 id_7,
    input wand id_8,
    input uwire id_9,
    input wand id_10,
    output tri1 id_11
    , id_25,
    input tri1 id_12,
    output supply0 id_13,
    input uwire id_14,
    output wand id_15,
    output tri1 id_16,
    input tri1 id_17,
    input supply0 id_18,
    input supply1 id_19,
    output wire id_20,
    output supply1 id_21,
    input supply0 id_22,
    input wor id_23
);
  always
  fork : SymbolIdentifier
  join
endmodule
module module_1 (
    input supply0 id_0,
    output tri1 id_1,
    output tri0 id_2,
    output tri id_3,
    input tri0 id_4,
    input wand id_5,
    input tri0 id_6,
    input tri1 id_7,
    input logic id_8,
    output logic id_9,
    output wire id_10,
    input tri1 id_11,
    inout tri0 id_12
);
  always @*
    if (1) begin : LABEL_0
      id_9 <= id_8;
    end
  module_0 modCall_1 (
      id_2,
      id_5,
      id_6,
      id_3,
      id_2,
      id_12,
      id_7,
      id_12,
      id_6,
      id_5,
      id_5,
      id_10,
      id_6,
      id_2,
      id_5,
      id_12,
      id_1,
      id_7,
      id_7,
      id_4,
      id_12,
      id_1,
      id_0,
      id_0
  );
  assign modCall_1.type_1 = 0;
  id_14(
      .id_0(!id_4), .id_1(""), .id_2(id_2), .id_3(id_7++)
  );
  always_comb @(id_8 or posedge 1 + id_12 or 1);
endmodule
