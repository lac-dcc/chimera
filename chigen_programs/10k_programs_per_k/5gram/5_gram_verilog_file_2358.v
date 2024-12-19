// Seed: 2786569709
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wand id_4 = id_1;
  assign id_1 = 1 ? 1 : id_1;
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
  input wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_14;
  wire id_15;
  assign id_3[1] = id_8;
  xnor primCall (id_9, id_3, id_1, id_10, id_5, id_8, id_14, id_2, id_6);
  assign id_6 = id_12;
  always @(posedge id_6) begin : LABEL_0
    id_2 <= 1;
  end
  module_0 modCall_1 (
      id_1,
      id_6,
      id_15
  );
  assign id_6 = 1;
  wire id_16;
endmodule
