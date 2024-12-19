// Seed: 2517034455
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
    id_10
);
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  always #1 id_5 = !1'b0;
  shortint id_11 (
      .id_0(1),
      .id_1(1'd0),
      .id_2(id_5 - 1),
      .id_3(1 - 1)
  );
  assign id_5 = 1;
  always @(*) if (1'b0) cover (id_2);
  always_latch release id_7;
  wire id_12;
  wire id_13;
  wire id_14;
  wire id_15;
  assign id_7 = 1;
  id_16(
      1, id_2 + id_5
  );
endmodule
module module_1 (
    output tri0  id_0,
    output tri   id_1,
    output tri   id_2,
    input  uwire id_3,
    input  tri1  id_4,
    output tri1  id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7
  );
endmodule
