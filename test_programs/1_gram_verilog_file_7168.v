// Seed: 2990777533
module module_0;
  reg id_2;
  assign id_1 = 1;
  always
  fork
    id_1 <= id_2;
  join
  initial begin : LABEL_0
    if (id_2 | "") id_1 = id_2;
    id_1 -= id_2;
    id_1 <= -1;
  end
  assign id_1 = ~id_2;
  reg id_3, id_4;
  assign id_1 = id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  id_7(
      .id_0(-1), .id_1(1), .id_2(id_1), .id_3(id_2)
  );
  module_0 modCall_1 ();
endmodule
