// Seed: 3987018353
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  module_2 modCall_1 ();
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_2
  );
  logic id_4;
endmodule
module module_2;
  logic id_1;
  logic id_2;
  ;
  assign id_2[1] = ("");
  assign {id_1 & 1'b0, id_1 ? id_2 ^ 1 : 1'h0, 1'b0} = id_2;
endmodule
