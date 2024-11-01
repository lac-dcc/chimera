// Seed: 2620589870
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  id_9(
      .id_0(1'b0), .id_1(1), .id_2(1'b0)
  );
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
    id_13#(.id_14(id_13)),
    id_15
);
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_10 = 1;
  genvar id_16;
  always begin
    id_4 <= id_1;
  end
  supply0 id_17;
  wire id_18;
  assign id_18 = 1;
  always_latch release id_16[1 : 1'b0];
  id_19 :
  assert property (@(id_7 - id_17) 1'b0)
  else;
  wire id_20 = id_2;
  wire id_21;
  module_0(
      id_21, id_16, id_7, id_8, id_3, id_19, id_15, id_19
  );
  always assume (id_12);
  assign id_18 = 1'd0;
endmodule
