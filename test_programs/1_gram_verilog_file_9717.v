// Seed: 1947128377
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
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24
);
  input wire id_24;
  inout wire id_23;
  inout wire id_22;
  inout wire id_21;
  output wire id_20;
  inout wire id_19;
  inout wire id_18;
  input wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_25;
  wire id_26, id_27;
  wire id_28;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  id_5(
      .id_0(-1'b0),
      .id_1(id_2),
      .id_2(-1),
      .id_3(-1),
      .id_4(id_4),
      .id_5($display(id_2, 1'b0, 1'b0, 1'h0 === -1)),
      .id_6(!1),
      .id_7(-1'd0)
  );
  supply1 id_6 = 1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_6,
      id_6,
      id_2,
      id_6,
      id_6,
      id_2,
      id_2,
      id_2,
      id_1,
      id_1,
      id_6,
      id_6,
      id_6,
      id_1,
      id_6,
      id_6,
      id_6,
      id_6
  );
  id_7 :
  assert property (@* -1) id_3 = id_5;
  assign id_2 = 1;
endmodule
