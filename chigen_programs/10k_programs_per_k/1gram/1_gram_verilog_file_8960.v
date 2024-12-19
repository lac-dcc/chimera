// Seed: 3977620401
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_4 = 1;
  module_2 modCall_1 ();
  wire id_5, id_6, id_7;
  wire id_8;
  assign module_1.id_4 = 0;
endmodule
macromodule module_1 ();
  assign id_1 = "";
  wire id_2;
  supply1 id_3, id_4 = 1, id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4
  );
  wire id_6, id_7;
  assign id_3 = id_4;
  wire id_8;
endmodule
module module_2;
  reg id_1;
  always
    if (id_1) id_1 = 1;
    else begin : LABEL_0
      id_1 <= 1;
      @(posedge 1'b0, posedge 1, negedge 1) id_1 = ((1)) == (1);
      begin : LABEL_0
        @(1'b0) id_1 = id_1;
      end
    end
endmodule
