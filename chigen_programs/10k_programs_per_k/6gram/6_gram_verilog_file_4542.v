// Seed: 3311880484
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_5;
  wire id_6;
  tri1 id_7 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    input logic id_1,
    output logic id_2,
    output logic id_3,
    input tri id_4,
    input tri0 id_5,
    input uwire id_6,
    output logic id_7,
    input logic id_8,
    input tri0 id_9,
    output logic id_10
);
  assign id_7 = 1 ? 1 : 1'b0;
  nor primCall (id_3, id_4, id_13, id_12, id_1, id_6, id_8, id_0, id_9);
  wire id_12;
  reg  id_13;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_12,
      id_12
  );
  initial begin : LABEL_0
    id_7 <= id_8;
    if ($display) $display(1'b0 == "", (1) ~^ 1);
    $display((1'h0), 1);
    wait (id_4)
      #1 begin : LABEL_0
        id_13 <= id_13;
        id_3 = #(1) id_13;
        $display;
      end
    id_10 <= id_13;
    id_2  <= id_1;
    $display(id_6);
    $display;
  end
endmodule
