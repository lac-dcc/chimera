// Seed: 4182852129
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  specify
    (id_7 => id_8) = (1 == 1  : ~id_3  : 1, id_4  : id_8  : !id_8);
  endspecify
endmodule
module module_1 (
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
    id_11,
    id_12,
    id_13
);
  output wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  id_14(
      .id_0(id_1), .id_1(id_11), .id_2(1), .id_3(1), .id_4(id_1), .id_5(1'b0), .id_6(id_12)
  );
  or primCall (id_9, id_8, id_12, id_2, id_14, id_6, id_3, id_4, id_10);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_5,
      id_9
  );
  assign modCall_1.id_8 = 0;
endmodule
