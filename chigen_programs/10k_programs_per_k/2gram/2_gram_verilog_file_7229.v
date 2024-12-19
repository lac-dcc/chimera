// Seed: 1333155988
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
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_9;
  supply1 id_10;
  always @(posedge 1) assign id_7 = 1;
  assign id_4 = id_10 >> 1'b0;
  assign id_7 = id_1;
  assign id_5 = id_1 - 1;
  id_11(
      .id_0(id_4), .id_1(id_7), .id_2(1), .id_3(1), .id_4(id_6)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_4;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_2,
      id_3,
      id_5
  );
  assign id_3 = 1;
endmodule
