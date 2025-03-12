// Seed: 2678000531
module module_0 #(
    parameter id_0 = 32'd15,
    parameter id_4 = 32'd70
) (
    input tri _id_0,
    input uwire id_1,
    input tri id_2,
    output tri0 id_3,
    input uwire _id_4,
    input wire id_5,
    output supply1 id_6
);
  wire id_8;
  wire [~  {  id_0  *  id_4  ,  1 'b0 } : 1] id_9;
  wire id_10;
  wire id_11;
  assign id_6 = -1;
endmodule
macromodule module_1 #(
    parameter id_0 = 32'd70
) (
    inout supply1 _id_0,
    output supply0 id_1,
    output wire id_2,
    output supply1 id_3,
    input tri id_4,
    inout tri1 id_5,
    input supply1 id_6
);
  wire [1 : 1 'h0] id_8;
  always @(negedge id_4 & id_0);
  assign id_2 = 1'b0;
  logic [1 : id_0] id_9 = -1;
  always deassign id_1;
  wire [1 : id_0] id_10;
  wire id_11;
  logic [7:0] id_12;
  assign id_0 = id_12[1];
  wire id_13 = id_5;
  wire id_14;
  assign id_11 = id_0;
  assign id_1  = id_8;
  parameter id_15 = 1;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_6,
      id_3,
      id_0,
      id_4,
      id_3
  );
  assign id_0 = id_4;
endmodule
