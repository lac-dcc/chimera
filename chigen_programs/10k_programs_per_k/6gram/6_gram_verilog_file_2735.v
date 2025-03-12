// Seed: 2150840279
module module_0 (
    input tri1 id_0,
    input tri id_1,
    output uwire id_2,
    input tri1 id_3,
    output tri1 id_4,
    input wor id_5,
    output wire id_6
    , id_12,
    input uwire id_7,
    input supply0 id_8,
    input tri id_9,
    output tri id_10
);
  logic id_13;
  timeprecision 1ps;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    output supply0 id_2,
    input tri0 id_3,
    output tri id_4,
    input tri1 id_5,
    input supply1 id_6,
    output wire id_7,
    input supply1 id_8,
    input tri1 id_9,
    input tri1 id_10,
    input tri1 id_11,
    output logic id_12,
    output wor id_13
);
  logic id_15;
  ;
  or primCall (id_12, id_3, id_16, id_15, id_8, id_0, id_5, id_1, id_6, id_10, id_11, id_9);
  always id_12 <= #1 id_5;
  parameter id_16 = 1;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_2,
      id_5,
      id_13,
      id_3,
      id_2,
      id_5,
      id_0,
      id_11,
      id_2
  );
  wire [1 : 'b0] id_17;
  generate
    assign id_15 = -1;
  endgenerate
endmodule
