// Seed: 2499070930
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_5 = 1;
  assign id_3 = id_5;
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  always
    id_2 = id_3#(
        .id_3(1),
        .id_5(id_5),
        .id_5(1)
    );
  module_0(
      id_4, id_2, id_1, id_3, id_4, id_1
  );
endmodule
