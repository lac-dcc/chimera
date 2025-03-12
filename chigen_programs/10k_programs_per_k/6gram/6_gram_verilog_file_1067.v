// Seed: 3808070084
module module_0 (
    input supply1 id_0,
    input tri0 id_1,
    input uwire id_2,
    input uwire id_3,
    output tri1 id_4,
    input wire id_5,
    input tri0 id_6,
    input uwire id_7,
    output wand id_8,
    output wire id_9
);
endmodule
module module_1 (
    input tri0 id_0,
    input wire id_1,
    input wor id_2,
    input supply0 id_3,
    output wand id_4
);
  assign id_4 = id_0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_3,
      id_4,
      id_1,
      id_0,
      id_0,
      id_4,
      id_4
  );
endmodule
module module_2 (
    input supply0 id_0,
    input wand id_1,
    input supply1 id_2,
    input tri id_3,
    output wand id_4,
    input tri1 id_5,
    input wand id_6,
    input uwire id_7,
    input wor id_8,
    input wor id_9,
    output tri id_10,
    input tri1 id_11,
    input supply1 id_12,
    output logic id_13
);
  parameter id_15 = -1;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_11,
      id_6,
      id_4,
      id_2,
      id_7,
      id_5,
      id_4,
      id_10
  );
  always @(posedge id_7 or posedge id_7)
    if (1) begin : LABEL_0
      id_13 = 1;
    end else id_13 <= -1;
endmodule
