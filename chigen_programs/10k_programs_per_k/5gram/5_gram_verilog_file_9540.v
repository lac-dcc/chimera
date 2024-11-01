// Seed: 1654300478
module module_0 (
    input wor   id_0,
    input wor   id_1,
    input uwire id_2,
    input uwire id_3,
    input uwire id_4,
    input tri   id_5
);
  assign id_7 = id_1;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    output supply1 id_2,
    input wand id_3,
    output supply1 id_4,
    output supply0 id_5,
    input tri id_6,
    input wor id_7
);
  always_latch @(id_6, posedge 1 == 1'b0) id_4 = 1;
  module_0(
      id_7, id_0, id_6, id_0, id_6, id_6
  ); id_9(
      .id_0(id_6 == id_0), .id_1(id_2)
  );
endmodule
