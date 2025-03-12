// Seed: 610603503
module module_0 #(
    parameter id_4 = 32'd60
) (
    output uwire id_0,
    output supply1 id_1
    , id_9,
    input tri0 id_2,
    output tri1 id_3,
    input supply0 _id_4,
    output uwire id_5,
    output supply0 id_6
    , id_10,
    input tri0 id_7
);
  logic [id_4 : 1] id_11;
  ;
  wire  id_12;
  logic id_13;
  wire  id_14;
endmodule
module module_1 #(
    parameter id_13 = 32'd19,
    parameter id_14 = 32'd24,
    parameter id_4  = 32'd28
) (
    output tri1 id_0,
    input uwire id_1,
    input tri0 id_2,
    input tri1 id_3,
    input wire _id_4,
    input tri0 id_5,
    input wire id_6,
    input wand id_7,
    output tri0 id_8,
    input supply0 id_9,
    output tri1 id_10
);
  assign id_10 = id_6;
  localparam id_12 = 1;
  wire _id_13;
  assign id_10 = -1;
  localparam id_14 = 1;
  assign id_10 = 1;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_9,
      id_8,
      id_14,
      id_10,
      id_8,
      id_7
  );
  assign modCall_1._id_4 = 0;
  logic id_15 = id_1;
  nor primCall (id_8, id_14, id_3, id_6, id_1, id_5, id_12);
  logic id_16;
  logic id_17;
  wire  id_18 = id_16[1];
  generate
    always @(posedge 1);
  endgenerate
endmodule
