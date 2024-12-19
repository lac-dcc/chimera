// Seed: 3626592101
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
  input wire id_2;
  input wire id_1;
  assign id_4 = id_1 == 1;
  assign module_1.id_17 = 0;
  wire id_6;
  wire id_7;
  assign id_3 = id_1;
endmodule
module module_1 (
    input tri0 id_0,
    output tri0 id_1,
    input wand id_2
    , id_19,
    output wand id_3,
    output supply0 id_4,
    output wor id_5,
    output wor id_6,
    input wand id_7,
    input tri1 id_8,
    input tri1 id_9,
    input wor id_10,
    output wand id_11,
    input supply0 id_12,
    output wor id_13,
    output wor id_14,
    output wire id_15,
    input tri1 id_16,
    output tri0 id_17
);
  id_20 :
  assert property (@(posedge 1'b0) id_10 < id_19)
  else $display(1);
  module_0 modCall_1 (
      id_20,
      id_20,
      id_20,
      id_20,
      id_19
  );
endmodule
