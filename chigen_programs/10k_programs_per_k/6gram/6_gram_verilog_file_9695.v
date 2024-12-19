// Seed: 2475581116
module module_0 (
    input wor id_0,
    input supply0 id_1,
    input wand id_2,
    input wand id_3,
    input supply1 id_4,
    input tri1 id_5,
    input uwire id_6,
    output wand id_7
);
  wire id_9;
  always #1 begin : LABEL_0
    #1;
  end
  assign module_1.type_10 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input supply1 id_1,
    input wor id_2,
    input tri1 id_3,
    output uwire id_4
);
  wire id_6;
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_0,
      id_2,
      id_3,
      id_0,
      id_1,
      id_4
  );
  wire  id_8;
  uwire id_9 = 1;
  assign id_7 = id_7;
endmodule
