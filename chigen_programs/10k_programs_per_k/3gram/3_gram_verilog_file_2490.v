// Seed: 4010120018
module module_0 (
    input supply0 id_0,
    input tri1 id_1,
    input wand id_2,
    input wire id_3,
    input tri0 id_4,
    input wire id_5,
    output wire id_6,
    input wire id_7,
    output uwire id_8,
    input tri0 id_9,
    input wor id_10,
    output supply1 id_11,
    input wire id_12,
    input wor id_13
);
  id_15 :
  assert property (@(posedge 1) id_10)
  else begin : LABEL_0
    id_15 = id_12;
  end
  wire id_16;
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input wire id_1,
    input wire id_2,
    output supply1 id_3,
    output tri1 id_4,
    input tri id_5,
    input wand id_6,
    output supply0 id_7,
    output supply1 id_8,
    input tri id_9
);
  xor primCall (id_3, id_0, id_9, id_2, id_5, id_6);
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_9,
      id_5,
      id_6,
      id_7,
      id_1,
      id_8,
      id_1,
      id_1,
      id_3,
      id_6,
      id_1
  );
endmodule
