// Seed: 1538455954
module module_0 (
    input wor id_0,
    input supply0 id_1,
    input uwire id_2,
    input supply1 id_3,
    output supply1 id_4,
    input tri0 id_5
    , id_12,
    input wor id_6,
    output tri1 id_7,
    input wire id_8,
    output supply0 id_9,
    input wand id_10
);
  assign id_9 = id_12;
  wire id_13;
endmodule
module module_1 (
    input tri0 id_0,
    input supply1 id_1,
    output wand id_2,
    output logic id_3,
    input tri1 id_4,
    output logic id_5,
    output tri id_6,
    input uwire id_7,
    output tri0 id_8
);
  assign id_8 = id_4;
  parameter id_10 = 1;
  always @(posedge id_1 or posedge -1) begin : LABEL_0
    `define pp_11 0
    id_3 <= 1;
    id_5 = id_1;
  end
  assign id_5 = 1;
  assign id_2 = id_7;
  always_comb @(negedge id_0) begin : LABEL_1
    id_5 <= 1;
  end
  module_0 modCall_1 (
      id_1,
      id_0,
      id_4,
      id_1,
      id_8,
      id_0,
      id_1,
      id_8,
      id_1,
      id_8,
      id_1
  );
  wire id_12;
endmodule
