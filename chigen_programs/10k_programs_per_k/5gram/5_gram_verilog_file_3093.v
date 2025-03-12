// Seed: 3575459364
module module_0 (
    output wire id_0,
    output tri id_1,
    input supply0 id_2,
    input wire id_3,
    input supply0 id_4,
    output tri1 id_5,
    input supply0 id_6
);
endmodule
module module_1 (
    output tri1 id_0,
    input  tri  id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1
  );
endmodule
module module_2 #(
    parameter id_14 = 32'd30,
    parameter id_5  = 32'd46,
    parameter id_6  = 32'd54
) (
    input supply1 id_0,
    input wor id_1,
    output uwire id_2,
    output supply1 id_3,
    output tri id_4,
    input wire _id_5,
    input uwire _id_6
);
  assign id_2 = id_0;
  wire [id_6 : id_6] id_8;
  uwire id_9, id_10, id_11, id_12;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_1,
      id_1,
      id_1,
      id_3,
      id_1
  );
  assign modCall_1.id_2 = 0;
  wire [-1 'h0 : 1] id_13;
  logic _id_14;
  ;
  wire id_15;
  bit [id_5 : id_14] id_16;
  always_ff @(posedge 1'b0) begin : LABEL_0
    force id_9 = id_8;
    id_16 <= "" + -1;
  end
  assign id_15 = id_13;
  assign id_9  = -1;
  xnor primCall (id_4, id_1, id_10, id_0, id_11, id_9, id_12, id_8);
  always @(posedge -1)
    force {
    id_11++
    , {
      id_9, ({id_0{id_8}} ? 1 : id_14 === id_10)
    }, id_16, id_0 ~^ id_5[-1'b0] ** -1} = "" < 1'd0;
  wire id_17;
  logic [1 : -1] id_18;
endmodule
