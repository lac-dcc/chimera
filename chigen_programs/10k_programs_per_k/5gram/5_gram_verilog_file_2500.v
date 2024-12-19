// Seed: 4054427415
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_8;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_1
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    output tri0  id_0,
    input  uwire id_1,
    input  wand  id_2
);
  assign id_0 = 1;
  assign module_3.id_13 = 0;
  assign id_0 = 1'b0;
endmodule
module module_3 (
    output wor id_0,
    output uwire id_1,
    input wire id_2,
    input supply1 id_3,
    output tri1 id_4,
    input uwire id_5,
    input tri1 id_6,
    input supply1 id_7,
    output tri1 id_8,
    output tri id_9,
    output tri0 id_10,
    output wor id_11,
    input wand id_12,
    output tri0 id_13,
    output supply0 id_14
);
  wire id_16, id_17;
  id_18 :
  assert property (@(posedge 1) id_3)
  else $display(id_3, 1);
  module_2 modCall_1 (
      id_4,
      id_2,
      id_18
  );
  assign id_13 = 1;
endmodule
