// Seed: 3601809639
module module_0 (
    input tri id_0,
    input uwire id_1,
    input uwire id_2,
    input tri1 id_3,
    input tri0 id_4,
    input tri0 id_5,
    input supply1 id_6,
    input supply0 id_7,
    input tri0 id_8,
    output wire id_9,
    input supply1 id_10,
    input supply1 id_11,
    input supply0 id_12,
    input supply0 id_13,
    input wor id_14,
    input wire id_15,
    input supply1 id_16,
    output wor id_17,
    input tri id_18,
    input supply1 id_19,
    output tri0 id_20,
    output wire id_21,
    input wire id_22,
    output wor id_23,
    output wand id_24,
    output supply0 id_25,
    input wand id_26,
    output tri id_27,
    output tri1 id_28,
    output supply1 id_29,
    output tri1 id_30,
    input wire id_31,
    input wire id_32,
    input supply1 id_33,
    input tri id_34,
    input tri module_0,
    input supply0 id_36,
    output uwire id_37,
    output uwire id_38,
    input uwire id_39
);
  logic [1 : 1] id_41;
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_5 = 32'd70,
    parameter id_7 = 32'd92
) (
    output logic id_0,
    input supply0 id_1,
    output tri1 id_2,
    output logic id_3,
    input wand id_4,
    input tri0 _id_5
);
  localparam id_7 = 1;
  always @(*) begin : LABEL_0
    id_0 <= id_7;
    id_3 = #id_8 1;
  end
  logic id_9;
  assign id_0 = 1;
  uwire id_10 = 1;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_4,
      id_1,
      id_1,
      id_1,
      id_4,
      id_4,
      id_4,
      id_2,
      id_1,
      id_4,
      id_4,
      id_1,
      id_1,
      id_4,
      id_4,
      id_2,
      id_4,
      id_4,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_4,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_4,
      id_4,
      id_2,
      id_2,
      id_4
  );
  logic ['b0 : -1] id_11;
  wire [id_7  == "" : id_5] id_12 = id_4;
endmodule
