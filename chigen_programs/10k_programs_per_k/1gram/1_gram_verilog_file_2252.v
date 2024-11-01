// Seed: 2072127061
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
    id_14
);
  inout wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  reg id_15 = id_15;
  assign id_5 = 1;
  wire id_16;
  reg id_17 = 1, id_18, id_19;
  uwire id_20 = 1, id_21;
  assign id_12 = id_12;
  id_22 :
  assert property (@(1) id_17) begin
    begin
      $display;
      id_15 <= id_17;
    end
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_8;
  module_0(
      id_3, id_1, id_1, id_1, id_7, id_2, id_2, id_3, id_8, id_1, id_1, id_8, id_6, id_8
  );
  event id_9 = 1;
endmodule
