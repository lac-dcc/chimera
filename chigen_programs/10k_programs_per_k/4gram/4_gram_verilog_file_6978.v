// Seed: 4252222951
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  id_7 :
  assert property (@(posedge id_7) 1)
  else $clog2(80);
  ;
  wire id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output uwire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_1,
      id_1,
      id_2
  );
  assign id_1 = ~id_2;
endmodule
