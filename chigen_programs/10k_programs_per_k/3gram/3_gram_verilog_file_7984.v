// Seed: 851477062
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_4;
endmodule
module module_1 ();
  wire id_2, id_3, id_4, id_5;
  module_0(
      id_4, id_4, id_5
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_5;
  module_0(
      id_5, id_5, id_5
  );
  wire id_6;
endmodule
module module_3 #(
    parameter id_6 = 32'd47,
    parameter id_7 = 32'd7
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  logic [7:0] id_5;
  defparam id_6.id_7 = 1; module_0(
      id_4, id_2, id_2
  );
  logic [7:0] id_8 = id_5[1];
  id_9(
      .id_0(id_7), .id_1(1)
  );
  assign id_8[1-1] = id_4;
  or (id_1, id_4, id_2, id_3);
endmodule
