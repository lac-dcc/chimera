// Seed: 3146704204
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
    id_16,
    id_17
);
  output wire id_17;
  output wire id_16;
  inout wire id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  logic id_18;
  wire  id_19;
  wire  id_20;
endmodule
module module_0 #(
    parameter id_1 = 32'd90,
    parameter id_5 = 32'd53
) (
    _id_1,
    module_1,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire _id_5;
  output wire id_4;
  inout wire id_3;
  output logic [7:0] id_2;
  input wire _id_1;
  module_0 modCall_1 (
      id_3,
      id_7,
      id_8,
      id_3,
      id_3,
      id_6,
      id_3,
      id_3,
      id_3,
      id_6,
      id_6,
      id_6,
      id_3,
      id_3,
      id_3,
      id_8,
      id_7
  );
  logic [7:0] id_9 = !-1;
  assign id_9[id_1] = id_9 * id_3;
  assign id_8 = id_5 ? -1'd0 : id_3 ? -1 && id_6 : -1'b0;
  uwire id_10 = 1;
endmodule
