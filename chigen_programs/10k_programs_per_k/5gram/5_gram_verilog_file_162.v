// Seed: 4241961795
module module_0 (
    input tri0 id_0,
    input wire id_1,
    output logic id_2,
    input supply1 id_3,
    input supply0 id_4,
    output supply1 id_5,
    output tri0 id_6
);
  assign id_5 = id_3;
  always @(1) begin : LABEL_0
    id_2 <= id_1 == 1;
  end
  wire id_8;
endmodule
module module_1 (
    output logic id_0,
    input wor id_1,
    input tri id_2
    , id_13,
    input supply1 id_3,
    output supply0 id_4,
    input supply1 id_5,
    input wand id_6,
    output logic id_7,
    input tri1 id_8,
    input tri id_9,
    input wand id_10,
    input logic id_11
);
  always @(negedge 1'b0) begin : LABEL_0
    id_7 = #id_14 id_11;
    id_0 <= id_1 + id_13;
  end
  module_0 modCall_1 (
      id_8,
      id_10,
      id_0,
      id_9,
      id_5,
      id_4,
      id_4
  );
  assign modCall_1.type_3 = 0;
endmodule
