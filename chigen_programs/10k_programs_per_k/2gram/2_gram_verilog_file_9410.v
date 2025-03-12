// Seed: 4112150659
module module_0 (
    output supply0 id_0,
    input wor id_1,
    input supply0 id_2,
    input uwire id_3,
    input tri0 id_4,
    input wire id_5,
    input tri0 id_6,
    input uwire id_7,
    input wire id_8,
    input wand id_9,
    input tri id_10
);
  assign id_0 = id_2;
  assign module_1.id_6 = 0;
endmodule
module module_1 #(
    parameter id_12 = 32'd31,
    parameter id_2  = 32'd93,
    parameter id_22 = 32'd57,
    parameter id_6  = 32'd27
) (
    input tri0 id_0,
    output tri0 id_1,
    input uwire _id_2,
    input wire id_3,
    input wand id_4,
    input wand id_5,
    output tri _id_6,
    input wor id_7,
    output supply1 id_8,
    input wand id_9,
    output wand id_10,
    input tri0 id_11,
    input wire _id_12,
    input wand id_13,
    input supply1 id_14,
    input wor id_15,
    output wire id_16,
    input supply1 id_17,
    output supply1 id_18,
    output wand id_19,
    input wor id_20,
    output tri id_21,
    input tri0 _id_22
);
  assign id_8 = -1'b0;
  localparam id_24 = 1;
  wire [~  id_22  &  1 : id_12] id_25;
  assign id_6 = id_9;
  module_0 modCall_1 (
      id_21,
      id_17,
      id_20,
      id_20,
      id_9,
      id_20,
      id_4,
      id_11,
      id_7,
      id_14,
      id_9
  );
  id_26 :
  assert property (@(posedge 1 or id_26) -1)
  else;
  wire id_27;
  logic [1 : id_2] id_28[id_6 : -1];
  parameter id_29 = id_24;
  assign id_28 = 1 <-> 1'b0;
endmodule
