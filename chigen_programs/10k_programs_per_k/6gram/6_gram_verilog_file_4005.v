// Seed: 1381026331
module module_0 (
    output tri1 id_0,
    input supply0 id_1,
    input tri0 id_2,
    input supply1 id_3,
    input uwire id_4,
    input uwire id_5,
    input uwire id_6,
    output wire id_7,
    input uwire id_8,
    input wor id_9,
    output wor id_10
);
  tri1 id_12 = -1;
  assign module_1.id_1 = 0;
endmodule
module module_1 #(
    parameter id_17 = 32'd49,
    parameter id_19 = 32'd64
) (
    input supply1 id_0,
    input wand id_1
    , id_33,
    input tri1 id_2,
    input uwire id_3,
    output tri1 id_4,
    input uwire id_5,
    input supply1 id_6,
    input wand id_7,
    input tri id_8,
    output wor id_9,
    input wand id_10,
    input tri0 id_11,
    output tri id_12,
    input tri0 id_13,
    input tri1 id_14,
    output wor id_15,
    input tri id_16,
    input tri1 _id_17,
    input tri0 id_18,
    input wor _id_19,
    input wor id_20,
    input supply1 id_21,
    input tri0 id_22,
    output logic id_23,
    input uwire id_24,
    input wire id_25,
    input tri1 id_26,
    input wire id_27,
    output wire id_28,
    output supply1 id_29,
    input tri1 id_30,
    output tri1 id_31
);
  wire [id_17 : id_19] id_34;
  assign id_31 = -1;
  always @(posedge id_14 or negedge id_13) begin : LABEL_0
    id_23 = 1'b0;
  end
  assign id_31 = id_7 - id_17;
  tri0 id_35 = 'b0 + id_0;
  module_0 modCall_1 (
      id_4,
      id_24,
      id_7,
      id_16,
      id_18,
      id_10,
      id_20,
      id_28,
      id_16,
      id_11,
      id_9
  );
  wire id_36;
  wire id_37;
  xor primCall (
      id_9,
      id_13,
      id_6,
      id_3,
      id_20,
      id_21,
      id_26,
      id_8,
      id_18,
      id_1,
      id_10,
      id_11,
      id_24,
      id_7,
      id_35,
      id_14,
      id_25,
      id_33,
      id_2,
      id_27,
      id_0,
      id_22
  );
endmodule
