// Seed: 937114587
module module_0 (
    input tri1 id_0,
    input wand id_1,
    input wand id_2,
    input supply1 id_3
    , id_6,
    output supply0 id_4
);
  logic   id_7;
  supply0 id_8;
  assign module_1.id_1 = 0;
  assign id_8 = -1;
endmodule
module module_1 (
    input supply1 id_0,
    input tri id_1,
    output supply1 id_2,
    input wand id_3,
    input uwire id_4,
    input uwire id_5,
    output wire id_6,
    input uwire id_7,
    output logic id_8
);
  always id_8 <= #1 id_4 > id_0;
  logic id_10;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_4,
      id_1,
      id_6
  );
endmodule
