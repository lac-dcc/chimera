// Seed: 3934014959
module module_0 (
    input wand id_0,
    input tri1 id_1,
    input tri1 id_2,
    input tri0 id_3,
    output wand id_4,
    input wand id_5,
    input wire id_6,
    input wor id_7,
    input wor id_8,
    input supply0 id_9,
    input supply0 id_10,
    input supply0 id_11,
    input wor id_12,
    input wire id_13,
    output tri1 id_14,
    input tri id_15,
    input supply1 id_16,
    input wire id_17,
    input supply0 id_18
);
  assign id_14 = 1'b0;
  assign module_1.type_10 = 0;
endmodule
module module_1 (
    input wire id_0,
    input supply1 id_1,
    output supply1 id_2,
    output uwire id_3,
    input uwire id_4,
    output wand id_5
);
  assign id_2 = 1;
  wire id_7;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_4,
      id_0,
      id_5,
      id_0,
      id_1,
      id_1,
      id_0,
      id_4,
      id_0,
      id_4,
      id_4,
      id_0,
      id_2,
      id_1,
      id_1,
      id_4,
      id_1
  );
  always @(*) begin : LABEL_0
    id_3 = 1;
  end
endmodule
