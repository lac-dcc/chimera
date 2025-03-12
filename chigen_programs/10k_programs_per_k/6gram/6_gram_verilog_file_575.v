// Seed: 3367259990
module module_0 (
    input supply1 id_0,
    output logic id_1,
    output logic id_2,
    input wire id_3,
    input wand id_4,
    input wor id_5,
    input wor id_6,
    input wor id_7,
    output logic id_8
);
  always @(id_3 or posedge -1) begin : LABEL_0
    id_2 <= id_7;
    id_8 <= id_6;
  end
  wire id_10, id_11;
  initial id_1 <= id_5;
endmodule
module module_1 (
    input wor id_0,
    output tri1 id_1,
    input supply1 id_2,
    output supply1 id_3,
    input supply0 id_4,
    output tri0 id_5,
    input supply1 id_6,
    input tri0 id_7,
    input wand id_8,
    output logic id_9
);
  always @(posedge 1 == 1 or 1) id_9 <= 1;
  module_0 modCall_1 (
      id_2,
      id_9,
      id_9,
      id_7,
      id_6,
      id_6,
      id_7,
      id_2,
      id_9
  );
  assign modCall_1.id_3 = 0;
endmodule
