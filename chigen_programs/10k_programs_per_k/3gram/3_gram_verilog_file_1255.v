// Seed: 2323311326
module module_0 (
    output uwire id_0,
    output tri1 id_1,
    input wire id_2,
    output supply1 id_3
);
  id_5(
      .id_0(id_0), .id_1(1)
  );
  always @(posedge id_5) id_1 = 0;
  if (1) initial cover (id_2);
  assign module_1.type_30 = 0;
endmodule
module module_1 (
    output wor id_0,
    input supply1 id_1,
    input wor id_2,
    input tri id_3,
    output wire id_4,
    input wire id_5,
    output tri id_6,
    input supply0 id_7,
    input wand id_8,
    input supply0 id_9,
    input uwire id_10,
    output wor id_11,
    input wand id_12,
    input supply1 id_13,
    input wor id_14,
    input tri id_15,
    output supply1 id_16,
    input tri id_17
    , id_21,
    output tri1 id_18,
    output tri0 id_19
);
  assign id_4 = 1;
  wire id_22;
  wire id_23;
  assign id_4 = id_13;
  id_24(
      .id_0(1'h0),
      .id_1(id_7),
      .id_2({id_17 == 1, 1'b0}),
      .id_3(id_18),
      .id_4(1),
      .id_5(1 - id_0),
      .id_6(1),
      .id_7(id_8++),
      .id_8(1 ? 1 : id_21 ^ 1),
      .id_9(),
      .id_10(id_4 * id_21),
      .id_11(1),
      .id_12(""),
      .id_13(1),
      .id_14(""),
      .id_15(1 + id_16),
      .id_16(1),
      .id_17(1),
      .id_18(1)
  );
  wire id_25;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_3,
      id_19
  );
endmodule
