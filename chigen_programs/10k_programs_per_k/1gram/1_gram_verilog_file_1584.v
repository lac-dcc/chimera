// Seed: 1617665023
module module_0 (
    output tri0 id_0,
    input supply0 id_1,
    input wand id_2,
    output tri0 id_3,
    output wire id_4,
    input tri1 id_5,
    input uwire id_6,
    input supply0 id_7,
    input uwire id_8
);
endmodule
module module_1 (
    output tri1 id_0,
    input wor id_1,
    input supply0 id_2,
    output tri0 id_3,
    output wand id_4
);
  assign id_0 = 1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_3,
      id_3,
      id_1,
      id_2,
      id_1,
      id_1
  );
  assign modCall_1.id_8 = 0;
  localparam id_6 = "";
endmodule
module module_2 (
    input supply0 id_0,
    output wor id_1,
    output supply1 id_2,
    input wor id_3,
    output logic id_4,
    input supply0 id_5
);
  assign id_1 = -1;
  assign id_4 = 1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_1,
      id_2,
      id_3,
      id_3,
      id_5,
      id_3
  );
  assign modCall_1.id_3 = 0;
  assign id_1 = &id_5;
  xnor primCall (id_2, id_3, id_5, id_0);
  always id_4 <= -1;
endmodule
