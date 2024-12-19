// Seed: 1762178218
module module_0 ();
  wire id_1, id_2;
endmodule
module module_1 #(
    parameter id_20 = 32'd27,
    parameter id_21 = 32'd90
) (
    output logic id_0,
    input supply0 id_1,
    input supply1 id_2,
    input logic id_3,
    input wor id_4,
    input wire id_5,
    input wand id_6
);
  integer id_8 (id_0);
  nor primCall (
      id_0,
      id_1,
      id_10,
      id_11,
      id_12,
      id_13,
      id_14,
      id_15,
      id_16,
      id_17,
      id_18,
      id_2,
      id_3,
      id_4,
      id_5,
      id_6,
      id_8,
      id_9
  );
  wire id_9, id_10;
  assign id_0 = id_3;
  reg id_11, id_12;
  id_13(
      1, 1
  );
  wire id_14;
  reg  id_15 = id_12;
  id_16(
      1'b0, 1 - id_1, id_3, 1
  );
  initial id_0 <= id_15;
  wire id_17, id_18;
  module_0 modCall_1 ();
  wand id_19;
  defparam id_20 = id_19, id_21 = 1;
endmodule
