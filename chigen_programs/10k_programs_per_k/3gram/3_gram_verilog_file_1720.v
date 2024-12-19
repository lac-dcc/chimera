// Seed: 1112037185
module module_0 ();
  wire id_1;
  wand id_2 = 1 ? 1 : id_1;
  assign module_1.id_7 = 0;
  wire id_3;
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
    id_13
);
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  always @(posedge id_4 or posedge id_11) begin : LABEL_0
    id_3 <= id_12 - 1;
  end
  assign id_7 = id_11;
  module_0 modCall_1 ();
  wire id_14;
  id_15();
  assign id_3 = id_10;
  always_latch #1;
endmodule
