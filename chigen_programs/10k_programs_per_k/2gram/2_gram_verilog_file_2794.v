// Seed: 153108070
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign module_1.id_12 = 0;
  wire id_6;
endmodule
module module_1 #(
    parameter id_13 = 32'd68
) (
    input tri0 id_0,
    input wire id_1,
    input wand id_2,
    output wor id_3,
    input tri0 id_4,
    input tri0 id_5,
    output tri0 id_6,
    output wor id_7,
    input wor id_8,
    input supply0 id_9,
    input wor id_10,
    input wor id_11,
    input supply0 id_12,
    input tri1 _id_13,
    output supply1 id_14,
    input tri0 id_15,
    output supply0 id_16,
    input wand id_17,
    output uwire id_18
);
  logic [id_13 : 1] id_20;
  id_21 :
  assert property (@(posedge 1 or negedge {1'h0, id_15, -1}) 1)
  else;
  and primCall (
      id_6,
      id_4,
      id_2,
      id_1,
      id_10,
      id_11,
      id_0,
      id_8,
      id_20,
      id_5,
      id_15,
      id_17,
      id_9,
      id_12,
      id_21
  );
  module_0 modCall_1 (
      id_21,
      id_21,
      id_21,
      id_20,
      id_20
  );
endmodule
