// Seed: 3511173973
module module_0 ();
  wire id_2;
  wire id_3;
  logic [7:0] id_4;
  assign id_4[1'b0] = 1'b0;
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
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_8;
  genvar id_9;
  assign id_9 = id_2#(1, 1);
  wire id_10;
  assign id_4 = 1;
  assign id_2[1] = id_6;
  assign id_9[1-1] = 1;
  module_0 modCall_1 ();
  id_11(
      .id_0(id_4),
      .id_1(id_4),
      .id_2(id_6),
      .id_3(id_3),
      .id_4(id_1),
      .id_5(id_3 == 1'd0),
      .id_6(id_10),
      .id_7(1'h0)
  );
  wire id_12;
  assign id_5 = 1 + id_7;
endmodule
