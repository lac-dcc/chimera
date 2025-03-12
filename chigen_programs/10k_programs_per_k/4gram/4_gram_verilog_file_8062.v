// Seed: 1553675908
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    output tri0 id_2,
    output uwire id_3,
    input supply1 id_4,
    output wor id_5,
    output wand id_6,
    input supply0 id_7,
    input supply1 id_8,
    input supply0 id_9
    , id_13,
    input tri1 id_10,
    output tri id_11
);
  assign module_1.id_6 = 0;
  logic [-1 : |  1] id_14 = id_7;
  wire id_15;
  ;
endmodule
module module_1 (
    output supply1 id_0,
    output tri0 id_1,
    output supply0 id_2,
    output logic id_3,
    input tri0 id_4,
    output logic id_5,
    output tri1 id_6
);
  localparam id_8 = -1'b0;
  module_0 modCall_1 (
      id_4,
      id_0,
      id_6,
      id_0,
      id_4,
      id_6,
      id_1,
      id_4,
      id_4,
      id_4,
      id_4,
      id_0
  );
  always
    if (1) begin : LABEL_0
      id_3 <= 1;
    end else id_5 <= "";
  assign id_6 = id_8.id_8;
endmodule
