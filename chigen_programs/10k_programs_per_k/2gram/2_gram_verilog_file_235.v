// Seed: 1747920354
module module_0 (
    output supply1 id_0,
    output wor id_1,
    output wor id_2,
    output tri0 id_3,
    output uwire id_4,
    input wire id_5
    , id_13,
    input tri1 id_6,
    input wire id_7,
    input tri0 id_8,
    output tri1 id_9,
    input tri id_10,
    output wor id_11
);
  assign id_13 = 1'b0;
  assign module_1.type_2 = 0;
endmodule
module module_1 (
    output wire id_0,
    input supply1 id_1,
    input tri0 id_2,
    output logic id_3,
    inout tri0 id_4,
    input tri0 id_5
    , id_7
);
  initial id_3 <= 1;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_4,
      id_0,
      id_4,
      id_2,
      id_1,
      id_1,
      id_2,
      id_4,
      id_2,
      id_4
  );
  always_latch @*
    #1 begin : LABEL_0
      id_3 = 1 ^ id_1;
    end
  assign id_7 = 1;
endmodule
