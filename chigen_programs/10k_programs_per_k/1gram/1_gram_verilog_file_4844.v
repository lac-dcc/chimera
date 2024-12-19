// Seed: 3072892658
module module_0;
  assign id_1 = 1'b0;
  reg id_2;
  assign id_2 = 1;
  reg id_3;
  always
    if (1 < id_3)
      #1 begin : LABEL_0
        id_2 <= 1;
        id_2 <= id_1;
        id_1 <= 1;
      end
    else begin : LABEL_0
      begin : LABEL_0
        @(posedge 1'b0) id_3 <= 1;
        id_3 = id_1;
      end
    end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_7, id_8, id_9, id_10, id_11;
  module_0 modCall_1 ();
  assign modCall_1.type_4 = 0;
endmodule
