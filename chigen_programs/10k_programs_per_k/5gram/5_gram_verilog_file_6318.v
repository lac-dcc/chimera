// Seed: 3718809921
module module_0 (
    input  tri0 id_0,
    input  wor  id_1,
    output wor  id_2,
    input  tri1 id_3
);
endmodule
module module_1 (
    input uwire id_0,
    output tri1 id_1,
    output tri0 id_2,
    output tri id_3,
    output tri0 id_4,
    output wire id_5,
    inout tri id_6,
    output tri0 id_7,
    output supply1 id_8,
    input uwire id_9,
    output supply1 id_10,
    output supply0 id_11,
    input supply0 id_12,
    input wor id_13,
    input supply1 id_14,
    input supply0 id_15,
    input supply1 id_16,
    output tri0 id_17,
    input wire id_18,
    input wire id_19,
    input wor id_20,
    input wand id_21,
    output supply0 id_22,
    input wand id_23
);
  id_25(
      .id_0(1 && id_18),
      .id_1(id_0),
      .id_2(id_1),
      .id_3(id_10),
      .id_4(1),
      .id_5(id_9),
      .id_6(!id_8),
      .id_7(id_5),
      .id_8(id_17),
      .id_9(id_1),
      .id_10(1'b0),
      .id_11(id_6),
      .id_12(!id_10)
  ); module_0(
      id_20, id_9, id_3, id_19
  );
  wire id_26;
  always_comb @(posedge id_19 or posedge id_21) $display(1, id_15 == 1, id_16);
endmodule
