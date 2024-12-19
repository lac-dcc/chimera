// Seed: 3771604178
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
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_15;
  wire id_16;
  id_17(
      .id_0(1'b0), .id_1(id_9)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_7;
  wire id_8;
  initial disable id_9;
  module_0 modCall_1 (
      id_5,
      id_2,
      id_2,
      id_4,
      id_6,
      id_6,
      id_7,
      id_2,
      id_4,
      id_3,
      id_5,
      id_6,
      id_6,
      id_2
  );
  if (id_6) begin : LABEL_0
    assign id_8 = id_9[1'd0];
  end
  assign id_2 = 1 | id_7;
  wire id_10;
  wire id_11;
  wire id_12;
endmodule
