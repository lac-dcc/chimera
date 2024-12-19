// Seed: 1503100915
module module_0 (
    input tri id_0,
    output wor id_1,
    input uwire id_2,
    output wor id_3,
    output uwire id_4,
    output uwire id_5,
    input tri id_6,
    input supply0 id_7,
    input uwire id_8,
    input wand id_9,
    input supply0 id_10,
    output supply0 id_11,
    input supply1 id_12,
    output supply0 id_13,
    output tri0 id_14
);
  wire id_16;
  id_17(
      .id_0(1), .id_1(""), .id_2(1), .id_3(1)
  );
endmodule
module module_1 (
    output wor   id_0,
    input  uwire id_1,
    output wor   id_2,
    input  tri   id_3,
    output logic id_4,
    input  logic id_5,
    output logic id_6
);
  assign id_4 = id_5;
  always @(posedge id_1) id_6 <= id_5;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_2,
      id_2,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_3,
      id_2,
      id_1,
      id_0,
      id_2
  );
  assign modCall_1.id_11 = 0;
  assign id_4 = 1'b0;
endmodule
