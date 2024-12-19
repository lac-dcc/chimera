// Seed: 3998231890
module module_0 (
    output tri0 id_0,
    output supply0 id_1,
    input supply0 id_2,
    input tri0 id_3,
    output wor id_4,
    input wor id_5,
    input tri id_6,
    output supply1 id_7,
    input supply0 id_8,
    input supply0 id_9,
    input wand id_10,
    input uwire id_11,
    input supply0 id_12,
    output tri id_13
);
  assign id_13 = id_6;
  wire id_15;
  generate
    if (id_2)
      if (id_10)
        if (1)
          if (id_6) tri id_16;
          else begin : LABEL_0
            assign id_16 = 1 || 1;
          end
        else wire id_17;
  endgenerate
endmodule
module module_1 (
    output tri1 id_0,
    input wand id_1,
    input supply1 id_2,
    output uwire id_3,
    input supply1 id_4,
    output wire id_5,
    output uwire id_6,
    output wire id_7
);
  assign  id_3  =  id_2  ^  id_2  ==  id_4  ?  id_1  -  id_1  :  id_2  ?  id_2  :  id_4  ?  1  :  id_1  ?  id_2  :  1  ?  id_4  :  1  ;
  module_0 modCall_1 (
      id_7,
      id_5,
      id_4,
      id_1,
      id_6,
      id_4,
      id_1,
      id_6,
      id_4,
      id_1,
      id_4,
      id_4,
      id_1,
      id_3
  );
  assign modCall_1.type_19 = 0;
endmodule
