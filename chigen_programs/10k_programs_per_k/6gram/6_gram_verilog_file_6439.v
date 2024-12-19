// Seed: 2181641617
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input tri id_2,
    input tri1 id_3,
    input wand id_4,
    output uwire id_5,
    output wire id_6,
    input wand id_7,
    output supply0 id_8,
    output tri id_9,
    input uwire id_10,
    input supply0 id_11,
    output supply1 id_12,
    input tri id_13,
    input uwire id_14,
    output tri1 id_15
);
  wire id_17;
  wire id_18;
  wire id_19;
  wire id_20;
  assign module_1.id_4 = 0;
  generate
    if (!(1 == id_0)) begin : LABEL_0
      wire id_21;
      assign id_9  = id_0;
      assign id_20 = id_19;
      assign id_5  = 1;
    end
  endgenerate
endmodule
module module_1 (
    input supply0 id_0,
    input uwire id_1,
    output wand id_2,
    input tri id_3,
    input tri id_4
);
  wire id_6 = id_6;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_1,
      id_0,
      id_2,
      id_2,
      id_4,
      id_2,
      id_2,
      id_4,
      id_1,
      id_2,
      id_3,
      id_3,
      id_2
  );
endmodule
