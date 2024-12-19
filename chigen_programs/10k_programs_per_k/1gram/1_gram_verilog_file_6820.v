// Seed: 3629005306
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  int id_4;
  assign id_4 = id_1;
  wire id_5;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    output wire id_1,
    output wand id_2,
    input  wire id_3,
    output tri1 id_4
);
  wire id_6;
  wire id_7;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_7
  );
  always id_2 = 1;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
  reg id_5, id_6, id_7;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4
  );
  reg id_8;
  id_9 :
  assert property (@(posedge 1 or id_5) 1) begin : LABEL_0
    id_2 <= 1;
    $display(1);
    id_6 = id_8;
    $display(id_2);
    id_1 <= 1;
    id_3[1] <= id_8;
    id_5 <= 1;
  end
endmodule
