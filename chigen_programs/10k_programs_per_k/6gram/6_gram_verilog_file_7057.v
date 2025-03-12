// Seed: 4253576262
module module_0 (
    input supply0 id_0,
    input uwire id_1,
    input uwire id_2,
    input tri id_3,
    input tri id_4,
    input supply1 id_5,
    input wire id_6,
    output wire id_7
);
  assign id_7 = (id_2 == (1));
endmodule
module module_1 (
    output supply0 id_0,
    input supply1 id_1,
    output supply1 id_2,
    input tri0 id_3,
    output wire id_4,
    output wire id_5,
    input wor id_6,
    output tri0 id_7,
    input tri0 id_8,
    input tri1 id_9,
    output tri0 id_10,
    output logic id_11,
    input tri id_12,
    input tri id_13
    , id_16,
    output uwire id_14
);
  always @(posedge id_1) begin : LABEL_0
    id_11 <= id_16 == id_13;
  end
  module_0 modCall_1 (
      id_6,
      id_9,
      id_3,
      id_3,
      id_1,
      id_3,
      id_8,
      id_4
  );
  assign modCall_1.id_3 = 0;
endmodule
