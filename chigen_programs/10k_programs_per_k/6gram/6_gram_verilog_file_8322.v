// Seed: 2915056481
module module_0 (
    input  tri0  id_0,
    output tri1  id_1,
    input  wire  id_2,
    input  wor   id_3,
    input  tri0  id_4,
    input  tri0  id_5,
    output uwire id_6,
    input  wire  id_7,
    output logic id_8
);
  initial id_8 = 1;
  assign module_1.id_0 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd49
) (
    input  tri0  id_0,
    input  wire  id_1,
    input  uwire id_2,
    output logic id_3,
    input  tri   _id_4,
    input  wand  id_5,
    input  tri1  id_6,
    input  uwire id_7,
    output wire  id_8
);
  localparam id_10 = 1;
  wire [1 : id_4] id_11;
  localparam id_12 = 1;
  assign id_3 = id_10;
  module_0 modCall_1 (
      id_0,
      id_8,
      id_1,
      id_6,
      id_6,
      id_1,
      id_8,
      id_7,
      id_3
  );
  assign id_11 = id_5;
  wire id_13;
  initial begin : LABEL_0
    id_3 <= 1'b0;
  end
endmodule
