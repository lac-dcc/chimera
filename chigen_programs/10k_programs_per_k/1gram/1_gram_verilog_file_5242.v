// Seed: 2859415467
module module_0;
  wire id_1;
  wire id_2;
  assign module_1.id_1 = 0;
  always id_2 = id_1;
endmodule
module module_1;
  assign id_1 = 1;
  module_0 modCall_1 ();
  assign id_1 = 1 ? 1'h0 : 1;
endmodule
module module_2 (
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
  output wire id_24;
  input wire id_23;
  input wire id_22;
  output wire id_21;
  input wire id_20;
  input wire id_19;
  output wire id_18;
  output wire id_17;
  input wire id_16;
  input wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  reg id_25;
  assign id_17 = id_20;
  always $display;
  wire id_26;
  id_27 :
  assert property (@(posedge {id_14{1}}) 1)
    @(posedge 1)
      if (id_22) id_17 <= 1;
      else;
  module_0 modCall_1 ();
  wire id_28, id_29;
  wire id_30;
  always id_25 <= 1;
  wire id_31, id_32;
endmodule
