// Seed: 3175614042
module module_0 (
    output wire id_0,
    input tri0 id_1
    , id_17,
    input tri0 id_2,
    input supply1 id_3,
    output supply0 id_4,
    output supply0 id_5,
    input wor id_6,
    input wor id_7,
    input tri0 id_8,
    output tri id_9,
    input supply0 id_10,
    output wor id_11,
    input wor id_12,
    output supply1 id_13,
    input tri1 id_14,
    output uwire id_15
);
  wire id_18;
  supply1 id_19 = id_10;
endmodule
module module_1 (
    output wor  id_0,
    input  tri  id_1,
    input  tri1 id_2,
    output tri0 id_3
);
  reg id_5;
  tri id_6, id_7, id_8, id_9;
  always @(posedge id_7 or posedge id_9) begin : LABEL_0
    if (1) begin : LABEL_0
      disable id_10;
    end else id_5 <= #1 id_7 < 1'b0;
  end
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_1,
      id_3,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_2,
      id_0,
      id_2,
      id_3
  );
  assign modCall_1.type_0 = 0;
endmodule
