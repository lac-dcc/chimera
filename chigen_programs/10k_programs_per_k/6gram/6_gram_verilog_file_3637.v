// Seed: 1800620258
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_4 = id_3 > id_1 ? 1 : 1;
endmodule
module module_1 #(
    parameter id_10 = 32'd50,
    parameter id_9  = 32'd96
) (
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
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  id_8(
      .id_0(id_1 + id_7), .id_1(1), .id_2(1'b0)
  );
  nor primCall (id_7, id_6, id_8, id_3, id_1);
  assign id_6 = id_8;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_5,
      id_7,
      id_7,
      id_7
  );
  defparam id_9.id_10 = id_3;
endmodule
