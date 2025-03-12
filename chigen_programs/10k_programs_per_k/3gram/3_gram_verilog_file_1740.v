// Seed: 2152296990
module module_0 (
    input wor id_0,
    output tri1 id_1,
    input uwire id_2,
    input wor id_3,
    input tri0 id_4,
    input wor id_5,
    output uwire id_6,
    output supply0 id_7,
    input wand id_8
);
  assign id_7 = 1;
  assign id_6 = id_8#(.id_3(1));
  assign module_1.id_0 = 0;
  wire [-1 : !  1] id_10;
  integer [-1 : 1 'b0] id_11;
endmodule
module module_1 (
    input  wire  id_0,
    output logic id_1,
    output uwire id_2
);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_2,
      id_0
  );
  always @(negedge id_0) id_1 = (id_0) ==? id_0;
endmodule
