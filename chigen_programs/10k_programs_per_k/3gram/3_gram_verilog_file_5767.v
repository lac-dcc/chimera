// Seed: 1025990761
module module_0 (
    input wor id_0,
    output wire id_1,
    output supply0 id_2,
    input wand id_3,
    input tri1 id_4
);
  reg id_6;
  always @(id_4 or posedge -1) begin : LABEL_0
    #1 id_6 = id_4;
    id_6 <= 1;
    $clog2(79);
    ;
  end
  assign module_1.id_8 = 0;
endmodule
module module_1 #(
    parameter id_11 = 32'd97,
    parameter id_2  = 32'd54,
    parameter id_8  = 32'd27
) (
    output supply1 id_0,
    output tri0 id_1,
    input supply0 _id_2,
    output wand id_3,
    input uwire id_4,
    input tri0 id_5,
    input tri1 id_6,
    output tri id_7,
    input uwire _id_8,
    input supply1 id_9
);
  wire _id_11;
  wire [(  (  id_2  )  -  id_8  ) : 1 'b0] id_12;
  wire id_13;
  wire [1  &  id_11 : -1] id_14;
  wire id_15, id_16;
  integer id_17;
  ;
  assign id_11 = id_12;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_3,
      id_5,
      id_9
  );
endmodule
