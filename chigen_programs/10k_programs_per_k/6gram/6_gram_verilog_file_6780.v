// Seed: 1425503868
module module_0 (
    output supply0 id_0,
    output supply0 id_1,
    input supply0 id_2,
    input supply1 id_3,
    output tri id_4,
    output wire id_5,
    output wire id_6,
    output tri1 id_7,
    input supply1 id_8
    , id_11,
    output uwire id_9
);
  wire id_12;
  assign id_6 = 1;
  assign module_1.id_9 = 0;
  tri0 id_13;
  wire id_14;
  always @(negedge id_13) begin : LABEL_0
    id_11 <= {id_13 < 1, 1'b0} & id_3;
  end
  assign id_1 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    input tri1 id_1,
    output tri1 id_2,
    output uwire id_3,
    input tri1 id_4,
    input supply1 id_5,
    output tri1 id_6,
    output wor id_7,
    output tri id_8,
    input supply0 id_9,
    input tri0 id_10,
    input supply1 id_11,
    input tri1 id_12,
    input supply0 id_13,
    input wor id_14,
    output wor id_15,
    output supply0 id_16
);
  assign id_2 = 1'd0;
  module_0 modCall_1 (
      id_6,
      id_16,
      id_13,
      id_5,
      id_15,
      id_16,
      id_8,
      id_2,
      id_1,
      id_7
  );
endmodule
