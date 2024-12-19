// Seed: 4242627321
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_7;
  module_2 modCall_1 (
      id_4,
      id_6
  );
endmodule
module module_1 (
    id_1
);
  output wire id_1;
  always id_1 = 1 - id_2;
  wire id_3;
  wire id_4, id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_5
  );
endmodule
module module_2 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  id_3(
      .id_0(id_1), .id_1(id_4 - id_5), .id_2(id_4), .id_3(id_4)
  );
  supply0 id_6;
  id_7 :
  assert property (@(id_2) 1)
  else;
  wire id_8;
endmodule
