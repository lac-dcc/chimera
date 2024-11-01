// Seed: 1837908914
macromodule module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22
);
  input wire id_22;
  input wire id_21;
  output wire id_20;
  output wire id_19;
  output wire id_18;
  output wire id_17;
  input wire id_16;
  input wire id_15;
  input wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_23 = id_21;
  assign id_18 = 1;
endmodule
module module_1 #(
    parameter id_4 = 32'd91,
    parameter id_5 = 32'd10,
    parameter id_8 = 32'd18
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    _id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    id_10,
    id_11
);
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire _id_8;
  inout wire id_7;
  inout wire id_6;
  input wire _id_5;
  inout wire _id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  always #1 id_2[1] = 1;
  assign id_1 = 1;
  module_0(
      id_9,
      id_6,
      id_6,
      id_1,
      id_7,
      id_7,
      id_6,
      id_7,
      id_7,
      id_6,
      id_7,
      id_9,
      id_6,
      id_9,
      id_11,
      id_11,
      id_1,
      id_9,
      id_9,
      id_7,
      id_7,
      id_7
  );
  always assign id_2[id_4-1'b0==id_5[id_8] : id_5] = 1;
  nor (id_2, id_7, id_6, id_11, id_9);
endmodule
