// Seed: 4268426989
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
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_3[1] = "" == 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2
  );
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
    id_13
);
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_8 = 1'd0;
  id_14(
      .id_0(id_11), .id_1(id_9), .id_2(id_2)
  );
  wire id_15;
  assign id_3 = id_14;
  always @(posedge !id_5 + 1 or posedge id_2) begin : LABEL_0
    id_4[1-:1] = 1'b0;
  end
  wire id_16;
  module_0 modCall_1 (
      id_16,
      id_13,
      id_15,
      id_11,
      id_12,
      id_16,
      id_12
  );
  assign modCall_1.id_7 = 0;
endmodule
