// Seed: 1708823007
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  input wire id_1;
  supply0 id_4;
  always @(posedge id_1 / 1'd0) begin : LABEL_0
    id_3 = 1;
  end
  always @(posedge id_4 or 1) $display(id_1);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(1 or posedge id_3) $display;
  always @(id_3 < id_6 or posedge 1) begin : LABEL_0
    id_2 <= (id_6.id_7 + {1, 1, 1});
  end
  module_0 modCall_1 (
      id_7,
      id_6,
      id_6
  );
endmodule
