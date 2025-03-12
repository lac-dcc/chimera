// Seed: 1024191144
module module_0 (
    output supply0 id_0
    , id_19,
    output tri1 id_1,
    input wand id_2,
    output logic id_3,
    input wor id_4,
    output uwire id_5,
    output uwire id_6,
    input tri0 id_7,
    input tri id_8,
    output tri1 id_9,
    input wand id_10,
    input wand id_11,
    input uwire id_12,
    input wire id_13,
    output wand id_14,
    output tri0 id_15,
    input wand id_16,
    output wire id_17
);
  wire [1 : -1] id_20;
  wire id_21 id_22;
  always
    if (1)
      @(1) begin : LABEL_0
        id_3 <= id_20;
      end
    else;
endmodule
module module_1 #(
    parameter id_10 = 32'd56,
    parameter id_3  = 32'd73,
    parameter id_7  = 32'd62,
    parameter id_8  = 32'd70
) (
    input uwire id_0,
    input tri0 id_1,
    output logic id_2,
    input wor _id_3,
    output supply1 id_4[id_7 : id_10],
    output wand id_5,
    input tri1 id_6,
    input supply0 _id_7,
    input tri0 _id_8,
    output wire id_9,
    output wire _id_10,
    output wire id_11,
    input wire id_12,
    output logic id_13,
    input wire id_14,
    input wor id_15[id_7 : id_8]
    , id_18,
    output supply0 id_16
);
  wire id_19;
  always begin : LABEL_0
    id_13 <= id_1;
  end
  wire [1 : id_3] id_20;
  reg id_21 = id_20;
  always id_2.id_21 = id_12;
  wire id_22;
  module_0 modCall_1 (
      id_16,
      id_9,
      id_0,
      id_2,
      id_14,
      id_11,
      id_4,
      id_14,
      id_12,
      id_11,
      id_12,
      id_12,
      id_15,
      id_1,
      id_11,
      id_16,
      id_1,
      id_11
  );
  assign modCall_1.id_0 = 0;
  logic id_23;
  ;
endmodule
