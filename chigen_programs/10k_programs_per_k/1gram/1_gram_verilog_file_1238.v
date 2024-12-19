// Seed: 831202695
macromodule module_0 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  wire id_3, id_4;
  assign module_2.type_17 = 0;
  wire id_5 = id_3;
  wire id_6, id_7;
  genvar id_8;
  assign id_3 = id_5;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  wire id_3;
  assign id_3 = id_2;
  module_0 modCall_1 (
      id_3,
      id_2
  );
endmodule
module module_2 (
    output tri0  id_0,
    input  uwire id_1,
    input  logic id_2,
    output logic id_3
);
  assign id_3 = id_1 + ~id_2 << id_2;
  logic id_5, id_6, id_7;
  logic id_8;
  for (id_9 = id_2; id_6; id_9 = id_8) assign id_3 = id_7;
  logic id_10, id_11;
  assign id_10 = id_6;
  task id_12(output id_13);
    begin : LABEL_0
      id_7 <= id_7;
      $display('b0);
      id_12 <= #1 1'd0 - 1;
      deassign id_3;
    end
  endtask
  assign id_13 = id_13;
  wor id_14;
  module_0 modCall_1 (
      id_14,
      id_14
  );
  assign id_14 = 1;
  wire id_15;
  wire id_16;
endmodule
