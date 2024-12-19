// Seed: 2273404656
module module_0 ();
  reg id_2;
  always_ff begin : LABEL_0
    #1 $display(id_1, 1);
    begin : LABEL_0
      begin : LABEL_0
        id_2 <= id_1;
      end
    end
    id_1 <= 1 - "";
  end
  assign id_1 = {id_2 / 1, id_1 + 1};
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  input wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_12;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
  assign id_2 = id_6[1]["" : 1];
  nor primCall (id_1, id_11, id_12, id_2, id_3, id_4, id_5, id_6, id_7, id_8, id_9);
endmodule
