// Seed: 1636888813
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    input wire id_2,
    output tri1 id_3,
    input wand id_4,
    output uwire id_5,
    input tri0 id_6,
    output wor id_7
    , id_36,
    input wire id_8,
    output wire id_9,
    output wire id_10,
    output tri0 id_11,
    output wor id_12,
    input tri0 id_13,
    output supply1 id_14,
    output wor id_15,
    input supply1 id_16,
    output wand id_17,
    output supply1 id_18,
    output wire id_19,
    output wor id_20,
    input supply0 id_21,
    output supply0 id_22,
    input supply1 id_23,
    input supply1 id_24,
    input wire id_25,
    input uwire id_26,
    output uwire id_27,
    input tri id_28,
    input tri id_29,
    input tri0 id_30,
    input tri1 id_31,
    output tri0 id_32,
    output tri0 id_33,
    output supply1 id_34
);
  wire [-1 : -1] id_37;
endmodule
module module_1 (
    output supply1 id_0,
    input tri id_1,
    input wire id_2,
    output logic id_3,
    input wand id_4,
    output logic id_5,
    input tri0 id_6,
    output logic id_7,
    input wor id_8
);
  bit id_10;
  supply0 id_11;
  assign id_3 = id_6;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_1,
      id_0,
      id_6,
      id_0,
      id_1,
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_8,
      id_0,
      id_2,
      id_6,
      id_1,
      id_4,
      id_0,
      id_2,
      id_4,
      id_2,
      id_8,
      id_0,
      id_0,
      id_0
  );
  wire id_12;
  if (1) begin : LABEL_0
    always
      for (id_11 = 1; id_11; id_5 = id_11) begin : LABEL_1
        if (1) begin : LABEL_2
          if (1) id_10 <= 1'b0;
          else if (-1) id_7 = id_6;
        end else begin : LABEL_3
          id_3 <= 1;
        end
      end
  end
endmodule
