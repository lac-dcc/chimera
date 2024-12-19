// Seed: 2777070622
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
endmodule
macromodule module_1 (
    input uwire id_0
);
  id_2 :
  assert property (@(posedge id_0) 1)
  else;
  assign id_2 = 1;
  id_3(
      .id_0('b0), .id_1(1), .id_2(id_2), .id_3(1), .id_4(1'h0), .id_5(id_0)
  );
  wire  id_4;
  uwire id_5;
  assign id_5 = 1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4
  );
endmodule
