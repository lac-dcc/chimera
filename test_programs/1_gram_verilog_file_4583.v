// Seed: 242419333
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
    id_13#(
        .id_14(id_15),
        .id_16(1)
    ),
    id_17,
    id_18
);
  output wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_19;
  wire id_20;
  assign id_18 = (id_14 ==? 1 ? id_9 : 1);
  assign id_5 = id_20;
  assign id_8 = -1;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_3 = 32'd31,
    parameter id_4 = 32'd28
);
  assign id_1 = id_1;
  assign id_2 = (1) ? id_2 : id_1;
  defparam id_3 = -1, id_4 = (1);
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_4
  );
endmodule
