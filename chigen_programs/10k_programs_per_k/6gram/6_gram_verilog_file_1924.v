// Seed: 362482907
module module_0 (
    output supply1 id_0
    , id_17,
    input tri1 id_1,
    input tri0 id_2,
    output wand id_3,
    output wor id_4,
    input tri0 id_5,
    output wire id_6,
    input supply0 id_7,
    input tri0 id_8,
    output tri1 id_9,
    input wor id_10,
    input tri0 id_11,
    output wire id_12,
    input wand id_13,
    input tri0 id_14,
    input supply0 id_15
);
  always force id_12 = 1;
endmodule
module module_1 (
    output supply1 id_0,
    output logic id_1,
    input wand id_2,
    input wand id_3,
    output supply0 id_4
);
  parameter id_6 = 1;
  wire id_7;
  wire id_8;
  always @(-1'b0 or negedge -1) begin : LABEL_0
    id_1 = 1'd0;
  end
  module_0 modCall_1 (
      id_0,
      id_2,
      id_3,
      id_0,
      id_0,
      id_3,
      id_0,
      id_2,
      id_3,
      id_0,
      id_3,
      id_2,
      id_0,
      id_3,
      id_2,
      id_2
  );
  tri0 id_9 = 1;
endmodule
