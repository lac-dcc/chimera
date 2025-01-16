// Seed: 3258957489
module module_0 (
    input  wor  id_0,
    output tri0 id_1
);
  assign id_1 = 1;
  module_2 modCall_1 ();
endmodule
module module_1 (
    output tri0 id_0,
    input  wire id_1,
    input  tri1 id_2,
    input  wor  id_3,
    output tri0 id_4
);
  module_0 modCall_1 (
      id_3,
      id_0
  );
  uwire id_6, id_7, id_8, id_9;
  always begin : LABEL_0
    begin : LABEL_0
      begin : LABEL_0
        @(posedge id_1 ? id_3 : -1) id_6 = -1;
      end
    end
  end
  assign id_6 = -1;
endmodule
module module_2 ();
  wire id_1;
  assign module_0.type_3 = 0;
  wire id_2;
endmodule
