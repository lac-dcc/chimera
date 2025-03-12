// Seed: 64185505
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  wire id_3;
  logic [{  1  ,  -1  &&  1  }  ||  1  +  1 'd0 : 1 'b0] id_4;
  ;
endmodule
module module_1 (
    id_1
);
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output logic [7:0] id_3;
  inout wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_4,
      id_1
  );
  always @(posedge ~-1'b0);
  assign id_3[1] = id_4 != id_2;
endmodule
