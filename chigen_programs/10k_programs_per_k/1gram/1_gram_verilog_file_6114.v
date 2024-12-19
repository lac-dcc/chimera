// Seed: 1591044705
module module_0 (
    input tri1 id_0,
    input wand id_1,
    output uwire id_2,
    output wire id_3,
    input supply0 id_4,
    output tri0 id_5,
    input supply1 id_6,
    output uwire id_7,
    output wor id_8,
    input tri0 id_9
);
  assign id_3 = 1;
  assign module_1.type_16 = 0;
endmodule
module module_1 (
    output tri id_0,
    inout tri id_1,
    output supply1 id_2,
    input wire id_3,
    output logic id_4,
    input wire id_5,
    output tri1 id_6
);
  supply1 id_8 = 1;
  assign id_0 = 1;
  always id_4 <= "";
  tri1 id_9;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_0,
      id_5,
      id_1,
      id_5,
      id_1,
      id_0,
      id_8
  );
  tri id_10, id_11;
  assign id_10.id_9 = 1;
  assign id_2 = id_8;
  supply0 id_12;
  assign id_10 = id_9;
  assign id_12 = id_9;
  id_13(
      .id_0(id_6 || 1),
      .id_1(id_12),
      .id_2(id_3),
      .id_3(1),
      .id_4("" == 1'b0),
      .id_5({1{1'b0}}),
      .id_6(id_4),
      .id_7(id_4 ? 1 : {1{id_5}}),
      .id_8(id_1)
  );
  wire id_14;
  always
    if (id_12) #1 id_12 = id_12;
    else $display(1'b0, 1);
endmodule
