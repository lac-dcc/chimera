// Seed: 4020997865
module module_0 ();
  tri id_1;
  assign id_1 = 1;
  assign module_2.id_1 = 0;
endmodule
module module_1 (
    output wand id_0
    , id_10,
    output wire id_1,
    output supply1 id_2,
    input wand id_3,
    output tri id_4,
    input tri1 id_5,
    output wor id_6,
    inout tri id_7,
    output wand id_8
);
  wire id_11;
  wire id_12;
  assign id_0 = 1;
  module_0 modCall_1 ();
  assign modCall_1.type_2 = 0;
endmodule
module module_2 (
    input  supply0 id_0,
    output logic   id_1
);
  module_0 modCall_1 ();
  always
    repeat (id_0[1]) begin : LABEL_0
      fork
        id_1 = #1 1;
      join
    end
endmodule
