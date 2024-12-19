// Seed: 1738288841
module module_0 (
    input supply0 id_0,
    output tri0 id_1,
    input tri0 id_2,
    output wor id_3,
    input tri0 id_4,
    input tri id_5,
    input supply1 id_6,
    output tri0 id_7,
    input wand id_8,
    output uwire id_9,
    input supply1 id_10,
    output tri id_11,
    input supply1 id_12,
    output tri id_13,
    output supply0 id_14,
    output uwire id_15,
    input supply0 id_16,
    output wor id_17
);
  wire id_19;
  wire id_20;
  assign id_11 = id_2;
  assign id_1  = 1;
endmodule
module module_1 (
    input  tri0  id_0,
    input  tri1  id_1,
    input  uwire id_2,
    output tri0  id_3,
    output tri1  id_4
);
  always @(1 or posedge 1'b0) begin : LABEL_0
    #1 id_4 = 1;
  end
  id_6(
      .id_0(id_4 * id_4), .id_1(id_1), .id_2(id_3)
  );
  module_0 modCall_1 (
      id_2,
      id_4,
      id_2,
      id_3,
      id_0,
      id_2,
      id_1,
      id_4,
      id_2,
      id_3,
      id_1,
      id_3,
      id_1,
      id_3,
      id_3,
      id_4,
      id_0,
      id_4
  );
  assign modCall_1.type_23 = 0;
endmodule
