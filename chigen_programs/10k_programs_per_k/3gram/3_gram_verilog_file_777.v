// Seed: 3969387467
module module_0 (
    input supply0 id_0,
    input wand id_1,
    input tri1 id_2,
    input uwire id_3,
    output wor id_4,
    input tri0 id_5,
    input wor id_6,
    output tri0 id_7
);
  wire id_9;
  ;
  logic [-1 : 1] id_10;
  ;
  wire id_11;
  wire id_12;
  wor  id_13 = 1;
endmodule
module module_1 (
    input tri1 id_0,
    output logic id_1,
    input uwire id_2,
    input wire id_3,
    input wand id_4,
    input tri0 id_5,
    output tri id_6,
    output uwire id_7,
    input tri id_8,
    output supply0 id_9,
    output logic id_10
);
  always
    if (1) begin : LABEL_0
      $unsigned(2);
      ;
      id_1 <= id_8;
    end else id_10 <= 1;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_0,
      id_2,
      id_7,
      id_2,
      id_8,
      id_6
  );
  assign modCall_1.id_7 = 0;
endmodule
