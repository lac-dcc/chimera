// Seed: 3621833938
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
endmodule
module module_1;
  uwire id_2;
  id_4(
      .id_0(1), .id_1(1), .id_2(id_2)
  ); specify
    (id_5 => id_6) = (id_2  : id_3 == id_6  : 1, 1  : id_6  : 1);
    (posedge id_7 => (id_8 +: 1)) = (id_5, 1);
    (negedge id_9 => (id_10 -: id_8)) = (1, 1);
  endspecify
  module_0 modCall_1 (
      id_9,
      id_7,
      id_7,
      id_10,
      id_8,
      id_6,
      id_7
  );
endmodule
