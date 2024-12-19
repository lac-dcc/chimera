// Seed: 1486128282
module module_0 ();
  assign id_1 = id_1++;
  assign id_1 = id_1;
endmodule
module module_1 (
    input  logic id_0,
    input  logic id_1,
    output logic id_2,
    output logic id_3,
    output wand  id_4
);
  wire id_6, id_7;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  always @(*) begin : LABEL_0
    if (1) begin : LABEL_0
      fork
        id_3 = 1 ^ 1;
        #1;
        if (id_1) begin : LABEL_0
          id_2 = id_0;
          $display;
          $display(id_0, 1'b0, 1, 1, id_0, id_1);
          force id_7 = id_0;
          wait (id_0);
        end
      join_any
    end else begin : LABEL_0
      id_3 <= 1'b0;
    end
  end
  id_8(
      .id_0(1'b0), .id_1(id_1)
  );
endmodule
