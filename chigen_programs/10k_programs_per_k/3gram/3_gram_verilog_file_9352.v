// Seed: 1713470511
module module_0 (
    output tri1 id_0,
    input supply1 id_1,
    output supply1 id_2,
    input tri1 id_3,
    output wire id_4,
    input wire id_5,
    output tri id_6,
    input uwire id_7,
    output wire id_8,
    input uwire id_9,
    input uwire id_10,
    input wor id_11,
    output wand id_12,
    input supply0 id_13,
    output tri1 id_14,
    input tri0 id_15,
    output supply1 id_16,
    output supply0 id_17
);
  assign id_6 = id_15 - 1'b0;
  assign id_0 = id_9 !=? id_7;
  logic id_19 = (id_5 - 1'h0) !=? "";
  wire  id_20;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_9 = 32'd15
) (
    output tri   id_0,
    output uwire id_1,
    output tri0  id_2,
    output tri1  id_3,
    output tri   id_4,
    output uwire id_5,
    input  uwire id_6,
    output logic id_7,
    output uwire id_8,
    input  tri   _id_9,
    output tri0  id_10,
    input  wand  id_11
);
  initial begin : LABEL_0
    id_7 = -1;
  end
  wire id_13;
  module_0 modCall_1 (
      id_10,
      id_11,
      id_8,
      id_11,
      id_5,
      id_11,
      id_4,
      id_6,
      id_1,
      id_6,
      id_11,
      id_6,
      id_4,
      id_6,
      id_10,
      id_6,
      id_4,
      id_4
  );
  wire  id_14;
  logic id_15;
  ;
  wire id_16;
  assign id_5 = id_15[1-id_9];
endmodule
