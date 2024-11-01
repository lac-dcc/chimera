// Seed: 3293968132
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
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  input wire id_18;
  inout wire id_17;
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(posedge id_3 or posedge id_5) begin
    wait (id_5);
    fork
      id_19;
      repeat (id_15) id_13 = id_5 + 1;
    join
  end
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
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25
);
  inout wire id_25;
  input wire id_24;
  inout wire id_23;
  input wire id_22;
  output wire id_21;
  inout wire id_20;
  input wire id_19;
  inout wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  inout wire id_14;
  output wire id_13;
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
  wire id_26;
  module_0(
      id_20,
      id_20,
      id_26,
      id_10,
      id_10,
      id_20,
      id_21,
      id_23,
      id_26,
      id_1,
      id_11,
      id_8,
      id_26,
      id_25,
      id_12,
      id_7,
      id_25,
      id_12
  );
  wire id_27;
  wire id_28;
  wire id_29;
  id_30(
      .id_0(id_5),
      .id_1(id_26),
      .id_2(id_4),
      .id_3(id_6[1] - 1),
      .id_4(1'b0),
      .id_5(id_13#(.id_6(1))),
      .id_7(1),
      .id_8(id_18 == 1),
      .id_9(id_13)
  );
endmodule
