// Seed: 2397144778
module module_0 (
    output wire id_0
);
  wire id_2, id_3;
  wire id_4;
endmodule
module module_1 (
    input wire id_0,
    input wand id_1,
    output logic id_2,
    input wor id_3,
    output tri id_4,
    output supply0 id_5
    , id_9,
    input supply1 id_6,
    input wand id_7
);
  wire id_10, id_11, id_12;
  id_13(
      .id_0(1), .id_1(id_6), .id_2(1), .id_3(1), .id_4(id_9), .id_5("")
  );
  module_0 modCall_1 (id_5);
  assign modCall_1.id_0 = 0;
  reg id_14, id_15;
  id_16 :
  assert property (@(posedge id_15) 1 && id_9) id_2 <= 1;
  always id_9 <= id_16;
endmodule
