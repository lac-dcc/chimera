// Seed: 1486817745
module module_0 #(
    parameter id_1 = 32'd82
) (
    output uwire id_0,
    input uwire _id_1,
    output supply0 id_2,
    output tri id_3
);
  logic [7:0][1 : id_1] id_5;
  assign id_3 = 1'd0;
  assign id_5[id_1] = id_1;
endmodule
module module_1 #(
    parameter id_21 = 32'd69
) (
    output supply0 id_0,
    input tri0 id_1,
    input wire id_2,
    input wire id_3,
    output wor id_4,
    output wand id_5,
    output supply0 id_6,
    output supply1 id_7,
    output supply1 id_8,
    input tri0 id_9,
    input tri0 id_10,
    input tri1 id_11,
    input tri0 id_12,
    input tri id_13,
    input tri id_14,
    output uwire id_15,
    input uwire id_16,
    input wand id_17,
    input tri id_18,
    input tri1 id_19
);
  wire  _id_21;
  logic id_22;
  ;
  nand primCall (
      id_5,
      id_2,
      id_14,
      id_24,
      id_17,
      id_10,
      id_21,
      id_9,
      id_16,
      id_18,
      id_1,
      id_23,
      id_11,
      id_3,
      id_19,
      id_12,
      id_22
  );
  assign id_21 = id_17;
  assign id_22 = (id_14);
  wire id_23;
  ;
  wire [~  -1 : id_21] id_24;
  module_0 modCall_1 (
      id_7,
      id_21,
      id_15,
      id_5
  );
  assign modCall_1._id_1 = 0;
  localparam id_25 = -1 - -1;
endmodule
