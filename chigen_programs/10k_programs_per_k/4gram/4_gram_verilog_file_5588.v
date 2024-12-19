// Seed: 3860037809
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_4 = id_5;
  wire id_8;
  assign id_7 = id_3;
  assign id_1 = id_2;
  initial begin : LABEL_0
    #1;
  end
  wire id_9;
  wire id_10;
  assign id_9 = id_1 ? id_6 : id_5 ? id_3 : 1'd0;
  wire id_11;
  wire id_12;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wand id_9 = 1;
  wire id_10;
  wire id_11;
  always @(id_5);
  assign id_11 = id_6;
  module_0 modCall_1 (
      id_3,
      id_7,
      id_10,
      id_9,
      id_7,
      id_10,
      id_11
  );
endmodule
