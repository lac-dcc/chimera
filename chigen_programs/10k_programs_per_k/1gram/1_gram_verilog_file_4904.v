// Seed: 2511703435
module module_0 (
    output wire id_0,
    input wor id_1,
    input supply0 id_2,
    input tri id_3,
    output supply1 id_4,
    output tri0 id_5,
    input wire id_6
    , id_14,
    input wand id_7,
    input tri0 id_8,
    input tri1 id_9,
    output tri id_10,
    output supply1 id_11,
    output tri id_12
);
  wire id_15;
  assign id_11 = -1;
  generate
    logic id_16;
  endgenerate
  assign id_10 = id_1;
  assign id_5  = 1'h0;
  assign id_0  = id_2 != id_9;
  wire id_17;
  wire id_18;
endmodule
module module_1 (
    input  uwire id_0,
    input  tri0  id_1,
    input  wor   id_2,
    output tri1  id_3,
    output logic id_4
);
  wire id_6;
  assign id_3 = -1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_1,
      id_3,
      id_3,
      id_1,
      id_0,
      id_2,
      id_1,
      id_3,
      id_3,
      id_3
  );
  assign id_3 = -1;
  final @(id_2 or posedge id_1) id_4 <= 1 - id_6;
endmodule
