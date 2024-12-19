// Seed: 3581852020
module module_0 (
    input wor id_0,
    input wor id_1,
    output supply0 id_2,
    input wor id_3,
    output wor id_4,
    input tri0 id_5,
    input supply0 id_6,
    input supply0 id_7,
    input tri1 id_8,
    input supply1 id_9,
    input tri id_10,
    output tri1 id_11,
    output tri1 id_12,
    input supply1 id_13,
    input uwire id_14,
    output wire id_15,
    input tri0 id_16,
    input wand id_17,
    output wor id_18
);
  tri0 id_20;
  wire id_21, id_22;
  wire id_23;
  always @* begin : LABEL_0
    id_20 = 1;
  end
  id_24(
      .id_0(id_18),
      .id_1(""),
      .id_2(1'b0),
      .id_3(id_6),
      .id_4(1),
      .id_5(id_5 | id_10 | id_5),
      .id_6(1),
      .id_7(id_22)
  );
  always @(posedge 1 or 1'b0) #1;
endmodule
module module_1 (
    input tri id_0,
    input tri id_1,
    input supply0 id_2,
    input supply1 id_3,
    output wire id_4,
    input wire id_5,
    input tri1 id_6,
    output supply1 id_7,
    inout uwire id_8
);
  always @(id_2 or 1'h0 !== 1 or posedge id_2 or posedge 1) release id_7;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_8,
      id_4,
      id_3,
      id_6,
      id_1,
      id_3,
      id_2,
      id_8,
      id_8,
      id_7,
      id_1,
      id_3,
      id_4,
      id_2,
      id_8,
      id_8
  );
  assign modCall_1.type_2 = 0;
endmodule
