// Seed: 1460059364
module module_0 (
    output tri1  id_0,
    output uwire id_1
);
  wire id_4;
  assign id_0 = 1;
  module_2 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_3 = 0;
  wor id_5;
  integer id_6;
  assign id_5 = 1;
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    output uwire id_2,
    input tri1 id_3,
    input uwire id_4,
    input tri1 id_5,
    output supply1 id_6
);
  always force id_2 = 1;
  module_0 modCall_1 (
      id_6,
      id_2
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_4 = id_3;
  uwire id_6;
  assign id_6 = id_2;
  assign id_6 = 1 - id_2;
  assign id_4 = 1 - (|id_1);
  id_7(
      .id_0(id_4), .id_1(1'b0), .id_2(1)
  );
  wire id_8;
  assign id_6 = id_1 == id_3;
  timeprecision 1ps; id_9(
      1, id_6
  );
endmodule
