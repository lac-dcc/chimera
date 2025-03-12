// Seed: 432582374
module module_0 (
    output wor id_0,
    input uwire id_1,
    output tri0 id_2,
    input tri1 id_3,
    output tri id_4,
    output uwire id_5,
    input supply0 id_6,
    input wire id_7,
    output tri id_8,
    input wand id_9,
    output supply1 id_10
);
  assign id_5 = -1;
endmodule
module module_1 (
    output tri1 id_0,
    input wire id_1,
    input tri1 id_2,
    inout uwire id_3,
    input wand id_4,
    input tri1 id_5,
    input wand id_6,
    input wor id_7,
    input supply1 id_8,
    output tri id_9,
    output wor id_10,
    output logic id_11
);
  always @(*) begin : LABEL_0
    id_11 = -1;
  end
  module_0 modCall_1 (
      id_10,
      id_4,
      id_9,
      id_5,
      id_0,
      id_9,
      id_5,
      id_7,
      id_10,
      id_8,
      id_0
  );
  assign modCall_1.id_1 = 0;
endmodule
