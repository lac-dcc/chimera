// Seed: 1001857351
module module_0 (
    id_1
);
  input wire id_1;
  initial begin
    id_2 <= id_1;
    cover (id_2);
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    .id_12(id_5),
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_7[1] = (1) - 1;
  supply0 id_13;
  wire id_14;
  id_15(
      .id_0(id_13),
      .id_1(1'b0),
      .id_2(1),
      .id_3(1),
      .id_4(~id_13 | 1'h0),
      .id_5(""),
      .id_6(id_14),
      .id_7(1)
  ); module_0(
      id_12
  );
  always id_12 <= #1 id_3[1];
endmodule
