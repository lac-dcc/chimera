// Seed: 4180984977
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output uwire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  integer id_7;
  ;
  assign id_5 = 1;
  assign id_5 = (id_7[-1] == id_1);
endmodule
module module_1 (
    id_1,
    id_2#(
        .id_3(id_4),
        .id_5(1),
        .id_6(1)
    ),
    id_7,
    id_8,
    id_9
);
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_8 = id_7;
  module_0 modCall_1 (
      id_3,
      id_7,
      id_7,
      id_1,
      id_8,
      id_8
  );
  assign id_1 = id_9;
endmodule
