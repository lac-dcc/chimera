// Seed: 1587053516
module module_0 (
    output tri   id_0,
    output uwire id_1
);
endmodule
module module_1 (
    output supply0 id_0,
    output tri1 id_1,
    output supply0 id_2,
    input wand id_3,
    output supply1 id_4,
    input wire id_5,
    input uwire id_6
);
  wire  id_8;
  wire  id_9;
  uwire id_10 = id_6;
  module_0 modCall_1 (
      id_1,
      id_0
  );
  assign modCall_1.id_1 = 0;
  logic id_11;
  assign id_0 = -1;
  wire id_12;
  assign id_10 = -1;
  wire [1 : 1] id_13;
endmodule
module module_2 #(
    parameter id_18 = 32'd48,
    parameter id_22 = 32'd5,
    parameter id_3  = 32'd30,
    parameter id_4  = 32'd29,
    parameter id_5  = 32'd59
) (
    output uwire id_0,
    input supply0 id_1,
    output supply0 id_2,
    input tri _id_3,
    input wand _id_4,
    input wire _id_5,
    output uwire id_6
);
  logic [7:0][id_4 : ~  id_3]
      id_8,
      id_9,
      id_10,
      id_11,
      id_12,
      id_13,
      id_14,
      id_15,
      id_16,
      id_17,
      _id_18,
      id_19,
      id_20,
      id_21;
  wire [id_5 : id_18] _id_22;
  assign id_10[-1'b0 :-1'b0] = (id_19[id_22 : 1'b0]) >> id_14;
  assign id_8 = id_12;
  module_0 modCall_1 (
      id_0,
      id_2
  );
  assign id_22 = -1'b0 - 1 ? id_10 : id_15;
endmodule
