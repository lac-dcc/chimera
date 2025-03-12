// Seed: 1494123918
module module_0 (
    input tri id_0,
    output uwire id_1,
    input wire id_2,
    input uwire id_3,
    output supply0 id_4,
    output tri0 id_5,
    output wor id_6,
    input tri0 id_7,
    output supply1 id_8,
    input wand id_9,
    output tri1 id_10,
    output supply0 id_11,
    input supply1 id_12,
    output wand id_13
);
  wire id_15, id_16[-1 : -1];
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    input wire id_1,
    input uwire id_2,
    output wand id_3,
    input wire id_4
);
  wire id_6;
  id_7 :
  assert property (@(id_6) -1)
  else id_7 = id_2;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_4,
      id_2,
      id_3,
      id_0,
      id_0,
      id_1,
      id_0,
      id_4,
      id_3,
      id_0,
      id_4,
      id_0
  );
  wire id_8, id_9;
  assign id_9 = id_7;
endmodule
