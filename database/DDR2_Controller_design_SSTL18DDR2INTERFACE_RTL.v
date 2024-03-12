module SSTL18DDR2INTERFACE(// Outputs
ck_pad, ckbar_pad, cke_pad, csbar_pad, rasbar_pad, casbar_pad, webar_pad, 
ba_pad, a_pad, dm_pad, odt_pad, dq_o, dqs_o, dqsbar_o,
// Inouts
dq_pad, dqs_pad, dqsbar_pad,
// Inputs
ri_i, ts_i, ck_i, cke_i, csbar_i, rasbar_i, casbar_i, webar_i,
ba_i, a_i, dq_i, dqs_i, dqsbar_i, dm_i, odt_i);


output  ck_pad, ckbar_pad, cke_pad, csbar_pad, rasbar_pad, casbar_pad, webar_pad, odt_pad;
output [1:0] ba_pad, dm_pad, dqs_o, dqsbar_o;
output [12:0] a_pad;
output [15:0] dq_o;

inout [1:0] dqs_pad, dqsbar_pad;   
inout [15:0]  dq_pad;

input  ri_i, ts_i, ck_i, cke_i, csbar_i, rasbar_i, casbar_i, webar_i, odt_i;
input [1:0] ba_i, dqs_i, dqsbar_i, dm_i;
input [12:0]  a_i;
input [15:0]  dq_i;

wire [1:0] ba_o,dm_o;
wire [12:0] a_o;


SSTL18DDR2DIFF ck_sstl(.Z(ck_o), .PAD(ck_pad), .PADN(ckbar_pad), .A(ck_i), .RI(1'b0), .TS(1'b1));
SSTL18DDR2 cke_sstl (.Z(cke_o), .PAD(cke_pad), .A(cke_i), .RI(1'b0), .TS(1'b1));
SSTL18DDR2 casbar_sstl (.Z(casbar_o), .PAD(casbar_pad), .A(casbar_i), .RI(1'b0), .TS(1'b1));
SSTL18DDR2 rasbar_sstl (.Z(rasbar_o), .PAD(rasbar_pad), .A(rasbar_i), .RI(1'b0), .TS(1'b1));
SSTL18DDR2 csbar_sstl (.Z(csbar_o), .PAD(csbar_pad), .A(csbar_i), .RI(1'b0), .TS(1'b1));
SSTL18DDR2 webar_sstl (.Z(webar_o), .PAD(webar_pad), .A(webar_i), .RI(1'b0), .TS(1'b1));
SSTL18DDR2 odt_sstl (.Z(odt_o), .PAD(odt_pad), .A(odt_i), .RI(1'b0), .TS(1'b1));

SSTL18DDR2 sstl_ba0 (.Z(ba_o[0]), .PAD(ba_pad[0]), .A(ba_i[0]), .RI(1'b0), .TS(1'b1));   
SSTL18DDR2 sstl_ba1 (.Z(ba_o[1]), .PAD(ba_pad[1]), .A(ba_i[1]), .RI(1'b0), .TS(1'b1));

SSTL18DDR2 sstl_a0(.Z(a_o[0]), .PAD(a_pad[0]), .A(a_i[0]), .RI(1'b0), .TS(1'b1));   
SSTL18DDR2 sstl_a1(.Z(a_o[1]), .PAD(a_pad[1]), .A(a_i[1]), .RI(1'b0), .TS(1'b1)); 
SSTL18DDR2 sstl_a2(.Z(a_o[2]), .PAD(a_pad[2]), .A(a_i[2]), .RI(1'b0), .TS(1'b1)); 
SSTL18DDR2 sstl_a3(.Z(a_o[3]), .PAD(a_pad[3]), .A(a_i[3]), .RI(1'b0), .TS(1'b1)); 
SSTL18DDR2 sstl_a4(.Z(a_o[4]), .PAD(a_pad[4]), .A(a_i[4]), .RI(1'b0), .TS(1'b1)); 
SSTL18DDR2 sstl_a5(.Z(a_o[5]), .PAD(a_pad[5]), .A(a_i[5]), .RI(1'b0), .TS(1'b1)); 
SSTL18DDR2 sstl_a6(.Z(a_o[6]), .PAD(a_pad[6]), .A(a_i[6]), .RI(1'b0), .TS(1'b1)); 
SSTL18DDR2 sstl_a7(.Z(a_o[7]), .PAD(a_pad[7]), .A(a_i[7]), .RI(1'b0), .TS(1'b1)); 
SSTL18DDR2 sstl_a8(.Z(a_o[8]), .PAD(a_pad[8]), .A(a_i[8]), .RI(1'b0), .TS(1'b1)); 
SSTL18DDR2 sstl_a9(.Z(a_o[9]), .PAD(a_pad[9]), .A(a_i[9]), .RI(1'b0), .TS(1'b1));    
SSTL18DDR2 sstl_a10(.Z(a_o[10]), .PAD(a_pad[10]), .A(a_i[10]), .RI(1'b0), .TS(1'b1)); 
SSTL18DDR2 sstl_a11(.Z(a_o[11]), .PAD(a_pad[11]), .A(a_i[11]), .RI(1'b0), .TS(1'b1)); 
SSTL18DDR2 sstl_a12(.Z(a_o[12]), .PAD(a_pad[12]), .A(a_i[12]), .RI(1'b0), .TS(1'b1)); 

SSTL18DDR2 sstl_dq0(.Z(dq_o[0]), .PAD(dq_pad[0]), .A(dq_i[0]), .RI(ri_i), .TS(ts_i));
SSTL18DDR2 sstl_dq1(.Z(dq_o[1]), .PAD(dq_pad[1]), .A(dq_i[1]), .RI(ri_i), .TS(ts_i));
SSTL18DDR2 sstl_dq2(.Z(dq_o[2]), .PAD(dq_pad[2]), .A(dq_i[2]), .RI(ri_i), .TS(ts_i));
SSTL18DDR2 sstl_dq3(.Z(dq_o[3]), .PAD(dq_pad[3]), .A(dq_i[3]), .RI(ri_i), .TS(ts_i));
SSTL18DDR2 sstl_dq4(.Z(dq_o[4]), .PAD(dq_pad[4]), .A(dq_i[4]), .RI(ri_i), .TS(ts_i));
SSTL18DDR2 sstl_dq5(.Z(dq_o[5]), .PAD(dq_pad[5]), .A(dq_i[5]), .RI(ri_i), .TS(ts_i));
SSTL18DDR2 sstl_dq6(.Z(dq_o[6]), .PAD(dq_pad[6]), .A(dq_i[6]), .RI(ri_i), .TS(ts_i));
SSTL18DDR2 sstl_dq7(.Z(dq_o[7]), .PAD(dq_pad[7]), .A(dq_i[7]), .RI(ri_i), .TS(ts_i));
SSTL18DDR2 sstl_dq8(.Z(dq_o[8]), .PAD(dq_pad[8]), .A(dq_i[8]), .RI(ri_i), .TS(ts_i));
SSTL18DDR2 sstl_dq9(.Z(dq_o[9]), .PAD(dq_pad[9]), .A(dq_i[9]), .RI(ri_i), .TS(ts_i));
SSTL18DDR2 sstl_dq10(.Z(dq_o[10]), .PAD(dq_pad[10]), .A(dq_i[10]), .RI(ri_i), .TS(ts_i));
SSTL18DDR2 sstl_dq11(.Z(dq_o[11]), .PAD(dq_pad[11]), .A(dq_i[11]), .RI(ri_i), .TS(ts_i));
SSTL18DDR2 sstl_dq12(.Z(dq_o[12]), .PAD(dq_pad[12]), .A(dq_i[12]), .RI(ri_i), .TS(ts_i));
SSTL18DDR2 sstl_dq13(.Z(dq_o[13]), .PAD(dq_pad[13]), .A(dq_i[13]), .RI(ri_i), .TS(ts_i));
SSTL18DDR2 sstl_dq14(.Z(dq_o[14]), .PAD(dq_pad[14]), .A(dq_i[14]), .RI(ri_i), .TS(ts_i));
SSTL18DDR2 sstl_dq15(.Z(dq_o[15]), .PAD(dq_pad[15]), .A(dq_i[15]), .RI(ri_i), .TS(ts_i));

SSTL18DDR2 sstl_dqs0 (.Z(dqs_o[0]), .PAD(dqs_pad[0]), .A(dqs_i[0]), .RI(ri_i), .TS(ts_i));
SSTL18DDR2 sstl_dqs1 (.Z(dqs_o[1]), .PAD(dqs_pad[1]), .A(dqs_i[1]), .RI(ri_i), .TS(ts_i));

SSTL18DDR2 sstl_dqsbar0(.Z(dqsbar_o[0]), .PAD(dqsbar_pad[0]), .A(dqsbar_i[0]), .RI(ri_i), .TS(ts_i));
SSTL18DDR2 sstl_dqsbar1(.Z(dqsbar_o[1]), .PAD(dqsbar_pad[1]), .A(dqsbar_i[1]), .RI(ri_i), .TS(ts_i));

SSTL18DDR2 sstl_dm0(.Z(dm_o[0]), .PAD(dm_pad[0]), .A(dm_i[0]), .RI(1'b0), .TS(1'b1));
SSTL18DDR2 sstl_dm1(.Z(dm_o[1]), .PAD(dm_pad[1]), .A(dm_i[1]), .RI(1'b0), .TS(1'b1));

endmodule


   
