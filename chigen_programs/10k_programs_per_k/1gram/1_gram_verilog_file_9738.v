// Seed: 3962399880
module module_0 #(
    parameter id_24 = 32'd70
) (
    input supply1 id_0,
    input tri0 id_1,
    input uwire id_2,
    output supply1 id_3,
    output supply0 id_4,
    output supply1 id_5,
    input supply0 id_6,
    output wor id_7
    , id_20,
    input wor id_8,
    input tri0 id_9,
    output wire id_10,
    input tri1 id_11,
    input wand id_12,
    input uwire id_13,
    input supply0 id_14,
    input tri0 id_15,
    input wor id_16,
    input wand id_17,
    input wire id_18
);
  wire id_21;
  wire id_22;
  wire id_23, _id_24, id_25, id_26, id_27;
  localparam id_28 = -1 - 1;
  logic id_29;
  ;
  wire [id_24 : -1] id_30, id_31;
  assign module_1._id_1 = 0;
  logic id_32;
endmodule
module module_1 #(
    parameter id_1  = 32'd18,
    parameter id_10 = 32'd60
) (
    input uwire id_0,
    input wire _id_1,
    input supply1 id_2,
    input tri0 id_3,
    input supply1 id_4
    , _id_10,
    input tri1 id_5,
    input wire id_6,
    output uwire id_7,
    input tri id_8
);
  wire [-1 : 1 'h0] id_11 = id_3;
  supply0 [id_10 : id_1] id_12 = id_3, id_13 = 1;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_6,
      id_7,
      id_7,
      id_7,
      id_5,
      id_7,
      id_2,
      id_5,
      id_7,
      id_8,
      id_5,
      id_2,
      id_3,
      id_8,
      id_2,
      id_6,
      id_3
  );
endmodule
