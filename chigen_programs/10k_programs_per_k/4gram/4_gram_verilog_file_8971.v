// Seed: 2391251794
module module_0 (
    input supply1 id_0,
    input tri0 id_1,
    input wor id_2,
    input tri1 id_3,
    input tri1 id_4,
    input uwire id_5,
    input wand id_6,
    input supply1 id_7,
    output tri id_8,
    output tri id_9,
    output wire id_10,
    input supply0 id_11,
    output tri id_12,
    input wor id_13,
    input tri0 module_0,
    input uwire id_15,
    input wand id_16,
    output wire id_17
);
endmodule
module module_1 (
    input tri0 id_0,
    input supply0 id_1,
    output tri id_2,
    input tri id_3,
    input wire id_4,
    input tri id_5,
    input supply0 id_6,
    output tri1 id_7,
    input wand id_8,
    output logic id_9,
    input tri0 id_10
);
  assign id_9 = 1'b0;
  initial begin : LABEL_0
    id_9 <= -1;
  end
  module_0 modCall_1 (
      id_0,
      id_3,
      id_1,
      id_8,
      id_8,
      id_1,
      id_10,
      id_8,
      id_7,
      id_2,
      id_2,
      id_8,
      id_7,
      id_3,
      id_4,
      id_4,
      id_10,
      id_7
  );
  assign modCall_1.id_15 = 0;
endmodule
