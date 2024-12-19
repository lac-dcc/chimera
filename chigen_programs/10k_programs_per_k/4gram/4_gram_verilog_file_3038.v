// Seed: 3125969122
module module_0 (
    input uwire id_0
    , id_23,
    input supply0 id_1,
    input wire id_2,
    output tri id_3,
    input tri1 id_4,
    input wor id_5,
    input uwire id_6,
    output tri0 id_7,
    output wor id_8,
    output supply1 id_9,
    input tri1 id_10,
    output wor id_11,
    output wire id_12,
    input tri id_13,
    input wand id_14,
    output wire id_15,
    input supply1 id_16,
    input tri1 id_17,
    output tri id_18,
    output wand id_19,
    input supply1 id_20,
    input tri1 id_21
);
  wire id_24;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input supply1 id_1,
    output logic id_2,
    output supply0 id_3,
    output logic id_4,
    input logic id_5,
    output wire id_6
);
  assign id_6 = !id_0 | id_0 - id_0;
  always @(posedge 1) begin : LABEL_0
    id_4 <= id_5;
  end
  id_8();
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_3,
      id_0,
      id_1,
      id_1,
      id_6,
      id_3,
      id_3,
      id_0,
      id_6,
      id_6,
      id_1,
      id_1,
      id_6,
      id_0,
      id_1,
      id_3,
      id_6,
      id_0,
      id_0
  );
  assign id_2 = id_5;
  nor primCall (id_3, id_0, id_5, id_1, id_8);
endmodule
