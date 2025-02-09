// Seed: 724073200
module module_0 (
    input  supply0 id_0,
    output uwire   id_1
);
  assign module_1.type_6 = 0;
  assign id_1 = 1 == id_0;
  assign module_2.id_1 = 0;
endmodule
module module_1 (
    input uwire id_0,
    output wire id_1,
    input wor id_2,
    input supply0 id_3,
    input wire id_4,
    input wand id_5,
    input supply0 id_6,
    input tri0 id_7,
    output uwire id_8
);
  assign id_8 = 1'b0;
  module_0 modCall_1 (
      id_3,
      id_1
  );
endmodule
module module_2 (
    output logic id_0,
    input  wand  id_1,
    output tri   id_2
);
  always @(negedge 1) id_0 <= 1'b0;
  module_0 modCall_1 (
      id_1,
      id_2
  );
endmodule
