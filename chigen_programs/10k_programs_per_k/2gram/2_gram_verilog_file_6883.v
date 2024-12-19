// Seed: 1524301900
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
    id_19
);
  output wire id_19;
  inout wire id_18;
  inout wire id_17;
  output wire id_16;
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  id_20(
      .id_0(1), .id_1(id_15)
  );
  assign module_1.id_12 = 0;
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
    id_11
);
  input wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_7 = {id_9, id_2, 1'd0};
  id_12 :
  assert property (@(posedge id_3[1&&1]) id_7)
  else;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_8,
      id_8,
      id_6,
      id_12,
      id_4,
      id_7,
      id_12,
      id_8,
      id_2,
      id_6,
      id_2,
      id_7,
      id_11,
      id_8,
      id_6,
      id_8,
      id_8
  );
  wire id_13 = id_11;
endmodule
