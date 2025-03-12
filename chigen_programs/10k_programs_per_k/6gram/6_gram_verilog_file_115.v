// Seed: 150349042
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
    id_17,
    id_18
);
  output supply1 id_18;
  input wire id_17;
  input wire id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  input wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout supply1 id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_18 = 1;
  assign id_4  = id_17 && id_4 && id_17;
endmodule
module module_1 #(
    parameter id_3 = 32'd79
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6,
      id_5,
      id_2,
      id_1,
      id_6,
      id_5,
      id_6,
      id_6,
      id_6,
      id_6,
      id_1,
      id_5,
      id_6,
      id_6,
      id_5
  );
  output uwire id_5;
  output logic [7:0] id_4;
  input wire _id_3;
  output wire id_2;
  output wire id_1;
  wire [(  id_3  ) : 1  == 'b0] id_7;
  assign id_4[(id_3)] = 1;
  assign id_5 = id_7 == 1;
endmodule
