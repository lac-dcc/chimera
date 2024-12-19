// Seed: 3584166712
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  initial repeat (id_6) if (1) #1 $display;
  assign module_1.type_10 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  reg id_6;
  assign id_6 = 1 ? 1 : 1;
  wire id_7;
  assign id_3 = 1'h0;
  always @(posedge 1) id_6 <= 1;
  supply1 id_8;
  assign id_6 = 1'b0 | id_8;
  module_0 modCall_1 (
      id_8,
      id_7,
      id_7,
      id_2,
      id_7,
      id_7
  );
  wire id_9;
  initial $display(id_4[1], id_6);
endmodule
