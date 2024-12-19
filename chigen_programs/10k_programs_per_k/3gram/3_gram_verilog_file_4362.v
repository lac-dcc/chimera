// Seed: 293755224
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  assign id_2 = !id_3;
endmodule
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
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  id_7(
      .id_0(), .id_1(1), .id_2(1), .id_3(1), .id_4(id_4[1'b0-:1]), .id_5(1'b0)
  );
  nor primCall (id_6, id_3, id_5, id_1, id_4, id_7);
  module_0 modCall_1 (
      id_6,
      id_6
  );
  assign id_2[1'b0] = id_1;
endmodule
