// Seed: 135157474
module module_0;
  wire id_1 = 1'h0 == "";
  assign module_1.type_11 = 0;
  always @(1) #1;
  module_2 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
module module_1 (
    input supply1 id_0,
    input tri0 id_1,
    output tri1 id_2,
    output wor id_3,
    input logic id_4,
    output tri id_5
);
  wire id_7;
  or primCall (id_2, id_4, id_7, id_8);
  reg id_8;
  always @(posedge ('b0) ==? 1) begin : LABEL_0
    id_8 <= id_4;
  end
  module_0 modCall_1 ();
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_5;
  generate
    for (id_6 = 1; 1; id_1 = 1'h0) begin : LABEL_0
      id_7(
          id_5, id_1, id_4
      );
    end
  endgenerate
  assign module_0.type_2 = 0;
endmodule
