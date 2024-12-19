// Seed: 2054191821
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_5;
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_1
  );
endmodule
module module_2 ();
  reg  id_3;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_4
  );
  always @(1 or posedge id_2) begin : LABEL_0
    #1 begin : LABEL_0
      if (1) begin : LABEL_0
        id_1 = 1;
      end
    end
    id_3 <= {id_1{id_3 - 1'b0}};
  end
endmodule
