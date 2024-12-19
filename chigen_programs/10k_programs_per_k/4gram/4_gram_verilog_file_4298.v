// Seed: 405310327
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign module_1.id_3 = 0;
  wire id_5;
  wire id_6;
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
    id_14
);
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_12 = id_13;
  wire id_15;
  assign id_3 = id_8 ? 1 : 1;
  id_16(
      .id_0((id_15)), .id_1(1), .id_2(1), .id_3({1, ~id_3})
  );
  wire id_17;
  wire id_18;
  id_19 :
  assert property (@(posedge id_5) 1)
  else $display;
  module_0 modCall_1 (
      id_1,
      id_11,
      id_6,
      id_18
  );
  assign id_2 = id_19;
  generate
    wire id_20;
    assign id_6 = id_18;
  endgenerate
  wire id_21;
endmodule
