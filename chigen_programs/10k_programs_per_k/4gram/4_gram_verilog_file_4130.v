// Seed: 2764162670
module module_0 (
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
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  logic [7:0] id_8;
  supply0 id_9;
  id_10(
      .id_0(1),
      .id_1(1),
      .id_2(id_4),
      .id_3(1'h0),
      .id_4(id_9),
      .id_5(),
      .id_6(1'b0),
      .id_7(1),
      .id_8(""),
      .id_9(id_9),
      .id_10(id_3),
      .id_11(id_7)
  );
  assign id_5 = id_3 + ~|id_3 + id_9 ? {1{1}} : 1;
  assign id_8[1] = 1;
  assign id_9 = 1'b0;
  wire id_11;
  wire id_12;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  if (id_2) wire id_3 = !id_2;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_3
  );
endmodule
