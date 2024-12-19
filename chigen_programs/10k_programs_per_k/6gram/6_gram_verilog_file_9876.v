// Seed: 3884735155
module module_0 (
    input wor id_0,
    output wire id_1,
    output wire id_2,
    input tri0 id_3,
    input wire id_4,
    input tri1 id_5,
    input tri0 id_6,
    output tri1 id_7,
    input supply0 id_8,
    input wand id_9,
    input wand id_10,
    output logic id_11
);
  initial id_11 = #1 1;
  assign id_11 = ~id_8;
  wire id_13;
  assign #id_14 id_1 = id_6;
endmodule
module module_1 (
    output wor   id_0,
    output wor   id_1,
    input  wire  id_2,
    output logic id_3
);
  initial begin : LABEL_0
    id_1 = 1;
    if (1) id_3 <= 1;
  end
  wire id_5;
  wire id_6;
  wire id_7;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_3
  );
  assign modCall_1.id_4 = 0;
  wire id_8;
endmodule
