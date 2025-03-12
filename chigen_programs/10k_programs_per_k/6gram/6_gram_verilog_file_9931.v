// Seed: 2041499689
module module_0 (
    output uwire id_0,
    input tri1 id_1,
    input supply1 id_2,
    input supply1 id_3,
    input tri0 id_4,
    input supply0 id_5
);
  integer id_7;
  assign id_0 = 1'b0;
endmodule
module module_1 #(
    parameter id_0  = 32'd51,
    parameter id_10 = 32'd64,
    parameter id_15 = 32'd90,
    parameter id_22 = 32'd63,
    parameter id_3  = 32'd91,
    parameter id_4  = 32'd72
) (
    input uwire _id_0,
    output wire id_1,
    output wor id_2,
    input wand _id_3,
    input wire _id_4
    , id_18,
    output uwire id_5,
    output wire id_6,
    input supply1 id_7,
    output wand id_8,
    output supply0 id_9,
    input supply1 _id_10,
    output supply0 id_11,
    input supply1 id_12,
    input wand id_13,
    input tri0 id_14,
    input supply1 _id_15,
    input supply1 id_16
);
  wire [-  id_3 : id_0  |  -1] id_19;
  wire id_20;
  ;
  wire [1 'b0 : id_4  %  id_15] id_21;
  wire _id_22;
  module_0 modCall_1 (
      id_6,
      id_12,
      id_12,
      id_12,
      id_16,
      id_7
  );
  assign modCall_1.id_5 = 0;
  wire [-1  &  id_22  &  -1 : id_10] id_23;
  wire id_24;
  ;
endmodule
