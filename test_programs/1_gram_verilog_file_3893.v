// Seed: 3656170493
module module_0 (
    input supply0 id_0,
    input uwire id_1,
    input wor id_2,
    input wor id_3,
    output uwire id_4,
    input uwire id_5,
    input uwire id_6,
    output tri id_7,
    input tri id_8,
    input supply1 id_9#(.id_18(-1)),
    output wire id_10,
    input wire id_11,
    output tri1 id_12,
    output supply1 id_13,
    input tri1 id_14,
    input uwire id_15,
    output tri id_16
);
  id_19(
      id_9 === id_15 + 1
  );
  parameter id_20 = 1;
  parameter id_21 = -1'b0;
  assign module_1.id_2 = 0;
  wire id_22, id_23;
  wire id_24;
endmodule
module module_1 (
    input  uwire id_0,
    output wire  id_1,
    output uwire id_2,
    output uwire id_3
);
  assign id_2 = id_0;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_3,
      id_0,
      id_0,
      id_3
  );
  supply1 id_5 = !-1 - -1;
endmodule
