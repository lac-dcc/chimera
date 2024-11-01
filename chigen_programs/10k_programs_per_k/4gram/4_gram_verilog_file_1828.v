// Seed: 1318755640
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
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  id_7(
      .sum(1), .id_0(1), .id_1(id_4)
  );
  wire id_8;
  id_9(
      .id_0(1), .id_1(1'b0), .id_2(1'b0), .id_3(1), .id_4(1), .id_5(id_5), .id_6(id_2)
  );
endmodule
module module_1 #(
    parameter id_6 = 32'd79,
    parameter id_7 = 32'd61
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  defparam id_6.id_7 = id_2; module_0(
      id_1, id_3, id_5, id_1, id_3, id_1
  );
endmodule
