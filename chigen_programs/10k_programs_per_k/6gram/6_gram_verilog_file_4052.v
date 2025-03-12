// Seed: 1552349133
module module_0 (
    output wand id_0,
    output tri1 id_1,
    input wor id_2,
    output supply1 id_3,
    output wand id_4,
    input wor id_5,
    output supply0 sample,
    input wand id_7,
    input tri1 id_8,
    input uwire id_9,
    input supply1 id_10,
    output tri id_11,
    input wor id_12,
    input tri0 module_0,
    output supply1 id_14,
    output wor id_15,
    input wor id_16,
    input supply1 id_17,
    input uwire id_18,
    input wor id_19,
    output tri id_20
);
  wire id_22;
endmodule
module module_1 #(
    parameter id_0 = 32'd11,
    parameter id_3 = 32'd5,
    parameter id_4 = 32'd34
) (
    output tri0 _id_0,
    input wor id_1,
    input wand id_2,
    input wire _id_3,
    input supply0 _id_4,
    input tri id_5,
    input tri1 id_6,
    input uwire id_7,
    input wire id_8,
    output wand id_9,
    input tri0 id_10,
    output tri id_11
);
  logic [id_3 : -1] id_13;
  ;
  wire id_14;
  ;
  function automatic reg [-1 : id_4  ==  id_4] id_15[1  : 1];
    input id_16;
    integer [id_0 : ""] id_17;
    begin : LABEL_0
      id_17 <= 1;
      id_15 <= id_5;
    end
  endfunction
  module_0 modCall_1 (
      id_9,
      id_9,
      id_10,
      id_9,
      id_9,
      id_10,
      id_11,
      id_8,
      id_1,
      id_6,
      id_10,
      id_9,
      id_6,
      id_1,
      id_11,
      id_9,
      id_7,
      id_7,
      id_2,
      id_10,
      id_11
  );
  assign id_9 = 1;
  wire id_18;
  always @(-1'b0 or posedge id_8 == id_6) begin : LABEL_1
    cover (1);
  end
  initial begin
    id_15(id_14);
  end
endmodule
