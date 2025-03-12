// Seed: 3947833953
module module_0 (
    input wire id_0,
    output supply1 id_1,
    output uwire id_2,
    input uwire id_3,
    output tri id_4
);
  assign id_1 = ~id_3 == id_0;
  assign module_2.id_1 = 0;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    input wand id_1,
    input supply1 id_2,
    input tri id_3,
    output logic id_4,
    input uwire id_5,
    input wand id_6,
    output uwire id_7
);
  always id_4 <= #1 -1'b0;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_1,
      id_0
  );
endmodule
module module_2 (
    input  uwire id_0,
    output tri0  id_1,
    input  wand  id_2
);
  reg [-1 : -1] id_4;
  wire [(  -1  ) : 1] id_5;
  always @(posedge id_4) begin : LABEL_0
    $unsigned(85);
    ;
  end
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_1
  );
  initial begin : LABEL_1
    id_4 <= id_4 ? id_2 : 1;
    cover (-1);
    if (-1) begin : LABEL_2
      wait (-1);
      fork
        id_6(id_4, id_2);
        id_7(-1, id_6, -1);
      join
    end else $clog2(54);
    ;
  end
endmodule
