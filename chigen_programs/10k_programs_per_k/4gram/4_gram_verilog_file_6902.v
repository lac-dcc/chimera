// Seed: 590462807
module module_0 (
    input wire id_0,
    output supply0 id_1,
    input tri1 id_2,
    input wand id_3
    , id_14,
    input supply0 id_4,
    output supply1 id_5,
    output uwire id_6,
    output wand id_7,
    input uwire id_8,
    output tri0 id_9,
    output wor id_10,
    input tri0 id_11,
    output uwire id_12
);
  wire id_15;
  wire id_16;
endmodule
module module_1 (
    output supply0 id_0,
    input  supply0 id_1,
    input  uwire   id_2
);
  supply1 id_4;
  assign id_4 = id_2;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_2,
      id_2,
      id_4,
      id_4,
      id_4,
      id_2,
      id_0,
      id_0,
      id_1,
      id_4
  );
  assign modCall_1.id_10 = 0;
  id_5 :
  assert property (@(posedge id_2) 1'b0)
  else $display;
  wire id_6;
  wire id_7;
endmodule
