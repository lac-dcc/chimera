// Seed: 278523227
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    input wor id_2,
    output wor id_3,
    input supply1 id_4,
    output logic id_5,
    input wire id_6,
    output tri1 id_7
);
  always @(posedge id_0 - 1) begin : LABEL_0
    id_5 <= -1;
  end
endmodule
module module_1 (
    input wand id_0,
    input tri1 id_1,
    output tri1 id_2,
    input tri1 id_3,
    output supply0 id_4,
    output tri0 id_5,
    input wor id_6,
    input supply0 id_7,
    output wor id_8,
    input supply0 id_9,
    output logic id_10,
    input supply0 id_11
    , id_13
);
  parameter id_14 = 1;
  assign id_10 = 1'b0;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_6,
      id_4,
      id_9,
      id_10,
      id_6,
      id_5
  );
  assign modCall_1.id_5 = 0;
  always id_10 = #1 id_11;
endmodule
