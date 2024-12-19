// Seed: 4158469508
module module_0 (
    input wor id_0
    , id_7,
    input supply1 id_1,
    input wand id_2,
    output wand id_3,
    output tri1 id_4,
    input tri0 id_5
);
  wire id_8;
  assign module_1.type_4 = 0;
  wire id_9;
  wire id_10;
  wire id_11;
  assign id_7 = 1;
  wire id_12;
endmodule
module module_1 (
    output tri1 id_0,
    input tri0 id_1,
    output supply0 id_2,
    input wor id_3,
    output tri1 id_4,
    input uwire id_5,
    input supply1 id_6,
    input tri1 id_7,
    input supply1 id_8,
    input tri0 id_9,
    input supply1 id_10,
    input wire id_11,
    input supply1 id_12,
    output wire id_13
);
  assign id_13 = 1;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_6,
      id_4,
      id_13,
      id_9
  );
  id_15 :
  assert property (@(posedge !id_7) 1'h0)
  else @(posedge id_1 - id_3);
endmodule
