// Seed: 1865241923
module module_0 (
    input tri id_0,
    input wor id_1,
    input uwire id_2,
    input tri id_3,
    input supply0 id_4,
    input uwire id_5
    , id_13,
    input wand id_6,
    input wor id_7,
    input uwire id_8,
    input uwire id_9,
    output tri id_10,
    output supply1 id_11
);
  assign id_13[-1] = id_3;
  real id_14;
  timeprecision 1ps;
  assign module_1.id_15 = 0;
endmodule
module module_1 #(
    parameter id_3 = 32'd80,
    parameter id_4 = 32'd56,
    parameter id_6 = 32'd73,
    parameter id_7 = 32'd62
) (
    output wor id_0,
    input supply0 id_1,
    input supply0 id_2,
    input supply1 _id_3,
    input wire _id_4,
    output supply1 id_5
    , id_12,
    input wor _id_6,
    input tri0 _id_7,
    input uwire id_8,
    input wand id_9,
    output tri1 id_10
);
  wire id_13;
  wire [id_7 : id_3] id_14;
  supply0 [id_6 : id_4] id_15;
  timeunit 1ps;
  generate
    if (1 && (-1 && 1)) begin : LABEL_0
      assign id_12 = id_7;
      assign id_15 = 1;
    end else begin : LABEL_1
      wire id_16;
    end
  endgenerate
  module_0 modCall_1 (
      id_9,
      id_2,
      id_1,
      id_9,
      id_9,
      id_1,
      id_8,
      id_8,
      id_9,
      id_2,
      id_10,
      id_10
  );
endmodule
