// Seed: 2227084330
module module_0 (
    input uwire id_0,
    input supply1 id_1,
    input wor id_2,
    input wire id_3,
    output logic id_4,
    input tri1 id_5,
    output wor id_6,
    output supply0 id_7,
    input supply0 id_8
);
  logic id_10[(  1  )  -  -1 : -1];
  ;
  parameter id_11 = 1;
  wire id_12, id_13;
  initial id_4 <= id_8;
endmodule
module module_1 #(
    parameter id_13 = 32'd26
) (
    output uwire id_0,
    input supply0 id_1,
    input supply1 id_2,
    input tri id_3,
    input tri id_4,
    output uwire id_5[1 : id_13],
    output wand id_6,
    output logic id_7,
    output logic id_8,
    output supply0 id_9,
    output wire id_10,
    input wor id_11,
    input tri0 id_12,
    output supply0 _id_13,
    output wand id_14,
    input supply1 id_15,
    input tri1 id_16,
    input uwire id_17,
    input uwire id_18,
    input tri0 id_19,
    input supply1 id_20,
    output wire id_21,
    output supply1 id_22,
    input tri id_23,
    output uwire id_24
);
  module_0 modCall_1 (
      id_20,
      id_19,
      id_20,
      id_20,
      id_8,
      id_17,
      id_21,
      id_24,
      id_23
  );
  assign modCall_1.id_5 = 0;
  assign id_8 = (id_11);
  always begin : LABEL_0
    #1 id_7 = id_1;
  end
  always id_8 <= #1 -1 ? (-1) : 1;
  final id_7 <= id_18;
  final $unsigned(25);
  ;
  always id_0 += id_17;
endmodule
