// Seed: 918874801
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_4 = 32'd93
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7#(-1),
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  inout logic [7:0] id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire _id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  reg id_11;
  wire [1 : -1 'h0] id_12;
  module_0 modCall_1 (
      id_12,
      id_7,
      id_10,
      id_7,
      id_7,
      id_10,
      id_8
  );
  initial begin : LABEL_0
    wait (-1);
    @(-1) id_9[id_4 :-1] = #1 id_9;
    id_11 <= id_12;
  end
  wire id_13;
  parameter id_14 = 1;
endmodule
