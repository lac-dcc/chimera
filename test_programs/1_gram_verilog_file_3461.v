// Seed: 683698198
module module_0 (
    input supply0 id_0,
    output wire id_1,
    output uwire id_2,
    output supply1 id_3,
    input tri id_4,
    input tri id_5,
    output supply1 id_6,
    id_14,
    input tri0 id_7,
    input wand id_8,
    input wire id_9,
    input wor id_10,
    input uwire id_11,
    output wire id_12
);
  assign id_1 = -1;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    output tri1  id_1,
    output logic id_2,
    input  tri1  id_3,
    output tri0  id_4
);
  id_6(
      .id_0(id_4), .id_1(1), .id_2(1)
  );
  if ((id_0) == ((id_3))) assign id_4 = 1;
  else initial id_2 <= -1;
  assign id_1 = id_3;
  wand id_7, id_8 = -1;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_4,
      id_1,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3,
      id_0,
      id_0,
      id_1
  );
endmodule
