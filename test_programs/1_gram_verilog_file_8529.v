// Seed: 4079307396
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  tri1 id_9 = 1;
  wire id_10;
  assign id_9 = id_8;
  assign id_8 = id_5;
  id_11(
      -1'b0 - 1, (id_5), id_7
  );
  assign id_2 = id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  genvar id_4;
  uwire id_5 = 1'd0;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4,
      id_3,
      id_5
  );
  assign id_2 = id_5#(
      .id_3(id_1),
      .id_4(-1),
      .id_4(1)
  );
endmodule
