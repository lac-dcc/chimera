// Seed: 4276649350
module module_0 (
    output wand id_0,
    output uwire id_1,
    input tri1 id_2
    , id_14,
    input wire id_3,
    output wor id_4,
    input wand id_5,
    input supply0 id_6,
    input tri0 id_7,
    input supply1 id_8,
    input tri0 id_9,
    output wor id_10,
    output supply0 id_11,
    output supply1 id_12
);
  struct packed {
    id_15 id_16;
    logic id_17;
  } id_18;
  wire [(  1  ) : -1 'b0] id_19;
  assign module_1.id_3 = 0;
  assign id_18.id_15   = 1;
  wire id_20, id_21;
endmodule
module module_1 (
    input wor id_0,
    input tri1 id_1,
    output wor id_2,
    input wire id_3,
    input supply1 id_4,
    output tri id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_4,
      id_0,
      id_5,
      id_0,
      id_1,
      id_1,
      id_0,
      id_4,
      id_2,
      id_2,
      id_2
  );
endmodule
