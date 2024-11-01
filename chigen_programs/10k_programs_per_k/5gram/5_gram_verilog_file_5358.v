// Seed: 3692178271
module module_0 (
    output tri id_0,
    output uwire id_1,
    input uwire id_2,
    input tri id_3,
    input tri0 id_4,
    input tri1 id_5,
    input tri0 id_6,
    input tri0 id_7,
    input wire id_8,
    input supply1 id_9,
    output supply1 id_10,
    input supply0 id_11,
    output supply0 id_12,
    output wor id_13,
    input wire id_14,
    output supply1 id_15,
    input wor id_16,
    input tri0 id_17,
    input supply1 id_18,
    output supply0 id_19,
    output supply1 id_20,
    input tri0 id_21,
    output wire id_22,
    input wire id_23,
    input wor id_24
);
  wand id_26 = (id_7) * 1 - 1;
endmodule
module module_1 (
    input  tri1  id_0,
    output uwire id_1,
    output tri1  id_2,
    input  wire  id_3,
    input  tri0  id_4,
    output uwire id_5
);
  logic [7:0] id_7;
  assign id_7[1] = id_4 != 1;
  id_8(
      id_2, 1'd0, id_3, id_7[1], id_2
  ); module_0(
      id_2,
      id_5,
      id_4,
      id_0,
      id_3,
      id_4,
      id_0,
      id_3,
      id_3,
      id_3,
      id_2,
      id_0,
      id_5,
      id_1,
      id_3,
      id_2,
      id_0,
      id_3,
      id_3,
      id_2,
      id_5,
      id_3,
      id_1,
      id_4,
      id_0
  );
endmodule
