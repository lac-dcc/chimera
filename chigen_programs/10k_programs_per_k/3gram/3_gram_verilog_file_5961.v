// Seed: 3524171198
module module_0 (
    output supply1 id_0,
    input supply1 id_1,
    input tri1 id_2,
    input uwire id_3,
    input supply0 id_4,
    input uwire id_5,
    input tri0 id_6,
    output supply1 id_7,
    output supply1 id_8,
    input tri id_9,
    output uwire id_10,
    input supply1 id_11,
    output supply1 id_12
);
endmodule
module module_1 #(
    parameter id_17 = 32'd9
) (
    output supply1 id_0,
    input tri id_1,
    output tri id_2,
    input uwire id_3#(
        .id_9 (1),
        .id_10(-1),
        .id_11(-1),
        .id_12(1),
        .id_13(1),
        .id_14(1),
        .id_15(-1),
        .id_16(1)
    ),
    output tri id_4,
    input wor id_5
    , _id_17,
    output supply0 id_6,
    output tri0 id_7
);
  always @(negedge id_14);
  wire id_18;
  ;
  logic id_19;
  wire [1 : id_17] id_20;
  supply1 id_21, id_22, id_23, id_24, id_25, id_26, id_27, id_28;
  always @(1);
  assign id_24 = 1;
  wire id_29 = id_10;
  reg  id_30;
  assign id_22 = -1;
  logic id_31;
  always_comb @(posedge -1) begin : LABEL_0
    id_30 <= id_26;
  end
  nand primCall (
      id_0,
      id_10,
      id_30,
      id_21,
      id_16,
      id_22,
      id_1,
      id_23,
      id_31,
      id_3,
      id_25,
      id_13,
      id_24,
      id_33,
      id_9,
      id_28,
      id_32,
      id_18,
      id_29,
      id_20,
      id_27,
      id_19,
      id_15,
      id_11,
      id_14,
      id_5,
      id_12
  );
  wire id_32;
  parameter id_33 = -1;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_5,
      id_3,
      id_5,
      id_3,
      id_2,
      id_6,
      id_3,
      id_6,
      id_1,
      id_0
  );
  assign modCall_1.id_8 = 0;
endmodule
