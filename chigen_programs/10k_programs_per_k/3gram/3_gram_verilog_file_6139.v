// Seed: 449439184
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
    id_14,
    id_15,
    id_16
);
  output wire id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_16 = 1;
  tri0 id_17;
  wire id_18;
  wire id_19;
  always @(id_7 or posedge id_19);
  wire id_20;
  always @(negedge id_18 or id_20) id_17 = {1 | 1'h0{1'd0}};
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
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  genvar id_8;
  xnor primCall (id_3, id_8, id_2);
  module_0 modCall_1 (
      id_8,
      id_8,
      id_2,
      id_2,
      id_7,
      id_2,
      id_2,
      id_7,
      id_4,
      id_2,
      id_1,
      id_8,
      id_2,
      id_8,
      id_3,
      id_3
  );
endmodule
