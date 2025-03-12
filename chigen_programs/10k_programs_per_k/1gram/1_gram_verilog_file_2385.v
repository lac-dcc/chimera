// Seed: 1004174838
module module_0 (
    input  uwire id_0,
    input  uwire id_1,
    input  tri   id_2,
    input  wor   id_3,
    output uwire id_4,
    input  wor   id_5
);
  wire id_7;
  ;
  module_2 modCall_1 ();
  assign id_4 = id_1;
endmodule
module module_1 (
    output wire id_0,
    input  wand id_1,
    input  wand id_2
);
  assign id_0 = (-1);
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2;
  wire id_1, id_2;
  integer id_3 = id_1;
endmodule
module module_3 #(
    parameter id_8 = 32'd70
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10
);
  inout wire id_10;
  output wire id_9;
  output wire _id_8;
  input wire id_7;
  output wire id_6;
  inout reg id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  struct packed {
    logic   id_11;
    logic   id_12;
    id_13   id_14;
    id_15   id_16;
    logic   id_17[1 : id_8];
    integer id_18;
  } id_19;
  ;
  module_2 modCall_1 ();
  localparam id_20 = -1'b0 + 1;
  initial id_5 <= 1;
endmodule
