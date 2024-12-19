// Seed: 482349983
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
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  if (id_6) begin : LABEL_0
    id_17(
        .id_0(id_9), .id_1(id_3), .id_2(), .id_3(1)
    );
  end
  assign id_10 = id_3[1'b0];
  assign id_4  = id_12;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_6 = id_2[1];
  assign id_5 = 1;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_2,
      id_4,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_3,
      id_4,
      id_6,
      id_6
  );
  wire id_7, id_8, id_9;
endmodule
