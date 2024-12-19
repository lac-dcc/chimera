// Seed: 3951627751
module module_0 (
    output supply1 id_0,
    input supply0 id_1,
    output supply0 id_2,
    output supply1 id_3,
    input wire id_4,
    input uwire id_5,
    output uwire id_6,
    output tri id_7
    , id_16,
    input wor id_8,
    input wire id_9,
    input supply1 id_10,
    input wor id_11,
    input tri0 id_12,
    output uwire id_13,
    input wand id_14
);
  wire id_17, id_18;
  wire id_19;
  assign id_16 = id_1;
  wire id_20;
  assign module_1.id_10 = 0;
endmodule
module module_1 (
    input logic id_0,
    input supply0 id_1
    , id_12,
    input supply1 id_2,
    input logic id_3,
    output tri0 id_4,
    output logic id_5,
    output tri0 id_6,
    output logic id_7,
    input supply1 id_8,
    input logic id_9,
    input tri0 id_10
);
  always begin : LABEL_0
    id_7 <= 1'b0;
    id_5 <= 1'b0;
  end
  module_0 modCall_1 (
      id_4,
      id_10,
      id_4,
      id_6,
      id_1,
      id_2,
      id_4,
      id_4,
      id_1,
      id_8,
      id_2,
      id_1,
      id_1,
      id_4,
      id_10
  );
endmodule
