// Seed: 3293788534
module module_0 (
    input tri0 id_0,
    input tri1 id_1
);
  assign module_1.type_4 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input tri id_1,
    input tri id_2,
    input wor id_3,
    input tri0 id_4 id_9,
    output tri0 id_5,
    output tri0 id_6,
    input uwire id_7
);
  id_10(
      id_1
  );
  module_0 modCall_1 (
      id_1,
      id_0
  );
  wire id_11;
endmodule
module module_2 (
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
    id_18
);
  input wire id_18;
  output wire id_17;
  output wire id_16;
  inout wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  if (-1'd0) assign id_15 = 1;
  assign module_3.id_5 = 0;
endmodule
macromodule module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_2 = id_4;
  assign id_3 = 1 == id_4;
  id_6(
      id_3
  );
  parameter id_7 = -1;
  for (id_8 = 1; id_1; id_5 = id_5) begin : LABEL_0
    wor id_9 = id_8, id_10 = id_5;
  end
  wire id_11;
  parameter id_12 = 1 == id_5;
  module_2 modCall_1 (
      id_11,
      id_11,
      id_8,
      id_5,
      id_10,
      id_5,
      id_5,
      id_7,
      id_12,
      id_1,
      id_1,
      id_10,
      id_5,
      id_7,
      id_11,
      id_1,
      id_5,
      id_8
  );
  wire id_13;
  wire id_14;
  wire id_15;
  assign id_8 = -1;
endmodule
