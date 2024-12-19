// Seed: 1285595518
module module_0 (
    output tri id_0,
    output wand id_1,
    output supply0 id_2,
    input tri1 id_3,
    input supply1 id_4,
    input tri1 id_5,
    input wire id_6,
    input wire id_7,
    output wand id_8,
    output wor id_9,
    input wire id_10,
    output wire id_11,
    input tri0 id_12,
    input supply1 id_13,
    input supply0 id_14,
    input supply1 id_15,
    input tri0 id_16,
    input tri0 id_17,
    input supply1 id_18,
    inout tri id_19,
    input tri id_20,
    output supply0 id_21,
    input uwire id_22,
    output uwire id_23,
    input uwire id_24,
    input wor id_25,
    input wor id_26
);
  wire id_28;
  wire id_29, id_30;
  always_ff id_1 = |1'b0;
  assign module_1.id_0 = 0;
endmodule
module module_1 #(
    parameter id_7 = 32'd31,
    parameter id_8 = 32'd13
) (
    output uwire id_0,
    output tri0 id_1,
    input supply0 id_2,
    output wor id_3
);
  genvar id_5;
  if (1) begin : LABEL_0
    id_6(
        .id_0(1), .id_1(id_0), .id_2(id_5 == id_1)
    );
  end else begin : LABEL_0
    defparam id_7.id_8 = 1;
  end
  assign id_1 = id_2;
  assign id_1 = id_5;
  reg id_9;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_2,
      id_5,
      id_5,
      id_2,
      id_2,
      id_3,
      id_0,
      id_5,
      id_0,
      id_2,
      id_5,
      id_2,
      id_5,
      id_2,
      id_5,
      id_5,
      id_5,
      id_2,
      id_5,
      id_2,
      id_3,
      id_2,
      id_2,
      id_5
  );
  always begin : LABEL_0
    id_9 <= 1;
  end
endmodule
