// Seed: 3218777925
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  tri1 id_3;
  final $display(id_3, 1);
endmodule
module module_1;
  wire id_1;
  supply1 id_2;
  module_0 modCall_1 (
      id_2,
      id_1
  );
  wire id_3;
endmodule
module module_2 ();
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_2
  );
  wire id_3;
endmodule
module module_3 ();
  wire id_1;
  assign module_4.id_1 = 0;
endmodule
module module_4 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  always @(posedge 1 or negedge 1) begin : LABEL_0
    #1 begin : LABEL_0
      #1;
      id_1 <= id_1;
    end
    release id_1;
    id_1 = id_1;
  end
  module_3 modCall_1 ();
endmodule
