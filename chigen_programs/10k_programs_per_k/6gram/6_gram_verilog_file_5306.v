// Seed: 2112927691
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_10 = ~id_4;
  always @(negedge id_4.id_5 or posedge 1'b0) $display(id_1);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_4
  );
  always @(id_5) begin : LABEL_0$display
    ;
  end
endmodule
