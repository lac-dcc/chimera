// Seed: 3001155364
module module_0 (
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
  wire id_7;
  always
  fork : SymbolIdentifier
    `define pp_8 0
  join
  wire id_9;
  wire id_10;
  wire id_11;
endmodule
module module_1 (
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
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  tri  id_9;
  tri0 id_10 = id_9 + id_1;
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_10,
      id_9,
      id_7
  );
  id_12(
      .id_0(id_5), .id_1(1), .id_2(id_9), .id_3(1), .id_4(1'b0 | 1), .id_5(id_9), .id_6(id_6)
  );
  always_comb @*;
endmodule
