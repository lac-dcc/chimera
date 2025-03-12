// Seed: 1926389415
module module_0 (
    input tri1 id_0,
    output uwire id_1,
    output tri0 id_2,
    input wor id_3,
    output supply1 id_4,
    output wire id_5,
    input wand id_6,
    input tri id_7,
    output tri0 id_8,
    input tri id_9,
    input wire id_10,
    input tri0 id_11,
    input tri1 id_12
);
endmodule
module module_1 (
    output wand id_0,
    output tri0 id_1,
    output logic id_2,
    input wire id_3,
    input wire id_4,
    output logic id_5,
    output tri0 id_6,
    input tri1 id_7,
    input supply0 id_8,
    output tri1 id_9[1 : 1],
    output wor id_10,
    output tri0 id_11,
    input supply1 id_12,
    input tri id_13,
    input tri0 id_14,
    input wor id_15,
    input supply0 id_16,
    output uwire id_17
);
  wire [1 : 1] id_19, id_20;
  module_0 modCall_1 (
      id_15,
      id_1,
      id_6,
      id_4,
      id_6,
      id_6,
      id_13,
      id_12,
      id_9,
      id_16,
      id_14,
      id_16,
      id_3
  );
  assign modCall_1.id_1 = 0;
  always begin : LABEL_0
    id_2 = id_16;
    @(posedge id_7) id_5 = 1;
  end
endmodule
