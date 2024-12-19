// Seed: 581878849
module module_0 (
    output supply1 id_0,
    output tri id_1,
    input supply1 id_2,
    output tri id_3,
    output supply0 id_4,
    output uwire id_5
    , id_15,
    input supply0 id_6,
    input wor id_7,
    input uwire id_8,
    output wand id_9,
    input tri0 id_10,
    input tri0 id_11,
    input supply0 id_12,
    output wor id_13
);
  wire id_16;
endmodule
module module_1 (
    input tri1 id_0,
    output tri0 id_1,
    input supply1 id_2
    , id_9,
    input logic id_3,
    output tri id_4,
    input wor id_5,
    output supply0 id_6,
    output logic id_7
);
  assign id_6 = id_0;
  logic id_10, id_11;
  tri0 id_12, id_13, id_14;
  assign id_7 = (id_11);
  module_0 modCall_1 (
      id_6,
      id_4,
      id_5,
      id_6,
      id_4,
      id_6,
      id_5,
      id_5,
      id_5,
      id_4,
      id_0,
      id_2,
      id_0,
      id_1
  );
  assign modCall_1.type_5 = 0;
  id_15(
      .id_0(1)
  );
  initial begin : LABEL_0
    id_11 <= id_3;
  end
  assign id_10 = 1'b0;
  assign id_12 = 1'b0;
endmodule
