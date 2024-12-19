// Seed: 584852443
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  tri1 id_10;
  specify
    (id_11 => id_12) = ({id_1{~(1)}} : id_6  : id_5 - 1, 1'b0 : id_6  : id_1);
  endspecify
  always_ff begin : LABEL_0
    id_5 <= id_10++ ? 1 : id_7;
  end
endmodule
module module_1 (
    input supply0 id_0
);
  reg id_2 = id_2;
  initial id_2 <= id_2;
  wire id_3;
  wire id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_2,
      id_4,
      id_2,
      id_4,
      id_3
  );
endmodule
