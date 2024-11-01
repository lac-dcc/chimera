// Seed: 3715352442
module module_0 (
    input wand id_0,
    input wand id_1,
    input uwire id_2
    , id_11,
    input uwire id_3,
    input wire id_4,
    input supply0 id_5,
    input wire id_6,
    output uwire id_7,
    input tri0 id_8,
    input wor id_9
);
  always disable id_12;
endmodule
module module_1 (
    input wor id_0,
    input uwire id_1,
    output uwire id_2,
    input wand id_3,
    input supply0 id_4,
    input tri1 id_5,
    input tri0 id_6,
    input tri id_7,
    output logic id_8,
    input wire id_9,
    input uwire id_10
);
  always_latch @(posedge id_4) id_8 = new[1'b0];
  module_0(
      id_0, id_7, id_1, id_9, id_7, id_1, id_10, id_2, id_3, id_10
  );
endmodule
