// Seed: 4036929430
module module_0 (
    input supply0 id_0,
    output supply0 id_1,
    input wor id_2,
    input wire id_3,
    input uwire id_4,
    output uwire id_5,
    input tri id_6,
    input tri id_7,
    output supply1 id_8,
    output wire id_9,
    input supply1 id_10,
    output wor id_11,
    output tri0 id_12,
    input uwire id_13,
    output wand id_14,
    output tri1 id_15,
    input supply0 id_16,
    output tri0 id_17,
    output supply1 id_18
);
  wire id_20;
endmodule
module module_1 (
    output tri1 id_0,
    input uwire id_1,
    output tri id_2,
    input wor id_3,
    output wor id_4,
    inout uwire id_5,
    input supply1 id_6,
    input uwire id_7,
    input wor id_8
);
  wor  id_10;
  wire id_11;
  module_0(
      id_8,
      id_2,
      id_1,
      id_8,
      id_6,
      id_5,
      id_7,
      id_7,
      id_2,
      id_5,
      id_1,
      id_4,
      id_5,
      id_3,
      id_5,
      id_2,
      id_6,
      id_2,
      id_0
  );
  wand id_12;
  assign id_10 = 1;
  assign id_0  = 1;
  supply1 id_13 = 1;
  wor id_14 = 1;
  assign id_12 = 1;
  always @({id_7, 1}, posedge 1'h0) deassign id_12.id_12;
  tri0 id_15 = (id_12);
  wire id_16;
  wire id_17;
endmodule
