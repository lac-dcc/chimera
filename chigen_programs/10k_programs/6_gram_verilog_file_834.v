// Seed: 2088023444
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_5[1'b0] = id_4;
endmodule : id_7
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  id_7(
      .id_0(1), .id_1(id_3[1]), .id_2(id_4), .id_3(id_5), .id_4(id_2), .id_5(1), .id_6(1)
  );
  and (id_1, id_3, id_2, id_7, id_5);
  module_0(
      id_5, id_2, id_6, id_2, id_3, id_2
  );
endmodule
