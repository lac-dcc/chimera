// Seed: 4241227357
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_1,
      id_3
  );
  wire id_4;
  parameter id_5 = 1;
  id_6 :
  assert property (@(posedge id_5 < 1) id_4 != id_4)
  else $signed(92);
  ;
endmodule
module module_2 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2
  );
  wire id_3;
endmodule
