// Seed: 1890133733
module module_0 (
    input wire id_0,
    output supply0 id_1,
    input wand id_2,
    output wire id_3,
    output tri0 id_4,
    input wor id_5,
    output tri1 id_6
);
  wire id_8;
endmodule
module module_1 (
    input tri0 id_0,
    input tri0 id_1,
    input tri0 id_2,
    output wire id_3,
    input supply1 id_4,
    input supply1 id_5,
    input supply0 id_6,
    input supply0 id_7,
    input tri id_8,
    input supply0 id_9,
    input wor id_10
);
  reg id_12;
  module_0 modCall_1 (
      id_10,
      id_3,
      id_8,
      id_3,
      id_3,
      id_5,
      id_3
  );
  assign modCall_1.id_3 = 0;
  always @(id_4 or posedge id_8 ^ 1) begin : LABEL_0
    id_12 = id_10#(.id_7(1));
  end
endmodule
