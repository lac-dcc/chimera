// Seed: 3243578775
module module_0 (
    input  tri1  id_0,
    output logic id_1,
    output logic id_2
);
  bit id_4;
  ;
  module_0 id_5 = -1'b0;
  initial begin : LABEL_0
    id_1 <= id_0;
    id_5 <= id_0 != -1;
    id_2 <= (-1);
  end
  always @(posedge id_5 or posedge "") begin : LABEL_1
    $signed(39);
    ;
    if (1) id_1 = id_5;
    else id_4 = id_0 ? 1 : -1;
  end
endmodule
module module_1 (
    input uwire id_0,
    input wand id_1,
    input supply0 id_2,
    output logic id_3,
    output logic id_4,
    output supply0 id_5,
    input supply0 id_6,
    output tri0 id_7,
    output logic id_8,
    input uwire id_9,
    output wire id_10
);
  always @(posedge id_6 & -1) begin : LABEL_0
    id_8 = -1;
    id_4 <= id_1 - 1;
    #1;
    id_3 <= 1;
  end
  module_0 modCall_1 (
      id_2,
      id_3,
      id_4
  );
  assign modCall_1.id_1 = 0;
endmodule
