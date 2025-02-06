// Seed: 2272581259
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
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  nmos (1, 1, -1, $realtime, $realtime);
  id_8(
      .id_0(!id_1), .id_1($realtime)
  );
  wire id_9;
endmodule
module module_1 #(
    parameter id_6 = 32'd79,
    parameter id_7 = 32'd10
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  defparam id_6.id_7 = $realtime;
  wire id_8;
  module_0 modCall_1 (
      id_8,
      id_1,
      id_4,
      id_1,
      id_1,
      id_5,
      id_8
  );
endmodule
