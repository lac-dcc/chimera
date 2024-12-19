// Seed: 1209809141
module module_0;
  assign id_1 = 1'd0;
  assign module_2.id_5 = 0;
  id_3(
      1, id_1, 1
  );
endmodule
module module_1 (
    input  uwire id_0,
    input  logic id_1,
    input  uwire id_2,
    output logic id_3
);
  tri id_5;
  module_0 modCall_1 ();
  initial begin : LABEL_0
    id_3 <= id_1;
    id_3 <= 1 ? $display(1'b0, id_2) : id_1;
    $display(1);
    id_5 = id_1 - id_5;
  end
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = $display(1);
  wire id_4;
  task id_5;
    fork
      id_1 <= id_2;
      id_6;
      #1 #1;
    join
  endtask
  always @(*) begin : LABEL_0
    id_1 <= id_6;
  end
  module_0 modCall_1 ();
endmodule
