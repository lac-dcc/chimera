// Seed: 2146872348
module module_0 (
    output wor   id_0,
    input  tri   id_1,
    input  uwire id_2,
    input  uwire id_3,
    input  wire  id_4,
    output tri0  id_5
);
  generate
    for (id_7 = 1; id_2 == id_7; id_5 = 1) begin : LABEL_0
      assign id_7 = id_7;
    end
  endgenerate
endmodule
module module_1 (
    output wire id_0,
    input tri0 id_1
    , id_10,
    input wor id_2,
    input tri0 id_3,
    output supply1 id_4,
    input wor id_5,
    output supply1 id_6,
    output wire id_7,
    output wire id_8
);
  always @(negedge id_2) begin : LABEL_0
    id_10 = 1;
  end
  module_0 modCall_1 (
      id_6,
      id_5,
      id_1,
      id_1,
      id_5,
      id_0
  );
  assign modCall_1.id_1 = 0;
endmodule
