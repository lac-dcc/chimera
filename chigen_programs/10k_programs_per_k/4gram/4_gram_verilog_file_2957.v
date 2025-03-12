// Seed: 3979987486
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    input supply1 id_2,
    output wire id_3,
    input wor id_4,
    input supply0 id_5,
    output wand id_6,
    input uwire id_7,
    output wor id_8
);
  assign id_6 = 1;
endmodule
module module_0 #(
    parameter id_16 = 32'd5
) (
    output supply1 module_1,
    output supply0 id_1,
    input tri id_2,
    input wand id_3,
    output logic id_4,
    input tri1 id_5,
    output tri id_6,
    input uwire id_7,
    output logic id_8,
    output wor id_9,
    input tri id_10,
    output wire id_11,
    input wire id_12,
    output supply0 id_13,
    input tri id_14,
    input tri id_15,
    input wor _id_16
);
  wire id_18;
  module_0 modCall_1 (
      id_15,
      id_5,
      id_15,
      id_11,
      id_10,
      id_3,
      id_11,
      id_5,
      id_1
  );
  assign modCall_1.id_8 = 0;
  always @(id_3) begin : LABEL_0
    wait (1);
    id_4 <= id_14;
    id_8 = -1 ? -1 : id_2 ? -1 : id_13++;
  end
  wire id_19;
  assign id_1 = 1;
  localparam id_20 = -1 || ~1;
  wire id_21;
  wire [id_16 : 1 'd0] id_22;
  wire id_23;
endmodule
