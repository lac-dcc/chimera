// Seed: 882671913
module module_0 #(
    parameter id_6 = 32'd80
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  uwire [1 : 1] id_5;
  parameter id_6 = 1;
  wire [-1 : id_6] id_7;
  assign id_5 = -1;
endmodule
module module_1 #(
    parameter id_12 = 32'd30
) (
    output logic id_0,
    input tri id_1,
    output logic id_2,
    output supply0 id_3,
    input uwire id_4,
    input tri id_5,
    input supply1 id_6,
    input wire id_7,
    output logic id_8,
    output wire id_9,
    input tri1 id_10,
    input supply1 id_11,
    input tri1 _id_12,
    output tri id_13
);
  always_ff @(*)
    if (1) begin : LABEL_0
      $unsigned(3);
      ;
      id_8 <= id_10;
      id_2 <= id_11;
    end else id_0 <= 1;
  wand id_15;
  assign id_15 = 1;
  assign id_2  = id_5;
  xor primCall (id_3, id_5, id_1, id_16, id_7, id_10);
  time [(  -1  ) : id_12] id_16;
  ;
  module_0 modCall_1 (
      id_15,
      id_16,
      id_16,
      id_15
  );
endmodule
