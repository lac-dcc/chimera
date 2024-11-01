// Seed: 33484997
module module_0 (
    output supply0 id_0,
    input wire id_1,
    output uwire id_2,
    input wand id_3,
    output supply0 id_4,
    output tri1 id_5,
    input tri0 id_6,
    input tri id_7,
    input wand id_8
    , id_18,
    output tri0 id_9,
    output uwire id_10,
    output tri0 id_11,
    output wor id_12,
    input tri0 id_13,
    input uwire id_14,
    output tri1 id_15,
    input tri id_16
);
  id_19(
      .id_0(1'b0), .id_1(id_0 == id_15), .id_2(1), .id_3(1)
  );
  assign id_2 = 1;
endmodule
module module_1 (
    output tri0 id_0,
    input uwire id_1,
    output wor id_2,
    output logic id_3,
    input supply1 id_4,
    output tri id_5,
    output supply1 id_6,
    input wand id_7,
    input tri0 id_8,
    input wand id_9,
    input wire id_10,
    output wor id_11,
    output tri0 id_12
);
  module_0(
      id_11,
      id_7,
      id_6,
      id_7,
      id_11,
      id_12,
      id_7,
      id_10,
      id_10,
      id_5,
      id_5,
      id_0,
      id_6,
      id_8,
      id_8,
      id_12,
      id_7
  );
  assign id_0 = (1 > id_4);
  supply1 id_14;
  reg id_15;
  tri id_16 = id_14;
  always @(posedge 1 or posedge 1) id_3 = #1 id_15;
  xnor (id_2, id_10, id_8, id_4);
  always_latch @(posedge id_14 ^ id_15 or posedge 1'h0) id_6 = id_1;
endmodule
