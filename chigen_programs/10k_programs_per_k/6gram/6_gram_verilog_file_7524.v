// Seed: 2203525654
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  tri id_6;
  id_7(
      .id_0(1'h0),
      .id_1(1'd0),
      .id_2(id_1),
      .id_3(1'd0),
      .id_4(1),
      .id_5(1),
      .id_6(~id_5 !== {1'b0{id_6}}),
      .id_7(id_2),
      .id_8(1),
      .id_9(1 != 1)
  );
  assign id_5 = !id_6 == id_4;
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
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  always id_7 = #1 id_2;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_1,
      id_8
  );
  assign modCall_1.id_4 = 0;
endmodule
