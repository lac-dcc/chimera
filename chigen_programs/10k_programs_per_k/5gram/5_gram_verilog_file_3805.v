// Seed: 2384024936
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
    id_11
);
  inout wire id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_12;
  wire id_13;
  always @(posedge 1 or posedge id_9) id_10 = id_12;
  wire id_14 = 1;
  wire id_15;
  initial begin : LABEL_0
    disable id_16;
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
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  string id_8 = "";
  xnor primCall (id_1, id_3, id_7, id_8);
  module_0 modCall_1 (
      id_7,
      id_1,
      id_7,
      id_1,
      id_7,
      id_5,
      id_6,
      id_7,
      id_7,
      id_1,
      id_1
  );
  assign modCall_1.id_11 = 0;
endmodule
