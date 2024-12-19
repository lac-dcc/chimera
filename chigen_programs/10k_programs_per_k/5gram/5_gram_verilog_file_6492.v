// Seed: 416331534
module module_0 (
    output tri1 id_0,
    input tri0 id_1,
    output wire id_2,
    input tri0 id_3,
    output wor id_4,
    input supply0 id_5,
    input wire id_6,
    output wor id_7,
    output supply0 id_8,
    output tri1 id_9,
    input wand id_10,
    output supply1 id_11,
    output tri1 id_12,
    input wor id_13,
    output supply1 id_14,
    output supply0 id_15,
    input tri0 id_16,
    input supply1 id_17,
    input supply0 id_18
);
  assign id_7 = {1{id_3}};
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    input wand id_2,
    output tri id_3,
    input tri1 id_4,
    input wor id_5,
    input tri id_6
);
  always @(posedge 1 or posedge 1 - 1) begin : LABEL_0
    id_3 = id_5;
  end
  assign id_3 = 1;
  wire id_8;
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3,
      id_0,
      id_3,
      id_5,
      id_6,
      id_3,
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_2,
      id_4,
      id_1
  );
  assign modCall_1.type_27 = 0;
endmodule
