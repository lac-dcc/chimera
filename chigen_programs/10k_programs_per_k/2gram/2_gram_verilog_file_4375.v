// Seed: 3975269479
module module_0 (
    output tri id_0,
    input tri0 id_1,
    input supply0 id_2,
    input wire id_3,
    input tri1 id_4,
    output tri0 id_5
);
  wire id_7;
  wand id_8;
  assign id_5 = 1;
  assign id_7 = id_1 ? 1 : 1;
  assign id_8 = id_2;
endmodule
module module_1 (
    input supply1 id_0,
    input tri id_1,
    input wand id_2,
    input supply1 id_3,
    input supply0 id_4,
    output logic id_5,
    input supply0 id_6,
    output tri1 id_7,
    input logic id_8,
    input uwire id_9,
    input supply0 id_10,
    output tri0 id_11,
    input tri0 id_12,
    input wire id_13
);
  always @(1) begin : LABEL_0
    id_5 <= id_8;
  end
  module_0 modCall_1 (
      id_7,
      id_10,
      id_6,
      id_9,
      id_9,
      id_11
  );
  assign modCall_1.id_0 = 0;
endmodule
