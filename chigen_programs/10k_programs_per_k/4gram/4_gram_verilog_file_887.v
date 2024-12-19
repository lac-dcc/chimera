// Seed: 1686878805
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_8;
  wire id_9;
  module_2 modCall_1 ();
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  wand id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
endmodule
module module_2;
  reg id_1;
  reg id_2 = id_2;
  reg id_3;
  tri id_4;
  reg id_5;
  assign id_2 = id_5;
  assign id_4 = id_5 ^ id_4 ? 1 : id_4;
  assign id_1 = 1;
  always #1 begin : LABEL_0
    begin : LABEL_0
      assume #1  (id_4) $display(id_3);
    end
    id_2 <= 1;
    id_1 <= |id_4;
    id_5 <= id_3;
    id_5 <= 1;
  end
  assign id_4 = 1;
endmodule
