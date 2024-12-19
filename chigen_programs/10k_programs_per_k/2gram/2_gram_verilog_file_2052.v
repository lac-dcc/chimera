// Seed: 4168797456
module module_0 (
    id_1
);
  output wire id_1;
  assign id_1 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_7;
  reg  id_8;
  wire id_9;
  assign id_7 = 1;
  tri1 id_10;
  assign id_4 = id_8 < 1'b0;
  wire id_11;
  module_0 modCall_1 (id_3);
  assign modCall_1.id_1 = 0;
  initial
    #id_12
      if (id_1) begin : LABEL_0
        id_8 <= id_12;
      end else #1 @(negedge id_10);
  assign id_10 = 1 ^ (1);
endmodule
