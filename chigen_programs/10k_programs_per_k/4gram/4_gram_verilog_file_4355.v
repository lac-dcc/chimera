// Seed: 457370647
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input uwire id_2,
    output wand id_3
);
  wire id_5;
  wire id_6;
  wire id_7;
endmodule
module module_1 (
    input tri0 id_0,
    input tri0 id_1,
    input wire id_2,
    output wire id_3,
    input wire id_4,
    input wor id_5,
    input supply1 id_6,
    input wor id_7,
    input supply1 id_8,
    input wand id_9
);
  wor id_11 = $display(1 - 1, id_5, 1, (1), 1, 1);
  always @(posedge id_6 ^ id_5) id_11 = id_9;
  assign id_3 = 0;
  wire id_12;
  module_0 modCall_1 (
      id_11,
      id_4,
      id_8,
      id_11
  );
  assign modCall_1.id_1 = 0;
  id_13 :
  assert property (@(posedge id_2) id_13)
  else $display;
  wire id_14, id_15, id_16;
  string id_17 = "";
endmodule
