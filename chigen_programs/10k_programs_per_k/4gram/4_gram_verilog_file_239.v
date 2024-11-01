// Seed: 2858326383
module module_0 (
    input tri1 id_0,
    output supply1 id_1,
    input uwire id_2,
    output wor id_3,
    input tri0 id_4,
    input uwire id_5,
    input tri id_6
    , id_11, id_12,
    input wor id_7,
    input wor id_8,
    input wor id_9
);
  wire id_13;
endmodule
module module_1 (
    output wor id_0,
    input supply0 id_1,
    output wire id_2,
    output logic id_3,
    input wand id_4,
    input tri id_5,
    output uwire id_6,
    input supply1 id_7,
    input wand id_8,
    input supply1 id_9,
    input supply0 id_10
);
  assign id_6 = 1'b0 ? id_7 : id_5;
  supply1 id_12;
  module_0(
      id_10, id_0, id_8, id_6, id_1, id_5, id_5, id_7, id_1, id_8
  );
  always_comb #1 begin
    id_3 <= id_10 & id_4;
    force id_2 = 1;
  end
  initial begin
    assert (id_1);
  end
  nor (id_0, id_8, id_7, id_12, id_1, id_10, id_9, id_4, id_5);
  integer id_13;
  assign id_12 = 1;
endmodule
