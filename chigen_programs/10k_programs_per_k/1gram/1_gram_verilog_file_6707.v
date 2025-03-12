// Seed: 3226826783
module module_0 (
    id_1
);
  output wire id_1;
  parameter id_2 = -1;
  parameter id_3 = 1;
  wire id_4 = id_4, id_5;
  wire id_6, id_7;
  wire id_8;
  localparam id_9 = 1;
endmodule
module module_1 #(
    parameter id_4 = 32'd78
) (
    output wand id_0,
    input tri1 id_1,
    input uwire id_2,
    output logic id_3,
    input wor _id_4,
    output logic id_5,
    output uwire id_6,
    input supply1 id_7[1 : -1],
    input tri id_8,
    input wor id_9,
    input tri0 id_10,
    input supply1 id_11,
    input wor id_12,
    output wor id_13,
    input tri1 id_14
);
  assign id_5 = {1'h0};
  assign id_3 = -1;
  assign id_0 = 1;
  struct packed {logic id_16;} id_17;
  assign id_3 = -1 ? (id_1) : -1;
  supply1 [1 : 1 'b0] id_18 = {-1{-1}}, id_19 = 1, id_20 = -1;
  localparam id_21 = -1;
  function void id_22;
    input [-1 'b0 |  id_4 : 1] id_23 = id_21;
    begin : LABEL_0
      #1 id_3 = id_14;
      if (1 == id_21) id_5 = id_17.id_16;
    end
  endfunction
  parameter id_24 = id_21;
  module_0 modCall_1 (id_21);
  wire  id_25 = id_17;
  logic id_26;
  ;
  initial begin
    id_22(id_21);
  end
endmodule
