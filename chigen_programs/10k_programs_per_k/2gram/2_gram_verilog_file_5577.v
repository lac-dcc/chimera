// Seed: 1643594956
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always id_2 = #id_5 id_2 - 1'b0;
  wire id_6;
  id_7(
      .id_0(1), .id_1(1), .id_2(id_5), .id_3(1), .id_4(id_6)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_10;
  module_0(
      id_2, id_6, id_10, id_9
  );
  wire id_11;
  always begin
    id_9 = 1;
    id_6 <= 1 - 1;
    assume (1);
  end
endmodule
