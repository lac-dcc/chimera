// Seed: 1576958926
module module_0;
  timeunit 1ps;
  wire id_1;
  assign module_1.type_6 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  tri0 id_5 = 1;
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4#(
        .id_5(1'h0 < id_5++),
        .id_6(id_4),
        .id_7(1 == ""),
        .id_8(1)
    ),
    id_9
);
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  always begin : LABEL_0
    #1;
  end
  initial begin : LABEL_0
    id_6 <= 1;
  end
  assign module_3.id_10 = 0;
  wire id_10;
endmodule
module module_3 #(
    parameter id_10 = 32'd73,
    parameter id_11 = 32'd47
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  if ((id_8)) assign id_6 = id_7;
  if (id_1) begin : LABEL_0
    wor id_9 = id_3 + 1;
  end else begin : LABEL_0
    defparam id_10.id_11 = id_8;
  end
  module_2 modCall_1 (
      id_3,
      id_7,
      id_7,
      id_8,
      id_7
  );
  assign id_7 = 1 == 1'h0;
  wire id_12;
endmodule
