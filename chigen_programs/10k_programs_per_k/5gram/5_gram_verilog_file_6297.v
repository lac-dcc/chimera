// Seed: 402860582
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_6, id_7;
  wire id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_4;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_4,
      id_4
  );
  wire id_5;
endmodule
module module_2 (
    input supply1 id_0,
    input wand id_1,
    input tri1 id_2,
    output uwire id_3
    , id_15,
    input supply1 id_4,
    input wire id_5,
    input supply0 id_6,
    input supply0 id_7,
    input uwire id_8,
    input wire id_9,
    input uwire id_10,
    output wand id_11,
    output wor id_12,
    input uwire id_13
);
  wire id_16;
  and primCall (id_11, id_15, id_16, id_10, id_8, id_6, id_2, id_4);
  module_0 modCall_1 (
      id_16,
      id_15,
      id_15,
      id_16,
      id_15
  );
endmodule
