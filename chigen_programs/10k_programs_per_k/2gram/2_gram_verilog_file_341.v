// Seed: 572544254
module module_0 (
    input uwire id_0
);
  reg [1 : -1] id_2;
  initial
    if (1 == 1) begin : LABEL_0
      fork
        id_2 = id_2;
      join_none
      id_2 <= "";
      id_2 = id_2;
      `define pp_3 0
    end else begin : LABEL_1
      id_2 <= id_2 ? 1 : id_2 && 1 ? id_2 : !id_2;
    end
  wire id_4;
  task id_5;
    @(1, posedge -1) id_2 <= (id_0);
  endtask
  assign id_5 = id_2;
endmodule
module module_1 (
    output logic id_0,
    input  wor   id_1,
    input  wor   id_2
);
  always for (id_0 = id_1; id_1; id_0 = 1) id_0 <= id_2;
  wire id_4;
  ;
  module_0 modCall_1 (id_2);
  assign modCall_1.id_2 = 0;
endmodule
