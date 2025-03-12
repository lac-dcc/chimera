// Seed: 4091285506
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always #1 begin : LABEL_0
    $unsigned(13);
    ;
  end
endmodule
module module_1 #(
    parameter id_12 = 32'd50,
    parameter id_4  = 32'd57
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input logic [7:0] id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  module_0 modCall_1 (
      id_8,
      id_2,
      id_8,
      id_9
  );
  output wire id_5;
  input wire _id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_11;
  wire _id_12;
  ;
  assign id_8 = id_10[id_4==id_12];
endmodule
