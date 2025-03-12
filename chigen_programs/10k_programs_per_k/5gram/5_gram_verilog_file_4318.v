// Seed: 2782111090
module module_0 (
    output supply1 id_0,
    input wand id_1,
    input supply0 id_2,
    input wor id_3,
    input wire id_4,
    output wand id_5,
    output tri id_6,
    output supply1 id_7
);
  bit id_9;
  assign id_0 = id_2;
  always #1 begin : LABEL_0
    if (1)
      if (id_7++) disable id_10;
      else begin : LABEL_1
        #1 id_9 <= id_1;
      end
  end
endmodule
module module_1 #(
    parameter id_3 = 32'd96
) (
    output supply0 id_0,
    input tri0 id_1,
    output wor id_2,
    input tri0 _id_3,
    output tri id_4,
    input supply1 id_5,
    output tri0 id_6,
    output tri0 id_7,
    output wand id_8,
    input uwire id_9,
    output supply1 id_10,
    input tri id_11,
    output supply1 id_12,
    output tri id_13,
    output supply0 id_14,
    output uwire id_15
);
  wire \id_17 ;
  wire [-1 : id_3] id_18;
  wire id_19;
  assign id_12 = id_9 == id_5;
  module_0 modCall_1 (
      id_4,
      id_9,
      id_1,
      id_9,
      id_9,
      id_12,
      id_4,
      id_7
  );
  assign modCall_1.id_2 = 0;
endmodule
