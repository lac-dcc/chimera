// Seed: 614164171
module module_0;
  wire id_1;
endmodule
module module_1 (
    output tri0 id_0,
    output logic id_1,
    input wand id_2,
    output wire id_3,
    input supply0 id_4,
    input wor id_5,
    output tri0 id_6,
    input wor id_7,
    input supply1 id_8
);
  always_comb @(id_5) id_1 <= 1;
  module_0 modCall_1 ();
endmodule
module module_0 #(
    parameter id_3 = 32'd39,
    parameter id_4 = 32'd3,
    parameter id_7 = 32'd3
) (
    input tri0 id_0,
    input uwire module_2,
    output logic id_2,
    input wor _id_3,
    input tri1 _id_4,
    input uwire id_5,
    input supply1 id_6,
    input supply1 _id_7
);
  reg id_9;
  assign id_9 = -1;
  assign id_9 = (id_0 ^ -1'b0);
  reg id_10;
  always @(posedge id_6) id_2 <= 1;
  module_0 modCall_1 ();
  assign id_10 = id_7 >= 1;
  wire [id_3  +  id_4 : id_7] id_11;
  assign id_2 = id_11;
  wire id_12;
  always @(posedge "" or -1'b0 == id_12) begin : LABEL_0
    id_2 <= -1'h0;
    id_2 <= $signed(55);
    ;
    #1 begin : LABEL_1
      id_9 = 1;
    end
    id_2  = -1;
    id_10 = id_11;
    id_2 <= 1;
  end
endmodule
