// Seed: 1896025793
program module_0 (
    output logic id_0,
    input wand id_1,
    input tri id_2,
    input wor id_3,
    input supply1 id_4,
    input supply0 id_5,
    input supply1 id_6,
    input uwire id_7,
    input tri0 id_8,
    input supply1 id_9,
    input wand id_10,
    output logic id_11
);
  initial begin : LABEL_0
    id_0 = id_7;
    id_11 <= -1;
  end
  wire [-1 : -1] id_13;
  assign #1 id_0 = id_9;
endprogram
module module_0 #(
    parameter id_10 = 32'd8,
    parameter id_11 = 32'd22
) (
    output supply0 id_0,
    input tri1 id_1,
    input wor id_2,
    input wor id_3,
    input wand id_4,
    output supply1 id_5,
    input tri0 module_1,
    output tri1 id_7,
    input uwire id_8,
    output tri1 id_9,
    input supply0 _id_10,
    input tri _id_11,
    input wand id_12,
    output uwire id_13,
    output tri id_14,
    input tri id_15,
    input tri id_16,
    input tri1 id_17,
    input supply1 id_18,
    output logic id_19,
    input wire id_20,
    input tri1 id_21,
    input uwire id_22
    , id_35,
    output logic id_23,
    input wire id_24,
    input wire id_25,
    input wand id_26,
    input uwire id_27,
    input wire id_28,
    input tri1 id_29,
    input wor id_30,
    output wor id_31,
    input wand id_32,
    output wire id_33
);
  initial begin : LABEL_0
    for (id_14 = id_20; id_35[id_11 : id_10]; id_19 = 1) begin : LABEL_1
      id_23 <= -1;
    end
    disable id_36;
  end
  module_0 modCall_1 (
      id_19,
      id_25,
      id_29,
      id_18,
      id_20,
      id_4,
      id_22,
      id_20,
      id_16,
      id_29,
      id_16,
      id_23
  );
  assign modCall_1.id_9 = 0;
endmodule
