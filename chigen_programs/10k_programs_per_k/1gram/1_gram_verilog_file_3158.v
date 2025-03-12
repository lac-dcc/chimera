// Seed: 756847842
module module_0 #(
    parameter id_1 = 32'd71
) (
    input  uwire id_0,
    input  wire  _id_1,
    input  wor   id_2,
    input  tri0  id_3,
    output wand  id_4,
    output wire  id_5,
    input  uwire id_6,
    output wand  id_7,
    input  wire  id_8
);
  integer id_10;
  ;
  wire [id_1 : 1] id_11;
  logic id_12;
  ;
endmodule
module module_1 #(
    parameter id_1 = 32'd68,
    parameter id_6 = 32'd67,
    parameter id_7 = 32'd29
) (
    output logic   id_0,
    input  uwire   _id_1,
    input  uwire   id_2,
    output uwire   id_3,
    input  supply0 id_4
);
  wire _id_6[1 : 1];
  localparam id_7 = 1;
  always id_0 <= id_7;
  assign id_0 = id_2;
  logic [-1 'b0 : id_1  ||  id_6] id_8;
  logic id_9[-1 : 1];
  ;
  wire  id_10;
  logic id_11;
  defparam id_7 = id_7 - 1;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_4,
      id_2,
      id_3,
      id_3,
      id_4,
      id_3,
      id_2
  );
  wire  id_12;
  wire  id_13;
  logic id_14;
  parameter id_15 = id_7 <= -1;
endmodule
