// Seed: 2245908028
module module_0 (
    output wor id_0,
    output supply1 id_1,
    input tri0 id_2,
    input uwire id_3
);
  assign id_0 = id_3;
endmodule
module module_1 (
    input uwire id_0,
    input tri id_1,
    output supply1 id_2,
    output tri id_3,
    input tri0 id_4,
    input tri id_5,
    input tri1 id_6,
    input wire id_7,
    input uwire id_8,
    input wor id_9,
    output uwire id_10,
    input wor id_11,
    input supply0 id_12,
    output tri0 id_13
);
  assign id_13 = -1 === id_0;
  always @(posedge 1 or posedge id_9) begin : LABEL_0
    assert (id_7 * id_12);
  end
  module_0 modCall_1 (
      id_3,
      id_10,
      id_6,
      id_9
  );
  assign modCall_1.id_2 = 0;
  logic [1 : 1] id_15;
endmodule
