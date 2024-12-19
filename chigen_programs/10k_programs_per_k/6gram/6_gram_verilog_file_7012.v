// Seed: 976324937
module module_0 (
    output wire id_0,
    output wand id_1,
    input supply1 id_2,
    input supply1 id_3,
    output supply0 id_4,
    input supply1 id_5,
    input wire id_6,
    output tri id_7,
    output tri id_8,
    output supply1 id_9
);
  assign id_0 = 1;
  wire id_11;
  wire id_12;
  wire id_13;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input logic id_1,
    output logic id_2,
    input supply0 id_3,
    input supply1 id_4,
    output tri0 id_5
);
  always @(negedge id_3) begin : LABEL_0
    id_2 = #1 id_1;
  end
  assign id_0 = 1;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_3,
      id_3,
      id_0,
      id_3,
      id_4,
      id_5,
      id_5,
      id_5
  );
endmodule
