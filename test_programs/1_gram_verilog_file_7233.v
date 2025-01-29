// Seed: 1681240302
module module_0 ();
  assign id_1 = id_1;
  always $display(id_1, -1);
  assign id_2 = 1;
  bit  id_3 = 1;
  wire id_4;
  always begin : LABEL_0
    id_2 <= -1;
    id_1 = id_1;
    id_3 <= -1;
    id_1 <= -1;
    begin : LABEL_0
      do begin : LABEL_0
        id_2 = id_1;
      end while (1);
      id_1 <= -1'b0;
      id_1 <= id_3 || 1;
    end
    id_3 <= 1;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always_ff id_1 = id_2;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_5;
  xnor primCall (id_1, id_2, id_3, id_4);
endmodule
