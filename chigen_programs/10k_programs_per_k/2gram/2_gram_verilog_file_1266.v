// Seed: 1276309842
module module_0 (
    input supply1 id_0,
    output wire id_1,
    output wire id_2,
    output wand id_3,
    input uwire id_4,
    input wor id_5,
    output uwire id_6,
    input wire id_7,
    input wand id_8,
    output supply0 id_9,
    input supply1 id_10,
    input supply0 id_11,
    output supply1 id_12,
    output uwire id_13,
    input supply0 id_14,
    input tri0 id_15,
    input supply1 id_16,
    output tri0 id_17
);
  wire id_19;
  wire id_20;
endmodule
module module_1 (
    output wire id_0,
    output logic id_1,
    output tri1 id_2,
    input supply1 id_3,
    output tri1 id_4,
    input tri id_5,
    input logic id_6,
    input supply1 id_7
);
  initial begin : LABEL_0
    id_1 = #1 id_6;
  end
  module_0 modCall_1 (
      id_7,
      id_0,
      id_4,
      id_0,
      id_3,
      id_3,
      id_0,
      id_5,
      id_3,
      id_0,
      id_3,
      id_7,
      id_2,
      id_0,
      id_3,
      id_5,
      id_3,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule
