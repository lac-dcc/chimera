// Seed: 3195925136
module module_0 (
    output uwire id_0,
    input wand id_1,
    output tri1 id_2,
    input wor id_3,
    output tri1 id_4,
    input wire id_5,
    output supply0 id_6,
    input wire id_7
);
  not primCall (id_6, id_3);
  module_2 modCall_1 (
      id_7,
      id_5,
      id_4,
      id_1,
      id_3,
      id_1,
      id_6
  );
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    input wand id_0,
    input supply0 id_1,
    output wire id_2,
    output tri0 id_3,
    output uwire id_4,
    output supply0 id_5,
    output wor id_6
);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_6,
      id_0,
      id_5,
      id_0,
      id_5,
      id_1
  );
endmodule
module module_2 (
    input tri1 id_0,
    input tri0 id_1,
    output tri id_2,
    input tri0 id_3,
    input wor id_4,
    input supply1 id_5,
    output tri id_6
);
  always #1 begin : LABEL_0
    id_8();
  end
  assign module_0.id_5 = 0;
endmodule
