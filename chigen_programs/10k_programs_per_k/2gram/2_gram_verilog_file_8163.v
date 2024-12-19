// Seed: 2945030396
module module_0 (
    output tri id_0
    , id_11,
    output supply0 id_1,
    input tri id_2,
    input supply1 id_3,
    input wire id_4,
    input wire id_5,
    input tri1 id_6,
    output supply1 id_7,
    input uwire id_8,
    input uwire id_9
);
  assign id_1 = 1;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    output wand id_0,
    input  wand id_1,
    input  wor  id_2,
    output wire id_3
);
  wire id_5;
  wire id_6;
  supply0 id_7;
  wire id_8;
  assign id_5 = 1 - 1'b0;
  xnor primCall (id_3, id_6, id_7, id_1, id_2, id_8, id_5);
  assign id_7 = 1;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_3,
      id_2,
      id_1
  );
  id_9(
      .id_0(1'b0 ==? 1'd0)
  );
endmodule
