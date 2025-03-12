// Seed: 477202037
module module_0 (
    output supply0 id_0,
    input wor id_1,
    input tri0 id_2,
    output supply1 id_3,
    output uwire id_4,
    output logic id_5,
    output uwire id_6,
    input supply0 id_7
);
  struct packed {
    logic id_9   = 1;
    logic id_10;
    logic id_11;
    logic id_12;
  } id_13;
  logic id_14;
  initial for (id_0 = id_13.id_11; id_7; id_13 = id_13.id_9) id_5 = 1'b0;
endmodule
module module_1 (
    input wand id_0
    , id_7,
    output tri1 id_1,
    output logic id_2,
    output supply0 id_3,
    output wor id_4,
    input wand id_5
);
  always id_2 <= id_0;
  initial id_2 = -1;
  wire id_8;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_1,
      id_3,
      id_2,
      id_1,
      id_5
  );
  assign id_1 = id_0;
endmodule
