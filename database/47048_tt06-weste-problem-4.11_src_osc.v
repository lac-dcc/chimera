// This program was cloned from: https://github.com/ericsmi/tt06-weste-problem-4.11
// License: Apache License 2.0

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////

module ring_osc_part_a_h1( 
  input en,
  input [7:0] a,
  input ntest,
  output y
);

  wire lb;
  wire [2:0] x;
  wire [2:0] z;

  wire xbuf;

  assign xbuf = (a[7:6] == 2'b11) ? x[2] :
                (a[7:6] == 2'b01) ? x[1] :
                                    x[0] ;

  assign lb = ntest ? z[2] : a[5];
  assign y = en & (ntest ? z[2] : xbuf);

  and_pa_h1 and_pa_h1_0( .a({lb, a[4:1], a[0]}), .y(x[0]));
  invh #(.H(1)) i0(.a(x[0]), .y(z[0]));

  and_pa_h1 and_pa_h1_1( .a({a[6],a[4:1],z[0]}), .y(x[1]));
  invh #(.H(1)) i1(.a(x[1]), .y(z[1]));

  and_pa_h1 and_pa_h1_2( .a({a[7],a[4:1],z[1]}), .y(x[2]));
  invh #(.H(1)) i2(.a(x[2]), .y(z[2]));

endmodule


////////////////////////////////////////////////////////////

module ring_osc_part_a_h5( 
  input en,
  input [7:0] a,
  input ntest,
  output y
);

  wire lb;
  wire [2:0] x;
  wire [2:0] z;

  wire xbuf;

  assign xbuf = (a[7:6] == 2'b11) ? x[2] :
                (a[7:6] == 2'b01) ? x[1] :
                                    x[0] ;

  assign lb = ntest ? z[2] : a[5];
  assign y = en & (ntest ? z[2] : xbuf);

  and_pa_h5 and_pa_h5_0( .a({lb, a[4:1], a[0]}), .y(x[0]));
  invh #(.H(5)) i0(.a(x[0]), .y(z[0]));

  and_pa_h5 and_pa_h5_1( .a({a[6],a[4:1],z[0]}), .y(x[1]));
  invh #(.H(5)) i1(.a(x[1]), .y(z[1]));

  and_pa_h5 and_pa_h5_2( .a({a[7],a[4:1],z[1]}), .y(x[2]));
  invh #(.H(5)) i2(.a(x[2]), .y(z[2]));

endmodule


////////////////////////////////////////////////////////////

module ring_osc_part_a_h20( 
  input en,
  input [7:0] a,
  input ntest,
  output y
);

  wire lb;
  wire [2:0] x;
  wire [2:0] z;

  wire xbuf;

  assign xbuf = (a[7:6] == 2'b11) ? x[2] :
                (a[7:6] == 2'b01) ? x[1] :
                                    x[0] ;

  assign lb = ntest ? z[2] : a[5];
  assign y = en & (ntest ? z[2] : xbuf);

  and_pa_h20 and_pa_h20_0( .a({lb, a[4:1], a[0]}), .y(x[0]));
  invh #(.H(20)) i0(.a(x[0]), .y(z[0]));

  and_pa_h20 and_pa_h20_1( .a({a[6],a[4:1],z[0]}), .y(x[1]));
  invh #(.H(20)) i1(.a(x[1]), .y(z[1]));

  and_pa_h20 and_pa_h20_2( .a({a[7],a[4:1],z[1]}), .y(x[2]));
  invh #(.H(20)) i2(.a(x[2]), .y(z[2]));

endmodule


////////////////////////////////////////////////////////////

module ring_osc_part_b_h1( 
  input en,
  input [7:0] a,
  input ntest,
  output y
);

  wire lb;
  wire [2:0] x;
  wire [2:0] z;

  wire xbuf;

  assign xbuf = (a[7:6] == 2'b11) ? x[2] :
                (a[7:6] == 2'b01) ? x[1] :
                                    x[0] ;

  assign lb = ntest ? z[2] : a[5];
  assign y = en & (ntest ? z[2] : xbuf);

  and_pb_h1 and_pb_h1_0( .a({lb, a[4:1], a[0]}), .y(x[0]));
  invh #(.H(1)) i0(.a(x[0]), .y(z[0]));

  and_pb_h1 and_pb_h1_1( .a({a[6],a[4:1],z[0]}), .y(x[1]));
  invh #(.H(1)) i1(.a(x[1]), .y(z[1]));

  and_pb_h1 and_pb_h1_2( .a({a[7],a[4:1],z[1]}), .y(x[2]));
  invh #(.H(1)) i2(.a(x[2]), .y(z[2]));

endmodule


////////////////////////////////////////////////////////////

module ring_osc_part_b_h5( 
  input en,
  input [7:0] a,
  input ntest,
  output y
);

  wire lb;
  wire [2:0] x;
  wire [2:0] z;

  wire xbuf;

  assign xbuf = (a[7:6] == 2'b11) ? x[2] :
                (a[7:6] == 2'b01) ? x[1] :
                                    x[0] ;

  assign lb = ntest ? z[2] : a[5];
  assign y = en & (ntest ? z[2] : xbuf);

  and_pb_h5 and_pb_h5_0( .a({lb, a[4:1], a[0]}), .y(x[0]));
  invh #(.H(5)) i0(.a(x[0]), .y(z[0]));

  and_pb_h5 and_pb_h5_1( .a({a[6],a[4:1],z[0]}), .y(x[1]));
  invh #(.H(5)) i1(.a(x[1]), .y(z[1]));

  and_pb_h5 and_pb_h5_2( .a({a[7],a[4:1],z[1]}), .y(x[2]));
  invh #(.H(5)) i2(.a(x[2]), .y(z[2]));

endmodule


////////////////////////////////////////////////////////////

module ring_osc_part_b_h20( 
  input en,
  input [7:0] a,
  input ntest,
  output y
);

  wire lb;
  wire [2:0] x;
  wire [2:0] z;

  wire xbuf;

  assign xbuf = (a[7:6] == 2'b11) ? x[2] :
                (a[7:6] == 2'b01) ? x[1] :
                                    x[0] ;

  assign lb = ntest ? z[2] : a[5];
  assign y = en & (ntest ? z[2] : xbuf);

  and_pb_h20 and_pb_h20_0( .a({lb, a[4:1], a[0]}), .y(x[0]));
  invh #(.H(20)) i0(.a(x[0]), .y(z[0]));

  and_pb_h20 and_pb_h20_1( .a({a[6],a[4:1],z[0]}), .y(x[1]));
  invh #(.H(20)) i1(.a(x[1]), .y(z[1]));

  and_pb_h20 and_pb_h20_2( .a({a[7],a[4:1],z[1]}), .y(x[2]));
  invh #(.H(20)) i2(.a(x[2]), .y(z[2]));

endmodule


////////////////////////////////////////////////////////////

module ring_osc_part_c_h1( 
  input en,
  input [7:0] a,
  input ntest,
  output y
);

  wire lb;
  wire [2:0] x;
  wire [2:0] z;

  wire xbuf;

  assign xbuf = (a[7:6] == 2'b11) ? x[2] :
                (a[7:6] == 2'b01) ? x[1] :
                                    x[0] ;

  assign lb = ntest ? z[2] : a[5];
  assign y = en & (ntest ? z[2] : xbuf);

  and_pc_h1 and_pc_h1_0( .a({lb, a[4:1], a[0]}), .y(x[0]));
  invh #(.H(1)) i0(.a(x[0]), .y(z[0]));

  and_pc_h1 and_pc_h1_1( .a({a[6],a[4:1],z[0]}), .y(x[1]));
  invh #(.H(1)) i1(.a(x[1]), .y(z[1]));

  and_pc_h1 and_pc_h1_2( .a({a[7],a[4:1],z[1]}), .y(x[2]));
  invh #(.H(1)) i2(.a(x[2]), .y(z[2]));

endmodule


////////////////////////////////////////////////////////////

module ring_osc_part_c_h5( 
  input en,
  input [7:0] a,
  input ntest,
  output y
);

  wire lb;
  wire [2:0] x;
  wire [2:0] z;

  wire xbuf;

  assign xbuf = (a[7:6] == 2'b11) ? x[2] :
                (a[7:6] == 2'b01) ? x[1] :
                                    x[0] ;

  assign lb = ntest ? z[2] : a[5];
  assign y = en & (ntest ? z[2] : xbuf);

  and_pc_h5 and_pc_h5_0( .a({lb, a[4:1], a[0]}), .y(x[0]));
  invh #(.H(5)) i0(.a(x[0]), .y(z[0]));

  and_pc_h5 and_pc_h5_1( .a({a[6],a[4:1],z[0]}), .y(x[1]));
  invh #(.H(5)) i1(.a(x[1]), .y(z[1]));

  and_pc_h5 and_pc_h5_2( .a({a[7],a[4:1],z[1]}), .y(x[2]));
  invh #(.H(5)) i2(.a(x[2]), .y(z[2]));

endmodule


////////////////////////////////////////////////////////////

module ring_osc_part_c_h20( 
  input en,
  input [7:0] a,
  input ntest,
  output y
);

  wire lb;
  wire [2:0] x;
  wire [2:0] z;

  wire xbuf;

  assign xbuf = (a[7:6] == 2'b11) ? x[2] :
                (a[7:6] == 2'b01) ? x[1] :
                                    x[0] ;

  assign lb = ntest ? z[2] : a[5];
  assign y = en & (ntest ? z[2] : xbuf);

  and_pc_h20 and_pc_h20_0( .a({lb, a[4:1], a[0]}), .y(x[0]));
  invh #(.H(20)) i0(.a(x[0]), .y(z[0]));

  and_pc_h20 and_pc_h20_1( .a({a[6],a[4:1],z[0]}), .y(x[1]));
  invh #(.H(20)) i1(.a(x[1]), .y(z[1]));

  and_pc_h20 and_pc_h20_2( .a({a[7],a[4:1],z[1]}), .y(x[2]));
  invh #(.H(20)) i2(.a(x[2]), .y(z[2]));

endmodule


////////////////////////////////////////////////////////////

module ring_osc_part_d_h1( 
  input en,
  input [7:0] a,
  input ntest,
  output y
);

  wire lb;
  wire [2:0] x;
  wire [2:0] z;

  wire xbuf;

  assign xbuf = (a[7:6] == 2'b11) ? x[2] :
                (a[7:6] == 2'b01) ? x[1] :
                                    x[0] ;

  assign lb = ntest ? z[2] : a[5];
  assign y = en & (ntest ? z[2] : xbuf);

  and_pd_h1 and_pd_h1_0( .a({lb, a[4:1], a[0]}), .y(x[0]));
  invh #(.H(1)) i0(.a(x[0]), .y(z[0]));

  and_pd_h1 and_pd_h1_1( .a({a[6],a[4:1],z[0]}), .y(x[1]));
  invh #(.H(1)) i1(.a(x[1]), .y(z[1]));

  and_pd_h1 and_pd_h1_2( .a({a[7],a[4:1],z[1]}), .y(x[2]));
  invh #(.H(1)) i2(.a(x[2]), .y(z[2]));

endmodule


////////////////////////////////////////////////////////////

module ring_osc_part_d_h5( 
  input en,
  input [7:0] a,
  input ntest,
  output y
);

  wire lb;
  wire [2:0] x;
  wire [2:0] z;

  wire xbuf;

  assign xbuf = (a[7:6] == 2'b11) ? x[2] :
                (a[7:6] == 2'b01) ? x[1] :
                                    x[0] ;

  assign lb = ntest ? z[2] : a[5];
  assign y = en & (ntest ? z[2] : xbuf);

  and_pd_h5 and_pd_h5_0( .a({lb, a[4:1], a[0]}), .y(x[0]));
  invh #(.H(5)) i0(.a(x[0]), .y(z[0]));

  and_pd_h5 and_pd_h5_1( .a({a[6],a[4:1],z[0]}), .y(x[1]));
  invh #(.H(5)) i1(.a(x[1]), .y(z[1]));

  and_pd_h5 and_pd_h5_2( .a({a[7],a[4:1],z[1]}), .y(x[2]));
  invh #(.H(5)) i2(.a(x[2]), .y(z[2]));

endmodule


////////////////////////////////////////////////////////////

module ring_osc_part_d_h20( 
  input en,
  input [7:0] a,
  input ntest,
  output y
);

  wire lb;
  wire [2:0] x;
  wire [2:0] z;

  wire xbuf;

  assign xbuf = (a[7:6] == 2'b11) ? x[2] :
                (a[7:6] == 2'b01) ? x[1] :
                                    x[0] ;

  assign lb = ntest ? z[2] : a[5];
  assign y = en & (ntest ? z[2] : xbuf);

  and_pd_h20 and_pd_h20_0( .a({lb, a[4:1], a[0]}), .y(x[0]));
  invh #(.H(20)) i0(.a(x[0]), .y(z[0]));

  and_pd_h20 and_pd_h20_1( .a({a[6],a[4:1],z[0]}), .y(x[1]));
  invh #(.H(20)) i1(.a(x[1]), .y(z[1]));

  and_pd_h20 and_pd_h20_2( .a({a[7],a[4:1],z[1]}), .y(x[2]));
  invh #(.H(20)) i2(.a(x[2]), .y(z[2]));

endmodule

