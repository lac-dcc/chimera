// Seed: 1043956902
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
    id_11,
    id_12
);
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  always begin
    id_9 += ~id_1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  supply0 id_7;
  module_0(
      id_1, id_5, id_7, id_3, id_6, id_1, id_2, id_1, id_1, id_5, id_1, id_5
  ); id_8(
      .id_0(id_2),
      .id_1(1),
      .id_2(1),
      .id_3(id_2),
      .id_4(id_5),
      .id_5(id_3),
      .id_6(id_6),
      .id_7(id_4),
      .id_8(1'b0),
      .id_9(1),
      .id_10(id_2),
      .id_11(1),
      .id_12(1)
  );
  assign id_7 = id_1;
  assign id_4[1'h0] = id_5 == id_3 < ~id_2 ? 1 : id_6;
  assign id_7 = id_2 - 1;
endmodule
