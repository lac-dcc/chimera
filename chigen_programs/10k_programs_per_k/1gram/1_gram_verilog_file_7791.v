// Seed: 3148559276
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  logic [7:0] id_12;
  wire id_13;
  tri1 id_14, id_15 = !id_15, id_16;
  assign id_12[1] = 1'd0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_7;
  module_0(
      id_4, id_6, id_7, id_3, id_6, id_3, id_6, id_1, id_3, id_6, id_3
  );
  assign id_2 = id_7(id_6);
  id_8(
      .id_0(id_3), .id_1(1), .id_2(""), .id_3(id_3), .id_4(1), .id_5(id_7)
  );
endmodule
