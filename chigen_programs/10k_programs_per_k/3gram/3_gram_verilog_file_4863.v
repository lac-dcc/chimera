// Seed: 4252486405
module module_0 (
    input supply1 id_0,
    input supply0 id_1,
    output supply1 id_2,
    input wand id_3,
    input supply0 id_4,
    output supply1 id_5,
    input tri id_6,
    input wor id_7,
    input wor id_8,
    output wire id_9,
    input wand id_10,
    input tri id_11,
    input uwire id_12,
    input uwire id_13,
    output wor id_14,
    output wor id_15,
    output uwire id_16,
    output tri1 id_17,
    input tri id_18,
    input wand id_19,
    input supply1 id_20,
    output wand id_21
);
  always @(posedge id_12) begin
    id_17 = 1;
  end
  wire id_23 = 1;
endmodule
module module_1 (
    input tri0 id_0,
    input uwire id_1,
    output logic id_2,
    input tri id_3,
    input wor id_4,
    output supply1 id_5,
    input tri id_6,
    input wand id_7
);
  always @(!id_4 or 1) begin
    id_2 <= 1;
  end
  module_0(
      id_7,
      id_0,
      id_5,
      id_0,
      id_6,
      id_5,
      id_1,
      id_6,
      id_3,
      id_5,
      id_0,
      id_7,
      id_6,
      id_3,
      id_5,
      id_5,
      id_5,
      id_5,
      id_3,
      id_6,
      id_4,
      id_5
  ); id_9(
      .id_0(id_6), .id_1(id_1)
  );
  wire id_10;
endmodule
