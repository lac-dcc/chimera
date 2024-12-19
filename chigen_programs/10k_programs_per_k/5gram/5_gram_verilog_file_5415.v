// Seed: 3231911036
module module_0 (
    output uwire id_0,
    input uwire id_1,
    input supply1 id_2,
    input tri0 id_3,
    input wand id_4
);
  wire id_6 = id_6;
  integer id_7;
  assign id_6 = 1'd0;
endmodule
module module_1 (
    output supply1 id_0,
    input tri0 id_1,
    output wire id_2,
    output wire id_3,
    input wire id_4,
    input wor id_5,
    output supply1 id_6,
    input tri1 id_7,
    input tri id_8,
    output wire id_9,
    input wire id_10,
    input tri1 id_11,
    input tri id_12,
    output tri0 id_13,
    input tri id_14
);
  assign id_0 = id_4 == 1;
  and primCall (id_9, id_4, id_1, id_10, id_5, id_12, id_8, id_11, id_7, id_14);
  always #1 begin : LABEL_0
    wait (1);
  end
  module_0 modCall_1 (
      id_0,
      id_11,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.type_9 = 0;
  assign id_9 = id_5;
endmodule
