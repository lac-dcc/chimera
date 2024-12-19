// Seed: 532801320
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
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_10;
  wire id_11;
  wire id_12;
  always_comb @(id_3, id_4) id_10 = id_12;
  wire id_13;
  assign id_10 = id_3;
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
    id_17
);
  output wire id_17;
  input wire id_16;
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_6,
      id_12,
      id_2,
      id_5,
      id_10,
      id_5,
      id_8,
      id_12,
      id_17
  );
  assign id_14 = id_16;
  id_18 :
  assert property (@(posedge (id_8)) id_5)
  else $display(id_15 * 1);
  always @* begin : LABEL_0
    id_13 <= id_16;
  end
  wire id_19;
endmodule
