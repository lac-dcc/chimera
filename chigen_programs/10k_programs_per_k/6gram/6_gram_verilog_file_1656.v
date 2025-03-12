// Seed: 3364868555
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  logic id_7, id_8;
endmodule
module module_1 #(
    parameter id_6 = 32'd68
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  logic [1 : 1] _id_6, id_7, id_8, id_9, id_10;
  wire id_11;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_10,
      id_9,
      id_4,
      id_8
  );
  logic id_12[id_6 : -1 'b0] = id_2;
  always @* begin : LABEL_0
    id_12 <= id_3 == 1;
  end
endmodule
