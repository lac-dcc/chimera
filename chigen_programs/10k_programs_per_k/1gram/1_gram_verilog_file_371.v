// Seed: 636174495
module module_0 ();
  pullup (id_1);
  tri0 id_2, id_3 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always begin : LABEL_0
    @(id_3 - id_2 or negedge id_5) if (1) id_5 <= id_1 & 1;
    id_5 = id_1;
    if (id_5 ? 1 : id_3) begin : LABEL_0
      #1 id_1 <= 1;
      $display(1'b0, 1'b0, 1 < 1);
      begin : LABEL_0
        id_6 <= 1 | 1;
      end
    end
  end
  module_0 modCall_1 ();
endmodule
