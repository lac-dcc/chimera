// Seed: 3299911163
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  assign id_2 = 1;
  wire id_3;
  always_latch id_2 = 1 ? id_1 : 1;
  id_4(
      1, {id_2{1'b0}}, id_1
  );
  wire id_5;
  wire id_6;
  initial
    #1
    `define pp_7 0
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_6;
  bufif0 primCall (id_2, id_3, id_7);
  int id_7;
  module_0 modCall_1 (
      id_7,
      id_6
  );
endmodule
