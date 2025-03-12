// Seed: 3813549942
program module_0 (
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
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_14;
  wire id_15, id_16, id_17;
  logic id_18, id_19;
  assign id_17 = id_18;
  always begin : LABEL_0
    id_18 <= id_19;
  end
endprogram
module module_1 #(
    parameter id_2 = 32'd82,
    parameter id_4 = 32'd99
) (
    id_1,
    _id_2,
    id_3,
    _id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  input wire _id_4;
  input wire id_3;
  input wire _id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_1,
      id_5,
      id_5,
      id_1,
      id_5,
      id_1,
      id_5,
      id_1,
      id_5,
      id_5,
      id_5
  );
  assign modCall_1.id_18 = 0;
  wire [id_4 : id_2] id_7 = id_3;
  wire id_8;
  ;
  wire id_9;
endmodule
