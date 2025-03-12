// Seed: 3088922028
module module_0 ();
  wire id_1;
  assign module_2.id_12 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  module_0 modCall_1 ();
  output wire id_1;
  wire id_5;
  wire id_6;
  assign id_2 = id_6;
endmodule
module module_2 #(
    parameter id_14 = 32'd25,
    parameter id_8  = 32'd84
) (
    input tri0 id_0,
    output wire id_1,
    input wire id_2,
    output tri0 id_3,
    input wire id_4,
    output supply0 id_5,
    input wor id_6,
    input tri0 id_7,
    output supply1 _id_8,
    input wor id_9,
    output supply1 id_10,
    input wand id_11,
    input wor id_12,
    output wor id_13,
    input wire _id_14,
    input tri1 id_15,
    output wand id_16,
    input uwire id_17,
    output tri0 id_18,
    input wor id_19
);
  wire [-1 : id_14] id_21;
  logic id_22;
  ;
  logic [1 : id_8] id_23;
  ;
  nor primCall (
      id_1, id_11, id_12, id_15, id_17, id_19, id_2, id_21, id_22, id_23, id_4, id_6, id_7, id_9
  );
  module_0 modCall_1 ();
  wire [-1 : 1] id_24;
  logic id_25 = id_6;
  assign id_3 = id_6;
endmodule
