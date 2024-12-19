// Seed: 698770673
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_4;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wor id_6;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_3
  );
  id_7(
      .id_0(id_5), .id_1(1), .id_2(1), .id_3(id_3), .id_4(1), .id_5({id_3{1 !== id_2}})
  );
  always
  fork
    id_4 <= 1'h0 ? id_5#(.id_6(id_6)) : (id_2 & 1);
  join_any
  id_8(
      1
  );
endmodule
