// Seed: 2025725970
module module_0 (
    output wand id_0,
    input wire id_1,
    output supply0 id_2,
    input tri0 id_3,
    input wor id_4,
    output supply0 id_5
);
  always @(posedge 1'b0 or negedge id_4) #1;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input logic id_0,
    output supply1 id_1,
    input wor id_2,
    input tri1 id_3,
    output logic id_4,
    input uwire id_5
);
  module_0 modCall_1 (
      id_1,
      id_5,
      id_1,
      id_3,
      id_2,
      id_1
  );
  always @(posedge 1'b0 or negedge "") begin : LABEL_0
    id_4 <= id_0;
    $display(1'd0);
    #1 id_1 = id_5;
    id_1 = id_2;
  end
endmodule
