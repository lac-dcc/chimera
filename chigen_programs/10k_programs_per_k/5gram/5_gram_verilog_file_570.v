// Seed: 2999190246
module module_0 (
    input wand id_0,
    input tri1 id_1,
    output logic id_2,
    input supply1 id_3,
    input tri0 id_4,
    input tri1 id_5,
    input wor id_6,
    input wor id_7
);
  always @(1 or -1) if (1 ^ -1 == 1'b0) id_2 <= id_5;
endmodule
module module_1 (
    output wand id_0,
    input tri id_1,
    input wire id_2,
    input wire id_3,
    output supply1 id_4,
    input tri1 id_5,
    input tri0 id_6,
    input wor id_7,
    input tri1 id_8,
    output logic id_9,
    output logic id_10
);
  assign id_10 = id_2;
  always @(posedge (id_8)) begin : LABEL_0
    id_9 <= 1'b0;
  end
  module_0 modCall_1 (
      id_2,
      id_7,
      id_10,
      id_7,
      id_7,
      id_1,
      id_8,
      id_8
  );
  assign modCall_1.id_4 = 0;
  always @(posedge 1 == id_2 < id_5) id_10 = id_7;
  wire  id_12;
  logic id_13;
endmodule
