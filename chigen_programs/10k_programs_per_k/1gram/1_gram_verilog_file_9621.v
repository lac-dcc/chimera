// Seed: 316298304
module module_0 (
    output tri0 id_0,
    output tri  id_1,
    output wor  id_2,
    input  tri  id_3
);
  assign module_1.id_3 = 0;
  localparam id_5 = 1;
endmodule
module module_1 (
    input tri id_0,
    input supply0 id_1,
    input uwire id_2,
    output supply1 id_3
);
  assign id_3 = -1'h0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_2
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_8, id_9, id_10;
  assign module_3.id_2 = 0;
  tri id_11;
  specify
    (id_12 => id_13) = (~-1 == 1, id_12, id_6);
    (id_14 => id_15) = (id_8);
  endspecify
  assign id_11 = -1;
  wire id_16, id_17;
endmodule
module module_3 #(
    parameter id_5 = 32'd6,
    parameter id_6 = 32'd40
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5
);
  inout wire _id_5;
  inout supply0 id_4;
  input wire id_3;
  inout wand id_2;
  input wire id_1;
  wire _id_6, id_7;
  wire [id_6  &  id_5 : id_5] id_8;
  module_2 modCall_1 (
      id_4,
      id_8,
      id_4,
      id_2,
      id_2,
      id_4,
      id_7
  );
  wire id_9;
  assign id_2.id_4 = id_5 - id_7;
endmodule
