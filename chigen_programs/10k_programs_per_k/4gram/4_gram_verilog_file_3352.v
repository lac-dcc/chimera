// Seed: 1930573708
module module_0 (
    output wand id_0,
    input  wand id_1,
    output tri  id_2,
    input  tri0 id_3,
    output wire id_4
);
  wire id_6 = id_6;
  wire id_7;
  wire id_8;
  wire id_9;
endmodule
module module_1 (
    input  wand id_0,
    output tri0 id_1
);
  wire id_3 = id_3;
  not primCall (id_1, id_0);
  tri1 id_4;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_4,
      id_4,
      id_4
  );
  tri0 id_5 = 1;
  assign id_1 = id_4;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_7 = id_4;
  assign module_3.id_7 = 0;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_5 = id_3;
  assign id_4 = 1;
  supply1 id_6 = id_5[1];
  id_7 :
  assert property (@(posedge id_6) id_1 !=? (1))
  else $display(1, id_1);
  assign id_1 = id_1 ? id_6 : id_1;
  wire id_8;
  module_2 modCall_1 (
      id_8,
      id_6,
      id_6,
      id_1,
      id_7,
      id_7
  );
endmodule
