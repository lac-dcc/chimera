// Seed: 3634550940
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
  input wire id_14;
  input wire id_13;
  inout supply0 id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_15;
  integer [-1  ==  -1 : -1] id_16 = id_16 ? (-1) : id_2;
  assign id_12 = 1;
  wire id_17, id_18;
  assign id_4 = id_14;
endmodule
module module_1 #(
    parameter id_3 = 32'd79,
    parameter id_5 = 32'd91
) (
    id_1,
    id_2
);
  output wire id_2;
  output logic [7:0] id_1;
  wire _id_3;
  or primCall (id_1, id_5, id_4, id_6);
  wire [id_3 : 1 'h0] id_4;
  parameter id_5 = 1;
  assign id_1[-1 : 1&-1] = id_4;
  wire id_6;
  module_0 modCall_1 (
      id_6,
      id_4,
      id_6,
      id_6,
      id_6,
      id_2,
      id_4,
      id_6,
      id_6,
      id_6,
      id_4,
      id_6,
      id_6,
      id_4
  );
  assign id_2 = id_5;
  wire id_7;
  defparam id_5.id_5 = -1 & 1'h0 - id_5;
endmodule
