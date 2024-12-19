// Seed: 2899678626
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_6;
  module_2 modCall_1 ();
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_1,
      id_3
  );
  wire id_5;
  assign id_3 = id_4;
  wire id_6;
endmodule
module module_2;
  task id_1;
    #id_2 for (id_1 = id_1; id_2; id_2 = id_1) id_2 = #1 id_2;
  endtask
  assign (highz1, strong0) id_2 = id_1;
  wire id_3;
endmodule
