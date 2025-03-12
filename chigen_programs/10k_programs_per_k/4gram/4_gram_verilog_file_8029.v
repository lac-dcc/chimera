// Seed: 3237519861
module module_0 (
    input wand id_0,
    input tri1 id_1,
    output supply0 id_2,
    output tri0 id_3,
    output wor id_4,
    input supply1 id_5,
    output wire id_6,
    input wor id_7,
    input uwire id_8,
    input tri0 id_9,
    input wire id_10,
    input wire id_11,
    output wire id_12,
    input wire id_13,
    input tri0 id_14,
    input wor id_15,
    input tri0 id_16,
    output supply1 id_17,
    input supply0 id_18,
    input supply0 id_19
);
  id_21 :
  assert property (@(posedge id_19) id_13)
  else $unsigned(59);
  ;
endmodule
module module_1 (
    output supply1 id_0,
    output tri1 id_1,
    input wire id_2
);
  wire [1 : -1 'b0] id_4, id_5, id_6;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_1,
      id_0,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
