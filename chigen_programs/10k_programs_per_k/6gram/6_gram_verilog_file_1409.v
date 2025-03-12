// Seed: 331733304
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    output supply0 id_2,
    input tri1 id_3,
    input supply0 id_4,
    output supply1 id_5
);
endmodule
module module_1 (
    input tri1 id_0,
    output tri0 id_1,
    input uwire id_2,
    input tri1 id_3,
    input wor id_4,
    output supply0 id_5
);
  event id_7;
  ;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_5,
      id_2,
      id_3,
      id_1
  );
endmodule
module module_1 #(
    parameter id_11 = 32'd58,
    parameter id_12 = 32'd68
) (
    output logic id_0,
    output tri0 id_1,
    input wire id_2,
    input uwire id_3,
    input tri0 id_4,
    input wand id_5,
    output tri0 id_6,
    output supply0 id_7,
    input supply1 id_8,
    input tri1 id_9,
    output uwire id_10,
    input wire _id_11,
    input supply1 _id_12,
    output tri0 id_13,
    input wor id_14,
    input tri0 id_15
    , id_18,
    output logic id_16
);
  assign id_1 = id_4;
  wire id_19;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_6,
      id_5,
      id_4,
      id_7
  );
  logic [id_12 : id_11] id_20;
  ;
  wire module_2;
  initial begin : LABEL_0
    id_18 = id_12;
    id_0  = #1 id_4;
    id_16 <= 1 | -1 | -1;
  end
endmodule
