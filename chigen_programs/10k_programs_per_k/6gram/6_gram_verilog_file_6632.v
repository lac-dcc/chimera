// Seed: 1242134321
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  logic id_7;
  assign id_7 = 1'b0 * 1 + id_4;
endmodule
module module_1 #(
    parameter id_3 = 32'd59,
    parameter id_6 = 32'd51,
    parameter id_8 = 32'd35
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    _id_8,
    id_9
);
  output wire id_9;
  inout wire _id_8;
  input wire id_7;
  input wire _id_6;
  inout wire id_5;
  input wire id_4;
  input wire _id_3;
  inout logic [7:0] id_2;
  input wire id_1;
  logic id_10[-1 : id_3];
  ;
  wire id_11;
  assign id_2[-1] = id_10[id_6-:id_8];
  module_0 modCall_1 (
      id_11,
      id_5,
      id_5,
      id_1,
      id_11,
      id_5
  );
endmodule
