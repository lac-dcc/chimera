// Seed: 1307733839
module module_0 (
    output uwire id_0,
    input wire id_1,
    input wor id_2,
    input tri id_3,
    output tri id_4,
    output supply1 id_5,
    input supply1 id_6,
    input supply1 id_7
);
  wire id_9;
  wire id_10;
  assign module_1.id_5 = 0;
  wire id_11;
endmodule
module module_1 (
    input supply1 id_0,
    input tri1 id_1,
    output wor id_2,
    input wor id_3
    , id_7,
    inout uwire id_4,
    input tri0 id_5
);
  assign id_7 = 1;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_5,
      id_0,
      id_2,
      id_2,
      id_1,
      id_1
  );
  assign id_2 = {id_1, ~({1, 1})};
endmodule
