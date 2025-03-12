// Seed: 2853944277
module module_0 (
    output tri1 id_0,
    output wor id_1,
    output supply1 id_2,
    input tri0 id_3,
    input tri id_4,
    output tri1 id_5,
    input wor id_6,
    output wand id_7,
    input uwire module_0,
    output wor id_9,
    input wor id_10,
    input supply1 id_11,
    input supply1 id_12
);
  localparam id_14 = 1;
  assign id_2 = id_12 < 1;
  wire  id_15;
  logic id_16;
  ;
endmodule
module module_1 (
    input tri0 id_0,
    output logic id_1,
    input supply0 id_2,
    input wor id_3,
    input supply0 id_4,
    input wand id_5,
    input wire id_6,
    input wand id_7,
    output tri1 id_8,
    input tri1 id_9,
    input wand id_10
    , id_12
);
  parameter id_13 = ~(1);
  module_0 modCall_1 (
      id_8,
      id_8,
      id_8,
      id_5,
      id_2,
      id_8,
      id_7,
      id_8,
      id_10,
      id_8,
      id_5,
      id_0,
      id_6
  );
  assign modCall_1.id_10 = 0;
  wire id_14;
  always @(*) begin : LABEL_0
    if (id_13) id_1 <= 1;
    else id_12 <= 1;
  end
endmodule
