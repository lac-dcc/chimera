// Seed: 825452989
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  wire id_3;
  assign id_2 = id_3;
  module_2 modCall_1 ();
endmodule
module module_1 (
    input  tri1 id_0,
    input  wor  id_1,
    output tri  id_2,
    output wand id_3
);
  wire id_5, id_6;
  wire id_7;
  assign id_5 = id_7;
  module_0 modCall_1 (
      id_5,
      id_6
  );
  id_8 :
  assert property (@(posedge 1) 1)
  else $display(1, id_1);
endmodule
module module_2;
  reg id_2;
  assign id_1 = id_2;
  initial $display(1, 1, id_2, ~id_1, 1 << id_1);
  always
    repeat (id_2) begin : LABEL_0
      if (id_1) begin : LABEL_0
        #1 begin : LABEL_0
          if (1) id_2 <= id_2;
        end
      end
    end
  assign module_0.id_4 = 0;
endmodule
