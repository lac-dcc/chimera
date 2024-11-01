// Seed: 3019914809
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
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_9, id_10;
  wire id_11, id_12, id_13;
  logic [7:0][1] id_14 = id_12;
endmodule
module module_1 (
    id_1#(
        .id_2(1),
        .id_3(id_4 - 1),
        .id_5(id_6),
        .id_7(1),
        .id_8(1'b0 + 1 ? id_8 : id_1 ? id_3 : id_2)
    ),
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_15, id_16 = 1 + id_11 + 1;
  wire id_17;
  wire id_18;
  always_latch #id_19 id_15 = id_9;
  module_0(
      id_19, id_12, id_19, id_17, id_10, id_15, id_14, id_13
  );
  wire id_20, id_21;
endmodule
