// Seed: 4292638865
module module_0 (
    input tri1 id_0,
    input wor id_1,
    input supply1 id_2,
    input supply1 id_3,
    output supply0 id_4,
    input tri0 id_5,
    input supply1 id_6,
    output tri0 id_7,
    output wand id_8,
    input tri1 id_9,
    output supply0 id_10,
    output wire id_11,
    input tri0 void id_12,
    input tri1 id_13
);
  tri0 id_15 = -1;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    output supply1 id_1,
    input wor id_2,
    input wire id_3,
    output logic id_4,
    input supply0 id_5,
    input wor id_6
);
  assign id_1 = 1;
  if (-1'b0) assign id_4 = id_0 - id_2;
  else begin : LABEL_0
    always id_4 <= 1;
  end
  wire id_8, id_9;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_0,
      id_1,
      id_3,
      id_6,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_5,
      id_6
  );
endmodule
