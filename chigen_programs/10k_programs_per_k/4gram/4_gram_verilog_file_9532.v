// Seed: 6933409
module module_0 (
    input wor id_0,
    input wor id_1,
    output uwire id_2,
    output uwire id_3,
    output uwire id_4,
    output uwire id_5,
    input supply0 id_6
);
  wire id_8;
  ;
  initial begin : LABEL_0
    disable id_9;
  end
  logic [-1 : 1  -  -1] id_10;
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    input wand id_2,
    input wor id_3,
    output wire id_4,
    input wand id_5,
    input tri id_6,
    input uwire id_7
);
  parameter id_9 = 1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_4,
      id_4,
      id_4,
      id_6
  );
  assign modCall_1.id_5 = 0;
endmodule
