// Seed: 662065612
module module_0;
  task id_1;
    input id_2;
    begin : LABEL_0
      id_1 <= #1 1'b0;
    end
  endtask
  assign id_2 = id_2 ? 1'b0 : 1'b0;
endmodule
macromodule module_1;
  assign id_1 = 1;
  wire id_2, id_3;
  assign id_1 = 1;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
  assign id_1 = 1;
  assign id_3 = id_2;
endmodule
