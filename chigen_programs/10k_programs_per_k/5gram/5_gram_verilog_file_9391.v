// Seed: 2058742988
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(posedge id_7 - id_3) begin : LABEL_0
    id_3 = 1;
  end
  module_2 modCall_1 ();
endmodule
module module_1 ();
  wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
module module_2;
  tri id_2;
  assign id_1 = id_2 ? id_2 == 1 : 1;
  assign id_2 = id_1;
  id_3 :
  assert property (@(posedge id_3) id_1)
  else $display;
  assign id_1 = 1 ? id_3 == id_3 : 1 ? 1 : id_2++;
  assign id_1 = (1'h0);
  assign id_2 = id_1;
  supply1 id_4;
  supply1 id_5;
  assign id_4 = 1 == id_5;
endmodule
