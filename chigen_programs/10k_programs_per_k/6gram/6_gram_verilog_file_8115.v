// Seed: 4133920358
module module_0 (
    input  tri0 id_0,
    input  wire id_1,
    input  wire id_2,
    input  wand id_3,
    output tri0 id_4,
    input  wire id_5,
    input  wire id_6,
    output tri1 id_7
);
  assign module_1.id_3 = 0;
  wire id_9;
  assign id_4 = 1 && id_6 == {-1{1'b0 - id_2}};
endmodule
module module_1 (
    input  wor  id_0,
    input  wire id_1,
    input  wire id_2,
    output wire id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_0,
      id_3,
      id_1,
      id_0,
      id_3
  );
endmodule
module module_2 #(
    parameter id_16 = 32'd18
) (
    output wor id_0,
    output wor id_1,
    input supply0 id_2,
    input tri0 id_3,
    output supply0 id_4,
    input uwire id_5,
    input uwire id_6,
    input wire id_7,
    input uwire id_8,
    output tri id_9,
    output logic id_10,
    output supply1 id_11,
    input tri id_12,
    output tri0 id_13,
    output tri id_14,
    output tri1 id_15,
    input wor _id_16,
    input tri1 id_17,
    output supply0 id_18,
    output tri1 id_19,
    output tri1 id_20,
    output wor id_21,
    input supply1 id_22,
    output wor id_23,
    input wire id_24,
    output uwire id_25,
    output supply0 id_26,
    input tri0 id_27,
    output tri0 id_28
);
  assign id_20 = id_8;
  wire id_30 = 1;
  function void id_31;
    input [id_16 : -1] id_32;
    id_10 = id_31;
  endfunction
  module_0 modCall_1 (
      id_8,
      id_5,
      id_27,
      id_5,
      id_14,
      id_24,
      id_24,
      id_18
  );
  wand id_33 = 1;
  always @(posedge id_6 or 1 == 1) #1;
  initial begin
    id_31(id_30);
  end
endmodule
