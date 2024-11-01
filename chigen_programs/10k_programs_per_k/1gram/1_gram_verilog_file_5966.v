// Seed: 601311230
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    input wire id_2,
    input wire id_3,
    output uwire id_4,
    input supply0 id_5,
    input wand id_6,
    output tri0 id_7,
    output tri0 id_8,
    input wor id_9,
    input supply0 id_10,
    output tri id_11
);
  wire id_13, id_14;
  tri id_15;
  id_16 :
  assert property (@((id_3 == id_2)) id_5) $display;
  assign id_15 = id_5.id_2;
  wire id_17;
  wire id_18, id_19;
  assign id_16 = id_10;
endmodule
module module_1 (
    output uwire id_0,
    input wor id_1,
    input supply1 id_2,
    output logic id_3,
    input tri1 id_4,
    output logic id_5,
    input wor id_6,
    input supply1 id_7,
    output tri id_8,
    input wor id_9,
    input tri id_10,
    input tri1 id_11,
    input tri1 id_12,
    input wor id_13,
    input supply1 id_14,
    input wor id_15
);
  assign id_8 = id_7;
  initial id_3 <= id_14 + 1;
  id_17(
      id_0, 1
  );
  wire id_18;
  for (id_19 = id_7; 1; id_8 = 1) always id_5 <= 'b0;
  module_0(
      id_4, id_10, id_6, id_9, id_0, id_6, id_4, id_19, id_19, id_2, id_14, id_19
  );
endmodule
