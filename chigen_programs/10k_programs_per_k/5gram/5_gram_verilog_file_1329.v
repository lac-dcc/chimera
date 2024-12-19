// Seed: 1489797598
module module_0 (
    input wor id_0,
    output supply0 id_1,
    input tri0 id_2,
    input tri1 id_3,
    input supply0 id_4,
    input tri1 id_5,
    input tri1 id_6
);
  assign id_1 = id_4;
endmodule
module module_1 (
    output supply1 id_0,
    input wand id_1,
    output wand id_2,
    input wire id_3,
    input wand id_4
);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_4,
      id_3,
      id_3,
      id_1,
      id_3
  );
  assign modCall_1.id_3 = 0;
  assign id_2 = 1 ==? 1;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_11;
endmodule
module module_3 (
    output tri id_0
    , id_21,
    input supply1 id_1,
    output uwire id_2,
    input tri1 id_3,
    output wor id_4,
    input uwire id_5,
    input tri id_6,
    output supply1 id_7,
    output tri1 id_8,
    output tri id_9,
    output tri0 id_10,
    input wand id_11,
    output tri id_12,
    output tri id_13,
    output wire id_14,
    input wor id_15,
    output uwire id_16,
    output supply0 id_17,
    output tri id_18,
    input tri id_19
);
  tri0 id_22, id_23;
  always @(*) id_9 = 1'd0;
  id_24 :
  assert property (@(posedge 1) (1 || id_6 == ""))
  else $display(1, 1'd0, id_19);
  module_2 modCall_1 (
      id_21,
      id_24,
      id_24,
      id_24,
      id_24,
      id_24,
      id_21,
      id_24,
      id_24,
      id_21
  );
  assign id_10 = (id_22);
endmodule
