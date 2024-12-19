// Seed: 69646601
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3 = 1 ? ~id_5 : 1;
  assign module_2.type_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
  tri id_4 = 1'b0;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_3 = 0;
endmodule
module module_2 (
    inout tri1  id_0,
    input uwire id_1,
    input wand  id_2
);
  wire id_4;
  id_5 :
  assert property (@(posedge 1) ~id_0#(.id_1(1)))
  else $display(1 == id_2 + 1, id_5 < 1, ~id_0 ==? 1);
  assign id_4 = id_0;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5
  );
endmodule
