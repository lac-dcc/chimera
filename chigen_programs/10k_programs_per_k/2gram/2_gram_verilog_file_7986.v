// Seed: 2637470139
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_7;
  ;
  localparam id_8 = -1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_2,
      id_3,
      id_2
  );
  wire id_4;
endmodule
module module_2 (
    output tri0 id_0,
    input  wand id_1,
    output wire id_2,
    output wire id_3
);
  wire id_5 = id_1;
endmodule
module module_3 (
    output wor id_0,
    input tri0 id_1,
    input wand id_2,
    input wire id_3,
    output logic id_4,
    input supply0 id_5,
    output wand id_6,
    input uwire id_7
);
  always id_4 <= id_5;
  module_2 modCall_1 (
      id_6,
      id_5,
      id_6,
      id_0
  );
  assign modCall_1.id_2 = 0;
endmodule
