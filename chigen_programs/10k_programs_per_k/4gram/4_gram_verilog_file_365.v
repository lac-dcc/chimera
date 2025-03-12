// Seed: 3407049249
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  inout wire id_1;
  wire   id_3 = id_1;
  string id_4 = "";
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wor id_5;
  module_0 modCall_1 (
      id_5,
      id_4
  );
  output wire id_4;
  output wire id_3;
  output supply0 id_2;
  input wire id_1;
  assign id_2 = 1'b0;
  assign id_5 = 1;
  wire id_6;
  ;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  input logic [7:0] id_2;
  input logic [7:0] id_1;
  always @(negedge id_2 or posedge id_1) begin : LABEL_0
    disable id_5;
  end
  wire id_6;
  parameter id_7 = -1;
  specify
    (id_8 => id_9) = (1, id_2[-1] ? 1 : -1  : -1  : id_1[-1'b0] - -1);
  endspecify
  module_0 modCall_1 (
      id_9,
      id_7
  );
endmodule
