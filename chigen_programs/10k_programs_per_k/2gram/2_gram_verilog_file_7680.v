// Seed: 1866369316
module module_0 (
    input wor id_0,
    input tri id_1,
    output supply0 id_2,
    output tri id_3,
    input tri1 id_4,
    output wire id_5
    , id_10,
    input tri1 id_6,
    input wand id_7,
    output tri id_8
);
  wire id_11;
  ;
  wire [1 : -1] id_12;
  wire id_13;
  parameter id_14 = 1;
  wire id_15;
  ;
endmodule
module module_1 (
    output wire id_0,
    input wire id_1,
    input wire id_2,
    input supply1 id_3,
    input tri1 id_4,
    input wand id_5,
    input wire id_6,
    output supply0 id_7,
    input uwire id_8,
    input tri0 id_9,
    output tri id_10,
    output logic id_11
);
  assign id_0 = id_1;
  always begin : LABEL_0
    id_11 <= id_8;
  end
  module_0 modCall_1 (
      id_5,
      id_4,
      id_10,
      id_0,
      id_6,
      id_7,
      id_5,
      id_9,
      id_10
  );
  assign modCall_1.id_8 = 0;
endmodule
