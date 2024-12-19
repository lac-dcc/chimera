// Seed: 1303898807
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  integer id_3;
  reg id_4;
  supply0 id_5;
  wire id_6;
  reg id_7;
  assign module_1.id_1 = 0;
  reg id_8;
  initial begin : LABEL_0
    if (1) id_1 = 1;
  end
  assign id_5 = 1;
  id_9(
      id_1, "" == id_5, (1)
  );
  initial begin : LABEL_0
    if (id_5) id_4 <= id_5 + 1;
    else id_7 <= id_8;
  end
endmodule
module module_1 ();
  assign #(1) id_1 = id_1;
  module_0 modCall_1 (
      id_1,
      id_1
  );
  always @(posedge 1 or posedge 1) $display(1 == id_1);
  wire id_2;
endmodule
