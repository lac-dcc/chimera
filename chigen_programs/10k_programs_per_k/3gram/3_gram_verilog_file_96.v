// Seed: 2734129512
module module_0 (
    output supply0 id_0,
    output supply0 id_1,
    output supply0 id_2,
    input uwire id_3,
    output tri0 id_4,
    output tri0 id_5,
    input tri0 id_6,
    output supply1 id_7,
    output supply1 id_8,
    output supply1 id_9,
    input tri id_10,
    input wire id_11,
    output wire id_12,
    input tri1 id_13,
    input supply1 id_14,
    input tri1 id_15,
    input supply1 id_16,
    input uwire id_17,
    input tri1 id_18,
    input wor id_19,
    input wand id_20
);
  wire id_22;
endmodule
module module_1 (
    output logic id_0,
    output wire  id_1,
    input  tri   id_2,
    output uwire id_3,
    input  wire  id_4,
    input  logic id_5,
    input  wor   id_6,
    input  uwire id_7
);
  always @(posedge 1) id_0 <= id_5;
  wire id_9;
  assign id_0 = 1'b0;
  or primCall (id_0, id_9, id_6);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_2,
      id_3,
      id_3,
      id_6,
      id_1,
      id_3,
      id_1,
      id_4,
      id_7,
      id_1,
      id_6,
      id_7,
      id_6,
      id_2,
      id_4,
      id_4,
      id_6,
      id_2
  );
  assign modCall_1.type_24 = 0;
endmodule
