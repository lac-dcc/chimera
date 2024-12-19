// Seed: 3937067261
module module_0 (
    input  uwire   id_0,
    output uwire   id_1,
    output supply1 id_2
);
  assign id_2 = id_0;
  wire id_4;
  wire id_5;
  tri id_6;
  wire id_7;
  supply0 id_8 = 1;
  assign id_6 = 1;
endmodule
module module_1 (
    input wand id_0,
    input supply0 id_1,
    output logic id_2,
    output wand id_3
);
  assign id_3 = 1;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_3
  );
  uwire id_5;
  always @(posedge 1 or posedge 1) begin : LABEL_0
    id_2 <= 1;
    $display({1, 1}, id_1);
    id_5 = id_1 == id_5;
  end
  initial begin : LABEL_0
    #1 $display(1);
    id_5 = id_0;
  end
endmodule
