// Seed: 1702106855
module module_0 (
    input uwire id_0,
    input tri0  id_1
);
  logic [-1 : 1 'b0] id_3;
  ;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    output logic id_2
);
  always @(id_1 or negedge 1) begin : LABEL_0
    if (1) id_2 <= -1;
    else begin : LABEL_1
      case (id_0)
        default: id_2 <= id_1;
      endcase
    end
    if (-1)
      if (-1) id_2 <= 1;
      else id_2 <= id_1;
  end
  module_0 modCall_1 (
      id_0,
      id_1
  );
endmodule
