// Seed: 1852707997
module module_0 (
    input tri0 id_0,
    input wand id_1,
    input supply1 id_2,
    output logic id_3,
    input supply1 id_4,
    output logic id_5,
    input tri1 id_6
);
  logic id_8;
  ;
  assign id_8 = id_0;
  bit  id_9;
  tri1 id_10;
  initial
    if (1) begin : LABEL_0
      assert (1) id_3 <= -1'b0;
    end
  always begin : LABEL_1
    #id_11 id_5 = id_6;
  end
  assign id_3 = -1;
  wire id_12, id_13;
  initial id_9 <= 1;
  assign id_10 = id_12;
  assign id_10 = id_4 ? id_6 : -1 - id_12;
  logic id_14 = -1;
  wire  id_15;
endmodule
module module_1 #(
    parameter id_15 = 32'd40
) (
    output uwire id_0,
    output uwire id_1,
    output supply1 id_2,
    input tri id_3,
    output tri1 id_4,
    input tri id_5,
    output wor id_6,
    output uwire id_7,
    input wor id_8,
    output tri id_9,
    output logic id_10[{  -1  {  1  }  }  +  -1 : ~  id_15],
    input tri id_11,
    output supply0 id_12,
    input uwire id_13,
    input tri id_14,
    input wand _id_15,
    input wire id_16,
    input tri1 id_17,
    input uwire id_18,
    input tri0 id_19,
    output tri1 id_20,
    output tri0 id_21,
    input tri0 id_22,
    output supply1 id_23,
    output tri0 id_24[1 : 1],
    input tri0 id_25
);
  always_latch id_10 = "";
  wire id_27, id_28, id_29;
  wire id_30, id_31, id_32;
  wire id_33;
  module_0 modCall_1 (
      id_14,
      id_18,
      id_3,
      id_10,
      id_5,
      id_10,
      id_14
  );
  int id_34 = 1, id_35;
endmodule
