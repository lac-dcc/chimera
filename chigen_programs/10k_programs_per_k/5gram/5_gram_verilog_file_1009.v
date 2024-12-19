// Seed: 2909717939
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = 1;
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
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  supply1 id_8;
  tri1 id_9 = id_2[1] ==? 1'b0;
  module_0 modCall_1 (
      id_1,
      id_9,
      id_5,
      id_9
  );
  assign modCall_1.id_1 = 0;
  assign id_7 = 1 && id_8 || $display ? 1 : id_1 ? (1 !=? id_1) : 1;
endmodule
