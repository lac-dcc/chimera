// Seed: 2938874827
module module_0 (
    output wire id_0
);
  assign id_0 = -1 ^ 1;
  assign module_1.type_4 = 0;
  wire id_2, id_3;
endmodule
module module_1 (
    input wire id_0,
    output supply1 id_1,
    input tri id_2,
    output wire id_3,
    output tri1 id_4,
    output supply1 id_5,
    output tri1 id_6,
    output tri id_7,
    id_10,
    input tri id_8
);
  wire id_11, id_12;
  module_0 modCall_1 (id_10);
  wire id_13, id_14, id_15;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_5;
endmodule
module module_3 (
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
    id_11
);
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  parameter id_12 = 1;
  always begin : LABEL_0
    id_1 <= id_7.id_11;
    fork
      id_5 <= id_9;
      id_2 <= id_7;
    join_any
    begin : LABEL_0
      id_5 <= -1'b0;
      id_8 = 1;
      if (1)
        if ($display(1));
        else id_2 = -1;
      else $display(-1);
    end
  end
  module_2 modCall_1 (
      id_8,
      id_12,
      id_8,
      id_8
  );
endmodule
