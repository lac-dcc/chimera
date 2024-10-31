// Seed: 264425781
module module_0 (
    output wire id_0,
    output uwire id_1,
    input uwire id_2,
    output uwire id_3,
    input tri0 id_4,
    input tri1 id_5,
    input tri0 id_6,
    input uwire id_7,
    input wor id_8,
    output tri0 id_9,
    input wor id_10,
    input uwire id_11,
    output tri1 id_12,
    output wor id_13,
    input supply0 id_14,
    output wand id_15
);
  assign id_13 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    output wire id_1,
    input wor id_2,
    input wor id_3,
    input supply1 id_4,
    input tri0 id_5,
    input wor id_6,
    input tri1 id_7,
    input uwire id_8,
    input supply1 id_9,
    input wor id_10,
    input tri id_11,
    input tri0 id_12,
    output logic id_13,
    input uwire id_14,
    output wor id_15,
    input uwire id_16,
    input tri id_17
);
  id_19 :
  assert property (@(posedge 1 or id_9) id_4) begin
    for (id_13 = 1; 1; id_1.id_16 = 1) id_13 <= 1;
  end
  int id_20 = id_19;
  always id_19 = id_17;
  wire id_21;
  wire id_22;
  module_0(
      id_20,
      id_1,
      id_20,
      id_19,
      id_9,
      id_2,
      id_4,
      id_11,
      id_17,
      id_20,
      id_9,
      id_8,
      id_20,
      id_19,
      id_8,
      id_15
  );
endmodule
