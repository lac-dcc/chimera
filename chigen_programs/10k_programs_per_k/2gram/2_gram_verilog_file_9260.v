// Seed: 492789862
module module_0 (
    output tri id_0,
    input tri id_1,
    input supply0 id_2,
    input wand id_3,
    output wand id_4,
    output supply1 id_5
);
  logic id_7;
  ;
  assign module_1.id_4 = 0;
  assign id_0 = id_3;
endmodule
module module_1 (
    output wand  id_0,
    output logic id_1,
    input  wand  id_2,
    input  wire  id_3,
    input  wire  id_4,
    output logic id_5
);
  module_0 modCall_1 (
      id_0,
      id_4,
      id_2,
      id_3,
      id_0,
      id_0
  );
  initial
    if ('h0) #1 id_5 = -1;
    else id_1 <= id_1++;
  logic id_7;
endmodule
