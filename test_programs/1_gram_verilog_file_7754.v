// Seed: 3744862555
module module_0 (
    input supply0 id_0,
    output wand id_1,
    input uwire id_2,
    input tri1 id_3,
    id_20,
    input tri id_4,
    input wor id_5,
    output tri1 id_6,
    input supply1 id_7,
    input supply0 id_8,
    input wire id_9,
    output tri0 id_10,
    input tri id_11,
    output wand id_12,
    input tri0 id_13,
    output uwire id_14,
    input tri0 id_15,
    input wor id_16,
    output tri1 id_17,
    input uwire id_18
);
  assign id_14 = id_8;
  supply1 id_21 = -1, id_22, id_23;
  assign module_1.type_10 = 0;
  assign id_12 = id_23;
endmodule
module module_1 (
    output tri0 id_0,
    output tri0 id_1,
    input tri1 id_2,
    output logic id_3,
    output supply1 id_4,
    output tri0 id_5,
    input tri0 id_6,
    input wand id_7,
    input tri0 id_8,
    output uwire id_9,
    input tri1 id_10,
    input logic id_11,
    output wire id_12,
    input tri id_13,
    input tri1 id_14,
    output tri id_15,
    output supply1 id_16,
    input tri id_17,
    input wand id_18,
    id_20
);
  id_21 :
  assert property (@(posedge -1'b0) id_20) id_3 <= id_11;
  module_0 modCall_1 (
      id_2,
      id_15,
      id_7,
      id_8,
      id_2,
      id_18,
      id_4,
      id_18,
      id_14,
      id_10,
      id_12,
      id_10,
      id_9,
      id_13,
      id_0,
      id_7,
      id_10,
      id_1,
      id_7
  );
endmodule
