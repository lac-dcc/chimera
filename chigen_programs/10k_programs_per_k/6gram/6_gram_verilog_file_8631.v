// Seed: 1244527993
module module_0 (
    input tri id_0,
    input tri id_1,
    input supply0 id_2,
    input wor id_3,
    input tri0 id_4,
    input supply1 id_5,
    input supply0 id_6
    , id_9,
    input tri0 id_7
);
  uwire id_10;
  wire  id_11;
  tri1  id_12 = id_4 == 1 - 1;
  assign id_10 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    input supply0 id_1,
    output supply0 id_2,
    input wor id_3,
    output tri id_4,
    output supply1 id_5
    , id_13,
    input tri0 id_6,
    output tri0 id_7,
    input tri0 id_8,
    output uwire id_9,
    input wire id_10,
    output uwire id_11
);
  always @(negedge id_6) begin : LABEL_0
    id_13 = !id_8;
  end
  module_0 modCall_1 (
      id_0,
      id_10,
      id_8,
      id_3,
      id_8,
      id_8,
      id_10,
      id_10
  );
  assign modCall_1.id_4 = 0;
  assign id_7 = 1 + id_0;
  wire id_14;
endmodule
