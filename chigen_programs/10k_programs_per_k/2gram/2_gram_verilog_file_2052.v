// Seed: 2804654217
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    output tri id_2,
    input wire id_3,
    input tri0 id_4
);
endmodule
module module_1 (
    input uwire id_0,
    output wire id_1,
    input tri0 id_2,
    input tri0 id_3,
    input supply1 id_4,
    input wand id_5,
    input wor id_6
);
  logic id_8;
  ;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_1,
      id_0,
      id_6
  );
  assign modCall_1.id_2 = 0;
  assign id_1 = -1 - id_0;
endmodule
program module_2 #(
    parameter id_15 = 32'd26,
    parameter id_20 = 32'd65,
    parameter id_24 = 32'd99
) (
    input wand id_0,
    input uwire id_1,
    input tri1 id_2,
    input tri1 id_3,
    output wire id_4,
    output wand id_5,
    output wand id_6,
    input supply0 id_7,
    output wand id_8,
    input uwire id_9,
    output logic id_10,
    output supply1 id_11,
    input tri id_12,
    output tri0 id_13,
    input uwire id_14#(
        .id_28(1),
        .id_29(1),
        .id_30(~1),
        .id_31(1),
        .id_32(1)
    ),
    input tri _id_15,
    output supply0 id_16,
    output wor id_17,
    input tri1 id_18,
    input tri1 id_19,
    input tri0 _id_20,
    input uwire id_21,
    input supply0 id_22,
    output uwire id_23,
    input wand _id_24,
    output supply1 id_25,
    input tri0 id_26
);
  wire [id_15 : 1] id_33;
  logic [-1 : -1] id_34;
  logic id_35;
  always begin : LABEL_0
    $signed(75);
    ;
  end
  localparam id_36 = 1 - 1;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_23,
      id_19,
      id_9
  );
  assign modCall_1.id_2 = 0;
  always
    if (1)
      if (-1)
        id_10 = id_0#(
            .id_35(1),
            .id_33(1),
            .id_3 (1),
            .id_15(-1),
            .id_18(1),
            .id_22(1),
            .id_35((1)),
            .id_9 (1)
        );
  parameter id_37 = -1;
  assign id_29 = id_22 > 1;
  wire [id_24 : id_20] id_38;
  assign id_17 = -1;
  parameter id_39 = id_37;
  parameter id_40 = id_37;
endprogram
