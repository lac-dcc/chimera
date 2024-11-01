// Seed: 4023602489
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  if (1'b0) begin
    wire id_10;
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
    id_11
);
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  always_latch
    if (1) @(negedge id_7) $display;
    else cover (id_4);
  wire id_12;
  module_0(
      id_11, id_11, id_6, id_10, id_6, id_12, id_3, id_3, id_12
  );
  genvar id_13;
  id_14(
      .id_0(), .id_1(1), .id_2(id_7), .id_3(1)
  );
  assign id_5 = "";
  assign id_7 = id_14;
  wire id_15 = id_13;
  wire id_16;
  wand id_17;
  wire id_18;
  wire id_19;
  id_20 :
  assert property (@(1'b0) id_17)
  else id_21[1 : 1];
  assign id_16 = id_19;
endmodule
