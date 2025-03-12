// Seed: 3802288442
module module_0 (
    input  supply1 id_0,
    output supply0 id_1,
    input  supply1 id_2,
    input  supply1 id_3,
    input  supply1 id_4,
    input  uwire   id_5
);
  wire id_7;
  parameter id_8 = 1;
  logic id_9;
  ;
  wire  id_10;
  logic id_11;
  parameter id_12 = "";
  localparam id_13 = -1 == 1;
  logic id_14 = id_14 == id_3, id_15;
  wire id_16;
  logic id_17, id_18, id_19, id_20, id_21, id_22, id_23, id_24;
endmodule
module module_1 #(
    parameter id_5 = 32'd81,
    parameter id_8 = 32'd34
) (
    input supply0 id_0
    , _id_8,
    input wire id_1,
    input uwire id_2,
    input tri0 id_3,
    input wor id_4,
    input wire _id_5,
    output tri1 id_6
);
  wire  [id_5 : -1] id_9;
  logic [ id_8 : 1] id_10;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_4,
      id_0,
      id_2,
      id_3
  );
  assign modCall_1.id_5 = 0;
  assign id_8 = id_4;
endmodule
