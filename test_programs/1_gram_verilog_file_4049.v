// Seed: 1016839173
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_1 = id_4 - 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(negedge id_1) id_2 <= id_1;
  assign id_1 = 1;
  supply0 id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_1 = 0;
  assign id_2 = id_4 == -1;
  bufif1 primCall (id_3, id_4, id_1);
endmodule
