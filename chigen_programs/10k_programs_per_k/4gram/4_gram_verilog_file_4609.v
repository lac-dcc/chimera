// Seed: 1078238638
module module_0 (
    output wand id_0,
    input tri0 id_1,
    output wand id_2,
    output wand id_3,
    input tri0 id_4,
    input tri0 id_5,
    input supply0 id_6,
    input tri1 id_7,
    input tri1 id_8,
    input tri id_9,
    output wire id_10,
    input uwire id_11,
    input wor id_12
);
endmodule
module module_1 (
    input  wand  id_0,
    input  uwire id_1,
    output tri0  id_2
);
  assign id_2 = id_1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_2,
      id_2,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_2,
      id_0,
      id_0
  );
  assign modCall_1.id_8 = 0;
endmodule
module module_2 (
    output supply0 id_0,
    output supply0 id_1,
    input wand id_2,
    input supply0 id_3,
    input supply1 id_4
);
  parameter id_6 = 1;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_0,
      id_1,
      id_2,
      id_3,
      id_4,
      id_4,
      id_2,
      id_3,
      id_1,
      id_3,
      id_2
  );
  assign modCall_1.id_6 = 0;
  task id_7(input [-1 : -1] id_8);
    begin : LABEL_0
      if (!1) if (id_6) id_7 <= id_4#(.id_3(id_6));
    end
  endtask
  wire id_9;
endmodule
