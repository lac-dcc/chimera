// Seed: 1758268643
module module_0 (
    output uwire id_0,
    input uwire id_1,
    input supply0 id_2,
    output supply1 id_3,
    input tri id_4,
    input supply1 id_5,
    input wand id_6,
    output wire id_7
);
  wire id_9;
  xor primCall (id_0, id_2, id_6);
  module_2 modCall_1 (
      id_4,
      id_3,
      id_0,
      id_1,
      id_3,
      id_5,
      id_7,
      id_1,
      id_6,
      id_0,
      id_4,
      id_5,
      id_5,
      id_0,
      id_1,
      id_1,
      id_2,
      id_4,
      id_1
  );
  assign modCall_1.id_16 = 0;
  assign module_1.id_1   = 0;
endmodule
module module_1 (
    input tri id_0,
    input tri id_1
);
  wor id_3;
  assign id_3 = id_0;
  id_4 :
  assert property (@(posedge id_4) id_0)
  else $display(id_0, 1, 1, 1);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4,
      id_3,
      id_4
  );
endmodule
module module_2 (
    input wire id_0,
    output tri0 id_1,
    output wand id_2,
    input supply1 id_3,
    output supply1 id_4,
    input uwire id_5,
    output tri1 id_6,
    input wire id_7,
    input wire id_8,
    output supply0 id_9,
    input wor id_10,
    input supply1 id_11,
    input wire id_12,
    output wor id_13,
    input wor id_14,
    input wire id_15,
    input tri id_16,
    input uwire id_17,
    input uwire id_18
);
  assign id_6 = id_15;
  assign id_9 = 1'd0;
endmodule
