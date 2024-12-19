// Seed: 1785008132
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
    id_11
);
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_12;
endmodule
module module_1 #(
    parameter id_7 = 32'd58,
    parameter id_8 = 32'd14
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  if (id_3) begin : LABEL_0
    defparam id_7.id_8 = 1;
  end else id_9(.id_0(""), .id_1(1));
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_1,
      id_4,
      id_4,
      id_1,
      id_2,
      id_4,
      id_1,
      id_5
  );
  real id_10;
  wire id_11;
  tri0 id_12 = 1'b0 == id_3;
endmodule
