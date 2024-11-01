// Seed: 144610264
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_5;
endmodule
module module_1 #(
    parameter id_14 = 32'd55,
    parameter id_15 = 32'd4
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_9 = 1 <-> id_10;
  module_0(
      id_2, id_6, id_5, id_9
  );
  always begin
    fork : id_11
      do #1 disable id_12; while (1);
      assume (id_9);
    join_any
  end
  wire id_13;
  defparam id_14.id_15 = 1 >> id_7;
endmodule
