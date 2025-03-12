// Seed: 397110814
module module_0 #(
    parameter id_2 = 32'd34,
    parameter id_6 = 32'd46
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    _id_6
);
  inout wire _id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire _id_2;
  output logic [7:0] id_1;
  assign id_1[id_2 : id_6] = id_6;
endmodule
module module_1 #(
    parameter id_2 = 32'd63,
    parameter id_3 = 32'd35,
    parameter id_9 = 32'd31
) (
    id_1,
    _id_2,
    _id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  input wire _id_3;
  input wire _id_2;
  inout logic [7:0] id_1;
  logic [id_3 : -1] id_6;
  wor id_7 = id_3 & -1 ? -1'b0 : -1;
  supply1 [id_2 : 1 'd0] id_8 = id_4 - id_1[1];
  parameter id_9 = ("");
  wire id_10;
  module_0 modCall_1 (
      id_1,
      id_9,
      id_7,
      id_10,
      id_8,
      id_9
  );
  logic id_11;
  defparam id_9.id_9 = 1;
endmodule
