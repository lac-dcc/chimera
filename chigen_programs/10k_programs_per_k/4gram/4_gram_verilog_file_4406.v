// Seed: 1133479185
module module_0 (
    input supply1 id_0,
    input uwire id_1,
    input supply0 id_2,
    output tri0 id_3,
    output supply1 id_4
);
  wire id_6;
  assign module_1.type_8 = 0;
  always
    if ("") begin : LABEL_0
      deassign id_3;
    end
  id_7(
      .id_0(id_3), .id_1(id_6), .id_2(1), .id_3(1)
  );
endmodule
module module_1 (
    input wire id_0,
    input tri  id_1
);
  assign id_3 = 1;
  assign id_3 = id_0;
  wire id_5;
  wire id_6;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_3,
      id_3,
      id_3
  );
  wire id_7;
endmodule
