// Seed: 336876765
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
  input wire id_3;
  output wire id_2;
  output wire id_1;
  id_7(
      .id_0(id_6), .id_1(1'b0), .id_2(1), .id_3(id_3)
  );
  assign id_1 = 1;
  assign id_6 = 1 + id_6;
  wire id_8;
endmodule
module module_1 (
    output supply1 id_0,
    input tri id_1,
    input supply0 id_2
);
  wire id_4;
  wire id_5;
  specify
    (id_6 => id_7) = (1);
    (id_8 *> id_9) = 1;
  endspecify
  module_0 modCall_1 (
      id_4,
      id_9,
      id_5,
      id_9,
      id_6,
      id_4
  );
  assign modCall_1.id_6 = 0;
endmodule
