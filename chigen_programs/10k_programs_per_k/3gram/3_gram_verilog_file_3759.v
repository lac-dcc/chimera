// Seed: 2399484404
module module_0 (
    output tri0 id_0,
    output supply0 id_1,
    input supply1 id_2,
    input supply1 id_3,
    output tri0 id_4,
    input tri id_5,
    input tri1 id_6,
    input tri0 id_7
    , id_15,
    input wor id_8,
    input tri1 id_9,
    input supply1 id_10,
    output wand id_11,
    input tri1 id_12,
    output supply0 id_13
);
endmodule
module module_1 (
    input tri id_0,
    output wor id_1
    , id_7,
    input supply1 id_2,
    output supply0 id_3,
    output supply1 id_4,
    output wand id_5
);
  reg id_8;
  logic [7:0] id_9;
  wire id_10;
  always @(id_9[1] or posedge 1'b0) begin : LABEL_0
    id_8 <= #id_10 1;
  end
  wire id_11;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_0,
      id_0,
      id_3,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_4,
      id_0,
      id_3
  );
  assign modCall_1.id_6 = 0;
endmodule
