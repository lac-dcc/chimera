// Seed: 618359109
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  assign module_1.id_11 = 0;
  output wire id_2;
  input wire id_1;
  assign id_12 = id_8;
endmodule
module module_1 #(
    parameter id_11 = 32'd35,
    parameter id_4  = 32'd93
) (
    output wor id_0,
    output tri1 id_1,
    output tri0 id_2,
    output supply1 id_3,
    input wor _id_4,
    output wire id_5,
    input tri0 id_6,
    input tri id_7,
    input wand id_8,
    input wand id_9,
    output logic id_10,
    input uwire _id_11
);
  function void id_13;
    output [1 : 1] id_14;
    begin : LABEL_0
      `define pp_15 0
    end
  endfunction
  always @(*) begin : LABEL_1
    id_10 <= -1'b0;
  end
  tri0 [!  -1  &&  id_11 : id_4  ==  1] id_16;
  assign id_0  = 1;
  assign id_16 = -1;
  module_0 modCall_1 (
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16,
      id_16
  );
  assign id_1 = id_16 - id_7;
  initial begin
    id_13(id_16);
  end
endmodule
