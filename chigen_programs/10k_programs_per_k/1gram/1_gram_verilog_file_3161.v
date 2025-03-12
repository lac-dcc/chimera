// Seed: 1867667721
module module_0 (
    input tri id_0,
    input tri id_1,
    input tri1 id_2,
    input supply1 id_3,
    input wire id_4,
    output uwire id_5,
    input supply0 id_6,
    input supply0 id_7,
    output tri1 id_8,
    input tri id_9,
    input uwire id_10,
    input tri1 id_11[-1 : "" ==  1],
    input uwire id_12,
    input uwire id_13,
    input uwire id_14,
    input tri0 id_15
);
  if (-1'b0) assign id_8 = id_7;
  else parameter id_17 = -1;
  assign module_1._id_8 = 0;
  wire id_18;
endmodule
module module_1 #(
    parameter id_8 = 32'd80,
    parameter id_9 = 32'd55
) (
    output logic id_0,
    input supply1 id_1,
    input wor id_2,
    input supply0 id_3,
    input supply0 id_4,
    output wire id_5,
    input tri1 id_6,
    input uwire id_7,
    input wor _id_8["" : -1],
    inout tri0 _id_9
);
  assign id_5 = id_6;
  wire [(  id_9  ) : 1  -  id_8] id_11, id_12;
  logic id_13[-1 : id_8];
  ;
  always #1 begin : LABEL_0
    id_0 = id_11;
  end
  struct packed {
    logic id_14;
    logic id_15;
    logic id_16;
    logic id_17;
    logic id_18;
    struct packed {
      logic id_19;
      id_20 id_21  = 1;
      logic id_22;
      logic id_23;
    } id_24;
    logic id_25;
  } id_26;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_1,
      id_3,
      id_2,
      id_5,
      id_1,
      id_3,
      id_5,
      id_7,
      id_6,
      id_7,
      id_6,
      id_2,
      id_1,
      id_7
  );
  localparam id_27 = -1;
  wire  id_28;
  logic id_29;
  assign id_26.id_21 = id_2;
  union packed {logic id_30;} id_31;
  ;
endmodule
