// Seed: 130297011
module module_0 (
    output supply1 id_0,
    input tri0 id_1,
    output wor id_2,
    input tri id_3,
    output tri0 id_4,
    output wor id_5,
    input supply0 id_6,
    output tri0 id_7
);
  logic id_9;
  assign module_1.id_0 = 0;
  assign id_4 = -1;
endmodule
module module_1 (
    input uwire id_0,
    output wand id_1,
    input supply1 id_2,
    input supply0 id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_1,
      id_3,
      id_1,
      id_1,
      id_0,
      id_1
  );
endmodule
module module_0 #(
    parameter id_31 = 32'd69
) (
    input tri id_0,
    input supply1 id_1,
    input tri0 id_2,
    input supply0 id_3,
    output wand id_4,
    output tri id_5,
    output tri id_6,
    input tri id_7,
    output wire id_8,
    input tri1 id_9,
    input tri0 id_10,
    input wor id_11,
    output tri id_12,
    output wand id_13,
    input supply1 id_14,
    output tri id_15,
    input wire id_16,
    input uwire module_2,
    output wor id_18,
    output tri0 id_19,
    input supply0 id_20,
    input wor id_21,
    output logic id_22,
    input supply1 id_23,
    input uwire id_24,
    output tri1 id_25,
    input wire id_26,
    output wor id_27,
    input supply0 id_28,
    output wand id_29,
    input uwire id_30,
    input uwire _id_31,
    output logic id_32,
    output supply1 id_33,
    input wire id_34,
    output wor id_35,
    input supply0 id_36
);
  assign id_13 = -1;
  wire id_38;
  wire [id_31 : 1] id_39;
  module_0 modCall_1 (
      id_8,
      id_36,
      id_25,
      id_28,
      id_15,
      id_13,
      id_10,
      id_29
  );
  assign modCall_1.id_2 = 0;
  wand id_40;
  always @(id_38 or posedge id_31 == id_17) begin : LABEL_0
    if (1'd0)
      if (-1'b0) begin : LABEL_1
        $signed(87);
        ;
        assert (1);
        id_32 <= id_30;
        id_22 <= -1 ? -1 : id_39;
      end
  end
endmodule
