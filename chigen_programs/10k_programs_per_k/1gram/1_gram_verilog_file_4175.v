// Seed: 4250115633
module module_0 ();
  wire id_1;
endmodule
module module_1 #(
    parameter id_10 = 32'd26,
    parameter id_11 = 32'd91,
    parameter id_12 = 32'd80,
    parameter id_13 = 32'd56
) (
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
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  defparam id_10 = id_3, id_11 = id_11, id_12 = 1, id_13 = 1'd0;
  assign id_6 = {1 - 1, id_1};
  wire id_14;
  supply1 id_15 = 1;
  wire id_16;
  nor primCall (
      id_1, id_10, id_11, id_12, id_13, id_14, id_15, id_16, id_17, id_2, id_3, id_8, id_9
  );
  wire id_17;
  assign id_7[1'b0 : 1] = 1;
  module_0 modCall_1 ();
  assign id_13 = id_13;
  integer id_18;
  assign id_1 = 1;
  id_19(
      .id_0(1), .id_1(id_8), .id_2(1)
  );
  wire id_20 = 1;
endmodule
