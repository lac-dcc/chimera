// Seed: 3116857623
module module_0 (
    input tri1 id_0,
    input wire id_1,
    input supply0 id_2,
    input wand id_3,
    output supply0 id_4,
    input wor id_5,
    output tri id_6,
    input wor id_7
);
  assign id_4 = id_1;
  always @(posedge id_0 or(-1)) $unsigned(88);
  ;
endmodule
module module_1 (
    output wor id_0,
    input wor id_1,
    input supply0 id_2,
    output wor id_3,
    output wor id_4,
    output supply0 id_5,
    output tri1 id_6,
    input wire id_7,
    output tri0 id_8,
    input wand id_9,
    input wor id_10,
    input tri0 id_11,
    input tri0 id_12,
    input tri0 id_13,
    output logic id_14
);
  wire id_16;
  always @(posedge {1{id_1}} or 1) begin : LABEL_0
    id_14 = -1;
  end
  module_0 modCall_1 (
      id_9,
      id_10,
      id_2,
      id_10,
      id_5,
      id_1,
      id_8,
      id_12
  );
  assign modCall_1.id_2 = 0;
endmodule
