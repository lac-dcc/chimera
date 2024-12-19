// Seed: 2626884171
module module_0 (
    output wor id_0,
    input wand id_1,
    input tri id_2,
    input uwire id_3,
    output supply0 id_4,
    inout supply0 id_5
);
  always @(posedge 1) begin : LABEL_0
    id_4 = id_1;
  end
endmodule
module module_1 (
    output tri0 id_0,
    inout supply0 id_1,
    input wire id_2,
    output logic id_3,
    input supply1 id_4,
    input logic id_5,
    output uwire id_6,
    output tri1 id_7
);
  initial
    forever
      #1 begin : LABEL_0
        if (1 ^ 1) begin : LABEL_0
          id_3 <= id_5;
        end
      end
  module_0 modCall_1 (
      id_7,
      id_2,
      id_4,
      id_1,
      id_6,
      id_1
  );
  assign modCall_1.type_2 = 0;
endmodule
