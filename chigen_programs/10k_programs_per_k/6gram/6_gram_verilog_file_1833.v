// Seed: 2223397524
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_9;
  assign id_2 = id_4;
  wire id_10;
  wire id_11;
  wire id_12;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  specify
    (id_4 => id_5) = ({1} : 1  : 1);
    (negedge id_6 => (id_7 +: id_4)) = (id_3, id_5);
  endspecify
  module_0 modCall_1 (
      id_4,
      id_6,
      id_7,
      id_3,
      id_6,
      id_4,
      id_6,
      id_2
  );
endmodule
