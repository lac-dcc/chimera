// Seed: 248253753
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8[1 : 1],
    id_9,
    id_10,
    id_11
);
  inout supply0 id_11;
  inout wire id_10;
  input wire id_9;
  output logic [7:0] id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_11 = 1;
endmodule
module module_1 #(
    parameter id_8 = 32'd36
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7[1'b0 : id_8],
    _id_8,
    id_9
);
  output wire id_9;
  input wire _id_8;
  inout logic [7:0] id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_5,
      id_6,
      id_1,
      id_5,
      id_6,
      id_7,
      id_1,
      id_3,
      id_5
  );
  input wire id_2;
  input wire id_1;
  initial $unsigned(4);
  ;
endmodule
