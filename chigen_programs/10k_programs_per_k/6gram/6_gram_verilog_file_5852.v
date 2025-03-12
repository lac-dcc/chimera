// Seed: 3487289248
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  bufif1 primCall (id_1, id_4, id_6);
  output wire id_1;
  assign id_1 = id_6;
  module_2 modCall_1 ();
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_5,
      id_4,
      id_3
  );
endmodule
module module_2;
  reg id_1;
  always #1
    if ((1 > "") - 1) id_1 <= -1;
    else if (1) id_1 <= id_1;
    else begin : LABEL_0
      wait (-1);
    end
endmodule
